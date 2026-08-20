library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;   -- for ceil / log2

entity mux_generic is
    generic (
        DATA_WIDTH  : positive := 8;   -- bits per data channel
        NUM_INPUTS  : positive := 4    -- number of inputs (must be >= 2)
    );
    port (
        -- Input bus: NUM_INPUTS channels, each DATA_WIDTH bits wide
        data_in  : in  std_logic_vector(NUM_INPUTS * DATA_WIDTH - 1 downto 0);

        -- Select: wide enough to address every input
        sel      : in  std_logic_vector(integer(ceil(log2(real(NUM_INPUTS)))) - 1 downto 0);

        -- Selected output
        data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
end entity mux_generic;

architecture rtl of mux_generic is

    -- Derive select-signal width as a constant for reuse inside the body
    constant SEL_WIDTH : positive := integer(ceil(log2(real(NUM_INPUTS))));

    -- Convenience type: array of NUM_INPUTS slices
    type input_array_t is array (0 to NUM_INPUTS - 1)
        of std_logic_vector(DATA_WIDTH - 1 downto 0);

    -- Helper function: unpack the flat input bus into an array of slices
    function unpack_inputs(flat : std_logic_vector) return input_array_t is
        variable arr : input_array_t;
    begin
        for i in 0 to NUM_INPUTS - 1 loop
            arr(i) := flat((i + 1) * DATA_WIDTH - 1 downto i * DATA_WIDTH);
        end loop;
        return arr;
    end function;

begin

    -- -------------------------------------------------------------------------
    -- Combinatorial select process
    -- -------------------------------------------------------------------------
    process(data_in, sel)
        variable inputs  : input_array_t;
        variable sel_idx : integer;
    begin
        inputs  := unpack_inputs(data_in);
        sel_idx := to_integer(unsigned(sel));

        -- Default: drive all zeros when sel is out of range
        -- (can only happen when NUM_INPUTS is not a power of two)
        data_out <= (others => '0');

        if sel_idx < NUM_INPUTS then
            data_out <= inputs(sel_idx);
        end if;
    end process;

end architecture rtl;


