library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lorenz is
  generic (
    N : integer := 7;  -- número de bits enteros
	 M : integer := 25;
	 sigma : integer := 3; -- shift_left = *8
	 b : integer := 1; -- shift_left = *2
	 r : integer := 5; -- shift_left = *32 
	 time_step : integer := 6 -- shift_right = *0.125
  );
  port (
    clk     : in  std_logic;
    start   : in  std_logic;              -- cuando =0 carga x_init
	 reset   : in  std_logic;
	 done_out : out std_logic;
	 AES_version : in std_logic_vector(1 downto 0);
--    x_init  : in  std_logic_vector(N+M-1 downto 0); -- valor inicial
--	 y_init  : in  std_logic_vector(N+M-1 downto 0);
--	 z_init  : in  std_logic_vector(N+M-1 downto 0);
--	 data_in : in std_logic_vector(255 downto 0);
--	 clk_test : out std_logic;
	
	 data_out   : out std_logic_vector(N+M-1 downto 0); -- salida
	 data_valid : out std_logic;
	 counter_out : out integer range 0 to 3;
	 ram_addr	: out integer range 0 to 15
--	 y_out   : out signed(N+M-1 downto 0);
--  z_out   : out signed(N+M-1 downto 0)  
  );
end entity;

architecture behave of lorenz is

--	component clk_div is
--		port	(	clk: in  std_logic ;
--				clkOut	: out std_logic
--		);
--	end component;
	
	type state_t is (IDLE, INIT, GENERATE_VALUES, DONE);
	signal state : state_t := IDLE;
	
--	constant x_init : signed (N+M-1 downto 0) := "00010100000000";
--	constant y_init : signed (N+M-1 downto 0) := "11101100000000";
--	constant z_init : signed (N+M-1 downto 0) := "00100000000000";
	
--	signal clk_2 :std_logic;
	
	signal x_reg  : signed(N+M-1 downto 0); -- valor actual (registro)
	signal y_reg  : signed(N+M-1 downto 0); -- valor actual (registro)
	signal z_reg  : signed(N+M-1 downto 0); -- valor actual (registro)
	
	signal x_aux : signed(2*(N+M)-1 downto 0); -- asumo que no hay overflow
	signal y_aux : signed(2*(N+M)+1 downto 0); 
	signal z_aux : signed(2*(N+M) downto 0); 
	
	signal x_aux_shifted : signed(2*(N+M)-1 downto 0); -- asumo que no hay overflow
	signal y_aux_shifted : signed(2*(N+M)+1 downto 0); 
	signal z_aux_shifted : signed(2*(N+M) downto 0); 
	
	signal x_reg_resized  : signed(2*(N+M)-1 downto 0); 
	signal y_reg_resized  : signed(2*(N+M)+1 downto 0); 
	signal z_reg_resized  : signed(2*(N+M) downto 0); 
	
	signal resta_yx : signed (2*(N+M)-1 downto 0);
	signal prod_xz : signed (2*(N+M)-1 downto 0);
	signal prod_xy : signed (2*(N+M)-1 downto 0); 
	
	signal prod_zb : signed (2*(N+M) downto 0);
	signal prod_xr : signed (2*(N+M)+1 downto 0);
	--signal prod_xy_resized : signed (N-1 downto 0);
	--signal prod_xz_resized : signed (N-1 downto 0);
	
--	type data_vector is array (0 to 3) of std_logic_vector(63 downto 0);
--	signal key : data_vector;
	
	signal round, max_round : integer range 0 to 3;
	signal words_x_round : integer range 0 to 20;
	signal counter, counter_2 : integer range 0 to 256;
	signal s_counter_out : integer range 0 to 3;
	signal total_key_words : integer range 0 to 56;
	signal s_ram_addr		: integer range 0 to 15;
	signal s_data_valid : std_logic;
	
	constant data_in : std_logic_vector(255 downto 0):= X"000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f";
	
begin

--	--------clock----------
--	clock: clk_div port map (clk => clk, clkOut => clk_2);
--	clk_test <= clk_2;
--	-----------------------
	
	resta_yx <= resize(y_reg, 2*(N+M)) - resize(x_reg, 2*(N+M));
	x_aux <= resta_yx(2*(N+M)-1) & shift_left(resta_yx(2*(N+M)-2 downto 0), sigma);
	
	prod_xz <= x_reg * z_reg;
	prod_xr <= shift_left(resize(x_reg, 2*(N+M)+2), r+M);
	--prod_xz_resized <= resize(shift_right(prod_xz,N/2),N);
	y_aux <= prod_xr - resize(prod_xz, 2*(N+M)+2) - shift_left(resize(y_reg, 2*(N+M)+2),M);
	
	prod_xy <= x_reg * y_reg;
	--prod_xy_resized <= resize(shift_right(prod_xy,N/2),N);
	prod_zb <= shift_left(resize(z_reg, 2*(N+M)+1), b+M);
	z_aux <= resize(prod_xy, 2*(N+M)+1) - prod_zb;
	
	x_reg_resized <= resize(x_reg, 2*(N+M));
	y_reg_resized <= shift_left(resize(y_reg, 2*(N+M)+2), M);
	z_reg_resized <= shift_left(resize(z_reg, 2*(N+M)+1), M);
	
	x_aux_shifted <= shift_right(x_aux, time_step);
	y_aux_shifted <= shift_right(y_aux, time_step);
	z_aux_shifted <= shift_right(z_aux, time_step);
	
	-- salidas
	data_out <= std_logic_vector(x_reg) xor std_logic_vector(y_reg) xor std_logic_vector(z_reg);
--	y_out <= y_reg;
--	z_out <= z_reg;
	
--	process (clk, load)
--	begin
--		if rising_edge(clk) then 
--			if load = '0' then
--				x_reg <= x_init;  -- carga inicial cuando load=0
--				y_reg <= y_init;
--				z_reg <= z_init;
--			else
--				x_reg <= resize(x_reg_resized + x_aux_shifted, N+M);	-- siguiente valor de la variable
--				y_reg <= resize(shift_right(y_reg_resized + y_aux_shifted , M), N+M);
--				z_reg <= resize(shift_right(z_reg_resized + z_aux_shifted , M), N+M);
--				
--			end if;
--		end if;
--  end process; 

--	key(0) <= data_in(255 downto 192);
--	key(1) <= data_in(191 downto 128);
--	key(2) <= data_in(127 downto 64);
--	key(3) <= data_in(63 downto 0);
	
	counter_out <= s_counter_out;
	ram_addr <= s_ram_addr;
	
	process (clk, start, reset)
	begin
		if reset = '0' then
			x_reg <= (others => '0');
			y_reg <= (others => '0');
			z_reg <= (others => '0');
			state <= IDLE;
		elsif rising_edge(clk) then
			case state is 
				
				when IDLE =>
					
					round <= 0;
					counter <= 0;
					x_reg <= (others => '0');
					y_reg <= (others => '0');
					z_reg <= (others => '0');
					s_counter_out <= 3;
					
					data_valid <= '0';
					s_data_valid <= '0';
					
					if start = '1' then
						done_out <= '0';
						state <= INIT;  -- start bulk load
						case AES_version is 
							when "00" =>
								max_round <= 1;
								words_x_round <= 20;
								total_key_words <= 40;
							when "01" =>
								max_round <= 2;
								words_x_round <= 16;
								total_key_words <= 48;
							when "10" =>
								max_round <= 3;
								words_x_round <= 13;
								total_key_words <= 56;
							when "11" =>
								max_round <= 3;
								words_x_round <= 13;
								total_key_words <= 56;
						end case;
					else
						state <= IDLE;
               end if;
					
				when INIT =>
					x_reg <= signed("00" & data_in(255-64*round downto 236-64*round) & "0000000000") - 16;
					y_reg <= signed("00" & data_in(235-64*round downto 216-64*round) & "0000000000") - 16;
					z_reg <= signed("00" & data_in(215-64*round downto 192-64*round) & "000000");

					state <= GENERATE_VALUES;
					
					data_valid <= '1';
					s_data_valid <= '1';
					s_counter_out <= s_counter_out + 1;
					counter <= counter + 1;
					
				when GENERATE_VALUES =>
					x_reg <= resize(x_reg_resized + x_aux_shifted, N+M);	-- siguiente valor de la variable
					y_reg <= resize(shift_right(y_reg_resized + y_aux_shifted , M), N+M);
					z_reg <= resize(shift_right(z_reg_resized + z_aux_shifted , M), N+M);
					
					s_counter_out <= s_counter_out + 1;
					
					if counter = total_key_words then
						state <= DONE;
						data_valid <= '0';
						s_data_valid <= '0';
						counter <= 0;
					else	
						data_valid <= '1';
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
  ---------------------------------------------------------------
