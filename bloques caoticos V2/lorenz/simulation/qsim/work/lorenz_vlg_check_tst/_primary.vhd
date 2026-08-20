library verilog;
use verilog.vl_types.all;
entity lorenz_vlg_check_tst is
    port(
        counter_out     : in     vl_logic_vector(1 downto 0);
        data_out        : in     vl_logic_vector(31 downto 0);
        data_valid      : in     vl_logic;
        done_out        : in     vl_logic;
        ram_addr        : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end lorenz_vlg_check_tst;
