library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram_out is
    Port (
        clk      : in  STD_LOGIC;
        we       : in  STD_LOGIC; -- write enable
        data_in  : in  STD_LOGIC_VECTOR(127 downto 0);
        addr     : in  integer range 0 to 15; -- for read
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ram_out;

architecture Behavioral of ram_out is

    -- Define RAM: 16 words of 8 bits
    type ram_type is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal ram : ram_type := (others => (others => '0'));
	 
	 signal addr_reg :integer range 0 to 15;

begin

    -- Write process (loads all 16 bytes at once)
    process(clk)
    begin
        if rising_edge(clk) then
				addr_reg <= addr;
            if we = '1' then
                for i in 0 to 15 loop
--                  ram(i) <= data_in((i*8+7) downto (i*8));
						  ram(15 - i) <= data_in((i*8+7) downto (i*8));
                end loop;
            end if;
        end if;
    end process;

    -- Read process (asynchronous read)
    data_out <= ram(addr_reg);

end Behavioral;