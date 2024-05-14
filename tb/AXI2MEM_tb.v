module AXI2MEM_tb;
// AXI2MEM_top Parameters
parameter PERIOD  = 10;


// AXI2MEM_top Inputs
reg   ACLK                                 = 0 ;
reg   ARESETn                              = 0 ;    //初始复位
reg   [3:0]  AWID                          = 0 ;
reg   [31:0]  AWADDR                       = 0 ;
reg   [7:0]  AWLEN                         = 0 ;
reg   [2:0]  AWSIZE                        = 0 ;
reg   AWLOCK                               = 0 ;
reg   [3:0]  AWCACHE                       = 0 ;
reg   [2:0]  AWPORT                        = 0 ;
reg   AWVALID                              = 0 ;
reg     [31:0]  WDATA                        ;
reg   [3:0]  WSTRB                         = 0 ;
wire   WLAST                                ;
reg   WVALID                               = 0 ;
reg   BREADY                               = 0 ;
reg   [3:0]  ARID                          = 0 ;
reg   [31:0]  ARADDR                       = 0 ;
reg   [7:0]  ARLEN                         = 0 ;
reg   [2:0]  ARSIZE                        = 0 ;
reg   ARLOCK                               = 0 ;
reg   [3:0]  ARCACHE                       = 0 ;
reg   [2:0]  ARPROT                        = 0 ;
reg   ARVALID                              = 0 ;
reg   RREADY                        = 0 ;
//第一次是INCR，后面才是WRAP
reg   [1:0]  AWBURST                       = 2'b01 ;
reg   [1:0]  ARBURST                       = 2'b01 ;

// AXI2MEM_top Outputs
wire  AWREADY                              ;
wire  WREADY                               ;
wire  [3:0]  BID                           ;
wire  [1:0]  BRESP                         ;
wire  BVALID                               ;
wire  ARREADY                              ;
wire  [3:0]  RID                           ;
wire  [3:0]  RDATA                         ;
wire  [3:0]  RRESP                         ;
wire  RLAST                                ;
wire  RVALID                               ;


AXI2MEM_top  u_AXI2MEM_top (
    .ACLK                    ( ACLK            ),
    .ARESETn                 ( ARESETn         ),
    .AWID                    ( AWID     [3:0]  ),
    .AWADDR                  ( AWADDR   [31:0] ),
    .AWLEN                   ( AWLEN    [7:0]  ),
    .AWSIZE                  ( AWSIZE   [2:0]  ),
    .AWBURST                 ( AWBURST  [1:0]  ),
    .AWLOCK                  ( AWLOCK          ),
    .AWCACHE                 ( AWCACHE  [3:0]  ),
    .AWPORT                  ( AWPORT   [2:0]  ),
    .AWVALID                 ( AWVALID         ),
    .WDATA                   ( WDATA    [31:0] ),
    .WSTRB                   ( WSTRB    [3:0]  ),
    .WLAST                   ( WLAST           ),
    .WVALID                  ( WVALID          ),
    .BREADY                  ( BREADY          ),
    .ARID                    ( ARID     [3:0]  ),
    .ARADDR                  ( ARADDR   [31:0] ),
    .ARLEN                   ( ARLEN    [7:0]  ),
    .ARSIZE                  ( ARSIZE   [2:0]  ),
    .ARBURST                 ( ARBURST  [1:0]  ),
    .ARLOCK                  ( ARLOCK          ),
    .ARCACHE                 ( ARCACHE  [3:0]  ),
    .ARPROT                  ( ARPROT   [2:0]  ),
    .ARVALID                 ( ARVALID         ),
    .RREADY                  ( RREADY   ),

    .AWREADY                 ( AWREADY         ),
    .WREADY                  ( WREADY          ),
    .BID                     ( BID      [3:0]  ),
    .BRESP                   ( BRESP    [1:0]  ),
    .BVALID                  ( BVALID          ),
    .ARREADY                 ( ARREADY         ),
    .RID                     ( RID      [3:0]  ),
    .RDATA                   ( RDATA    [3:0]  ),
    .RRESP                   ( RRESP    [1:0]  ),
    .RLAST                   ( RLAST           ),
    .RVALID                  ( RVALID          )
);

//时钟与复位
always #(PERIOD/2) ACLK = ~ACLK;
initial begin
    #(PERIOD*2) ARESETn = 1;
end
   
//测试：
//0号测试：突发写入127,并突发读出127传输(ICNR)
//1号测试：突发写入127,并突发读出127传输（WRAP）
//2号测试：同时发起突发读和突发写，查看状态(突发写为选通高两个字节,且将来回切换状态写入不同片和相同片)
//

//考虑到状态比较多，采用8位宽的状态机
reg [7:0] cstate;
reg [7:0] nstate;

`define         IDLE0_R         8'd0            //实验0的读过渡准备
`define         IDLE0_W         8'd1            //实验0的写过渡准备

`define         AWLEN0          8'd2            //发起写地址与写数据
`define         ARLEN0          8'd3            //发起读地址和读数据
`define         END0            8'd4            //实验0结束

`define         SET1            8'd5            //切换到实验1,将AxBURST设置为2'b10

`define         RESET_ALL       8'd6            //准备到实验二，将信号重置
`define         SEND_AW         8'd7            //发送写地址
`define         SEND_W          8'd8            //发送写数据
`define         SEND_AR         8'd9            //发送读地址
`define         GET_B           8'd10           //获取写响应
`define         GET_R           8'd11           //获取读数据和读响应
`define         END1            8'd12           //实验二的第n次结束

`define         SET2            8'd13           //实验二的切换
`define         END2            8'd14           //实验的结束


 

    //*******************
    //WLAST怎么弄
    reg     [7:0]   cnt_wr;   

    always @(posedge ACLK or negedge ARESETn) begin
        if(!ARESETn)    
            cnt_wr <= 0;
        else if(WVALID & WREADY)
            //写数据握手成功就写入一次
            cnt_wr <= cnt_wr - 1;
        else if(AWVALID & AWREADY)
            //写地址握手成功，给写计数器赋值
            cnt_wr <= AWLEN + 1; 
        
    end
    //要写最后一笔数据的时候，将WLAST拉高
   assign WLAST = (cnt_wr == 1) && (WVALID & WREADY);
    
    //wlast_r是用来为BREADY指明的响应状态的
    //wlast_r滞后WLAST一个周期, wlastr为1说明上个周期WLAST为1,即本周期应当是响应周期
    reg wlast_r;
    always @(posedge ACLK or negedge ARESETn) begin
        if(!ARESETn)
            wlast_r <= 0;
        else 
            wlast_r <= WLAST;
    end
    //*******************

//*******************
//设计随机写数据
always @(posedge ACLK or negedge ARESETn) begin
    if(!ARESETn)
        WDATA <= 0;
    else if(WVALID & WREADY)
        WDATA <= $random;
    else
        WDATA <= 0;
end
//*******************

always @(posedge ACLK or negedge ARESETn) begin
    if(!ARESETn)  
        cstate <= `IDLE0_W;
    else
        cstate <= nstate;
end

always @(*) begin
    case (cstate)
        `IDLE0_W: begin
            //写之前，先把所有信号拉低
            ARVALID = 0;
            AWVALID = 0;
            RREADY = 0;
            WVALID = 0;
            BREADY = 0;

            nstate <= `AWLEN0; 
            //这里的初始是INCR，在前面创建的AxBURST已经赋值了
        end

        `AWLEN0: begin
            //直接把写地址有效和写数据拉高，等待对面握手
            AWVALID = 1;
            AWSIZE = 3'b010;        //32位
            AWLEN = 127;             //127笔传输
            AWADDR = 0;             //地址从零开始

            WVALID = 1;
            WSTRB = 4'b1111;        //全写入
            
            if(wlast_r)
                BREADY = wlast_r;       //wlast_r滞后WLAST一个周期, wlastr为1说明上个周期WLAST为1,即本周期应当是响应周期  
            //
            if(BREADY & BVALID)
                nstate = `IDLE0_R;
            else
                nstate = `AWLEN0;
        end

        `IDLE0_R:begin
            //切换到读，清空写的握手信号
            AWVALID = 0;
            WVALID = 0;
            BREADY = 0;
            
            nstate = `ARLEN0;
        end

        `ARLEN0: begin
            ARVALID = 1;           //读地址有效
            ARADDR = 0;            //读地址也从零开始
            ARLEN = 127;            //127笔突发读
            ARSIZE = 3'b010;       //32位

            RREADY = 1;
            if(RLAST)
                nstate = `END0;
            else 
                nstate = `ARLEN0;

        end

        `END0: begin
            //结束阶段，清空所有握手信号
            AWVALID = 0;
            ARVALID = 0;
            WVALID = 0;
            RREADY = 0;
            BREADY = 0;
            nstate = `SET1;
        end

        `SET1 :begin
            //重设阶段
            if(AWBURST == 2'b01 && ARBURST == 2'b01) begin //如果都处于INCR，那么切换为WRAP
                AWBURST = 2'b10;
                ARBURST = 2'b10;
                nstate = `IDLE0_W;
            end
            else begin 
                //如果已经处于WRAP，那么就切换到下一个状态
                nstate = `RESET_ALL;
            end
        end

        `RESET_ALL: begin
            nstate = `SEND_AW;
            AWBURST = 2'b01;
            ARBURST = 2'b01;
        end

        `SEND_AW: begin
            //发送写地址
            AWVALID = 1;
            AWSIZE = 3'b001;        //32位
            AWLEN = 127;             //127笔传输
            if(AWVALID & AWREADY) 
                nstate = `SEND_W;
            else
                nstate = `SEND_AW;
        end

        `SEND_W : begin
            //将写地址有效拉低,并拉高写数据有效
            AWVALID = 0;
            WVALID = 1;
            WSTRB = 4'b1100;        //写入高16位
            nstate = `SEND_AR;
        end

        `SEND_AR: begin
            //读地址有效
            ARVALID = 1;           //读地址有效
            ARLEN = 127;            //127笔突发读
            ARSIZE = 3'b010;       //32位
            if(ARVALID & ARREADY) 
                nstate = `GET_R;
            else
                nstate = `SEND_AR;
        end

        `GET_R: begin
            //分阶段的拉高和拉低握手信号
            ARVALID = 0;
            RREADY = 1;
            nstate = `GET_B;
        end

        `GET_B: begin
            BREADY = 1;
            if(BVALID) begin
                //BVALID到来，说明已经结束写数据了，开始写响应了，因而关闭WVALID
                WVALID = 0;
            end

            if(RLAST) begin
                //RLAST结束
                nstate = `END1;
            end
            else 
                nstate = `GET_B;
        end

        `END1: begin
            AWVALID = 0;
            ARVALID = 0;
            WVALID = 0;
            BREADY = 0;
            RREADY = 0;
            nstate = `SET2;
        end

        `SET2: begin
            //第一次执行同时读写的时候是同一片，因而会先写再读；在第一次执行完成之后，将在这里切换成不同的两片
            if(AWADDR == 0 && ARADDR == 0) begin
                AWADDR[13:0] = 14'b1_000_00000_00000; //另一片的零起始地址             
                nstate = `RESET_ALL;
            end

            //然后再切换读写的两片
            else if(AWADDR != 0 &&  ARADDR == 0) begin
                AWADDR =0;
                ARADDR[13:0] = 14'b1_000_00000_00000;             
                nstate = `RESET_ALL;
            end

            //最后在让其读写同一片
            else if (AWADDR==0 && ARADDR !=0)begin
                AWADDR[13:0] = 14'b1_000_00000_00000;             
                nstate = `RESET_ALL;
            end

            //如果都已经完成,那么结束
            else if(AWADDR != 0 && ARADDR != 0)
                nstate = `END2; 
        end

        `END2: begin
            #300 $finish;
        end
    endcase
end


initial begin
    $fsdbDumpfile("AXI2MEM.fsdb");
    $fsdbDumpvars();
    //#10000 $finish;
end



endmodule

