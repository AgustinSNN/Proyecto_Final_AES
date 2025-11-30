-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "04/11/2025 17:23:32"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	main_AES IS
    PORT (
	clk : IN std_logic;
	enable : IN std_logic;
	ciphertext : OUT std_logic_vector(127 DOWNTO 0)
	);
END main_AES;

-- Design Ports Information
-- ciphertext[0]	=>  Location: PIN_G9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[1]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[2]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[3]	=>  Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[4]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[5]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[6]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[7]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[8]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[9]	=>  Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[10]	=>  Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[11]	=>  Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[12]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[13]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[14]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[15]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[16]	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[17]	=>  Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[18]	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[19]	=>  Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[20]	=>  Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[21]	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[22]	=>  Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[23]	=>  Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[24]	=>  Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[25]	=>  Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[26]	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[27]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[28]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[29]	=>  Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[30]	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[31]	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[32]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[33]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[34]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[35]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[36]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[37]	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[38]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[39]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[40]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[41]	=>  Location: PIN_J9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[42]	=>  Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[43]	=>  Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[44]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[45]	=>  Location: PIN_K9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[46]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[47]	=>  Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[48]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[49]	=>  Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[50]	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[51]	=>  Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[52]	=>  Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[53]	=>  Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[54]	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[55]	=>  Location: PIN_J8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[56]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[57]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[58]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[59]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[60]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[61]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[62]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[63]	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[64]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[65]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[66]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[67]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[68]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[69]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[70]	=>  Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[71]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[72]	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[73]	=>  Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[74]	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[75]	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[76]	=>  Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[77]	=>  Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[78]	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[79]	=>  Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[80]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[81]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[82]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[83]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[84]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[85]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[86]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[87]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[88]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[89]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[90]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[91]	=>  Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[92]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[93]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[94]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[95]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[96]	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[97]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[98]	=>  Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[99]	=>  Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[100]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[101]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[102]	=>  Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[103]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[104]	=>  Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[105]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[106]	=>  Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[107]	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[108]	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[109]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[110]	=>  Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[111]	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[112]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[113]	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[114]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[115]	=>  Location: PIN_J3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[116]	=>  Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[117]	=>  Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[118]	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[119]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[120]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[121]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[122]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[123]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[124]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[125]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[126]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ciphertext[127]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- enable	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF main_AES IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_ciphertext : std_logic_vector(127 DOWNTO 0);
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \enable~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \cnt[0]~0_combout\ : std_logic;
SIGNAL \enable~combout\ : std_logic;
SIGNAL \enable~clkctrl_outclk\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \currentstate[15][0]~feeder_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \currentstate[15][0]~regout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \currentstate[15][1]~regout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \currentstate[15][2]~regout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \currentstate[15][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[15][3]~regout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \currentstate[15][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[15][4]~regout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \currentstate[15][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[15][5]~regout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \currentstate[15][6]~regout\ : std_logic;
SIGNAL \u1|Mux7_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \currentstate[15][7]~regout\ : std_logic;
SIGNAL \Decoder0~2_combout\ : std_logic;
SIGNAL \Decoder0~3_combout\ : std_logic;
SIGNAL \currentstate[14][0]~regout\ : std_logic;
SIGNAL \currentstate[14][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[14][1]~regout\ : std_logic;
SIGNAL \currentstate[14][2]~regout\ : std_logic;
SIGNAL \currentstate[14][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[14][3]~regout\ : std_logic;
SIGNAL \currentstate[14][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[14][4]~regout\ : std_logic;
SIGNAL \currentstate[14][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[14][5]~regout\ : std_logic;
SIGNAL \currentstate[14][6]~regout\ : std_logic;
SIGNAL \currentstate[14][7]~regout\ : std_logic;
SIGNAL \currentstate[13][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~5_combout\ : std_logic;
SIGNAL \currentstate[13][0]~regout\ : std_logic;
SIGNAL \currentstate[13][1]~regout\ : std_logic;
SIGNAL \currentstate[13][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[13][2]~regout\ : std_logic;
SIGNAL \currentstate[13][3]~regout\ : std_logic;
SIGNAL \currentstate[13][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[13][4]~regout\ : std_logic;
SIGNAL \currentstate[13][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[13][5]~regout\ : std_logic;
SIGNAL \currentstate[13][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[13][6]~regout\ : std_logic;
SIGNAL \currentstate[13][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[13][7]~regout\ : std_logic;
SIGNAL \Decoder0~6_combout\ : std_logic;
SIGNAL \Decoder0~7_combout\ : std_logic;
SIGNAL \currentstate[12][0]~regout\ : std_logic;
SIGNAL \currentstate[12][1]~regout\ : std_logic;
SIGNAL \currentstate[12][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[12][2]~regout\ : std_logic;
SIGNAL \currentstate[12][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[12][3]~regout\ : std_logic;
SIGNAL \currentstate[12][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[12][4]~regout\ : std_logic;
SIGNAL \currentstate[12][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[12][5]~regout\ : std_logic;
SIGNAL \currentstate[12][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[12][6]~regout\ : std_logic;
SIGNAL \currentstate[12][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[12][7]~regout\ : std_logic;
SIGNAL \Decoder0~8_combout\ : std_logic;
SIGNAL \Decoder0~9_combout\ : std_logic;
SIGNAL \currentstate[11][0]~regout\ : std_logic;
SIGNAL \currentstate[11][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[11][1]~regout\ : std_logic;
SIGNAL \currentstate[11][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[11][2]~regout\ : std_logic;
SIGNAL \currentstate[11][3]~regout\ : std_logic;
SIGNAL \currentstate[11][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[11][4]~regout\ : std_logic;
SIGNAL \currentstate[11][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[11][5]~regout\ : std_logic;
SIGNAL \currentstate[11][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[11][6]~regout\ : std_logic;
SIGNAL \currentstate[11][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[11][7]~regout\ : std_logic;
SIGNAL \currentstate[10][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~10_combout\ : std_logic;
SIGNAL \Decoder0~11_combout\ : std_logic;
SIGNAL \currentstate[10][0]~regout\ : std_logic;
SIGNAL \currentstate[10][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[10][1]~regout\ : std_logic;
SIGNAL \currentstate[10][2]~regout\ : std_logic;
SIGNAL \currentstate[10][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[10][3]~regout\ : std_logic;
SIGNAL \currentstate[10][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[10][4]~regout\ : std_logic;
SIGNAL \currentstate[10][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[10][5]~regout\ : std_logic;
SIGNAL \currentstate[10][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[10][6]~regout\ : std_logic;
SIGNAL \currentstate[10][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[10][7]~regout\ : std_logic;
SIGNAL \Decoder0~12_combout\ : std_logic;
SIGNAL \Decoder0~13_combout\ : std_logic;
SIGNAL \currentstate[9][0]~regout\ : std_logic;
SIGNAL \currentstate[9][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[9][1]~regout\ : std_logic;
SIGNAL \currentstate[9][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[9][2]~regout\ : std_logic;
SIGNAL \currentstate[9][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[9][3]~regout\ : std_logic;
SIGNAL \currentstate[9][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[9][4]~regout\ : std_logic;
SIGNAL \currentstate[9][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[9][5]~regout\ : std_logic;
SIGNAL \currentstate[9][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[9][6]~regout\ : std_logic;
SIGNAL \currentstate[9][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[9][7]~regout\ : std_logic;
SIGNAL \currentstate[8][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~14_combout\ : std_logic;
SIGNAL \Decoder0~15_combout\ : std_logic;
SIGNAL \currentstate[8][0]~regout\ : std_logic;
SIGNAL \currentstate[8][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[8][1]~regout\ : std_logic;
SIGNAL \currentstate[8][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[8][2]~regout\ : std_logic;
SIGNAL \currentstate[8][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[8][3]~regout\ : std_logic;
SIGNAL \currentstate[8][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[8][4]~regout\ : std_logic;
SIGNAL \currentstate[8][5]~regout\ : std_logic;
SIGNAL \currentstate[8][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[8][6]~regout\ : std_logic;
SIGNAL \currentstate[8][7]~regout\ : std_logic;
SIGNAL \Decoder0~16_combout\ : std_logic;
SIGNAL \currentstate[7][0]~regout\ : std_logic;
SIGNAL \currentstate[7][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[7][1]~regout\ : std_logic;
SIGNAL \currentstate[7][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[7][2]~regout\ : std_logic;
SIGNAL \currentstate[7][3]~regout\ : std_logic;
SIGNAL \currentstate[7][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[7][4]~regout\ : std_logic;
SIGNAL \currentstate[7][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[7][5]~regout\ : std_logic;
SIGNAL \currentstate[7][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[7][6]~regout\ : std_logic;
SIGNAL \currentstate[7][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[7][7]~regout\ : std_logic;
SIGNAL \currentstate[6][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~17_combout\ : std_logic;
SIGNAL \currentstate[6][0]~regout\ : std_logic;
SIGNAL \currentstate[6][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[6][1]~regout\ : std_logic;
SIGNAL \currentstate[6][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[6][2]~regout\ : std_logic;
SIGNAL \currentstate[6][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[6][3]~regout\ : std_logic;
SIGNAL \currentstate[6][4]~regout\ : std_logic;
SIGNAL \currentstate[6][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[6][5]~regout\ : std_logic;
SIGNAL \currentstate[6][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[6][6]~regout\ : std_logic;
SIGNAL \currentstate[6][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[6][7]~regout\ : std_logic;
SIGNAL \Decoder0~4_combout\ : std_logic;
SIGNAL \Decoder0~18_combout\ : std_logic;
SIGNAL \currentstate[5][0]~regout\ : std_logic;
SIGNAL \currentstate[5][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[5][1]~regout\ : std_logic;
SIGNAL \currentstate[5][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[5][2]~regout\ : std_logic;
SIGNAL \currentstate[5][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[5][3]~regout\ : std_logic;
SIGNAL \currentstate[5][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[5][4]~regout\ : std_logic;
SIGNAL \currentstate[5][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[5][5]~regout\ : std_logic;
SIGNAL \currentstate[5][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[5][6]~regout\ : std_logic;
SIGNAL \currentstate[5][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[5][7]~regout\ : std_logic;
SIGNAL \currentstate[4][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~19_combout\ : std_logic;
SIGNAL \currentstate[4][0]~regout\ : std_logic;
SIGNAL \currentstate[4][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[4][1]~regout\ : std_logic;
SIGNAL \currentstate[4][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[4][2]~regout\ : std_logic;
SIGNAL \currentstate[4][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[4][3]~regout\ : std_logic;
SIGNAL \currentstate[4][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[4][4]~regout\ : std_logic;
SIGNAL \currentstate[4][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[4][5]~regout\ : std_logic;
SIGNAL \currentstate[4][6]~regout\ : std_logic;
SIGNAL \currentstate[4][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[4][7]~regout\ : std_logic;
SIGNAL \Decoder0~20_combout\ : std_logic;
SIGNAL \currentstate[3][0]~regout\ : std_logic;
SIGNAL \currentstate[3][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[3][1]~regout\ : std_logic;
SIGNAL \currentstate[3][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[3][2]~regout\ : std_logic;
SIGNAL \currentstate[3][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[3][3]~regout\ : std_logic;
SIGNAL \currentstate[3][4]~regout\ : std_logic;
SIGNAL \currentstate[3][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[3][5]~regout\ : std_logic;
SIGNAL \currentstate[3][6]~regout\ : std_logic;
SIGNAL \currentstate[3][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[3][7]~regout\ : std_logic;
SIGNAL \Decoder0~21_combout\ : std_logic;
SIGNAL \currentstate[2][0]~regout\ : std_logic;
SIGNAL \currentstate[2][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[2][1]~regout\ : std_logic;
SIGNAL \currentstate[2][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[2][2]~regout\ : std_logic;
SIGNAL \currentstate[2][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[2][3]~regout\ : std_logic;
SIGNAL \currentstate[2][4]~regout\ : std_logic;
SIGNAL \currentstate[2][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[2][5]~regout\ : std_logic;
SIGNAL \currentstate[2][6]~regout\ : std_logic;
SIGNAL \currentstate[2][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[2][7]~regout\ : std_logic;
SIGNAL \currentstate[1][0]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~22_combout\ : std_logic;
SIGNAL \currentstate[1][0]~regout\ : std_logic;
SIGNAL \currentstate[1][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[1][1]~regout\ : std_logic;
SIGNAL \currentstate[1][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[1][2]~regout\ : std_logic;
SIGNAL \currentstate[1][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[1][3]~regout\ : std_logic;
SIGNAL \currentstate[1][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[1][4]~regout\ : std_logic;
SIGNAL \currentstate[1][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[1][5]~regout\ : std_logic;
SIGNAL \currentstate[1][6]~regout\ : std_logic;
SIGNAL \currentstate[1][7]~feeder_combout\ : std_logic;
SIGNAL \currentstate[1][7]~regout\ : std_logic;
SIGNAL \Decoder0~23_combout\ : std_logic;
SIGNAL \currentstate[0][0]~regout\ : std_logic;
SIGNAL \currentstate[0][1]~feeder_combout\ : std_logic;
SIGNAL \currentstate[0][1]~regout\ : std_logic;
SIGNAL \currentstate[0][2]~feeder_combout\ : std_logic;
SIGNAL \currentstate[0][2]~regout\ : std_logic;
SIGNAL \currentstate[0][3]~feeder_combout\ : std_logic;
SIGNAL \currentstate[0][3]~regout\ : std_logic;
SIGNAL \currentstate[0][4]~feeder_combout\ : std_logic;
SIGNAL \currentstate[0][4]~regout\ : std_logic;
SIGNAL \currentstate[0][5]~feeder_combout\ : std_logic;
SIGNAL \currentstate[0][5]~regout\ : std_logic;
SIGNAL \currentstate[0][6]~feeder_combout\ : std_logic;
SIGNAL \currentstate[0][6]~regout\ : std_logic;
SIGNAL \currentstate[0][7]~regout\ : std_logic;
SIGNAL cnt : std_logic_vector(3 DOWNTO 0);
SIGNAL address : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_enable~clkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_enable <= enable;
ciphertext <= ww_ciphertext;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (address(7) & address(6) & address(5) & address(4) & address(3) & address(2) & address(1) & address(0));

\u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\u1|Mux7_rtl_0|auto_generated|ram_block1a1\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\u1|Mux7_rtl_0|auto_generated|ram_block1a2\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\u1|Mux7_rtl_0|auto_generated|ram_block1a3\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\u1|Mux7_rtl_0|auto_generated|ram_block1a4\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\u1|Mux7_rtl_0|auto_generated|ram_block1a5\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\u1|Mux7_rtl_0|auto_generated|ram_block1a6\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\u1|Mux7_rtl_0|auto_generated|ram_block1a7\ <= \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\enable~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \enable~combout\);
\ALT_INV_enable~clkctrl_outclk\ <= NOT \enable~clkctrl_outclk\;

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X11_Y35_N30
\cnt[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \cnt[0]~0_combout\ = !cnt(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => cnt(0),
	combout => \cnt[0]~0_combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\enable~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_enable,
	combout => \enable~combout\);

-- Location: CLKCTRL_G1
\enable~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \enable~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \enable~clkctrl_outclk\);

-- Location: LCFF_X12_Y35_N3
\cnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \cnt[0]~0_combout\,
	aclr => \ALT_INV_enable~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(0));

-- Location: LCCOMB_X12_Y35_N28
\Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = cnt(1) $ (cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(1),
	datad => cnt(0),
	combout => \Add0~1_combout\);

-- Location: LCFF_X12_Y35_N29
\cnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Add0~1_combout\,
	aclr => \ALT_INV_enable~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(1));

-- Location: LCCOMB_X11_Y35_N0
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = cnt(2) $ (((cnt(0) & cnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datab => cnt(1),
	datad => cnt(2),
	combout => \Add0~2_combout\);

-- Location: LCFF_X12_Y35_N23
\cnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Add0~2_combout\,
	aclr => \ALT_INV_enable~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(2));

-- Location: LCCOMB_X12_Y35_N12
\Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (cnt(0) & ((cnt(1) & (cnt(3))) # (!cnt(1) & ((!cnt(2)))))) # (!cnt(0) & (!cnt(3) & (cnt(1) $ (!cnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux7~0_combout\);

-- Location: LCFF_X12_Y35_N13
\address[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux7~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(0));

-- Location: LCCOMB_X12_Y35_N14
\Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (cnt(1) & ((cnt(2) & (!cnt(3))) # (!cnt(2) & ((!cnt(0)))))) # (!cnt(1) & (!cnt(3) & (cnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux6~0_combout\);

-- Location: LCFF_X12_Y35_N15
\address[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux6~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(1));

-- Location: LCCOMB_X12_Y35_N4
\Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (cnt(3) & (!cnt(1) & (cnt(0) & !cnt(2)))) # (!cnt(3) & (!cnt(0) & ((!cnt(2)) # (!cnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux5~0_combout\);

-- Location: LCFF_X12_Y35_N5
\address[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux5~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(2));

-- Location: LCCOMB_X12_Y35_N6
\Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (cnt(3)) # ((cnt(2) & (cnt(1))) # (!cnt(2) & ((!cnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux4~0_combout\);

-- Location: LCFF_X12_Y35_N7
\address[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux4~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(3));

-- Location: LCCOMB_X12_Y35_N24
\Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (cnt(2) & ((cnt(1) $ (!cnt(0))))) # (!cnt(2) & (!cnt(3) & ((!cnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux3~0_combout\);

-- Location: LCFF_X12_Y35_N25
\address[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux3~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(4));

-- Location: LCCOMB_X12_Y35_N10
\Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (cnt(1) & (((!cnt(3) & !cnt(0))) # (!cnt(2)))) # (!cnt(1) & (((!cnt(0))) # (!cnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux2~0_combout\);

-- Location: LCFF_X12_Y35_N11
\address[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux2~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(5));

-- Location: LCCOMB_X12_Y35_N16
\Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (cnt(2) & (((!cnt(1))))) # (!cnt(2) & (cnt(0) & (cnt(3) $ (!cnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux1~0_combout\);

-- Location: LCFF_X12_Y35_N17
\address[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux1~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(6));

-- Location: LCCOMB_X12_Y35_N26
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (cnt(0) & (((!cnt(2))) # (!cnt(3)))) # (!cnt(0) & (cnt(1) $ (((cnt(3)) # (cnt(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Mux0~0_combout\);

-- Location: LCFF_X12_Y35_N27
\address[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux0~0_combout\,
	ena => \enable~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => address(7));

-- Location: M4K_X13_Y34
\u1|Mux7_rtl_0|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"16BB54B00F2D99416842E6BF0D89A18CDF2855CEE9871E9B948ED9691198F8E19E1DC186B95735610EF6034866B53E708A8BBD4B1F74DDE8C6B4A61C2E2578BA08AE7A65EAF4566CA94ED58D6D37C8E779E4959162ACD3C25C2406490A3A32E0DB0B5EDE14B8EE4688902A22DC4F816073195D643D7EA7C41744975FEC130CCDD2F3FF1021DAB6BCF5389D928F40A351A89F3C507F02F94585334D43FBAAEFD0CF584C4A39BECB6A5BB1FC20ED00D153842FE329B3D63B52A05A6E1B1A2C830975B227EBE28012079A059618C323C7041531D871F1E5A534CCF73F362693FDB7C072A49CAFA2D4ADF04759FA7DC982CA76ABD7FE2B670130C56F6BF27B777C63",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AES.main_AES0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sbox_rom:u1|altsyncram:Mux7_rtl_0|altsyncram_r3v:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 8,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 8,
	port_b_data_width => 8,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \clk~clkctrl_outclk\,
	portaaddr => \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \u1|Mux7_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X12_Y34_N0
\currentstate[15][0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[15][0]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \currentstate[15][0]~feeder_combout\);

-- Location: LCCOMB_X12_Y35_N0
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = cnt(3) $ (((cnt(1) & (cnt(0) & cnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(1),
	datab => cnt(0),
	datac => cnt(3),
	datad => cnt(2),
	combout => \Add0~0_combout\);

-- Location: LCFF_X12_Y35_N1
\cnt[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Add0~0_combout\,
	aclr => \ALT_INV_enable~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => cnt(3));

-- Location: LCCOMB_X12_Y35_N20
\Decoder0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (\enable~combout\ & (cnt(1) & (!cnt(0) & cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X12_Y34_N2
\Decoder0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (cnt(3) & \Decoder0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(3),
	datad => \Decoder0~0_combout\,
	combout => \Decoder0~1_combout\);

-- Location: LCFF_X12_Y34_N1
\currentstate[15][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[15][0]~feeder_combout\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][0]~regout\);

-- Location: LCFF_X12_Y34_N3
\currentstate[15][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][1]~regout\);

-- Location: LCFF_X12_Y34_N25
\currentstate[15][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][2]~regout\);

-- Location: LCCOMB_X12_Y34_N14
\currentstate[15][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[15][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[15][3]~feeder_combout\);

-- Location: LCFF_X12_Y34_N15
\currentstate[15][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[15][3]~feeder_combout\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][3]~regout\);

-- Location: LCCOMB_X12_Y34_N28
\currentstate[15][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[15][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[15][4]~feeder_combout\);

-- Location: LCFF_X12_Y34_N29
\currentstate[15][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[15][4]~feeder_combout\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][4]~regout\);

-- Location: LCCOMB_X12_Y34_N30
\currentstate[15][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[15][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[15][5]~feeder_combout\);

-- Location: LCFF_X12_Y34_N31
\currentstate[15][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[15][5]~feeder_combout\,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][5]~regout\);

-- Location: LCFF_X12_Y34_N17
\currentstate[15][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][6]~regout\);

-- Location: LCFF_X12_Y34_N23
\currentstate[15][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[15][7]~regout\);

-- Location: LCCOMB_X11_Y35_N16
\Decoder0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~2_combout\ = (cnt(0) & (!cnt(1) & (\enable~combout\ & cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datab => cnt(1),
	datac => \enable~combout\,
	datad => cnt(2),
	combout => \Decoder0~2_combout\);

-- Location: LCCOMB_X12_Y34_N4
\Decoder0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~3_combout\ = (cnt(3) & \Decoder0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(3),
	datad => \Decoder0~2_combout\,
	combout => \Decoder0~3_combout\);

-- Location: LCFF_X12_Y34_N5
\currentstate[14][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][0]~regout\);

-- Location: LCCOMB_X12_Y34_N10
\currentstate[14][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[14][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[14][1]~feeder_combout\);

-- Location: LCFF_X12_Y34_N11
\currentstate[14][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[14][1]~feeder_combout\,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][1]~regout\);

-- Location: LCFF_X12_Y34_N13
\currentstate[14][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][2]~regout\);

-- Location: LCCOMB_X12_Y34_N18
\currentstate[14][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[14][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[14][3]~feeder_combout\);

-- Location: LCFF_X12_Y34_N19
\currentstate[14][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[14][3]~feeder_combout\,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][3]~regout\);

-- Location: LCCOMB_X12_Y34_N20
\currentstate[14][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[14][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[14][4]~feeder_combout\);

-- Location: LCFF_X12_Y34_N21
\currentstate[14][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[14][4]~feeder_combout\,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][4]~regout\);

-- Location: LCCOMB_X12_Y34_N6
\currentstate[14][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[14][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[14][5]~feeder_combout\);

-- Location: LCFF_X12_Y34_N7
\currentstate[14][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[14][5]~feeder_combout\,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][5]~regout\);

-- Location: LCFF_X12_Y34_N9
\currentstate[14][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][6]~regout\);

-- Location: LCFF_X12_Y34_N27
\currentstate[14][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[14][7]~regout\);

-- Location: LCCOMB_X9_Y34_N20
\currentstate[13][0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[13][0]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \currentstate[13][0]~feeder_combout\);

-- Location: LCCOMB_X9_Y34_N26
\Decoder0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~5_combout\ = (\Decoder0~4_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~4_combout\,
	datab => cnt(3),
	combout => \Decoder0~5_combout\);

-- Location: LCFF_X9_Y34_N21
\currentstate[13][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[13][0]~feeder_combout\,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][0]~regout\);

-- Location: LCFF_X9_Y34_N7
\currentstate[13][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][1]~regout\);

-- Location: LCCOMB_X9_Y34_N0
\currentstate[13][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[13][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[13][2]~feeder_combout\);

-- Location: LCFF_X9_Y34_N1
\currentstate[13][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[13][2]~feeder_combout\,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][2]~regout\);

-- Location: LCFF_X9_Y34_N27
\currentstate[13][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	sload => VCC,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][3]~regout\);

-- Location: LCCOMB_X9_Y34_N12
\currentstate[13][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[13][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[13][4]~feeder_combout\);

-- Location: LCFF_X9_Y34_N13
\currentstate[13][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[13][4]~feeder_combout\,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][4]~regout\);

-- Location: LCCOMB_X9_Y34_N10
\currentstate[13][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[13][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[13][5]~feeder_combout\);

-- Location: LCFF_X9_Y34_N11
\currentstate[13][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[13][5]~feeder_combout\,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][5]~regout\);

-- Location: LCCOMB_X9_Y34_N4
\currentstate[13][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[13][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[13][6]~feeder_combout\);

-- Location: LCFF_X9_Y34_N5
\currentstate[13][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[13][6]~feeder_combout\,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][6]~regout\);

-- Location: LCCOMB_X9_Y34_N18
\currentstate[13][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[13][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[13][7]~feeder_combout\);

-- Location: LCFF_X9_Y34_N19
\currentstate[13][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[13][7]~feeder_combout\,
	ena => \Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[13][7]~regout\);

-- Location: LCCOMB_X12_Y35_N18
\Decoder0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~6_combout\ = (\enable~combout\ & (cnt(1) & (cnt(0) & !cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Decoder0~6_combout\);

-- Location: LCCOMB_X9_Y34_N8
\Decoder0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~7_combout\ = (cnt(3) & \Decoder0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(3),
	datad => \Decoder0~6_combout\,
	combout => \Decoder0~7_combout\);

-- Location: LCFF_X9_Y34_N9
\currentstate[12][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][0]~regout\);

-- Location: LCFF_X9_Y34_N3
\currentstate[12][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	sload => VCC,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][1]~regout\);

-- Location: LCCOMB_X9_Y34_N28
\currentstate[12][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[12][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[12][2]~feeder_combout\);

-- Location: LCFF_X9_Y34_N29
\currentstate[12][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[12][2]~feeder_combout\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][2]~regout\);

-- Location: LCCOMB_X9_Y34_N22
\currentstate[12][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[12][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[12][3]~feeder_combout\);

-- Location: LCFF_X9_Y34_N23
\currentstate[12][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[12][3]~feeder_combout\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][3]~regout\);

-- Location: LCCOMB_X9_Y34_N24
\currentstate[12][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[12][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[12][4]~feeder_combout\);

-- Location: LCFF_X9_Y34_N25
\currentstate[12][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[12][4]~feeder_combout\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][4]~regout\);

-- Location: LCCOMB_X9_Y34_N30
\currentstate[12][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[12][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[12][5]~feeder_combout\);

-- Location: LCFF_X9_Y34_N31
\currentstate[12][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[12][5]~feeder_combout\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][5]~regout\);

-- Location: LCCOMB_X9_Y34_N16
\currentstate[12][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[12][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[12][6]~feeder_combout\);

-- Location: LCFF_X9_Y34_N17
\currentstate[12][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[12][6]~feeder_combout\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][6]~regout\);

-- Location: LCCOMB_X9_Y34_N14
\currentstate[12][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[12][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[12][7]~feeder_combout\);

-- Location: LCFF_X9_Y34_N15
\currentstate[12][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[12][7]~feeder_combout\,
	ena => \Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[12][7]~regout\);

-- Location: LCCOMB_X12_Y35_N8
\Decoder0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~8_combout\ = (\enable~combout\ & (cnt(1) & (!cnt(2) & !cnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datab => cnt(1),
	datac => cnt(2),
	datad => cnt(0),
	combout => \Decoder0~8_combout\);

-- Location: LCCOMB_X16_Y34_N0
\Decoder0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~9_combout\ = (cnt(3) & \Decoder0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(3),
	datad => \Decoder0~8_combout\,
	combout => \Decoder0~9_combout\);

-- Location: LCFF_X16_Y34_N1
\currentstate[11][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][0]~regout\);

-- Location: LCCOMB_X16_Y34_N22
\currentstate[11][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[11][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[11][1]~feeder_combout\);

-- Location: LCFF_X16_Y34_N23
\currentstate[11][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[11][1]~feeder_combout\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][1]~regout\);

-- Location: LCCOMB_X16_Y34_N28
\currentstate[11][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[11][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[11][2]~feeder_combout\);

-- Location: LCFF_X16_Y34_N29
\currentstate[11][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[11][2]~feeder_combout\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][2]~regout\);

-- Location: LCFF_X16_Y34_N19
\currentstate[11][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	sload => VCC,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][3]~regout\);

-- Location: LCCOMB_X16_Y34_N24
\currentstate[11][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[11][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[11][4]~feeder_combout\);

-- Location: LCFF_X16_Y34_N25
\currentstate[11][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[11][4]~feeder_combout\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][4]~regout\);

-- Location: LCCOMB_X16_Y34_N30
\currentstate[11][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[11][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[11][5]~feeder_combout\);

-- Location: LCFF_X16_Y34_N31
\currentstate[11][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[11][5]~feeder_combout\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][5]~regout\);

-- Location: LCCOMB_X16_Y34_N12
\currentstate[11][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[11][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[11][6]~feeder_combout\);

-- Location: LCFF_X16_Y34_N13
\currentstate[11][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[11][6]~feeder_combout\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][6]~regout\);

-- Location: LCCOMB_X16_Y34_N6
\currentstate[11][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[11][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[11][7]~feeder_combout\);

-- Location: LCFF_X16_Y34_N7
\currentstate[11][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[11][7]~feeder_combout\,
	ena => \Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[11][7]~regout\);

-- Location: LCCOMB_X10_Y34_N0
\currentstate[10][0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[10][0]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \currentstate[10][0]~feeder_combout\);

-- Location: LCCOMB_X11_Y35_N22
\Decoder0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~10_combout\ = (cnt(0) & (!cnt(1) & (\enable~combout\ & !cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datab => cnt(1),
	datac => \enable~combout\,
	datad => cnt(2),
	combout => \Decoder0~10_combout\);

-- Location: LCCOMB_X10_Y34_N8
\Decoder0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~11_combout\ = (cnt(3) & \Decoder0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datad => \Decoder0~10_combout\,
	combout => \Decoder0~11_combout\);

-- Location: LCFF_X10_Y34_N1
\currentstate[10][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[10][0]~feeder_combout\,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][0]~regout\);

-- Location: LCCOMB_X10_Y34_N6
\currentstate[10][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[10][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[10][1]~feeder_combout\);

-- Location: LCFF_X10_Y34_N7
\currentstate[10][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[10][1]~feeder_combout\,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][1]~regout\);

-- Location: LCFF_X10_Y34_N9
\currentstate[10][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	sload => VCC,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][2]~regout\);

-- Location: LCCOMB_X10_Y34_N30
\currentstate[10][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[10][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[10][3]~feeder_combout\);

-- Location: LCFF_X10_Y34_N31
\currentstate[10][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[10][3]~feeder_combout\,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][3]~regout\);

-- Location: LCCOMB_X10_Y34_N24
\currentstate[10][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[10][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[10][4]~feeder_combout\);

-- Location: LCFF_X10_Y34_N25
\currentstate[10][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[10][4]~feeder_combout\,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][4]~regout\);

-- Location: LCCOMB_X10_Y34_N14
\currentstate[10][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[10][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[10][5]~feeder_combout\);

-- Location: LCFF_X10_Y34_N15
\currentstate[10][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[10][5]~feeder_combout\,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][5]~regout\);

-- Location: LCCOMB_X10_Y34_N4
\currentstate[10][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[10][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[10][6]~feeder_combout\);

-- Location: LCFF_X10_Y34_N5
\currentstate[10][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[10][6]~feeder_combout\,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][6]~regout\);

-- Location: LCCOMB_X10_Y34_N18
\currentstate[10][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[10][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[10][7]~feeder_combout\);

-- Location: LCFF_X10_Y34_N19
\currentstate[10][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[10][7]~feeder_combout\,
	ena => \Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[10][7]~regout\);

-- Location: LCCOMB_X12_Y35_N30
\Decoder0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~12_combout\ = (\enable~combout\ & (!cnt(1) & (!cnt(0) & !cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Decoder0~12_combout\);

-- Location: LCCOMB_X8_Y34_N12
\Decoder0~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~13_combout\ = (cnt(3) & \Decoder0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(3),
	datad => \Decoder0~12_combout\,
	combout => \Decoder0~13_combout\);

-- Location: LCFF_X8_Y34_N13
\currentstate[9][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][0]~regout\);

-- Location: LCCOMB_X8_Y34_N14
\currentstate[9][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[9][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[9][1]~feeder_combout\);

-- Location: LCFF_X8_Y34_N15
\currentstate[9][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[9][1]~feeder_combout\,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][1]~regout\);

-- Location: LCCOMB_X8_Y34_N20
\currentstate[9][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[9][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[9][2]~feeder_combout\);

-- Location: LCFF_X8_Y34_N21
\currentstate[9][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[9][2]~feeder_combout\,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][2]~regout\);

-- Location: LCCOMB_X8_Y34_N6
\currentstate[9][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[9][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[9][3]~feeder_combout\);

-- Location: LCFF_X8_Y34_N7
\currentstate[9][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[9][3]~feeder_combout\,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][3]~regout\);

-- Location: LCCOMB_X8_Y34_N16
\currentstate[9][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[9][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[9][4]~feeder_combout\);

-- Location: LCFF_X8_Y34_N17
\currentstate[9][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[9][4]~feeder_combout\,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][4]~regout\);

-- Location: LCCOMB_X8_Y34_N26
\currentstate[9][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[9][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[9][5]~feeder_combout\);

-- Location: LCFF_X8_Y34_N27
\currentstate[9][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[9][5]~feeder_combout\,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][5]~regout\);

-- Location: LCCOMB_X8_Y34_N8
\currentstate[9][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[9][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[9][6]~feeder_combout\);

-- Location: LCFF_X8_Y34_N9
\currentstate[9][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[9][6]~feeder_combout\,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][6]~regout\);

-- Location: LCCOMB_X8_Y34_N18
\currentstate[9][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[9][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[9][7]~feeder_combout\);

-- Location: LCFF_X8_Y34_N19
\currentstate[9][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[9][7]~feeder_combout\,
	ena => \Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[9][7]~regout\);

-- Location: LCCOMB_X15_Y34_N8
\currentstate[8][0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[8][0]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \currentstate[8][0]~feeder_combout\);

-- Location: LCCOMB_X12_Y35_N22
\Decoder0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~14_combout\ = (\enable~combout\ & (cnt(0) & (cnt(2) & cnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datab => cnt(0),
	datac => cnt(2),
	datad => cnt(1),
	combout => \Decoder0~14_combout\);

-- Location: LCCOMB_X15_Y34_N30
\Decoder0~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~15_combout\ = (!cnt(3) & \Decoder0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datad => \Decoder0~14_combout\,
	combout => \Decoder0~15_combout\);

-- Location: LCFF_X15_Y34_N9
\currentstate[8][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[8][0]~feeder_combout\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][0]~regout\);

-- Location: LCCOMB_X15_Y34_N2
\currentstate[8][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[8][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[8][1]~feeder_combout\);

-- Location: LCFF_X15_Y34_N3
\currentstate[8][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[8][1]~feeder_combout\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][1]~regout\);

-- Location: LCCOMB_X15_Y34_N4
\currentstate[8][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[8][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[8][2]~feeder_combout\);

-- Location: LCFF_X15_Y34_N5
\currentstate[8][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[8][2]~feeder_combout\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][2]~regout\);

-- Location: LCCOMB_X15_Y34_N18
\currentstate[8][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[8][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[8][3]~feeder_combout\);

-- Location: LCFF_X15_Y34_N19
\currentstate[8][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[8][3]~feeder_combout\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][3]~regout\);

-- Location: LCCOMB_X15_Y34_N24
\currentstate[8][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[8][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[8][4]~feeder_combout\);

-- Location: LCFF_X15_Y34_N25
\currentstate[8][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[8][4]~feeder_combout\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][4]~regout\);

-- Location: LCFF_X15_Y34_N31
\currentstate[8][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][5]~regout\);

-- Location: LCCOMB_X15_Y34_N28
\currentstate[8][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[8][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[8][6]~feeder_combout\);

-- Location: LCFF_X15_Y34_N29
\currentstate[8][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[8][6]~feeder_combout\,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][6]~regout\);

-- Location: LCFF_X15_Y34_N7
\currentstate[8][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	sload => VCC,
	ena => \Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[8][7]~regout\);

-- Location: LCCOMB_X16_Y34_N2
\Decoder0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~16_combout\ = (!cnt(3) & \Decoder0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(3),
	datad => \Decoder0~0_combout\,
	combout => \Decoder0~16_combout\);

-- Location: LCFF_X16_Y34_N5
\currentstate[7][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][0]~regout\);

-- Location: LCCOMB_X16_Y34_N10
\currentstate[7][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[7][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[7][1]~feeder_combout\);

-- Location: LCFF_X16_Y34_N11
\currentstate[7][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[7][1]~feeder_combout\,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][1]~regout\);

-- Location: LCCOMB_X16_Y34_N8
\currentstate[7][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[7][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[7][2]~feeder_combout\);

-- Location: LCFF_X16_Y34_N9
\currentstate[7][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[7][2]~feeder_combout\,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][2]~regout\);

-- Location: LCFF_X16_Y34_N3
\currentstate[7][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	sload => VCC,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][3]~regout\);

-- Location: LCCOMB_X16_Y34_N20
\currentstate[7][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[7][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[7][4]~feeder_combout\);

-- Location: LCFF_X16_Y34_N21
\currentstate[7][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[7][4]~feeder_combout\,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][4]~regout\);

-- Location: LCCOMB_X16_Y34_N26
\currentstate[7][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[7][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[7][5]~feeder_combout\);

-- Location: LCFF_X16_Y34_N27
\currentstate[7][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[7][5]~feeder_combout\,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][5]~regout\);

-- Location: LCCOMB_X16_Y34_N16
\currentstate[7][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[7][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[7][6]~feeder_combout\);

-- Location: LCFF_X16_Y34_N17
\currentstate[7][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[7][6]~feeder_combout\,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][6]~regout\);

-- Location: LCCOMB_X16_Y34_N14
\currentstate[7][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[7][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[7][7]~feeder_combout\);

-- Location: LCFF_X16_Y34_N15
\currentstate[7][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[7][7]~feeder_combout\,
	ena => \Decoder0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[7][7]~regout\);

-- Location: LCCOMB_X10_Y34_N12
\currentstate[6][0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[6][0]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \currentstate[6][0]~feeder_combout\);

-- Location: LCCOMB_X10_Y34_N20
\Decoder0~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~17_combout\ = (!cnt(3) & \Decoder0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datad => \Decoder0~2_combout\,
	combout => \Decoder0~17_combout\);

-- Location: LCFF_X10_Y34_N13
\currentstate[6][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[6][0]~feeder_combout\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][0]~regout\);

-- Location: LCCOMB_X10_Y34_N26
\currentstate[6][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[6][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[6][1]~feeder_combout\);

-- Location: LCFF_X10_Y34_N27
\currentstate[6][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[6][1]~feeder_combout\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][1]~regout\);

-- Location: LCCOMB_X10_Y34_N28
\currentstate[6][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[6][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[6][2]~feeder_combout\);

-- Location: LCFF_X10_Y34_N29
\currentstate[6][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[6][2]~feeder_combout\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][2]~regout\);

-- Location: LCCOMB_X10_Y34_N22
\currentstate[6][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[6][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[6][3]~feeder_combout\);

-- Location: LCFF_X10_Y34_N23
\currentstate[6][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[6][3]~feeder_combout\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][3]~regout\);

-- Location: LCFF_X10_Y34_N21
\currentstate[6][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	sload => VCC,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][4]~regout\);

-- Location: LCCOMB_X10_Y34_N2
\currentstate[6][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[6][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[6][5]~feeder_combout\);

-- Location: LCFF_X10_Y34_N3
\currentstate[6][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[6][5]~feeder_combout\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][5]~regout\);

-- Location: LCCOMB_X10_Y34_N16
\currentstate[6][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[6][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[6][6]~feeder_combout\);

-- Location: LCFF_X10_Y34_N17
\currentstate[6][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[6][6]~feeder_combout\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][6]~regout\);

-- Location: LCCOMB_X10_Y34_N10
\currentstate[6][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[6][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[6][7]~feeder_combout\);

-- Location: LCFF_X10_Y34_N11
\currentstate[6][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[6][7]~feeder_combout\,
	ena => \Decoder0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[6][7]~regout\);

-- Location: LCCOMB_X12_Y35_N2
\Decoder0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~4_combout\ = (\enable~combout\ & (!cnt(1) & (!cnt(0) & cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~combout\,
	datab => cnt(1),
	datac => cnt(0),
	datad => cnt(2),
	combout => \Decoder0~4_combout\);

-- Location: LCCOMB_X14_Y34_N0
\Decoder0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~18_combout\ = (!cnt(3) & \Decoder0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datad => \Decoder0~4_combout\,
	combout => \Decoder0~18_combout\);

-- Location: LCFF_X14_Y34_N1
\currentstate[5][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][0]~regout\);

-- Location: LCCOMB_X14_Y34_N6
\currentstate[5][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[5][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[5][1]~feeder_combout\);

-- Location: LCFF_X14_Y34_N7
\currentstate[5][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[5][1]~feeder_combout\,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][1]~regout\);

-- Location: LCCOMB_X14_Y34_N20
\currentstate[5][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[5][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[5][2]~feeder_combout\);

-- Location: LCFF_X14_Y34_N21
\currentstate[5][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[5][2]~feeder_combout\,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][2]~regout\);

-- Location: LCCOMB_X14_Y34_N30
\currentstate[5][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[5][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[5][3]~feeder_combout\);

-- Location: LCFF_X14_Y34_N31
\currentstate[5][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[5][3]~feeder_combout\,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][3]~regout\);

-- Location: LCCOMB_X14_Y34_N8
\currentstate[5][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[5][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[5][4]~feeder_combout\);

-- Location: LCFF_X14_Y34_N9
\currentstate[5][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[5][4]~feeder_combout\,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][4]~regout\);

-- Location: LCCOMB_X14_Y34_N22
\currentstate[5][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[5][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[5][5]~feeder_combout\);

-- Location: LCFF_X14_Y34_N23
\currentstate[5][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[5][5]~feeder_combout\,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][5]~regout\);

-- Location: LCCOMB_X14_Y34_N16
\currentstate[5][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[5][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[5][6]~feeder_combout\);

-- Location: LCFF_X14_Y34_N17
\currentstate[5][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[5][6]~feeder_combout\,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][6]~regout\);

-- Location: LCCOMB_X14_Y34_N2
\currentstate[5][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[5][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[5][7]~feeder_combout\);

-- Location: LCFF_X14_Y34_N3
\currentstate[5][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[5][7]~feeder_combout\,
	ena => \Decoder0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[5][7]~regout\);

-- Location: LCCOMB_X14_Y34_N28
\currentstate[4][0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[4][0]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \currentstate[4][0]~feeder_combout\);

-- Location: LCCOMB_X14_Y34_N12
\Decoder0~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~19_combout\ = (!cnt(3) & \Decoder0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datad => \Decoder0~6_combout\,
	combout => \Decoder0~19_combout\);

-- Location: LCFF_X14_Y34_N29
\currentstate[4][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[4][0]~feeder_combout\,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][0]~regout\);

-- Location: LCCOMB_X14_Y34_N18
\currentstate[4][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[4][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[4][1]~feeder_combout\);

-- Location: LCFF_X14_Y34_N19
\currentstate[4][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[4][1]~feeder_combout\,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][1]~regout\);

-- Location: LCCOMB_X14_Y34_N4
\currentstate[4][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[4][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[4][2]~feeder_combout\);

-- Location: LCFF_X14_Y34_N5
\currentstate[4][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[4][2]~feeder_combout\,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][2]~regout\);

-- Location: LCCOMB_X14_Y34_N26
\currentstate[4][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[4][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[4][3]~feeder_combout\);

-- Location: LCFF_X14_Y34_N27
\currentstate[4][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[4][3]~feeder_combout\,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][3]~regout\);

-- Location: LCCOMB_X14_Y34_N24
\currentstate[4][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[4][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[4][4]~feeder_combout\);

-- Location: LCFF_X14_Y34_N25
\currentstate[4][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[4][4]~feeder_combout\,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][4]~regout\);

-- Location: LCCOMB_X14_Y34_N14
\currentstate[4][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[4][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[4][5]~feeder_combout\);

-- Location: LCFF_X14_Y34_N15
\currentstate[4][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[4][5]~feeder_combout\,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][5]~regout\);

-- Location: LCFF_X14_Y34_N13
\currentstate[4][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	sload => VCC,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][6]~regout\);

-- Location: LCCOMB_X14_Y34_N10
\currentstate[4][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[4][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[4][7]~feeder_combout\);

-- Location: LCFF_X14_Y34_N11
\currentstate[4][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[4][7]~feeder_combout\,
	ena => \Decoder0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[4][7]~regout\);

-- Location: LCCOMB_X11_Y34_N28
\Decoder0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~20_combout\ = (!cnt(3) & \Decoder0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datad => \Decoder0~8_combout\,
	combout => \Decoder0~20_combout\);

-- Location: LCFF_X11_Y34_N25
\currentstate[3][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][0]~regout\);

-- Location: LCCOMB_X11_Y34_N18
\currentstate[3][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[3][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[3][1]~feeder_combout\);

-- Location: LCFF_X11_Y34_N19
\currentstate[3][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[3][1]~feeder_combout\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][1]~regout\);

-- Location: LCCOMB_X11_Y34_N4
\currentstate[3][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[3][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[3][2]~feeder_combout\);

-- Location: LCFF_X11_Y34_N5
\currentstate[3][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[3][2]~feeder_combout\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][2]~regout\);

-- Location: LCCOMB_X11_Y34_N30
\currentstate[3][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[3][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[3][3]~feeder_combout\);

-- Location: LCFF_X11_Y34_N31
\currentstate[3][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[3][3]~feeder_combout\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][3]~regout\);

-- Location: LCFF_X11_Y34_N21
\currentstate[3][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	sload => VCC,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][4]~regout\);

-- Location: LCCOMB_X11_Y34_N10
\currentstate[3][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[3][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[3][5]~feeder_combout\);

-- Location: LCFF_X11_Y34_N11
\currentstate[3][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[3][5]~feeder_combout\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][5]~regout\);

-- Location: LCFF_X11_Y34_N29
\currentstate[3][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	sload => VCC,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][6]~regout\);

-- Location: LCCOMB_X11_Y34_N14
\currentstate[3][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[3][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[3][7]~feeder_combout\);

-- Location: LCFF_X11_Y34_N15
\currentstate[3][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[3][7]~feeder_combout\,
	ena => \Decoder0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[3][7]~regout\);

-- Location: LCCOMB_X11_Y34_N8
\Decoder0~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~21_combout\ = (\Decoder0~10_combout\ & !cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder0~10_combout\,
	datad => cnt(3),
	combout => \Decoder0~21_combout\);

-- Location: LCFF_X11_Y34_N1
\currentstate[2][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][0]~regout\);

-- Location: LCCOMB_X11_Y34_N26
\currentstate[2][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[2][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[2][1]~feeder_combout\);

-- Location: LCFF_X11_Y34_N27
\currentstate[2][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[2][1]~feeder_combout\,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][1]~regout\);

-- Location: LCCOMB_X11_Y34_N16
\currentstate[2][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[2][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[2][2]~feeder_combout\);

-- Location: LCFF_X11_Y34_N17
\currentstate[2][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[2][2]~feeder_combout\,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][2]~regout\);

-- Location: LCCOMB_X11_Y34_N2
\currentstate[2][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[2][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[2][3]~feeder_combout\);

-- Location: LCFF_X11_Y34_N3
\currentstate[2][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[2][3]~feeder_combout\,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][3]~regout\);

-- Location: LCFF_X11_Y34_N13
\currentstate[2][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	sload => VCC,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][4]~regout\);

-- Location: LCCOMB_X11_Y34_N22
\currentstate[2][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[2][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[2][5]~feeder_combout\);

-- Location: LCFF_X11_Y34_N23
\currentstate[2][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[2][5]~feeder_combout\,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][5]~regout\);

-- Location: LCFF_X11_Y34_N9
\currentstate[2][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	sload => VCC,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][6]~regout\);

-- Location: LCCOMB_X11_Y34_N6
\currentstate[2][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[2][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[2][7]~feeder_combout\);

-- Location: LCFF_X11_Y34_N7
\currentstate[2][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[2][7]~feeder_combout\,
	ena => \Decoder0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[2][7]~regout\);

-- Location: LCCOMB_X8_Y34_N4
\currentstate[1][0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[1][0]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \currentstate[1][0]~feeder_combout\);

-- Location: LCCOMB_X8_Y34_N0
\Decoder0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~22_combout\ = (!cnt(3) & \Decoder0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(3),
	datad => \Decoder0~12_combout\,
	combout => \Decoder0~22_combout\);

-- Location: LCFF_X8_Y34_N5
\currentstate[1][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[1][0]~feeder_combout\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][0]~regout\);

-- Location: LCCOMB_X8_Y34_N10
\currentstate[1][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[1][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[1][1]~feeder_combout\);

-- Location: LCFF_X8_Y34_N11
\currentstate[1][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[1][1]~feeder_combout\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][1]~regout\);

-- Location: LCCOMB_X8_Y34_N28
\currentstate[1][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[1][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[1][2]~feeder_combout\);

-- Location: LCFF_X8_Y34_N29
\currentstate[1][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[1][2]~feeder_combout\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][2]~regout\);

-- Location: LCCOMB_X8_Y34_N30
\currentstate[1][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[1][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[1][3]~feeder_combout\);

-- Location: LCFF_X8_Y34_N31
\currentstate[1][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[1][3]~feeder_combout\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][3]~regout\);

-- Location: LCCOMB_X8_Y34_N24
\currentstate[1][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[1][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[1][4]~feeder_combout\);

-- Location: LCFF_X8_Y34_N25
\currentstate[1][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[1][4]~feeder_combout\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][4]~regout\);

-- Location: LCCOMB_X8_Y34_N2
\currentstate[1][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[1][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[1][5]~feeder_combout\);

-- Location: LCFF_X8_Y34_N3
\currentstate[1][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[1][5]~feeder_combout\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][5]~regout\);

-- Location: LCFF_X8_Y34_N1
\currentstate[1][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	sload => VCC,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][6]~regout\);

-- Location: LCCOMB_X8_Y34_N22
\currentstate[1][7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[1][7]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	combout => \currentstate[1][7]~feeder_combout\);

-- Location: LCFF_X8_Y34_N23
\currentstate[1][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[1][7]~feeder_combout\,
	ena => \Decoder0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[1][7]~regout\);

-- Location: LCCOMB_X15_Y34_N16
\Decoder0~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \Decoder0~23_combout\ = (cnt(3) & \Decoder0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datad => \Decoder0~14_combout\,
	combout => \Decoder0~23_combout\);

-- Location: LCFF_X15_Y34_N17
\currentstate[0][0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][0]~regout\);

-- Location: LCCOMB_X15_Y34_N26
\currentstate[0][1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[0][1]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a1\,
	combout => \currentstate[0][1]~feeder_combout\);

-- Location: LCFF_X15_Y34_N27
\currentstate[0][1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[0][1]~feeder_combout\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][1]~regout\);

-- Location: LCCOMB_X15_Y34_N12
\currentstate[0][2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[0][2]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a2\,
	combout => \currentstate[0][2]~feeder_combout\);

-- Location: LCFF_X15_Y34_N13
\currentstate[0][2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[0][2]~feeder_combout\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][2]~regout\);

-- Location: LCCOMB_X15_Y34_N10
\currentstate[0][3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[0][3]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a3\,
	combout => \currentstate[0][3]~feeder_combout\);

-- Location: LCFF_X15_Y34_N11
\currentstate[0][3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[0][3]~feeder_combout\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][3]~regout\);

-- Location: LCCOMB_X15_Y34_N20
\currentstate[0][4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[0][4]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a4\,
	combout => \currentstate[0][4]~feeder_combout\);

-- Location: LCFF_X15_Y34_N21
\currentstate[0][4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[0][4]~feeder_combout\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][4]~regout\);

-- Location: LCCOMB_X15_Y34_N14
\currentstate[0][5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[0][5]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a5\,
	combout => \currentstate[0][5]~feeder_combout\);

-- Location: LCFF_X15_Y34_N15
\currentstate[0][5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[0][5]~feeder_combout\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][5]~regout\);

-- Location: LCCOMB_X15_Y34_N0
\currentstate[0][6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \currentstate[0][6]~feeder_combout\ = \u1|Mux7_rtl_0|auto_generated|ram_block1a6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u1|Mux7_rtl_0|auto_generated|ram_block1a6\,
	combout => \currentstate[0][6]~feeder_combout\);

-- Location: LCFF_X15_Y34_N1
\currentstate[0][6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \currentstate[0][6]~feeder_combout\,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][6]~regout\);

-- Location: LCFF_X15_Y34_N23
\currentstate[0][7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \u1|Mux7_rtl_0|auto_generated|ram_block1a7\,
	sload => VCC,
	ena => \Decoder0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \currentstate[0][7]~regout\);

-- Location: PIN_G9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(0));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(1));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(2));

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(3));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(4));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(5));

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(6));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[15][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(7));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(8));

-- Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(9));

-- Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(10));

-- Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(11));

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(12));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(13));

-- Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(14));

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[14][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(15));

-- Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(16));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(17));

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(18));

-- Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(19));

-- Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(20));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(21));

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(22));

-- Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[13][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(23));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(24));

-- Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(25));

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(26));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(27));

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(28));

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(29));

-- Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(30));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[12][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(31));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[32]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(32));

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[33]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(33));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[34]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(34));

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[35]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(35));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[36]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(36));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[37]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(37));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[38]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(38));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[39]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[11][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(39));

-- Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[40]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(40));

-- Location: PIN_J9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[41]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(41));

-- Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[42]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(42));

-- Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[43]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(43));

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[44]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(44));

-- Location: PIN_K9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[45]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(45));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[46]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(46));

-- Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[47]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[10][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(47));

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[48]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(48));

-- Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[49]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(49));

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[50]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(50));

-- Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[51]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(51));

-- Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[52]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(52));

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[53]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(53));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[54]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(54));

-- Location: PIN_J8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[55]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[9][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(55));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[56]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(56));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[57]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(57));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[58]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(58));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[59]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(59));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[60]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(60));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[61]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(61));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[62]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(62));

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[63]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[8][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(63));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[64]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(64));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[65]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(65));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[66]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(66));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[67]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(67));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[68]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(68));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[69]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(69));

-- Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[70]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(70));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[71]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[7][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(71));

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[72]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(72));

-- Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[73]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(73));

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[74]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(74));

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[75]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(75));

-- Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[76]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(76));

-- Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[77]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(77));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[78]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(78));

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[79]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[6][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(79));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[80]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(80));

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[81]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(81));

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[82]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(82));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[83]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(83));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[84]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(84));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[85]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(85));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[86]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(86));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[87]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[5][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(87));

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[88]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(88));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[89]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(89));

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[90]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(90));

-- Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[91]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(91));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[92]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(92));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[93]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(93));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[94]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(94));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[95]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[4][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(95));

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[96]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(96));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[97]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(97));

-- Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[98]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(98));

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[99]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(99));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[100]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(100));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[101]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(101));

-- Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[102]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(102));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[103]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[3][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(103));

-- Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[104]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(104));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[105]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(105));

-- Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[106]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(106));

-- Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[107]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(107));

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[108]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(108));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[109]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(109));

-- Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[110]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(110));

-- Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[111]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[2][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(111));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[112]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(112));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[113]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(113));

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[114]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(114));

-- Location: PIN_J3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[115]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(115));

-- Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[116]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(116));

-- Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[117]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(117));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[118]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(118));

-- Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[119]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[1][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(119));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[120]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(120));

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[121]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(121));

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[122]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(122));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[123]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(123));

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[124]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(124));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[125]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(125));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[126]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(126));

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ciphertext[127]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \currentstate[0][7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ciphertext(127));
END structure;


