library verilog;
use verilog.vl_types.all;
entity main_AES is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        AES_version     : in     vl_logic_vector(1 downto 0);
        start           : in     vl_logic;
        done_o          : out    vl_logic;
        sub_text_out    : out    vl_logic_vector(127 downto 0);
        index_out       : out    vl_logic_vector(3 downto 0);
        state_out       : out    vl_logic_vector(2 downto 0);
        sbox_out_test   : out    vl_logic_vector(7 downto 0);
        ciphertext_out  : out    vl_logic_vector(127 downto 0)
    );
end main_AES;
