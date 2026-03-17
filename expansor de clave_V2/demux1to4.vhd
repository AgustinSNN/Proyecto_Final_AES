library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1to4 is
    Port (
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        sel      : in  std_logic_vector(1 downto 0);
        out0     : out STD_LOGIC_VECTOR(7 downto 0);
        out1     : out STD_LOGIC_VECTOR(7 downto 0);
        out2     : out STD_LOGIC_VECTOR(7 downto 0);
        out3    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end demux1to4;

architecture Behavioral of demux1to4 is
begin
    process(data_in, sel)
    begin
--        -- Default all outputs to zero
        out0  <= (others => '0');
        out1  <= (others => '0');
        out2  <= (others => '0');
        out3  <= (others => '0');
      
        -- Assign input to the selected output
        case sel is
            when "00" => out0  <= data_in;
            when "01" => out1  <= data_in;
            when "10" => out2  <= data_in;
            when "11" => out3  <= data_in;
            
            when others => null;
        end case;
    end process;
end Behavioral;