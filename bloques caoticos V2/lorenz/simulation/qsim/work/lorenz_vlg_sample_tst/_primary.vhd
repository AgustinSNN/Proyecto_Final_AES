library verilog;
use verilog.vl_types.all;
entity lorenz_vlg_sample_tst is
    port(
        AES_version     : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lorenz_vlg_sample_tst;
