library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mux8to1 is
	 generic (
        M : integer := 8    -- bits per word
    );
    Port (
        sel  : in  std_logic_vector (1 downto 0);   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(M-1 downto 0);
        d1   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d2   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d3   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d4   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d5   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d6   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d7   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  y    : out std_logic_vector(M-1 downto 0)
		);
end mux8to1;

architecture Behavioral of mux8to1 is
begin
    process(sel, d0, d1, d2, d3)
    begin
        case sel is
            when "000" => y <= d0;
            when "001" => y <= d1;
				when "010" => y <= d2;
				when "011" => y <= d3;
				when "100" => y <= d4;
				when "101" => y <= d5;
				when "110" => y <= d6;
				when "111" => y <= d7;
            when others => y <= (others => '0');  -- Default output
        end case;
    end process;
end Behavioral;