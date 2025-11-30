library verilog;
use verilog.vl_types.all;
entity main_AES_vlg_check_tst is
    port(
        ciphertext      : in     vl_logic_vector(127 downto 0);
        counter_out     : in     vl_logic_vector(3 downto 0);
        plain_text_out  : in     vl_logic_vector(127 downto 0);
        round_out       : in     vl_logic_vector(3 downto 0);
        sbox_out_test   : in     vl_logic_vector(7 downto 0);
        state_out       : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end main_AES_vlg_check_tst;
