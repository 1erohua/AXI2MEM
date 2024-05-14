module bist_sram(
    input                       sram_clk,       
    input                       sram_rst_n,
    input                       bist_en,

    input   [12:0]              sram_addr,
    input   [7:0]               sram_wdata,
    input                       sram_wen,
    input                       sram_csn,

    output  [7:0]               sram_rdata,
    output                      b_done,
    output                      b_fail

);
    wire    [7:0]               sram_data_in_bist;
    wire    [12:0]              addr_out_bist;
    wire    [7:0]               wdata_out_bist;
    wire                        wen_out_bist;
    wire                        csn_out_bist;                  



    bist_8_8192 x1(
        .b_clk(sram_clk),          
        .b_rst_n(sram_rst_n),
        .b_en(bist_en),           
                        
        .addr_in(sram_addr),         
        .wdata_in(sram_wdata),
        .wen(sram_wen),
        .csn(sram_csn),
                        
        
        .sram_data_in(sram_rdata),
                        
                        
        .addr_out(addr_out_bist),
        .wdata_out(wdata_out_bist),
        .wen_out(wen_out_bist),
        .csn_out(csn_out_bist),
                        
                        
        .b_done(b_done),
        .b_fail(b_fail)
    );

    sram_8_8192_scn4m_subm s1(
        .clk0(~sram_clk),
        .csb0(csn_out_bist),
        .web0(wen_out_bist),
        .addr0(addr_out_bist),
        .din0(wdata_out_bist),
        .dout0(sram_rdata)

    );


endmodule
