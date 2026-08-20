library verilog;
use verilog.vl_types.all;
entity mapa_logistico is
    port(
        clk             : in     vl_logic;
        start           : in     vl_logic;
        reset           : in     vl_logic;
        AES_version     : in     vl_logic_vector(1 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0);
        data_valid      : out    vl_logic;
        counter_out     : out    vl_logic_vector(1 downto 0);
        ram_addr        : out    vl_logic_vector(3 downto 0);
        done_out        : out    vl_logic
    );
end mapa_logistico;
