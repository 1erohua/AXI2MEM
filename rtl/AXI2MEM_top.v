//不支持outstanding，阻塞的读写
//不必支持同时读写
//支持突发读写，不跨越4kb边界
//支持独占访问

module AXI2MEM_top(

    input  wire ACLK,
    input  wire ARESETn,

    //AW
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

    //W
    input  wire [31:0]  WDATA,
    input  wire [3:0]   WSTRB,
    input  wire         WLAST,
    output wire         WREADY,
    input  wire         WVALID,

    //B
    output  wire [3:0]   BID,
    output  wire [1:0]   BRESP,
    output  wire         BVALID,
    input   wire         BREADY,

    //AR
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

    //R
    output wire [3:0]   RID,
    output wire [31:0]   RDATA,
    output wire [3:0]   RRESP,
    output wire         RLAST,
    output wire         RVALID,
    input  wire [3:0]   RREADY 

);

wire [7:0]              b_done;
wire [7:0]              b_fail;         

wire [12:0]             sram_addr_bank0;
wire [12:0]             sram_addr_bank1;

wire [31:0]             sram_wdata;
wire [3:0]              bank0_csn;
wire [3:0]              bank1_csn;

wire [1:0]              wen;

wire [7:0]              sram0,sram1,sram2,sram3,sram4,sram5,sram6,sram7;



AXI2MEM_if  u_AXI2MEM_if (
    .ACLK                    ( ACLK                    ),
    .ARESETn                 ( ARESETn                 ),
    .AWID                    ( AWID             [3:0]  ),
    .AWADDR                  ( AWADDR           [31:0] ),
    .AWLEN                   ( AWLEN            [7:0]  ),
    .AWSIZE                  ( AWSIZE           [2:0]  ),
    .AWBURST                 ( AWBURST          [1:0]  ),
    .AWLOCK                  ( AWLOCK                  ),
    .AWCACHE                 ( AWCACHE          [3:0]  ),
    .AWPORT                  ( AWPORT           [2:0]  ),
    .AWVALID                 ( AWVALID                 ),
    .WDATA                   ( WDATA            [31:0] ),
    .WSTRB                   ( WSTRB            [3:0]  ),
    .WLAST                   ( WLAST                   ),
    .WVALID                  ( WVALID                  ),
    .BREADY                  ( BREADY                  ),
    .ARID                    ( ARID             [3:0]  ),
    .ARADDR                  ( ARADDR           [31:0] ),
    .ARLEN                   ( ARLEN            [7:0]  ),
    .ARSIZE                  ( ARSIZE           [2:0]  ),
    .ARBURST                 ( ARBURST          [1:0]  ),
    .ARLOCK                  ( ARLOCK                  ),
    .ARCACHE                 ( ARCACHE          [3:0]  ),
    .ARPROT                  ( ARPROT           [2:0]  ),
    .ARVALID                 ( ARVALID                 ),
    .RREADY                  ( RREADY           [3:0]  ),
    .sram0                   ( sram0            [7:0]  ),
    .sram1                   ( sram1            [7:0]  ),
    .sram2                   ( sram2            [7:0]  ),
    .sram3                   ( sram3            [7:0]  ),
    .sram4                   ( sram4            [7:0]  ),
    .sram5                   ( sram5            [7:0]  ),
    .sram6                   ( sram6            [7:0]  ),
    .sram7                   ( sram7            [7:0]  ),

    .AWREADY                 ( AWREADY                 ),
    .WREADY                  ( WREADY                  ),
    .BID                     ( BID              [3:0]  ),
    .BRESP                   ( BRESP            [1:0]  ),
    .BVALID                  ( BVALID                  ),
    .ARREADY                 ( ARREADY                 ),
    .RID                     ( RID              [3:0]  ),
    .RDATA                   ( RDATA            [31:0] ),
    .RRESP                   ( RRESP            [3:0]  ),
    .RLAST                   ( RLAST                   ),
    .RVALID                  ( RVALID                  ),
    .sram_wdata              ( sram_wdata       [31:0] ),
    .wen                     ( wen              [1:0]  ),
    .bank0_csn               ( bank0_csn        [3:0]  ),
    .bank1_csn               ( bank1_csn        [3:0]  ),
    .sram_addr_bank0         ( sram_addr_bank0  [12:0] ),
    .sram_addr_bank1         ( sram_addr_bank1  [12:0] )
);
//*********************************
//第一片sram，位宽为32位，深度为8k
bist_sram  u_bist_sram_0 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank0    ),
    .sram_wdata              ( sram_wdata  [7:0]  ),
    .sram_wen                ( wen[0]             ),
    .sram_csn                ( bank0_csn[0]       ),

    .sram_rdata              ( sram0  [7:0]  ),
    .b_done                  ( b_done[0]          ),
    .b_fail                  ( b_fail[0]          )
);

bist_sram  u_bist_sram_1 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank0    ),
    .sram_wdata              ( sram_wdata  [15:8]  ),
    .sram_wen                ( wen[0]             ),
    .sram_csn                ( bank0_csn[1]       ),

    .sram_rdata              ( sram1  [7:0]  ),
    .b_done                  ( b_done[1]          ),
    .b_fail                  ( b_fail[1]          )
);

bist_sram  u_bist_sram_2 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank0    ),
    .sram_wdata              ( sram_wdata  [23:16]),
    .sram_wen                ( wen[0]             ),
    .sram_csn                ( bank0_csn[2]       ),

    .sram_rdata              ( sram2  [7:0]  ),
    .b_done                  ( b_done[2]          ),
    .b_fail                  ( b_fail[2]          )
);

bist_sram  u_bist_sram_3 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank0    ),
    .sram_wdata              ( sram_wdata  [31:24]),
    .sram_wen                ( wen[0]             ),
    .sram_csn                ( bank0_csn[3]       ),

    .sram_rdata              ( sram3  [7:0]  ),
    .b_done                  ( b_done[3]          ),
    .b_fail                  ( b_fail[3]          )
);
//*********************************


//*********************************
//第二片sram，位宽为32位，深度为8k
bist_sram  u_bist_sram_4 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank1    ),
    .sram_wdata              ( sram_wdata  [7:0]  ),
    .sram_wen                ( wen[1]             ),
    .sram_csn                ( bank1_csn[0]       ),

    .sram_rdata              ( sram4  [7:0]  ),
    .b_done                  ( b_done[0]          ),
    .b_fail                  ( b_fail[0]          )
);

bist_sram  u_bist_sram_5 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank1    ),
    .sram_wdata              ( sram_wdata  [15:8]  ),
    .sram_wen                ( wen[1]             ),
    .sram_csn                ( bank1_csn[1]       ),

    .sram_rdata              ( sram5  [7:0]  ),
    .b_done                  ( b_done[1]          ),
    .b_fail                  ( b_fail[1]          )
);

bist_sram  u_bist_sram_6 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank1    ),
    .sram_wdata              ( sram_wdata  [23:16]),
    .sram_wen                ( wen[1]             ),
    .sram_csn                ( bank1_csn[2]       ),

    .sram_rdata              ( sram6  [7:0]  ),
    .b_done                  ( b_done[2]          ),
    .b_fail                  ( b_fail[2]          )
);

bist_sram  u_bist_sram_7 (
    .sram_clk                ( ACLK               ),
    .sram_rst_n              ( ARESETn            ),
    .bist_en                 ( 0                  ),
    .sram_addr               ( sram_addr_bank1    ),
    .sram_wdata              ( sram_wdata  [31:24]),
    .sram_wen                ( wen[1]             ),
    .sram_csn                ( bank1_csn[3]       ),

    .sram_rdata              ( sram7  [7:0]  ),
    .b_done                  ( b_done[3]          ),
    .b_fail                  ( b_fail[3]          )
);
//*********************************


endmodule
