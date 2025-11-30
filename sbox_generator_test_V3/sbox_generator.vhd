library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sbox_generator is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;                      -- synchronous reset
        start    : in  std_logic;                      -- trigger sort after load
        --load_en  : in  std_logic;                      -- start loading sequence
--      data_in  : in  signed(13 downto 0);
        done_out : out std_logic;
		  test_out : out std_logic;
		  counter_test : out integer range 0 to 255;
		  data_out_test : out signed(13 downto 0);
		  values_out: out signed(13 downto 0);
		  sbox_out : out unsigned(7 downto 0)
        --data_out : out signed(13 downto 0);
        --read_idx : in  integer range 0 to 255
    );
end entity;

architecture rtl of sbox_generator is

component lorenz is
  generic (
    N : integer := 7;  -- número de bits enteros
	 M : integer := 7;
	 sigma : integer := 3; -- shift_left = *8
	 b : integer := 1; -- shift_left = *2
	 r : integer := 5; -- shift_left = *32 
	 time_step : integer := 6 -- shift_right = *0.125
  );
  port (
    clk     : in  std_logic;
    load    : in  std_logic; 	 -- cuando =0 carga x_init	
	 stop    : in  std_logic;
	 reset   : in  std_logic;
	 x_out   : out signed(N+M-1 downto 0) -- salida 
--	 y_out   : out signed(N+M-1 downto 0);
--  z_out   : out signed(N+M-1 downto 0)  
  );
end component;


    -- Array of 256 signed 14-bit elements
    type arr_t_values is array (0 to 255) of signed(13 downto 0);
	 type arr_t_sbox is array (0 to 255) of unsigned(7 downto 0);
    signal values_random : arr_t_values := (others => (others => '0'));
	 signal sbox : arr_t_sbox := (others => (others => '0'));

    -- FSM states
    type state_t is (IDLE, LOAD_ARRAY, INIT_I, LOAD_AUX, COMPARE_SHIFT, INSERT_AUX, TEST, DONE);
    signal state : state_t := IDLE;

	 signal data_in  :  signed(13 downto 0);
	 
    -- Internal variables
	 signal stop_values : std_logic;
    signal index : integer range 0 to 255 := 0;
    signal i        : integer range 0 to 255 := 0;
    signal j        : integer range -1 to 255 := -1;
    signal aux_value      : signed(13 downto 0) := (others => '0');
	 signal aux_sbox       : unsigned(7 downto 0) := (others => '0');
	 signal counter : integer range 0 to 255 := 0;

begin

    -- Output port: read array for verification
--    data_out <= arr(read_idx);
----------------------------------------------
--	comp_lorenz: lorenz generic map (N=>7, M=>7, sigma=>3, b=>1, r=>5, time_step=>6) port map (clk=>clk, load=> start, reset => reset, stop=> stop_values, x_out <= data_in);
	comp_lorenz: lorenz port map (clk=>clk, load=> start, reset => reset, stop=> stop_values, x_out => data_in);
	
----------------------------------------------
	 data_out_test <= data_in;
	 counter_test <= counter;
	
    process(clk, reset, start)
    begin
        if reset = '1' then
            state <= IDLE;
            index <= 0;
            i <= 0;
            j <= -1;
            aux_value <= (others => '0');
				aux_sbox <= (others => '0');
            done_out <= '0';
            values_random <= (others => (others => '0'));
				stop_values <= '0';
				test_out <= '0';

        elsif rising_edge(clk) then
            case state is

                ------------------------------------------------------------------
                when IDLE =>
                    done_out <= '0';
                    index <= 0;
						  stop_values <= '0';
						  counter <= 0;

						if start = '0' then
							state <= LOAD_ARRAY;  -- start bulk load
						else
							state <= IDLE;
                  end if;

                ------------------------------------------------------------------
                when LOAD_ARRAY =>
                    -- Sequentially fill the array from data_in
                    values_random(index) <= data_in;
						  sbox(index) <= to_unsigned(index, 8);
						  stop_values <= '0';

                    if index < 255 then
                        index <= index + 1;
								state <= LOAD_ARRAY;
                    else
                        index <= 0;
								state <= INIT_I;
                    end if;

                ------------------------------------------------------------------
                when INIT_I =>
                    i <= 1;
                    state <= LOAD_AUX;
						  stop_values <= '1';
                ------------------------------------------------------------------
                when LOAD_AUX =>
                    aux_value <= values_random(i);
						  aux_sbox <= sbox(i);
                    j <= i - 1;
						  stop_values <= '1';
                    state <= COMPARE_SHIFT;

                ------------------------------------------------------------------
                when COMPARE_SHIFT =>
                    if (j >= 0) and (values_random(j) > aux_value) then
                        sbox(j + 1) <= sbox(j);
								values_random(j+1) <= values_random(j);
                        if j = 0 then
									 j <= -1;
                            state <= INSERT_AUX;
                        else
                            j <= j - 1;
                            state <= COMPARE_SHIFT;  -- keep shifting
                        end if;
                    else
                        state <= INSERT_AUX;
                    end if;

                ------------------------------------------------------------------
                when INSERT_AUX =>
                    values_random(j + 1) <= aux_value;
						  sbox(j+1) <= aux_sbox;
                    if i < 255 then
                        i <= i + 1;
                        state <= LOAD_AUX;
                    else
                        state <= TEST;
                    end if;

                ------------------------------------------------------------------
               when TEST =>
						test_out <= '1';
						values_out <= values_random(counter);
						sbox_out <= sbox(counter);
						if counter < 255 then
							counter <= counter + 1;
                     state <= TEST;
                  else
							counter <= 0;
                     state <= DONE;
                  end if;
					 ------------------------------------------------------------------
					 when DONE =>
                    done_out <= '1';
                    state <= DONE;
                 

                ------------------------------------------------------------------
                when others =>
                    state <= IDLE;

            end case;
        end if;
    end process;
	 
	 

end rtl;