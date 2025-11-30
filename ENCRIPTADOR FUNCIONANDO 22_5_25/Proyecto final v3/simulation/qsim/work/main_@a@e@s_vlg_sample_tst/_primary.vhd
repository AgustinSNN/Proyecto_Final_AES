library verilog;
use verilog.vl_types.all;
entity main_AES_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end main_AES_vlg_sample_tst;
