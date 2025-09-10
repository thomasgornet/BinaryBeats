
##################################################################################################
## LP_DDR3 INTERFACE FOR THE URBANA BOARD based on the July 18 2022 schematic
## Memory Device: DDR3_SDRAM->Components->MT41K256M16XX-15E
## Data Width: 16
## Time Period: 2500
## Data Mask: 1
## Rick Ballantyne AMD July25 2022 NOT HARDWARE VERIFIED
##################################################################################################
############## NET - IOSTANDARD ##################

# PadFunction: IO_L12P_T1_MRCC_14 (SCHEMATIC CLK_100MHZ)
set_property IOSTANDARD LVCMOS33 [get_ports clk_ref_i]
set_property PACKAGE_PIN N15 [get_ports clk_ref_i]
create_clock -period 10.000 [get_ports clk_ref_i]

set_property IOSTANDARD LVCMOS25 [get_ports sys_rst]
set_property PACKAGE_PIN J2 [get_ports sys_rst]

# PadFunction: IO_L12N_T1_MRCC_16 (SCHEMATIC RGB0_G)
set_property IOSTANDARD LVCMOS33 [get_ports ram_init_done]
set_property PACKAGE_PIN A9 [get_ports ram_init_done]

# PadFunction: IO_L14N_T2_SRCC_16 (SCHEMATIC RGB1_R)
set_property IOSTANDARD LVCMOS33 [get_ports ram_init_error]
set_property PACKAGE_PIN A11 [get_ports ram_init_error]

# Set SPI buswidth
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[0]}]
set_property PACKAGE_PIN G6 [get_ports {hex_gridA[0]}]
set_property PACKAGE_PIN H6 [get_ports {hex_gridA[1]}]
set_property PACKAGE_PIN C3 [get_ports {hex_gridA[2]}]
set_property PACKAGE_PIN B3 [get_ports {hex_gridA[3]}]
set_property PACKAGE_PIN E6 [get_ports {hex_segA[0]}]
set_property PACKAGE_PIN B4 [get_ports {hex_segA[1]}]
set_property PACKAGE_PIN D5 [get_ports {hex_segA[2]}]
set_property PACKAGE_PIN C5 [get_ports {hex_segA[3]}]
set_property PACKAGE_PIN D7 [get_ports {hex_segA[4]}]
set_property PACKAGE_PIN D6 [get_ports {hex_segA[5]}]
set_property PACKAGE_PIN C4 [get_ports {hex_segA[6]}]
set_property PACKAGE_PIN B5 [get_ports {hex_segA[7]}]
set_property PACKAGE_PIN F3 [get_ports {hex_segB[0]}]
set_property PACKAGE_PIN G5 [get_ports {hex_segB[1]}]
set_property PACKAGE_PIN J3 [get_ports {hex_segB[2]}]
set_property PACKAGE_PIN H4 [get_ports {hex_segB[3]}]
set_property PACKAGE_PIN F4 [get_ports {hex_segB[4]}]
set_property PACKAGE_PIN H3 [get_ports {hex_segB[5]}]
set_property PACKAGE_PIN E5 [get_ports {hex_segB[6]}]
set_property PACKAGE_PIN J4 [get_ports {hex_segB[7]}]
set_property PACKAGE_PIN E4 [get_ports {hex_gridB[0]}]
set_property PACKAGE_PIN E3 [get_ports {hex_gridB[1]}]
set_property PACKAGE_PIN F5 [get_ports {hex_gridB[2]}]
set_property PACKAGE_PIN H5 [get_ports {hex_gridB[3]}]

set_property -dict {PACKAGE_PIN M16 IOSTANDARD LVCMOS33} [get_ports sd_miso]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports sd_cs]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports sd_mosi]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports sd_sclk]

# On-board Slide Switches
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS25} [get_ports {SW[0]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS25} [get_ports {SW[1]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS25} [get_ports {SW[2]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS25} [get_ports {SW[3]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS25} [get_ports {SW[4]}]
set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS25} [get_ports {SW[5]}]
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS25} [get_ports {SW[6]}]
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS25} [get_ports {SW[7]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS25} [get_ports {SW[8]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS25} [get_ports {SW[9]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS25} [get_ports {SW[10]}]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS25} [get_ports {SW[11]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS25} [get_ports {SW[12]}]
set_property -dict {PACKAGE_PIN A7 IOSTANDARD LVCMOS25} [get_ports {SW[13]}]
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS25} [get_ports {SW[14]}]
set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS25} [get_ports {SW[15]}]

# On-board LEDs
set_property -dict {PACKAGE_PIN C13 IOSTANDARD LVCMOS33} [get_ports {LED[0]}]
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS33} [get_ports {LED[1]}]
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports {LED[2]}]
set_property -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS33} [get_ports {LED[3]}]
set_property -dict {PACKAGE_PIN D16 IOSTANDARD LVCMOS33} [get_ports {LED[4]}]
set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports {LED[5]}]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {LED[6]}]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports {LED[7]}]
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {LED[8]}]
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports {LED[9]}]
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports {LED[10]}]
set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS33} [get_ports {LED[11]}]
set_property -dict {PACKAGE_PIN C18 IOSTANDARD LVCMOS33} [get_ports {LED[12]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {LED[13]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {LED[14]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {LED[15]}]


# PadFunction: IO_L1N_T0_34 (SCHEMATIC DDR_DQ0)
current_instance -quiet
set_property SLEW FAST [get_ports {ddr3_dq[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[0]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[0]}]
set_property PACKAGE_PIN K2 [get_ports {ddr3_dq[0]}]

# PadFunction: IO_L2P_T0_34 (SCHEMATIC DDR_DQ1)
set_property SLEW FAST [get_ports {ddr3_dq[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[1]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[1]}]
set_property PACKAGE_PIN M4 [get_ports {ddr3_dq[1]}]

# PadFunction: IO_L2N_T0_34 (SCHEMATIC DDR_DQ2)
set_property SLEW FAST [get_ports {ddr3_dq[2]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[2]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[2]}]
set_property PACKAGE_PIN K3 [get_ports {ddr3_dq[2]}]

# PadFunction: IO_L4P_T0_34 (SCHEMATIC DDR_DQ3)
set_property SLEW FAST [get_ports {ddr3_dq[3]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[3]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[3]}]
set_property PACKAGE_PIN L5 [get_ports {ddr3_dq[3]}]

# PadFunction: IO_L4N_T0_34 (SCHEMATIC DDR_DQ4)
set_property SLEW FAST [get_ports {ddr3_dq[4]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[4]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[4]}]
set_property PACKAGE_PIN L6 [get_ports {ddr3_dq[4]}]

# PadFunction: IO_L5P_T0_34 (SCHEMATIC DDR_DQ5)
set_property SLEW FAST [get_ports {ddr3_dq[5]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[5]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[5]}]
set_property PACKAGE_PIN M6 [get_ports {ddr3_dq[5]}]

# PadFunction: IO_L5N_T0_34 (SCHEMATIC DDR_DQ6)
set_property SLEW FAST [get_ports {ddr3_dq[6]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[6]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[6]}]
set_property PACKAGE_PIN L4 [get_ports {ddr3_dq[6]}]

# PadFunction: IO_L6P_T0_34 (SCHEMATIC DDR_DQ7)
set_property SLEW FAST [get_ports {ddr3_dq[7]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[7]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[7]}]
set_property PACKAGE_PIN K6 [get_ports {ddr3_dq[7]}]

# PadFunction: IO_L7N_T1_34 (SCHEMATIC DDR_DQ8)
set_property SLEW FAST [get_ports {ddr3_dq[8]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[8]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[8]}]
set_property PACKAGE_PIN N5 [get_ports {ddr3_dq[8]}]

# PadFunction: IO_L8P_T1_34 (SCHEMATIC DDR_DQ9)
set_property SLEW FAST [get_ports {ddr3_dq[9]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[9]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[9]}]
set_property PACKAGE_PIN M1 [get_ports {ddr3_dq[9]}]

# PadFunction: IO_L8N_T1_34 (SCHEMATIC DDR_DQ10)
set_property SLEW FAST [get_ports {ddr3_dq[10]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[10]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[10]}]
set_property PACKAGE_PIN P1 [get_ports {ddr3_dq[10]}]

# PadFunction: IO_L10P_T1_34 (SCHEMATIC DDR_DQ11)
set_property SLEW FAST [get_ports {ddr3_dq[11]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[11]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[11]}]
set_property PACKAGE_PIN N1 [get_ports {ddr3_dq[11]}]

# PadFunction: IO_L10N_T1_34 (SCHEMATIC DDR_DQ12)
set_property SLEW FAST [get_ports {ddr3_dq[12]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[12]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[12]}]
set_property PACKAGE_PIN R2 [get_ports {ddr3_dq[12]}]

# PadFunction: IO_L11P_T1_SRCC_34 (SCHEMATIC DDR_DQ13)
set_property SLEW FAST [get_ports {ddr3_dq[13]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[13]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[13]}]
set_property PACKAGE_PIN N4 [get_ports {ddr3_dq[13]}]

# PadFunction: IO_L11N_T1_SRCC_34 (SCHEMATIC DDR_DQ14)
set_property SLEW FAST [get_ports {ddr3_dq[14]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[14]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[14]}]
set_property PACKAGE_PIN P2 [get_ports {ddr3_dq[14]}]

# PadFunction: IO_L12P_T1_MRCC_34 (SCHEMATIC DDR_DQ15)
set_property SLEW FAST [get_ports {ddr3_dq[15]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[15]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dq[15]}]
set_property PACKAGE_PIN M2 [get_ports {ddr3_dq[15]}]

# PadFunction: IO_L13P_T2_MRCC_34 (SCHEMATIC DDR_A14)
#set_property SLEW FAST [get_ports {ddr3_addr[14]}]
#set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[14]}]
#set_property PACKAGE_PIN R6 [get_ports {ddr3_addr[14]}]

# PadFunction: IO_L13N_T2_MRCC_34 (SCHEMATIC DDR_A13)
#set_property SLEW FAST [get_ports {ddr3_addr[13]}]
#set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[13]}]
#set_property PACKAGE_PIN V7 [get_ports {ddr3_addr[13]}]

# PadFunction: IO_L14P_T2_SRCC_34 (SCHEMATIC DDR_A12)
set_property SLEW FAST [get_ports {ddr3_addr[12]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[12]}]
set_property PACKAGE_PIN V6 [get_ports {ddr3_addr[12]}]

# PadFunction: IO_L14N_T2_SRCC_34 (SCHEMATIC DDR_A11)
set_property SLEW FAST [get_ports {ddr3_addr[11]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[11]}]
set_property PACKAGE_PIN P5 [get_ports {ddr3_addr[11]}]

# PadFunction: IO_L15P_T2_DQS_34 (SCHEMATIC DDR_A10)
set_property SLEW FAST [get_ports {ddr3_addr[10]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[10]}]
set_property PACKAGE_PIN U3 [get_ports {ddr3_addr[10]}]

# PadFunction: IO_L15N_T2_DQS_34 (SCHEMATIC DDR_A9)
set_property SLEW FAST [get_ports {ddr3_addr[9]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[9]}]
set_property PACKAGE_PIN U6 [get_ports {ddr3_addr[9]}]

# PadFunction: IO_L16P_T2_34 (SCHEMATIC DDR_A8)
set_property SLEW FAST [get_ports {ddr3_addr[8]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[8]}]
set_property PACKAGE_PIN R7 [get_ports {ddr3_addr[8]}]

# PadFunction: IO_L16N_T2_34 (SCHEMATIC DDR_A7)
set_property SLEW FAST [get_ports {ddr3_addr[7]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[7]}]
set_property PACKAGE_PIN U7 [get_ports {ddr3_addr[7]}]

# PadFunction: IO_L17P_T2_34 (SCHEMATIC DDR_A6)
set_property SLEW FAST [get_ports {ddr3_addr[6]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[6]}]
set_property PACKAGE_PIN V5 [get_ports {ddr3_addr[6]}]

# PadFunction: IO_L17N_T2_34 (SCHEMATIC DDR_A5)
set_property SLEW FAST [get_ports {ddr3_addr[5]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[5]}]
set_property PACKAGE_PIN T1 [get_ports {ddr3_addr[5]}]

# PadFunction: IO_L18P_T2_34 (SCHEMATIC DDR_A4)
set_property SLEW FAST [get_ports {ddr3_addr[4]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[4]}]
set_property PACKAGE_PIN T6 [get_ports {ddr3_addr[4]}]

# PadFunction: IO_L18N_T2_34 (SCHEMATIC DDR_A3)
set_property SLEW FAST [get_ports {ddr3_addr[3]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[3]}]
set_property PACKAGE_PIN T3 [get_ports {ddr3_addr[3]}]

# PadFunction: IO_L19P_T3_34 (SCHEMATIC DDR_A2)
set_property SLEW FAST [get_ports {ddr3_addr[2]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[2]}]
set_property PACKAGE_PIN P6 [get_ports {ddr3_addr[2]}]

# PadFunction: IO_L19N_T3_VREF_34 (SCHEMATIC DDR_A1)
set_property SLEW FAST [get_ports {ddr3_addr[1]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[1]}]
set_property PACKAGE_PIN R4 [get_ports {ddr3_addr[1]}]

# PadFunction: IO_L20P_T3_34 (SCHEMATIC DDR_A0)
set_property SLEW FAST [get_ports {ddr3_addr[0]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_addr[0]}]
set_property PACKAGE_PIN V3 [get_ports {ddr3_addr[0]}]

# PadFunction: IO_L20N_T3_34 (SCHEMATIC DDR_BA2)
set_property SLEW FAST [get_ports {ddr3_ba[2]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_ba[2]}]
set_property PACKAGE_PIN R3 [get_ports {ddr3_ba[2]}]

# PadFunction: IO_L22P_T3_34 (SCHEMATIC DDR_BA1)
set_property SLEW FAST [get_ports {ddr3_ba[1]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_ba[1]}]
set_property PACKAGE_PIN V4 [get_ports {ddr3_ba[1]}]

# PadFunction: IO_L22N_T3_34 (SCHEMATIC DDR_BA0)
set_property SLEW FAST [get_ports {ddr3_ba[0]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_ba[0]}]
set_property PACKAGE_PIN V2 [get_ports {ddr3_ba[0]}]

# PadFunction: IO_L23P_T3_34 (SCHEMATIC DDR_RAS_B
set_property SLEW FAST [get_ports ddr3_ras_n]
set_property IOSTANDARD SSTL135 [get_ports ddr3_ras_n]
set_property PACKAGE_PIN U2 [get_ports ddr3_ras_n]

# PadFunction: IO_L23N_T3_34 (SCHEMATIC DDR_CAS_B)
set_property SLEW FAST [get_ports ddr3_cas_n]
set_property IOSTANDARD SSTL135 [get_ports ddr3_cas_n]
set_property PACKAGE_PIN U1 [get_ports ddr3_cas_n]

# PadFunction: IO_L24P_T3_34 (SCHEMATIC DDR_WE_B)
set_property SLEW FAST [get_ports ddr3_we_n]
set_property IOSTANDARD SSTL135 [get_ports ddr3_we_n]
set_property PACKAGE_PIN T2 [get_ports ddr3_we_n]

# PadFunction: IO_L6N_T0_VREF_34 (SCHEMATIC DDR_RESET_B)
set_property SLEW FAST [get_ports ddr3_reset_n]
set_property IOSTANDARD SSTL135 [get_ports ddr3_reset_n]
set_property PACKAGE_PIN M5 [get_ports ddr3_reset_n]

# PadFunction: IO_L24N_T3_34 (SCHEMATIC DDR_CKE)
set_property SLEW FAST [get_ports {ddr3_cke[0]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_cke[0]}]
set_property PACKAGE_PIN T5 [get_ports {ddr3_cke[0]}]

# PadFunction: IO_25_34 (SCHEMATIC DDR_ODT)
set_property SLEW FAST [get_ports {ddr3_odt[0]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_odt[0]}]
set_property PACKAGE_PIN P7 [get_ports {ddr3_odt[0]}]

# PadFunction: IO_L1P_T0_34 (SCHEMATIC DDR_LDM)
set_property SLEW FAST [get_ports {ddr3_dm[0]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dm[0]}]
set_property PACKAGE_PIN K4 [get_ports {ddr3_dm[0]}]

# PadFunction: IO_L7P_T1_34 (SCHEMATIC DDR_UDM)
set_property SLEW FAST [get_ports {ddr3_dm[1]}]
set_property IOSTANDARD SSTL135 [get_ports {ddr3_dm[1]}]
set_property PACKAGE_PIN M3 [get_ports {ddr3_dm[1]}]

# PadFunction: IO_L12P_T1_MRCC_35 (SCHEMATIC DDR_REF_CLK_P)
#set_property IOSTANDARD LVDS_25 [get_ports sys_clk_p]

# PadFunction: IO_L12N_T1_MRCC_35 (SCHEMATIC DDR_REF_CLK_N)
#set_property IOSTANDARD LVDS_25 [get_ports sys_clk_n]
#set_property PACKAGE_PIN C1 [get_ports sys_clk_p]
#set_property PACKAGE_PIN B1 [get_ports sys_clk_n]

# PadFunction: IO_L3P_T0_DQS_34 (SCHEMATIC DDR_LDQS_P)
set_property SLEW FAST [get_ports {ddr3_dqs_p[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL135 [get_ports {ddr3_dqs_p[0]}]

# PadFunction: IO_L3N_T0_DQS_34 (SCHEMATIC DDR_LDQS_N)
set_property SLEW FAST [get_ports {ddr3_dqs_n[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL135 [get_ports {ddr3_dqs_n[0]}]
set_property PACKAGE_PIN K1 [get_ports {ddr3_dqs_p[0]}]
set_property PACKAGE_PIN L1 [get_ports {ddr3_dqs_n[0]}]

# PadFunction: IO_L9P_T1_DQS_34 (SCHEMATIC DDR_UDQS_P)
set_property SLEW FAST [get_ports {ddr3_dqs_p[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL135 [get_ports {ddr3_dqs_p[1]}]

# PadFunction: IO_L9N_T1_DQS_34 (SCHEMATIC DDR_UDQS_N)
set_property SLEW FAST [get_ports {ddr3_dqs_n[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL135 [get_ports {ddr3_dqs_n[1]}]
set_property PACKAGE_PIN N3 [get_ports {ddr3_dqs_p[1]}]
set_property PACKAGE_PIN N2 [get_ports {ddr3_dqs_n[1]}]

# PadFunction: IO_L21P_T3_DQS_34 (SCHEMATIC DDR_CLK_P)
set_property SLEW FAST [get_ports {ddr3_ck_p[0]}]
set_property IOSTANDARD DIFF_SSTL135 [get_ports {ddr3_ck_p[0]}]

# PadFunction: IO_L21N_T3_DQS_34 (SCHEMATIC DDR_CLK_N)
set_property SLEW FAST [get_ports {ddr3_ck_n[0]}]
set_property IOSTANDARD DIFF_SSTL135 [get_ports {ddr3_ck_n[0]}]
set_property PACKAGE_PIN R5 [get_ports {ddr3_ck_p[0]}]
set_property PACKAGE_PIN T4 [get_ports {ddr3_ck_n[0]}]

set_property INTERNAL_VREF 0.675 [get_iobanks 34]
