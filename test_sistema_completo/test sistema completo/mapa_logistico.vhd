library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mapa_logistico is
  generic (
    N : integer := 32  -- número de bits fraccionarios
  );
  port (
    clk     : in  std_logic;
    start   : in  std_logic;              -- cuando =0 carga x_init
	 reset	: in  std_logic;
	 AES_version : in std_logic_vector(1 downto 0);
	 data_in : in std_logic_vector(255 downto 0);
	 generate_sbox : in std_logic;  -- 0 para expansión de clave/ 1 para generar s-box
--	 key_enable	: out std_logic;
	 data_out   : out std_logic_vector(N-1 downto 0); -- salida
	 data_valid : out std_logic;
	 counter_out : out integer range 0 to 3;
	 ram_addr	: out integer range 0 to 15;
	 done_out	: out std_logic
  );
end entity;

architecture rtl of mapa_logistico is
	signal x_reg  : unsigned(N downto 0); -- valor actual (registro)
	signal diff   : unsigned(N-1 downto 0); -- (1 - x)
	signal prod   : unsigned(2*N-1 downto 0); -- 4x*(1-x)
	signal diff_1   : unsigned(N downto 0); -- (1 - x)
	signal x_out_MSB   : unsigned(N-1 downto 0); -- siguiente valor

  constant one : unsigned(N downto 0) := (N => '1', others => '0'); 
  -- 1.0 en Q1.N
  
  
  	type state_t is (IDLE, INIT, GENERATE_VALUES, DONE);
	signal state : state_t := IDLE;
	
	signal round : integer range 0 to 3;
	signal words_x_round : integer range 0 to 128;
	signal counter, counter_2 : integer range 0 to 256;
	signal s_counter_out : integer range 0 to 3;
	signal total_key_words : integer range 0 to 256;
	signal s_ram_addr		: integer range 0 to 15;
	signal s_data_valid : std_logic;
  

  
begin

  -- cálculo combinacional sobre el valor actual
  diff_1 <= one - x_reg;
  diff <= diff_1(N-1 downto 0);
  prod  <= x_reg(N-1 downto 0) * diff;
  
  x_out_MSB  <= prod(2*N-3 downto N-2);--hay q desprecias los dos bits mas significativos y quedarse con los N sguientes

  -- registro con carga de inicialización
--  reg: process(clk,load)
--  begin
--  if rising_edge(clk) then 
--      if load = '0' then
--        x_reg <= '0' & x_init;  -- carga inicial cuando load=0
--      else
--        x_reg <= '0' &  x_out_MSB;    -- siguiente valor del mapa
--      end if;
--end if;
--  end process;

	data_out <= std_logic_vector(x_reg(N-1 downto 0));
  
  	counter_out <= s_counter_out;
	ram_addr <= s_ram_addr;
	data_valid <= s_data_valid;

	process (clk, start, reset)
	begin
		if reset = '0' then
			x_reg <= (others => '0');
			state <= IDLE;
		elsif rising_edge(clk) then
			case state is 
				
				when IDLE =>
					
					round <= 0;
					counter <= 0;
					counter_2 <= 0;
					x_reg <= (others => '0');
					
					s_counter_out <= 3;
					
--					data_valid <= '0';
					s_data_valid <= '0';
					
					
					if start = '1' then
						done_out <= '0';
						state <= INIT;  -- start bulk load
						if generate_sbox = '1' then
--							key_enable <= '0';
							total_key_words <= 256;
							case AES_version is
								when "01" =>
--									max_round <= 1;
									words_x_round <= 64;
								when "10" =>
--									max_round <= 2;
									words_x_round <= 43;
								when "11" =>
--									max_round <= 3;
									words_x_round <= 32;
								when "00" =>
--									max_round <= 1;
									words_x_round <= 64;
							end case;
						else	
--							key_enable <= '1';
							case AES_version is 
								when "01" =>
--									max_round <= 1;
									words_x_round <= 10;
									total_key_words <= 40;
								when "10" =>
--									max_round <= 2;
									words_x_round <= 8;
									total_key_words <= 48;
								when "11" =>
--									max_round <= 3;
									words_x_round <= 7;
									total_key_words <= 56;
								when "00" =>
--									max_round <= 3;
									words_x_round <= 7;
									total_key_words <= 56;
							end case;
						end if;
					else
						state <= IDLE;
						done_out <= '1';
               end if;
					
				when INIT =>
					x_reg <= unsigned('0' & data_in(255-32*round downto 224-32*round));
					
					state <= GENERATE_VALUES;
					
--					data_valid <= '1';
					s_data_valid <= '1';
					s_counter_out <= s_counter_out + 1;
					counter <= counter + 1;
					
				when GENERATE_VALUES =>

					x_reg <= '0' &  x_out_MSB;
					
					s_counter_out <= s_counter_out + 1;
					
					if counter = total_key_words then
						state <= DONE;
--						data_valid <= '0';
						s_data_valid <= '0';
						counter <= 0;
					else	
--						data_valid <= '1';
						s_data_valid <= '1';
						counter <= counter + 1;
						if counter_2 = words_x_round then
							state <= INIT;
							round <= round +1;
							counter_2 <= 0;
						else
							state <= GENERATE_VALUES;
							counter_2 <= counter_2 + 1;
						end if;
					end if;
						
				when DONE =>
					state <= DONE;
					done_out <= '1';
			end case;
		end if;
	end process;
					
	process(clk, s_counter_out, s_data_valid)
	begin
		if s_data_valid = '0' then
			s_ram_addr <= 0;
		elsif rising_edge(clk) and s_counter_out = 3 then
			s_ram_addr <= s_ram_addr + 1;
		end if;
	end process;


end architecture;
