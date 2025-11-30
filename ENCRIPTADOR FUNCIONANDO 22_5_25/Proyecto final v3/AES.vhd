library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity sampler is 
port(
		data_in : in std_logic;
		clk : in std_logic;
		enable : in std_logic;
		plain_text : out std_logic_vector (128 downto 0)
		);
end sampler;

architecture behave of sampler is
begin
	process(clk, enable)
		variable cnt : integer range 0 to 128;
	begin
		if rising_edge(clk) and enable = 1 then
			if cnt = 127 then
				cnt := '0';
			else 
				cnt := cnt + '1';
			end if ;
			plain_text(cnt) <= data_in;
		end if;
	end process;
end behave;