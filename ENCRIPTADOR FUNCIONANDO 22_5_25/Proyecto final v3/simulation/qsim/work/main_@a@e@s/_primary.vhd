library verilog;
use verilog.vl_types.all;
entity main_AES is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ciphertext      : out    vl_logic_vector(127 downto 0);
        round_out       : out    vl_logic_vector(3 downto 0);
        counter_out     : out    vl_logic_vector(3 downto 0);
        state_out       : out    vl_logic_vector(2 downto 0);
        sbox_out_test   : out    vl_logic_vector(7 downto 0);
        plain_text_out  : out    vl_logic_vector(127 downto 0)
    );
end main_AES;
