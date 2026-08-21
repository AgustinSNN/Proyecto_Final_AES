library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2to4 is
    Port (
        A : in  integer range 0 to 3; -- 2-bit input
        Y : out STD_LOGIC_VECTOR(3 downto 0)  -- 4 outputs
    );
end decoder_2to4;

architecture Behavioral of decoder_2to4 is
begin
    process(A)
    begin
        case A is
            when 0 => Y <= "0001";
            when 1 => Y <= "0010";
            when 2 => Y <= "0100";
            when 3 => Y <= "1000";
            when others => Y <= "0000";
        end case;
    end process;
end Behavioral;