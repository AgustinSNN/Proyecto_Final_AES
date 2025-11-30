library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mux16to1 is
    Port (
        sel  : in  integer range 0 to 15;   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(7 downto 0);
        d1   : in  STD_LOGIC_VECTOR(7 downto 0);
        d2   : in  STD_LOGIC_VECTOR(7 downto 0);
        d3   : in  STD_LOGIC_VECTOR(7 downto 0);
        d4   : in  STD_LOGIC_VECTOR(7 downto 0);
        d5   : in  STD_LOGIC_VECTOR(7 downto 0);
        d6   : in  STD_LOGIC_VECTOR(7 downto 0);
        d7   : in  STD_LOGIC_VECTOR(7 downto 0);
        d8   : in  STD_LOGIC_VECTOR(7 downto 0);
        d9   : in  STD_LOGIC_VECTOR(7 downto 0);
        d10  : in  STD_LOGIC_VECTOR(7 downto 0);
        d11  : in  STD_LOGIC_VECTOR(7 downto 0);
        d12  : in  STD_LOGIC_VECTOR(7 downto 0);
        d13  : in  STD_LOGIC_VECTOR(7 downto 0);
        d14  : in  STD_LOGIC_VECTOR(7 downto 0);
        d15  : in  STD_LOGIC_VECTOR(7 downto 0);
        y    : out STD_LOGIC_VECTOR(7 downto 0)    -- Output
    );
end mux16to1;

architecture Behavioral of mux16to1 is
begin
    process(sel, d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15)
    begin
        case sel is
            when 0 => y <= d0;
            when 1 => y <= d1;
            when 2 => y <= d2;
            when 3 => y <= d3;
            when 4 => y <= d4;
            when 5 => y <= d5;
            when 6 => y <= d6;
            when 7 => y <= d7;
            when 8 => y <= d8;
            when 9 => y <= d9;
            when 10 => y <= d10;
            when 11 => y <= d11;
            when 12 => y <= d12;
            when 13 => y <= d13;
            when 14 => y <= d14;
            when 15 => y <= d15;
            when others => y <= (others => '0');  -- Default output
        end case;
    end process;
end Behavioral;
