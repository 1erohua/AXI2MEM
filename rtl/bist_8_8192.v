//整个设计没有问题
//带有bist的sram
module  bist_8_8192
(
    input                   b_clk,                
    input                   b_rst_n,
    input                   b_en,               //bist模式使能

    //从这引入的是ahb的正常输入
    input       [12:0]      addr_in,
    input       [7:0]       wdata_in,
    input                   wen,
    input                   csn,

    //从sram引入的，用作比较
    input       [7:0]      sram_data_in,

    //引给sram_ip的
    output      [12:0]      addr_out,
    output      [7:0]       wdata_out,
    output                  wen_out,
    output                  csn_out,

    //最终用于测试的结果
    output reg              b_done,
    output reg              b_fail

);
    //如果启用bist，那么接下来将有bist模块进行自建立测试，所有输出（引入到sram的值都将被设置为自建立产生的值）
    reg         [12:0]      addr_out_bist;
    reg         [7:0]       wdata_out_bist;
    reg                     wen_out_bist;       //低电平是写,高电平是读   

    assign addr_out =  b_en ? addr_out_bist : addr_in ; 
    assign wdata_out = b_en ? wdata_out_bist : wdata_in;
    assign wen_out = b_en ? wen_out_bist : wen;
    assign csn_out = b_en ? 1'b0 : csn;         //默认选中的呀(低电平有效)

    //地址控制部分
    reg                     incre0_decre1;      //为0时为递增状态，为1时是递减状态    
    reg                     addr_rst_n;         //地址复位信号，用于切换递增递减的复位

    always @(posedge b_clk or negedge b_rst_n) begin 
        if(!b_rst_n) begin
            addr_out_bist <= 0;
        end     

        else begin
            //切换递增递减状态时，需要将地址复位
            if(!addr_rst_n) begin
                if(incre0_decre1==1'b0) begin           //递增状态      地址复位为0
                    addr_out_bist <=  13'b0;
                end
                else begin                              //递减状态      地址复位为1
                    addr_out_bist <=  13'h1fff;         //一个f代表4'b1111
                end
            end

            else begin
                if(incre0_decre1==1'b0) begin 
                    addr_out_bist <= addr_out_bist +1;
                end
                else begin
                    addr_out_bist <= addr_out_bist -1;
                end
            end
        end
    end
    //

    //比较装置,用于判断是fail还是成功
    //比较装置应该是在处于比较状态下再启用的，因而不应该使用组合逻辑时刻判断
    reg                     compare_on;     //启用比较
    reg        [7:0]       data_compare;   //要比较的数, 用来存一个数，当进入比较状态的时候，指定要比较的值
    
    always @(posedge b_clk or negedge b_rst_n )begin 
        if(!b_rst_n)begin
            b_fail <= 1'b0;
        end

        else if(b_en == 1'b1) begin 
            if(compare_on && (data_compare != sram_data_in))
                b_fail <= 1'b1;
        end

        else b_fail <= 1'b0;

    end
    //

    //状态机
    `define     IDLE            4'b0000
    `define     WRITE0          4'b0001
    `define     READ0           4'b0011
    `define     COMPARE0        4'b0010
    `define     COMPARE0_IDLE   4'b1010
    `define     READ1           4'b0110
    `define     WRITE1          4'b0111
    `define     COMPARE1        4'b0101
    `define     END             4'b1101
    
    reg     [3:0]           c_state;        //现态
    reg     [3:0]           n_state;        //次态

    //状态机第一步，现态切换
    always @(posedge b_clk or negedge b_rst_n) begin
        if(!b_rst_n) begin 
            c_state <= `IDLE ; 
        end
        else begin
            c_state <= n_state;
        end
    end

    //状态机第二步，次态切换
    //addr_out_bist 和 c_state 都是在时钟沿进行切换
    always @(addr_out_bist or b_en or c_state) begin 
        //先什么都不管了，全部赋一遍初始值再说

        case (c_state) 
            `IDLE: begin
                incre0_decre1 = 0;                      //初始默认递增
                wdata_out_bist = 0;                     //初始默认写入0
                wen_out_bist = 0;                       //初始默认是写状态 写使能为低的时候，代表为写状态

                b_done = 0;                             //初始的时候肯定没有完成
                compare_on = 0;                         //初始时设置未启用对比
                
                addr_rst_n = 0;
                if(b_en) begin 
                    n_state = `WRITE0;
                    addr_rst_n = 1;
                end
                else 
                    n_state = `IDLE;
            end

            `WRITE0: begin                              //递增写
                if(addr_out_bist==13'h1fff) begin       //
                    n_state = `READ0;
                    addr_rst_n = 0;
                end
                else 
                    n_state = `WRITE0;
            end

            `READ0: begin                       //递增读
                //上个周期使用了addr_rst_n进行复位，那么这个周期复位成功，地址变成了复位之后的地址
                //并在这个周期将读信号有效，然后将复位信号降低                
                //由于复位是同步复位，因而如果当前周期遇到的下一个时钟沿需要用地址
                //就必须在当前周期的时钟沿读到复位信号，然后当前周期把复位后地址准备好
               
                //因此复位信号需要要上个周期就准备好，这个周期准备复位后地址，让下个周期的上升沿来读
                addr_rst_n = 1;
                wen_out_bist = 1;               //读状态
                n_state = `COMPARE0;
            end

            `COMPARE0: begin
                compare_on = 1;
                data_compare = 0;
                if(addr_out_bist == 13'h1fff) begin         //我理解了,这里确实是13'h1fff,当c_state切换到这个状态之后
                    n_state = `COMPARE0_IDLE ;              //当c_state切换到这个状态之后, 这里所用的所有数据都是当前拍的
                    addr_rst_n = 0;                         //而不是上一拍的输入
                    //这也说明了为什么,不是先有的13'h1fff再有的n_state=compare_idle
                    //而是两者共同进行的
                    //我差点忘了，状态机的状态切换是组合逻辑，因而用的是都是当前周期的数据做判断
                    //我当然知道这些代码都是组合逻辑，但是那个if判断的时候却用了时序逻辑。。。
                    incre0_decre1 = 1;

                end

                else begin 
                    n_state = `COMPARE0 ; 
                end
            end

            `COMPARE0_IDLE : begin          //由于地址为8191时数据需要下个周期才能出现
                n_state = `WRITE1;          //因而需要一个周期的维持，在下个数据比较完之后再进入写状态
                           //进入到本周期后，进行最后一次对比并且将比较信号拉低
                compare_on = 0;             //这样下个周期到来的时候接收的compare信号就是0了,也就不会进行比较

            end

            `WRITE1: begin              //递减写
                wen_out_bist = 0;
                wdata_out_bist = 8'hff;
                addr_rst_n = 1;

                if(addr_out_bist == 13'b0) begin
                    //注意，读使能的调高决不能在这里做
                    //因为当前周期，地址第一次到13'b0，因而当前周期产生的写使能仍然要生效
                    //这样下个时钟的上升沿才能接收到有效的写使能，将数据写入地址13'b0
                    //然后在下个周期再顺势把写使能无效，读使能有效
                    n_state = `READ1 ;              
                    incre0_decre1 = 0;
                    addr_rst_n = 0;
                end
                else begin
                    n_state = `WRITE1 ;
                end
            end

            `READ1 : begin              //递增读
                //读状态刚到的时候，写周期写完最后一个数据; 读状态快结束的时候，将地址、使能送入下个周期
                addr_rst_n = 1;
                wen_out_bist = 1;
                n_state = `COMPARE1;

            end
                                                            //时钟             第n个时钟          第n+1个时钟
            `COMPARE1 : begin                               //c_state           compare1           end
                compare_on = 1 ;                            //addr_out_bist     13'h1fff           13'h1fff+1 = 0 
                data_compare = 8'hff;                       //n_state           end                end
                                                            //操作           比较倒数第二个值     比较最后一个值
                if(addr_out_bist == 13'h1fff) begin         //永远记得
                                                            //这个周期给出地址的值，下个周期才能给出数据
                    n_state = `END ;                        //比较使能在第n个时钟还需要保持有效，因为比较器会在第n+1个时钟的上升沿读入比较使能，因而在第n+1个时钟完成比较之后，就可以拉低了
                end
                   
            end

            `END : begin 
                compare_on = 0;
                b_done = 1;
                addr_rst_n = 0;
                incre0_decre1 = 0;
            end

            default : begin
                addr_rst_n = 1;
            end
        endcase
    end

endmodule
