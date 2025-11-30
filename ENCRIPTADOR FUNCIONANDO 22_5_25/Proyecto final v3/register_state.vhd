library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity register_state is
port (
		clk, e: in std_logic;
		data_in : in std_logic_vector(127 downto 0);
		data_out : out std_logic_vector(127 downto 0)
	);
end register_state;

architecture behave of register_state is
begin
	process(clk, e)
	begin
		if rising_edge (clk) and e='1' then
			data_out <= data_in;
		end if;
	end process;
end architecture;