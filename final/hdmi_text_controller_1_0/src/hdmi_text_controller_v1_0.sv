//Provided HDMI_Text_controller_v1_0 for HDMI AXI4 IP 
//Fall 2024 Distribution

//Modified 3/10/24 by Zuofu
//Updated 11/18/24 by Zuofu


`timescale 1 ns / 1 ps

module hdmi_text_controller_v1_0 #
(
    // Parameters of Axi Slave Bus Interface S00_AXI
    // Modify parameters as necessary for access of full VRAM range

    parameter integer C_AXI_DATA_WIDTH	= 32,
    parameter integer C_AXI_ADDR_WIDTH	= 16
)
(
    // Users to add ports here

    output logic hdmi_clk_n,
    output logic hdmi_clk_p,
    output logic [2:0] hdmi_tx_n,
    output logic [2:0] hdmi_tx_p,

    // User ports ends
    // Do not modify the ports beyond this line


    // Ports of Axi Slave Bus Interface AXI
    input logic  axi_aclk,
    input logic  axi_aresetn,
    input logic [C_AXI_ADDR_WIDTH-1 : 0] axi_awaddr,
    input logic [2 : 0] axi_awprot,
    input logic  axi_awvalid,
    output logic  axi_awready,
    input logic [C_AXI_DATA_WIDTH-1 : 0] axi_wdata,
    input logic [(C_AXI_DATA_WIDTH/8)-1 : 0] axi_wstrb,
    input logic  axi_wvalid,
    output logic  axi_wready,
    output logic [1 : 0] axi_bresp,
    output logic  axi_bvalid,
    input logic  axi_bready,
    input logic [C_AXI_ADDR_WIDTH-1 : 0] axi_araddr,
    input logic [2 : 0] axi_arprot,
    input logic  axi_arvalid,
    output logic  axi_arready,
    output logic [C_AXI_DATA_WIDTH-1 : 0] axi_rdata,
    output logic [1 : 0] axi_rresp,
    output logic  axi_rvalid,
    input logic  axi_rready,
    input logic [31:0] score
);

//additional logic variables as necessary to support VGA, and HDMI modules.

    logic clk_25MHz, clk_125MHz, clk, clk_100MHz, clk_75MHz;
    logic locked;
    logic [9:0] drawX, drawY;
    logic [16:0] ram_addr;
    logic [1:0] color;
    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    logic [10:0] rom_addr;
    logic [7:0] rom_data;
    logic [31:0] control_data;
    logic [31:0] vram_data;
    logic [9:0] vram_addr;

    
    logic [13:0]  sram_addra;
    logic [31:0] sram_dina;
    logic        sram_ena;
    logic [3:0]  sram_wea;
    logic [31:0] sram_douta;
    logic [13:0]  sram_addrb;
    logic [31:0] sram_dinb;
    logic        sram_enb;
    logic [3:0]  sram_web;
    logic [31:0] sram_doutb;
    
//    logic [4:0] fg_color;
//    logic [4:0] bg_color;
//    logic [11:0] fg_palatte_color; 
//    logic [11:0] bg_palatte_color;
    
    assign reset_ah = ~axi_aresetn;
// Instantiation of Axi Bus Interface AXI
 hdmi_text_controller_v1_0_AXI # ( 
     .C_S_AXI_DATA_WIDTH(C_AXI_DATA_WIDTH),
     .C_S_AXI_ADDR_WIDTH(C_AXI_ADDR_WIDTH)
 ) hdmi_text_controller_v1_0_AXI_inst (
     .S_AXI_ACLK(axi_aclk),
     .S_AXI_ARESETN(axi_aresetn),
     .S_AXI_AWADDR(axi_awaddr),
     .S_AXI_AWPROT(axi_awprot),
     .S_AXI_AWVALID(axi_awvalid),
     .S_AXI_AWREADY(axi_awready),
     .S_AXI_WDATA(axi_wdata),
     .S_AXI_WSTRB(axi_wstrb),
     .S_AXI_WVALID(axi_wvalid),
     .S_AXI_WREADY(axi_wready),
     .S_AXI_BRESP(axi_bresp),
     .S_AXI_BVALID(axi_bvalid),
     .S_AXI_BREADY(axi_bready),
     .S_AXI_ARADDR(axi_araddr),
     .S_AXI_ARPROT(axi_arprot),
     .S_AXI_ARVALID(axi_arvalid),
     .S_AXI_ARREADY(axi_arready),
     .S_AXI_RDATA(axi_rdata),
     .S_AXI_RRESP(axi_rresp),
     .S_AXI_RVALID(axi_rvalid),
     .S_AXI_RREADY(axi_rready),
 //    .reg_addr(vram_addr),
 //    .reg_data(vram_data),
 //    .control_data(control_data)
     .sram_addra(sram_addra),
     .sram_dina(sram_dina),
     .sram_ena(sram_ena),
     .sram_wea(sram_wea),
     .sram_douta(sram_douta)
 );




    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

//    Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        //Clocking and Reset
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        //Reset is active LOW
        .rst(reset_ah),
        //Color and Sync Signals
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        
        //aux Data (unused)
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        
        //Differential outputs
        .TMDS_CLK_P(hdmi_clk_p),          
        .TMDS_CLK_N(hdmi_clk_n),          
        .TMDS_DATA_P(hdmi_tx_p),         
        .TMDS_DATA_N(hdmi_tx_n)          
    );
    
    //Color Mapper Module   
   
    pixel_color pixel_color_i(
        .drawX(drawX), 
        .drawY(drawY),
        .rom_data(rom_data),
        .sram_data(sram_doutb),
        .Red(red), 
        .Green(green), 
        .Blue(blue),
        .sram_addr(sram_addrb),
        .rom_addr(rom_addr),
        .sram_enb(sram_enb),
        .clk(axi_aclk),
        .score(score),
        .ram_addr(ram_addr),
        .color(color)
    );
    
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .clk_out3(clk_75MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(axi_aclk)
    );
    
    font_rom font_rom_i (
        .addr(rom_addr),
        .data(rom_data)
     );
    

     
     blk_mem_gen_0 sram0 (
        .addra	(sram_addra),
        .clka	(axi_aclk),
        .dina	(sram_dina),
        .ena	(sram_ena),
        .wea	(sram_wea),
        .douta	(sram_douta),
        .addrb	(sram_addrb),
        .clkb	(clk_75MHz),
        .dinb	(sram_dinb),
        .enb	(sram_enb),
        .web	(sram_web),
        .doutb	(sram_doutb)
    );
    
    blk_mem_gen_1 rom (
        .addra(ram_addr),
        .clka(clk_75MHz),
        .douta(color)
    );
//Instiante clocking wizard, VGA sync generator modules, and VGA-HDMI IP here. For a hint, refer to the provided
//top-level from the previous lab. You should get the IP to generate a valid HDMI signal (e.g. blue screen or gradient)
//prior to working on the text drawing.

// User logic ends

endmodule