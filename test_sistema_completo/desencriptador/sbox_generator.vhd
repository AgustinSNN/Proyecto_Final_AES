library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sbox_generator is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;                      -- synchronous reset
        start    : in  std_logic;                      
		  data_in  : in  std_logic_vector(23 downto 0);
		  load 	  : out std_logic;   -- le dice a los sistemas caoticos que empiecen a generar datos
        done_out : out std_logic;
		  test_out : out std_logic;
		  counter_out : out std_logic_vector(7 downto 0);	-- direcciones de memoria para llenar la sbox ram 
--		  data_out_test : out signed(13 downto 0);
--		  values_out: out signed(23 downto 0);
		  sbox_out : out std_logic_vector(7 downto 0);
		  
		  --------- DEBUG -----------
		  FLAG_SBOX_GEN : out std_logic

		  
		  --		  load_test : out std_logic

		  -------------test-----------------  señales que vienen del controlador pero pongo acá por ser el top level entity
--		  AES_version : in std_logic_vector(1 downto 0);
--		  generate_sbox : std_logic
    );
end entity;

architecture rtl of sbox_generator is


    -- Array of 256 signed 14-bit elements
    type arr_t_values is array (0 to 255) of signed(23 downto 0);
	 type arr_t_sbox is array (0 to 255) of unsigned(7 downto 0);
    signal values_random : arr_t_values := (others => (others => '0'));
	 signal sbox : arr_t_sbox := (others => (others => '0'));

    -- FSM states
    type state_t is (IDLE, AUX_WAIT, AUX_WAIT_2, LOAD_ARRAY, INIT_I, LOAD_AUX, COMPARE_SHIFT, INSERT_AUX, TEST, DONE);
    signal state : state_t := IDLE;

	 
    -- Internal variables
--	 signal stop_values : std_logic;
    signal index : integer range 0 to 255 := 0;
    signal i        : integer range 0 to 255 := 0;
    signal j        : integer range -1 to 255 := -1;
    signal aux_value      : signed(23 downto 0) := (others => '0');
	 signal aux_sbox       : unsigned(7 downto 0) := (others => '0');
	 signal counter : integer range 0 to 255 := 0;
	

	---------- señales para la expansionde clave,  no importan pero se tienen que conectar a algun lado-----------
--	signal load	: std_logic;
--	signal s_done, s_data_valid : std_logic;
--	signal s_counter_out : integer range 0 to 3;
--	signal s_ram_addr	: integer range 0 to 15;
	
begin

	 counter_out <= std_logic_vector(to_unsigned(counter,8));
		
    process(clk, reset, start)
    begin
        if reset = '0' then
            state <= IDLE;
            index <= 0;
            i <= 0;
            j <= -1;
            aux_value <= (others => '0');
				aux_sbox <= (others => '0');
            done_out <= '0';
            values_random <= (others => (others => '0'));
				test_out <= '0';
				FLAG_SBOX_GEN <= '0';

        elsif rising_edge(clk) then
            case state is

                ------------------------------------------------------------------
                when IDLE =>
                    
                    index <= 0;
						  counter <= 0;

						if start = '1' then
							state <= AUX_WAIT;  -- start bulk load
							load <= '1';
							done_out <= '0';
						else
							state <= IDLE;
							done_out <= '1';
                  end if;

                ------------------------------------------------------------------
					 when AUX_WAIT =>  -- espera a que inicialice el PRNG
						load <= '0';
						state <= AUX_WAIT_2;
						FLAG_SBOX_GEN <= '1';
						
					 when AUX_WAIT_2 =>
						state <= LOAD_ARRAY;
						
                when LOAD_ARRAY =>
                    -- Sequentially fill the array from data_in
                    values_random(index) <= signed(data_in);
						  sbox(index) <= to_unsigned(index, 8);
						  
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

                ------------------------------------------------------------------
                when LOAD_AUX =>
                    aux_value <= values_random(i);
						  aux_sbox <= sbox(i);
                    j <= i - 1;
                    state <= COMPARE_SHIFT;


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
								test_out <= '1';
								sbox_out <= std_logic_vector(sbox(counter));
                    end if;

                ------------------------------------------------------------------
               when TEST =>
--						test_out <= '1';
--						values_out <= values_random(counter);
						sbox_out <= std_logic_vector(sbox(counter+1));
						if counter < 255 then
							counter <= counter + 1;
                     state <= TEST;
							test_out <= '1';
                  else
							counter <= 0;
							test_out <= '0';
--							done_out <= '1';
                     state <= DONE;
                  end if;
					 ------------------------------------------------------------------
					 when DONE =>
                    state <= IDLE;
						  done_out <= '1';
--						  test_out <= '0';
                 
                ------------------------------------------------------------------
                when others =>
                    state <= IDLE;

            end case;
        end if;
    end process;
	 
	 

end rtl;