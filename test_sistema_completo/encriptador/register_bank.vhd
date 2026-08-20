library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_bank is
    generic (
        N : integer := 16;  -- number of words
        M : integer := 8    -- bits per word
    );
    port (
        clk      : in  std_logic;
        we       : in  std_logic;
        w_addr   : in  integer range 0 to N-1;
        data_in  : in  std_logic_vector(M-1 downto 0);
        data_out : out std_logic_vector(N*M-1 downto 0)  -- ALL words
    );
end entity;

architecture rtl of register_bank is

    type reg_array_t is array (0 to N-1) of std_logic_vector(M-1 downto 0);
    signal reg_array : reg_array_t := (others => (others => '0'));

begin

    -- Write process
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                reg_array(w_addr) <= data_in;
            end if;
        end if;
    end process;

    -- Flatten array into a single vector (parallel output)
	gen_output : for i in 0 to N-1 generate
--		data_out((i+1)*M-1 downto i*M) <= reg_array(i);
		data_out((N-i)*M-1 downto (N-i-1)*M) <= reg_array(i);		  
    end generate;

end architecture;