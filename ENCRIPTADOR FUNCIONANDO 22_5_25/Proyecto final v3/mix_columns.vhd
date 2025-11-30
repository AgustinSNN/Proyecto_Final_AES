library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity mix_columns is 
port (
		byte0, byte1, byte2, byte3 : in std_logic_vector (7 downto 0);
		out0,out1, out2, out3 : out std_logic_vector (7 downto 0)
	);
end mix_columns;

architecture behave of mix_columns is

signal byte0x2, byte0x3, byte1x2, byte1x3 ,byte2x2, byte2x3, byte3x2, byte3x3 : std_logic_vector (7 downto 0);

begin
	process (byte0, byte1, byte2, byte3)
	begin
		if byte0(7) ='1' then
			byte0x2 <= (byte0(6 downto 0) & '0') xor X"1B";
		else
			byte0x2 <= byte0(6 downto 0) & '0';
		end if;
		
		if byte1(7) ='1' then
			byte1x2 <= (byte1(6 downto 0) & '0') xor X"1B";
		else
			byte1x2 <= byte1(6 downto 0) & '0';
		end if;
		
		if byte2(7) ='1' then
			byte2x2 <= (byte2(6 downto 0) & '0') xor X"1B";
		else
			byte2x2 <= byte2(6 downto 0) & '0';
		end if;
		
		if byte3(7) ='1' then
			byte3x2 <= (byte3(6 downto 0) & '0') xor X"1B";
		else
			byte3x2 <= byte3(6 downto 0) & '0';
		end if;
	end process;
	
	byte0x3 <= byte0x2 xor byte0;
	byte1x3 <= byte1x2 xor byte1;
	byte2x3 <= byte2x2 xor byte2;
	byte3x3 <= byte3x2 xor byte3;
	
	out0 <= byte0x2 xor byte1x3 xor byte2 xor byte3;
	out1 <= byte0 xor byte1x2 xor byte2x3 xor byte3;
	out2 <= byte0 xor byte1 xor byte2x2 xor byte3x3;
	out3 <= byte0x3 xor byte1 xor byte2 xor byte3x2;
	
end architecture;
	
			