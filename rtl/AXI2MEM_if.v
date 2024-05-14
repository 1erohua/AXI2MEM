//不支持乱序读写
//支持突发读写。
//突发写，第一次给出响应的写地址与写控制信号，后面再给出数据
//突发字节大小 = 2的AxSIZE次方
//MEM 8192B x 8
//支持同时读写, 但读写地址的长度最多为16位
//在下面的地址寄存器中，将会把读地址存到寄存器的低16位，写地址存到寄存器的高16位
//共有两片 sram_bank, 不能同时读写同一片，可以读一片写另一片
//如果同时读写一片，会认为读优先，将写准备滞后
//如果某一片正在写，那么就会将读准备给拉低

module AXI2MEM_if(
    //************
    //与总线的交互
    //************
    input  wire ACLK,
    input  wire ARESETn,

    //AW    from master to slave
    input  wire [3:0]   AWID,
    input  wire [31:0]  AWADDR,
    input  wire [7:0]   AWLEN,
    input  wire [2:0]   AWSIZE,
    input  wire [1:0]   AWBURST,
    input  wire         AWLOCK,
    input  wire [3:0]   AWCACHE,
    input  wire [2:0]   AWPORT,

    input  wire         AWVALID,
    output wire         AWREADY,

    //W     from master to slave
    input  wire [31:0]  WDATA,
    input  wire [3:0]   WSTRB,
    input  wire         WLAST,
    output wire         WREADY,
    input  wire         WVALID,

    //B     from slave to master
    output  wire [3:0]   BID,
    output  wire [1:0]   BRESP,
    output  wire         BVALID,
    input   wire         BREADY,

    //AR    from master to slave
    input  wire [3:0]   ARID,
    input  wire [31:0]  ARADDR,
    input  wire [7:0]   ARLEN,
    input  wire [2:0]   ARSIZE,
    input  wire [1:0]   ARBURST,
    input  wire         ARLOCK,
    input  wire [3:0]   ARCACHE,
    input  wire [2:0]   ARPROT,
    input  wire         ARVALID,
    output wire         ARREADY,

    //R     from slave to master
    output wire [3:0]   RID,
    output wire [31:0]  RDATA,
    output wire [1:0]   RRESP,
    output wire         RLAST,
    output wire         RVALID,
    input  wire         RREADY, 

    //*************
    //与sram的交流
    //*************
    input  wire [7:0]   sram0, sram1, sram2, sram3, sram4, sram5, sram6, sram7,
    output wire [31:0]  sram_wdata,
    output wire [1:0]   wen,                //wen[0]指示bank0, wen[1]指示bank1
    output reg  [3:0]   bank0_csn,bank1_csn,
    output wire [12:0]  sram_addr_bank0,
    output wire [12:0]  sram_addr_bank1

);

    reg  [4:0]  temp_reg ;
    wire [25:0]  sram_addr;
    //******************
    //用状态机实现读与写
    //******************
    reg     [2:0]       cstate_rd;
    reg     [2:0]       nstate_rd;

    reg     [2:0]       cstate_wr;
    reg     [2:0]       nstate_wr;

    //state
    `define     IDLE_AXI        3'b000    
    `define     READ        3'b001
    `define     WRITE       3'b011
    `define     WRITE_RESP  3'b100

    //BURST
    `define     FIXED       2'b00
    `define     INCR        2'b01
    `define     WRAP        2'b10

    always @(posedge ACLK or negedge ARESETn) begin
        if(!ARESETn) begin 
            cstate_rd <= `IDLE_AXI;
            cstate_wr <= `IDLE_AXI;
        end

        else  begin
            cstate_rd <= nstate_rd;
            cstate_wr <= nstate_wr;
        end

    end

    //读的状态机切换
    always @(*) begin
        case (cstate_rd)
            `IDLE_AXI :begin
                if(ARVALID&ARREADY)
                    nstate_rd = `READ;
                else 
                    nstate_rd = `IDLE_AXI;
            end

            `READ: begin
                if(RLAST)
                    nstate_rd = `IDLE_AXI;
                //注意，所有的任务结束都要跳转到 `IDLE_AXI
                else 
                    nstate_rd = `READ;
            end
        endcase
    end

    //写状态机
    always @(*) begin           //state change
        case (cstate_wr)
            `IDLE_AXI :begin
                temp_reg = 0;
                if(AWVALID & AWREADY)
                    nstate_wr = `WRITE;
                else
                    nstate_wr = `IDLE_AXI;
            end

            `WRITE: begin
                if(WLAST)
                    nstate_wr = `WRITE_RESP;
                else 
                    nstate_wr = `WRITE;
            end

            `WRITE_RESP: begin
                if(BVALID & BREADY)
                    nstate_wr = `IDLE_AXI;
                else 
                    nstate_wr = `WRITE_RESP;
            end
        endcase
    end

    //*****************
    //读写状态的操作
    //*****************

    //*******************
    //RLAST
    reg     [7:0]   cnt_rd;   

    always @(posedge ACLK or negedge ARESETn) begin
        if(!ARESETn)    
            cnt_rd <= 0;
        else if(RVALID & RREADY)
            cnt_rd <= cnt_rd - 1;
        else if(ARVALID & ARREADY)
            cnt_rd <= ARLEN + 1; 
    end
    assign RLAST = (cnt_rd == 1) && (RVALID & RREADY);
    //*******************

    //读写地址寄存器，高16位存写地址，低16位存读地址
    reg     [31:0]  addr_r;

    reg     [2:0]   ar_size_r;     
    reg     [1:0]   ar_burst_r;
    reg     [7:0]   ar_len_r;

    reg     [2:0]   aw_size_r;
    reg     [1:0]   aw_burst_r;
    reg     [7:0]   aw_len_r;
    
    wire    [31:0]  Wrap_Boundary; //地址下界
    wire    [31:0]  Address_N;     //地址上界
    //每次传输的数据的byte的最大数量为Number_Byte，即2的AxSIZE次方
    //一次突发传输读写所传输的数据数量 Burst_Length 为 Length + 1
    //wrap传输的上界为传输时不可超过的边界；传输下界为传输达到上届后所回到的地方
    //地址下界：Wrap_Boundary = (INT(Start_Address / (Number_Byte x Burst_Length))) x (Number_Byte x Burst_Length)
    //地址上界：Address_N = (Wrap_Boundary + Number_Byte x Burst_Length)

    /*
    assign Wrap_Boundary[15:0] = (addr_r[15:0]/((1<<ar_size_r)*(ar_len_r))) * ((1<<ar_size_r)*(ar_len_r));
    assign Address_N[15:0] = (Wrap_Boundary[15:0] + ((1<<ar_size_r)*(ar_len_r)));

    assign Wrap_Boundary[31:16] = (addr_r[31:16]/((1<<aw_size_r)*(aw_len_r))) * ((1<<aw_size_r)*(aw_len_r));
    assign Address_N[31:16] = (Wrap_Boundary[31:16] + ((1<<aw_size_r)*(aw_len_r)));
    */
    assign Wrap_Boundary[15:0] = 0;
    assign Wrap_Boundary[31:16] = 0;
    assign Address_N[15:0] = 60;
    assign Address_N[31:16] = 60;

    //********
    //读地址与读控制信号的采样处理
    always @(posedge ACLK or negedge ARESETn) begin
        if(!ARESETn) begin
            addr_r[15:0] <= 16'h0;

            ar_size_r <= 3'b0;
            ar_burst_r <= 2'b0;
            ar_len_r <= 7'b0;
        end

        //采样读地址以及读地址信号
        else if (ARREADY & ARVALID) begin   
            addr_r[15:0] <= ARADDR[15:0] ;

            ar_size_r <= ARSIZE ;
            ar_burst_r <= ARBURST;
            ar_len_r <= ARLEN;
        end
        //读地址的BURST       
        else if (RREADY & RVALID) begin 
            if(ar_burst_r == `FIXED)
                addr_r[15:0] <= addr_r[15:0] ;

            else if(ar_burst_r == `INCR)
                addr_r[15:0] <= addr_r[15:0] + 1'b1; //这里的1是代表1个字，由4个字节
            
            else if(ar_burst_r == `WRAP) begin
                if(addr_r[15:0] >= Address_N[15:0])
                    addr_r[15:0] <= Wrap_Boundary[15:0];
                else
                    addr_r[15:0] <= addr_r[15:0] + 1'b1;
            end
        end
    end
    //********

    //********
    //写地址与写控制信号的采样  和上面的基本一样
    always @(posedge ACLK or negedge ARESETn) begin
        if(!ARESETn) begin
            addr_r[31:16] <= 16'h0;

            aw_size_r <= 3'b0;
            aw_burst_r <= 2'b0;
            aw_len_r <= 7'b0;
        end

        //采用写地址以及写地址信号
        else if(AWREADY & AWVALID) begin
            addr_r[31:16] <= AWADDR[15:0] ; 
 
            aw_size_r <= AWSIZE;
            aw_burst_r <= AWBURST;
            aw_len_r <= AWLEN ;
       end
         //写地址的BURST       
        else if (WREADY & WVALID) begin 
            if(aw_burst_r == `FIXED)
                addr_r[31:16] <= addr_r[31:16] ;

            else if(aw_burst_r == `INCR)
                addr_r[31:16] <= addr_r[31:16] + 1'b1; //这里的1是代表1个字，由4个字节
            
            else if(aw_burst_r == `WRAP) begin
                if(addr_r[31:16] >= Address_N[31:16])
                    addr_r[31:16] <= Wrap_Boundary[31:16];
                else
                    addr_r[31:16] <= addr_r[31:16] + 1'b1;
            end
        end   
    end
    //********
 
    //*************************
    //握手与响应信号
    assign BRESP = 2'b00;   //认为不会产生错误的响应
    assign RRESP = 2'b00;
    assign BVALID =(cstate_wr == `WRITE_RESP);
    //处于IDLE_AXI时，都将AxREADY置高
    assign AWREADY = (cstate_wr == `IDLE_AXI);
    //处于读数据准备才会拉高读有效
    assign RVALID = (cstate_rd == `READ) ? 1'b1 : 1'b0;  
    //如果读写同一片，那么就会将WREADY维持在低电平
    //
    //在不改变现有代码的情况下，读写地址在IDLE_AXI下握手成功，就会进入各自的读写cstate(READ 和 WRITE)
    //此时读写地址都会被打入地址寄存器
    //READ状态会直接把地址寄存器的地址送入sram，并直接得到读结果
    //WRITE状态会等待握手，一旦握手成功，将在当前周期直接送到sram的写数据输入端口，并在下个周期的时钟有效沿，将数据写入sram
    //因而需要使用WREADY控制写状态
    
    //addr_r[13]是读的片选结果
    //addr_r[29]是写的片选结果
    //当处于读状态且同片，则将WREADY拉低
    assign WREADY = ( (cstate_rd==`READ) && (addr_r[13]==addr_r[29]) ) ? 1'b0 :
                      (cstate_wr == `WRITE)   ? 1'b1: 1'b0;

    assign ARREADY = (cstate_rd == `IDLE_AXI) ? (
        (cstate_wr == `WRITE && addr_r[29] == ARADDR[13]) ? 1'b0 : 1'b1
    ) : 1'b0;

    //以下情况分析都是基于二者都是读写同一片情况
    //1.wr处于IDLE_AXI，rd处于IDLE_AXI
    //WREADY为0, ARREADY为1,通道中无读写；假设请求到来，那么接下来wr将进入WRITE，rd进入READ
    //此时WREADY仍然为0,写被阻塞，读将继续，被选中片将开始被读
    //
    //2.wr处于WRITE，rd处于IDLE_AXI
    //WREADY处于1, ARREADY为0,通道中处于写状态，直到wr退出WRITE，ARREADY将被拉高
    //
    //3.wr处于WRITE_RESP, rd处于IDLE_AXI
    //WREADY处于0,ARREADY被拉高
    //
    //4.wr处于IDLE_AXI, rd处于READ
    //WREADY处于0,ARREADY处于0,此时是进行读，假设来了写请求，那么写请求必须等待读完成
    //
    //5.wr处于WRITE，rd处于READ
    //由1分析得到，这种情况是读写同时到来引起的
    //WREADY符合拉低，ARREADY也被拉低，但是此时读已经开始了，写被读阻塞
    //
    //6.wr处于WRITE_RESP, rd处于READ
    //WREADY拉低，仍然处于读的步骤
    //
    //综上，不会产生死锁
    //*************************
    
   


    //****************************************
    //片选的确定
    always @(*) begin
        if(cstate_rd == `READ && addr_r[13] == 1)
            bank0_csn = 4'b0000;

        else if(cstate_wr == `WRITE && addr_r[29]) begin
            if(aw_size_r[1] >= 1'b1) //传输位宽在32位以上
                bank0_csn = 4'b0000;
            else begin              //传输位宽为16或8位，此时则跟据写选通来使能片 
                bank0_csn = ~WSTRB;
                
            end
        end

        else 
            bank0_csn = 4'b1111;
    end

    always @(*) begin
        if(cstate_rd == `READ && addr_r[13] == 0)
            bank1_csn = 4'b0000;

        else if(cstate_wr == `WRITE && !addr_r[29]) begin
            if(aw_size_r[1] >= 1'b1) //传输位宽在32位以上
                bank1_csn = 4'b0000;
            else if(aw_size_r[1] == 1'b0)             //传输位宽为16或8位，此时则跟据写选通来使能片 
                bank1_csn = ~WSTRB;
        end

        else 
            bank1_csn = 4'b1111;
    end
    //****************************************

    assign sram_addr[12:0] = addr_r[12:0];    //读
    assign sram_addr[25:13] = addr_r[28:16];    //写
    assign RDATA = addr_r [13] ?({sram3,sram2,sram1,sram0}):({sram7,sram6,sram5,sram4}) ; 
    assign sram_wdata = (WREADY & WVALID) ? WDATA : 32'bz;

    //wen[0]指示bank0的读写，低电平为写
    //wen[1]指示bank1的读写
    //13,29处为1代表选中第一片（0,1,2,3）
    assign wen[0] = (cstate_rd==`READ && addr_r[13]==1'b1) ? 1'b1 :
                    (cstate_wr==`WRITE && addr_r[29]==1'b1) ? 1'b0 :1'bz;

    assign wen[1] = (cstate_rd==`READ && addr_r[13]==1'b0) ? 1'b1 :
                    (cstate_wr==`WRITE && addr_r[29]==1'b0) ? 1'b0 :1'bz;

    assign sram_addr_bank0 = wen[0] ? sram_addr[12:0] : sram_addr[25:13];
    assign sram_addr_bank1 = wen[1] ? sram_addr[12:0] : sram_addr[25:13];



endmodule
