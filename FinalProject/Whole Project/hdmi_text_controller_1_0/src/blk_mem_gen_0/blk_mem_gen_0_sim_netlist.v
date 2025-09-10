// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Apr 10 21:40:11 2025
// Host        : Zephyrus running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/new_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1200" *) 
  (* C_READ_DEPTH_B = "1200" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "1200" *) 
  (* C_WRITE_DEPTH_B = "1200" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48192)
`pragma protect data_block
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
HqkUj8P62dD5CLG8KabZrV6Q0MI7Tbetsv0E
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
