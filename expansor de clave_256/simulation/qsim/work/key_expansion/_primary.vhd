library verilog;
use verilog.vl_types.all;
entity key_expansion is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        key_word        : out    vl_logic_vector(31 downto 0);
        rcon_out        : out    vl_logic_vector(31 downto 0);
        aux_out         : out    vl_logic_vector(31 downto 0);
        state_out       : out    vl_logic_vector(3 downto 0);
        sel_mux_aux_2_out: out    vl_logic;
        counter_out     : out    vl_logic_vector(2 downto 0)
    );
end key_expansion;
