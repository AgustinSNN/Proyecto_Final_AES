library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1to16 is
    Port (
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        sel      : in  INTEGER range 0 to 15;
        out0     : out STD_LOGIC_VECTOR(7 downto 0);
        out1     : out STD_LOGIC_VECTOR(7 downto 0);
        out2     : out STD_LOGIC_VECTOR(7 downto 0);
        out3     : out STD_LOGIC_VECTOR(7 downto 0);
        out4     : out STD_LOGIC_VECTOR(7 downto 0);
        out5     : out STD_LOGIC_VECTOR(7 downto 0);
        out6     : out STD_LOGIC_VECTOR(7 downto 0);
        out7     : out STD_LOGIC_VECTOR(7 downto 0);
        out8     : out STD_LOGIC_VECTOR(7 downto 0);
        out9     : out STD_LOGIC_VECTOR(7 downto 0);
        out10    : out STD_LOGIC_VECTOR(7 downto 0);
        out11    : out STD_LOGIC_VECTOR(7 downto 0);
        out12    : out STD_LOGIC_VECTOR(7 downto 0);
        out13    : out STD_LOGIC_VECTOR(7 downto 0);
        out14    : out STD_LOGIC_VECTOR(7 downto 0);
        out15    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end demux1to16;

architecture Behavioral of demux1to16 is
begin
    process(data_in, sel)
    begin
--        -- Default all outputs to zero
        out0  <= (others => '0');
        out1  <= (others => '0');
        out2  <= (others => '0');
        out3  <= (others => '0');
        out4  <= (others => '0');
        out5  <= (others => '0');
        out6  <= (others => '0');
        out7  <= (others => '0');
        out8  <= (others => '0');
        out9  <= (others => '0');
        out10 <= (others => '0');
        out11 <= (others => '0');
        out12 <= (others => '0');
        out13 <= (others => '0');
        out14 <= (others => '0');
        out15 <= (others => '0');

        -- Assign input to the selected output
        case sel is
            when 0  => out0  <= data_in;
            when 1  => out1  <= data_in;
            when 2  => out2  <= data_in;
            when 3  => out3  <= data_in;
            when 4  => out4  <= data_in;
            when 5  => out5  <= data_in;
            when 6  => out6  <= data_in;
            when 7  => out7  <= data_in;
            when 8  => out8  <= data_in;
            when 9  => out9  <= data_in;
            when 10 => out10 <= data_in;
            when 11 => out11 <= data_in;
            when 12 => out12 <= data_in;
            when 13 => out13 <= data_in;
            when 14 => out14 <= data_in;
            when 15 => out15 <= data_in;
            when others => null;
        end case;
    end process;
end Behavioral;