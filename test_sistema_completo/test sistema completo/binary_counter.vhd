-- Quartus II VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter is

	port
	(
		clk		  : in std_logic;
		enable	  : in std_logic;
		q		  : out integer range 0 to 3
	);

end entity;

architecture rtl of binary_counter is
begin

	process (clk)
		variable   cnt		   : integer range 0 to 3;
	begin
		if (rising_edge(clk)) then

			if enable = '1' then
				-- Increment the counter if counting is enabled			   
				cnt := cnt + 1;
			else 
				cnt := 0;
			end if;
		end if;

		-- Output the current count
		q <= cnt;
	end process;

end rtl;
