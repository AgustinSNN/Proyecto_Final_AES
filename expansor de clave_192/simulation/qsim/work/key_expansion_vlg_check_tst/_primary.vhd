library verilog;
use verilog.vl_types.all;
entity key_expansion_vlg_check_tst is
    port(
        aux_out         : in     vl_logic_vector(31 downto 0);
        counter_out     : in     vl_logic_vector(1 downto 0);
        key_word        : in     vl_logic_vector(31 downto 0);
        rcon_out        : in     vl_logic_vector(31 downto 0);
        state_out       : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end key_expansion_vlg_check_tst;
