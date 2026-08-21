library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity inv_mix_columns is 
port (
		byte0, byte1, byte2, byte3 : in std_logic_vector (7 downto 0);
		out0,out1, out2, out3 : out std_logic_vector (7 downto 0)
	);
end inv_mix_columns;

architecture behave of inv_mix_columns is
	
	component xtime is
	port (
		i_byte : in std_logic_vector(7 downto 0);
		o_byte : out std_logic_vector(7 downto 0)
		);
	end component;

	signal byte0x2, byte0x4, byte0x8  : std_logic_vector (7 downto 0);
	signal byte1x2, byte1x4, byte1x8  : std_logic_vector (7 downto 0);
	signal byte2x2, byte2x4, byte2x8  : std_logic_vector (7 downto 0);
	signal byte3x2, byte3x4, byte3x8  : std_logic_vector (7 downto 0);
	
	signal byte0x09, byte0x0b, byte0x0d, byte0x0e : std_logic_vector(7 downto 0);
	signal byte1x09, byte1x0b, byte1x0d, byte1x0e : std_logic_vector(7 downto 0);
	signal byte2x09, byte2x0b, byte2x0d, byte2x0e : std_logic_vector(7 downto 0);
	signal byte3x09, byte3x0b, byte3x0d, byte3x0e : std_logic_vector(7 downto 0);	

begin
		
	b0x2: xtime port map(i_byte => byte0, o_byte => byte0x2);
	b0x4: xtime port map(i_byte => byte0x2, o_byte => byte0x4);
	b0x8: xtime port map(i_byte => byte0x4, o_byte => byte0x8);
	
	b1x2: xtime port map(i_byte => byte1, o_byte => byte1x2);
	b1x4: xtime port map(i_byte => byte1x2, o_byte => byte1x4);		
	b1x8: xtime port map(i_byte => byte1x4, o_byte => byte1x8);
		
	b2x2: xtime port map(i_byte => byte2, o_byte => byte2x2);
	b2x4: xtime port map(i_byte => byte2x2, o_byte => byte2x4);
	b2x8: xtime port map(i_byte => byte2x4, o_byte => byte2x8);
		
	b3x2: xtime port map(i_byte => byte3, o_byte => byte3x2);
	b3x4: xtime port map(i_byte => byte3x2, o_byte => byte3x4);
	b3x8: xtime port map(i_byte => byte3x4, o_byte => byte3x8);
		
	
	byte0x0e <= byte0x2 xor byte0x4 xor byte0x8;
	byte1x0e <= byte1x2 xor byte1x4 xor byte1x8;
	byte2x0e <= byte2x2 xor byte2x4 xor byte2x8;
	byte3x0e <= byte3x2 xor byte3x4 xor byte3x8;
	
	byte1x0b <= byte1 xor byte1x2 xor byte1x8;
	byte2x0b <= byte2 xor byte2x2 xor byte2x8;
	byte3x0b <= byte3 xor byte3x2 xor byte3x8;
	byte0x0b <= byte0 xor byte0x2 xor byte0x8;
	
	byte2x0d <= byte2 xor byte2x4 xor byte2x8;
	byte3x0d <= byte3 xor byte3x4 xor byte3x8;
	byte0x0d <= byte0 xor byte0x4 xor byte0x8;
	byte1x0d <= byte1 xor byte1x4 xor byte1x8;
	
	byte3x09 <= byte3 xor byte3x8;
	byte0x09 <= byte0 xor byte0x8;
	byte1x09 <= byte1 xor byte1x8;
	byte2x09 <= byte2 xor byte2x8;
	
	
	out0 <= byte0x0e xor byte1x0b xor byte2x0d xor byte3x09;
	out1 <= byte0x09 xor byte1x0e xor byte2x0b xor byte3x0d;
	out2 <= byte0x0d xor byte1x09 xor byte2x0e xor byte3x0b;
	out3 <= byte0x0b xor byte1x0d xor byte2x09 xor byte3x0e;
	
end architecture;
	
			