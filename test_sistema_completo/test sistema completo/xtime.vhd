library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity xtime is
port (
	i_byte : in std_logic_vector(7 downto 0);
	o_byte : out std_logic_vector(7 downto 0)
	);
end xtime;

architecture behave of xtime is

begin
	process(i_byte)
	begin
		if i_byte(7) = '1' then
			o_byte <= (i_byte(6 downto 0) & '0') xor X"1B";
		else
			o_byte <= i_byte(6 downto 0) & '0';
		end if;
	end process;
end architecture;