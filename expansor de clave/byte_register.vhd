library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity byte_register is
  Port (
        clk, enable : in  std_logic;
		  data_in	  : in std_logic_vector(7 downto 0);
		  data_out	  : out std_logic_vector(7 downto 0)
    );
end byte_register;

architecture behave of byte_register is
begin
	process (clk, enable, data_in)
	begin
		if enable = '1' and rising_edge(clk) then
			data_out <= data_in;
		end if;
	end process;
end architecture;
