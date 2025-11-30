library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mux2to1 is

    Port (
        sel  : in  integer range 0 to 1;   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(127 downto 0);
        d1   : in  STD_LOGIC_VECTOR(127 downto 0);
		  y    : out std_logic_vector(127 downto 0)
		);
end mux2to1;

architecture Behavioral of mux2to1 is
begin
    process(sel, d0, d1)
    begin
        case sel is
            when 0 => y <= d0;
            when 1 => y <= d1;
            when others => y <= (others => '0');  -- Default output
        end case;
    end process;
end Behavioral;