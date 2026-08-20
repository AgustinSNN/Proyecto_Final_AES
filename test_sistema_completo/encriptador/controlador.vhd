library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity controlador is
  port (
    clk       		 : in  std_logic;
	 reset 			 : in  std_logic;
	 ---------UART--------------
    data_valid     : in  std_logic;
	 RX_active		 : in  std_logic;
    data_in		    : in  std_logic_vector(7 downto 0);
	 byte_send		 : in  std_logic;
	 trigger_send	 : out std_logic;
	 ----------control-------------------
	 enable_key_version : out std_logic_vector(5 downto 0);
	 AES_version_out	  : out std_logic_vector(1 downto 0);
	 sel_block		  : out std_logic_vector(2 downto 0);
	 start_cypher	 : out std_logic;
	 start_key_expance : out std_logic;
	 done_cypher	 : in std_logic;
	 done_key		 : in std_logic;
	 done_sbox		 : in std_logic;
	 write_data_reg : out std_logic;
	 write_key_reg  : out std_logic;
	 data_reg_add   : out integer range 0 to 15;
	 key_reg_add	 : out integer range 0 to 31;
	 out_block_index	 : out integer range 0 to 15;
	 block_counter  : out integer range 0 to 16383;
	 key_round		 : out integer range 0 to 15;
	 sel_data_out	 : out std_logic_vector(1 downto 0);
	 sel_uart_TX	 : out std_logic;
	 enable_sbox_read : out std_logic;
	 sbox_counter_out : out std_logic_vector(7 downto 0);
	 generate_sbox	 : out std_logic;
	 sel_sbox		 : out std_logic;
	 sel_sbox_generator : out std_logic_vector(1 downto 0);
	 sel_sbox_addr	: out std_logic_vector(2 downto 0);
	 start_sbox_generator : out std_logic;
	 enable_sbox_generator : out std_logic_vector(3 downto 0);
	 ---------- DEBUG --------------
	 state_out : out std_logic_vector(3 downto 0);
	 FLAG_KEY_READY, FLAG_DATA_READY, FLAG_SEND, FLAG_INVALID_DATA   : out std_logic
--	 write_ram		 : out std_logic
	 ----------TEST------------
--	 ciphertext		 : in std_logic_vector(127 downto 0) 

    );
end controlador;
 
 
architecture RTL of controlador is
	

	type state_t is (IDLE, READ_COMAND, FILL_KEY_REGISTER, FILL_DATA_REGISTER, COMPUTING_AUX, COMPUTING, TIMEOUT, SEND_DATA, SEND_KEY, SEND_KEY_EXPANSE, SEND_DATA_AUX, SEND_KEY_AUX, SEND_SBOX, SEND_SBOX_AUX, DONE);
	signal state : state_t := IDLE;
	
	signal AES_version : std_logic_vector(1 downto 0);
	
	signal key_size : integer range 0 to 31;
	signal s_key_register_add : integer range 0 to 31;
	signal top_key_address : integer range 0 to 15;
	
	signal index : integer range 0 to 16 := 0;
	signal s_data_add : integer range 0 to 15 := 0;

	-- para controlar los datos de salida (TX)
--	signal s_ram_address : integer range 0 to 63 := 0;
--	signal top_address	: integer range 0 to 63 := 0;
	
	signal timeout_counter : integer range 0 to 1023:=0;
	signal s_block_counter, top_address : integer range 0 to 16384 := 0;
	
	signal sbox_counter : integer range 0 to 255;
	
	signal s_key_round : integer range 0 to 15;
	
	
begin


--	ram_address <= s_ram_address;
	out_block_index <= index;
	key_reg_add <= s_key_register_add;
	data_reg_add <= s_data_add;
	AES_version_out <= AES_version;
	
	block_counter <= s_block_counter - 1;
	
	key_round <= s_key_round;
	
	sbox_counter_out <= std_logic_vector(to_unsigned(sbox_counter, 8));
	
	process(clk, data_valid, data_in, reset)
	begin
	
		if reset = '0' then
			state <= IDLE;
			FLAG_DATA_READY <= '0';
			FLAG_KEY_READY <= '0';
			FLAG_SEND <= '0';
			------------------------
--			reset_test <= '1';
			------------------------
		elsif rising_edge(clk) then
--			reset_test <= '0';		
			case state is
				
				when IDLE =>
					enable_key_version <= "000000";
					start_cypher <= '0';
					start_key_expance <= '0';
					trigger_send <= '0';
					index <= 0;
					sbox_counter <= 0;
					timeout_counter <= 0;
					enable_sbox_read <= '0';
--					s_ram_address <= 0;
		----------------------------------------
--					s_block_counter <= 0;
		----------------------------------------			
					if data_valid = '1' then
						state <= READ_COMAND;
					else
						state <= IDLE;
					end if;
		----------------------------------------
--				when READ_COMAND =>
--					case data_in is
--						when "11000000" =>
--							key_size <= 15;
--							top_key_address <= 9;
--							state <= FILL_KEY_REGISTER;
--							AES_version <= "01";
--							enable_key_version <= "001";
--							sel_block <= "000";
--						when "11000001" =>
--							state <= FILL_KEY_REGISTER;
--							key_size <= 23;
--							top_key_address <= 11;
--							AES_version <= "10";
--							enable_key_version <= "010";
--							sel_block <= "001";
--						when "11000010" =>
--							state <= FILL_KEY_REGISTER;
--							key_size <= 31;
--							top_key_address <= 13;
--							AES_version <= "11";
--							enable_key_version <= "100";
--							sel_block <= "010";
--						when "11000011" =>
--							state <= FILL_DATA_REGISTER;
--							sel_block <= "011";
--							s_block_counter <= 0;
--						when "10101010" =>
--							state <= SEND_DATA_AUX;
--							sel_data_out <= "00";
--						when "01010101" =>
--							state <= SEND_KEY_AUX;
--							sel_data_out <= "01";
--							sel_block <= "100";						
--						when others =>
--							state <= IDLE;
--					end case;
				when READ_COMAND =>
					case data_in(7 downto 4) is
						
						when "0000" =>  -- recibo clave
							state <= FILL_KEY_REGISTER;
								if data_in(3 downto 0)= "0001" then
									key_size <= 15;
									AES_version <= "01";
									top_key_address <= 9;
								elsif data_in(3 downto 0)= "0010" then
									key_size <= 23;
									AES_version <= "10";
									top_key_address <= 11;
								elsif data_in(3 downto 0)= "0011" then
									key_size <= 31;
									AES_version <= "11";
									top_key_address <= 13;
								else	
									state <= IDLE;
									FLAG_INVALID_DATA <= '1';
								end if;
						
						when "0001" => -- selecciono sbox
							if data_in(3 downto 0) = "0001" then
								-------------------------
--								if data_in(3 downto 0) = "0000" then									
--								-------------------------
--									sel_sbox <= '0';
--									state <= IDLE;
--									FLAG_INVALID_DATA <= '0';
--								else
--									state <= IDLE;
--									FLAG_INVALID_DATA <= '1';
--								end if;
								-------------------------
								sel_sbox <= '0';
								state <= IDLE;
								FLAG_INVALID_DATA <= '0';			
							else 
								state <= COMPUTING_AUX;
								FLAG_INVALID_DATA <= '0';
								sel_sbox <= '1';
								generate_sbox <= '1';
								start_sbox_generator <= '1';
								sel_sbox_addr <= "100"; -- selecciono el contador que viene del generador de sbox
								case data_in(3 downto 0) is -- quedan 2 bits libres para agregar bloques 
									when "0010" => -- mapa logistico
										sel_sbox_generator <= "00";
										enable_sbox_generator <= "0001";
									when "0011" => -- lorenz 
										sel_sbox_generator <= "10";
										enable_sbox_generator <= "0100";
									when "0100" => -- rossler
										sel_sbox_generator <= "11";
										enable_sbox_generator <= "1000";	
									when others => -- por default elije mapa logistico
										sel_sbox_generator <= "00";
										enable_sbox_generator <= "0001"; 
								end case;
							end if;
							
						
						when "0010" => -- selecciono expansor de clave
							start_key_expance <= '1';
							generate_sbox <= '0';
							state <= COMPUTING_AUX;
							case data_in(3 downto 0) is
								when "0000" =>
									if AES_version = "01" then
										sel_block <= "000"; -- AES 128
										sel_sbox_addr <= "000";
										enable_key_version <= std_logic_vector(to_unsigned(1, 6));
									elsif AES_version = "10" then
										sel_block <= "001"; -- AES 192
										sel_sbox_addr <= "001";
										enable_key_version <= std_logic_vector(to_unsigned(2, 6));
									elsif AES_version = "11" then
										sel_block <= "010"; -- AES 256
										sel_sbox_addr <= "010";
										enable_key_version <= std_logic_vector(to_unsigned(4, 6));
									else
										sel_block <= "010"; -- AES 256
										sel_sbox_addr <= "010";
										enable_key_version <= std_logic_vector(to_unsigned(4, 6));
									end if;
									
--									sel_block <= "000"; -- AES 128
--									sel_sbox_addr <= "000";
--									enable_key_version <= std_logic_vector(to_unsigned(1, 6));
--								when "001" =>
--									sel_block <= "001"; -- AES 192
--									sel_sbox_addr <= "001";
--									enable_key_version <= std_logic_vector(to_unsigned(2, 6));
--								when "010" =>	
--									sel_block <= "010"; -- AES 256
--									sel_sbox_addr <= "010";
--									enable_key_version <= std_logic_vector(to_unsigned(4, 6));
								when "0001" =>	
									sel_block <= "011"; -- mapa logistico
									enable_key_version <= std_logic_vector(to_unsigned(8, 6));
								when "0010" =>	
									sel_block <= "100"; -- lorenz
									enable_key_version <= std_logic_vector(to_unsigned(16, 6));
								when "0011" =>	
									sel_block <= "101"; -- rossler
									enable_key_version <= std_logic_vector(to_unsigned(32, 6));
								when others =>
									sel_block <= "000"; -- default AES 128
									enable_key_version <= std_logic_vector(to_unsigned(1, 6));
								end case;							
							
						when "0011" => -- recibo datos y encripto
							if data_in(3 downto 0) = "0000" then
								state <= FILL_DATA_REGISTER;
								s_block_counter <= 0;
								sel_block <= "110";
								FLAG_INVALID_DATA <= '0';
							else
								state <= IDLE;
								FLAG_INVALID_DATA <= '1';
							end if;
												
						when "1000" => -- leo datos
							if data_in(3 downto 0) = "0000" then
								state <= SEND_DATA_AUX;
								sel_data_out <= "00";
								sel_uart_TX <= '0';
								FLAG_INVALID_DATA <= '0';
							else
								state <= IDLE;
								FLAG_INVALID_DATA <= '1';
							end if;
							
						when "0101" => -- leo clave
							if data_in(3 downto 0) = "0000" then
								state <= SEND_KEY_AUX;
								sel_data_out <= "01";
								sel_block <= "111";
								sel_uart_TX <= '0';
								FLAG_INVALID_DATA <= '0';
							else
								state <= IDLE;
								FLAG_INVALID_DATA <= '1';
							end if;
								
						when "0110" => -- leo SBOx
							if data_in(3 downto 0) = "0000" then
								state <= SEND_SBOX_AUX;
								sel_uart_TX <= '1';
								enable_sbox_read <= '1';
								sel_sbox_addr <= "111";
								FLAG_INVALID_DATA <= '0';
							else
								state <= IDLE;
								FLAG_INVALID_DATA <= '1';
							end if;
						
						when others =>
							state <= IDLE;
							FLAG_INVALID_DATA <= '1';
					end case;
				
				
				when FILL_KEY_REGISTER =>
					FLAG_KEY_READY <= '1';
					if data_valid = '1' then
                  if s_key_register_add = key_size then
							s_key_register_add <= 0;
--							start_key_expance <= '1';
							state <= IDLE;
                  else
                     s_key_register_add <= s_key_register_add + 1;
							state <= FILL_KEY_REGISTER;
                  end if;
					else 
						state <= FILL_KEY_REGISTER;
               end if;
							
				when FILL_DATA_REGISTER =>
					FLAG_DATA_READY <= '1';
					sel_sbox_addr <= "011";
					if data_valid = '1' then
--						s_data_add <= s_data_add + 1;
                  if s_data_add = 15 then
							s_data_add <= 0;
							state <= TIMEOUT;
							start_cypher <= '1';
							---------------------------------------
							s_block_counter <= s_block_counter + 1;
							---------------------------------------
                  else
                     s_data_add <= s_data_add + 1;
							state <= FILL_DATA_REGISTER;
                  end if;
					else 
						state <= FILL_DATA_REGISTER;
               end if;
					
				when COMPUTING_AUX =>
--					start_sbox_generator <= '0';
					start_key_expance <= '0';
					state <= COMPUTING;
				
				when COMPUTING =>
					start_sbox_generator <= '0';
--					start_key_expance <= '0';
					if done_cypher = '1' and done_key = '1' and done_sbox = '1' then
						state <= IDLE;
					else 
						state <= COMPUTING;
					end if;
					
				when TIMEOUT =>
					start_cypher <= '0';
					if timeout_counter < 1023 then
						timeout_counter <= timeout_counter + 1;
						if RX_active = '0' then
							state <= TIMEOUT;
						else
							state <= FILL_DATA_REGISTER;
							timeout_counter <= 0;
--							s_block_counter <= s_block_counter + 1;
						end if;
					else
						state <= COMPUTING;
						top_address <= s_block_counter; -- apunta a la siguiente direccion disponible
						s_block_counter <= 1;
					end if;			
					
--				when INIT_SEND =>
--					trigger_send <= '1';
--					state <= SEND_DATA;
--					index <= 1;
					
				when SEND_DATA_AUX =>
					trigger_send <= '1';
					state <= SEND_DATA;
					index <= 1;
					
				when SEND_KEY_AUX =>
					trigger_send <= '1';
					state <= SEND_KEY;
					index <= 1;
					
				when SEND_SBOX_AUX =>
					trigger_send <= '1';
					state <= SEND_SBOX;
					sbox_counter <= 1;
				
					
				when SEND_DATA =>
					FLAG_SEND <='1';
					if byte_send = '1' then
						if index < 15 then
							trigger_send <= '1';
							index <= index + 1;
							state <= SEND_DATA;
						else 
							index <= 0;
							if s_block_counter = top_address then
								trigger_send <= '1';
								state <= DONE;
								----------------------------------
								s_block_counter <= 1;
--								top_address <= 1;
								----------------------------------
							else
								trigger_send <= '1';
								s_block_counter <= s_block_counter + 1;
								state <= SEND_DATA;
							end if;
						end if;
					else
						trigger_send <= '0';
						state <= SEND_DATA;
					end if;
				
				when SEND_KEY =>
					if byte_send = '1' then
						if index < 15 then
							trigger_send <= '1';
							index <= index + 1;
							state <= SEND_KEY;
						else
							state <= SEND_KEY_EXPANSE;
							sel_data_out <= "10";
							trigger_send <= '1';
							index <= 0;
							s_key_round <= 0;
						end if;
					else
						trigger_send <= '0';
						state <= SEND_KEY;
					end if;
					
				when SEND_KEY_EXPANSE =>
					if byte_send = '1' then
						if index < 15 then
							trigger_send <= '1';
							index <= index + 1;
							state <= SEND_KEY_EXPANSE;
						else 
							index <= 0;
							if s_key_round = top_key_address then
								trigger_send <= '1';
								state <= DONE;
								----------------------------------
								s_key_round <= 1;
--								top_address <= 1;
								----------------------------------
							else
								trigger_send <= '1';
								s_key_round <= s_key_round + 1;
								state <= SEND_KEY_EXPANSE;
							end if;
						end if;
					else
						trigger_send <= '0';
						state <= SEND_KEY_EXPANSE;
					end if;
					
					
				when SEND_SBOX =>
					if byte_send = '1' then
						if sbox_counter < 255 then
							trigger_send <= '1';
							sbox_counter <= sbox_counter + 1;
							state <= SEND_SBOX;
						else
							trigger_send <= '1';
							state <= DONE;
							sbox_counter <= 0;
						end if;
					else
						trigger_send <= '0';
						state <= SEND_SBOX;
					end if;					
						
				when DONE =>
				--------------------------------
--					if send_boton = '0' then
--						state <= DONE;
--					else
--						state <= IDLE;
--					end if;	
				--------------------------------		
					
--					write_ram <= '0';
--					s_ram_address <= 0;
					trigger_send <= '0';
					state <= IDLE;
					
			end case;
		end if;
	end process;
	
	process(state, data_valid)
	begin
		case state is
				
			when IDLE =>
				write_data_reg <= '0';
				write_key_reg <= '0';
--				write_ram <= '0';
				state_out <= "0000";
			when READ_COMAND =>
				write_data_reg <= '0';
				write_key_reg <= '0';
--				write_ram <= '0';
				state_out <= "0001";
			when FILL_KEY_REGISTER =>
--				write_ram <= '0';
				state_out <= "0010";
				write_data_reg <= '0';
				if data_valid = '1' then
					write_key_reg <= '1';
				else
					write_key_reg <= '0';
				end if;
			when FILL_DATA_REGISTER =>
				state_out <= "0011";
				write_key_reg <= '0';
				if data_valid = '1' then
					write_data_reg <= '1';
				else
					write_data_reg <= '0';
				end if;
			when TIMEOUT =>
				state_out <= "0100";
				write_data_reg <= '0';
				write_key_reg <= '0';
--				write_ram <= '0';
			when COMPUTING_AUX =>
				state_out <= "0101";
				write_data_reg <= '0';
				write_key_reg <= '0';
			when COMPUTING =>
				state_out <= "0101";
				write_data_reg <= '0';
				write_key_reg <= '0';
--				write_ram <= '0';
--			when INIT_SEND =>
--				state_out <= "110";
--				write_data_reg <= '0';
--				write_key_reg <= '0';
			when SEND_DATA_AUX =>
				state_out <= "0110";
				write_data_reg <= '0';
				write_key_reg <= '0';
			when SEND_KEY_AUX =>
				state_out <= "0110";
				write_data_reg <= '0';
				write_key_reg <= '0';						
			when SEND_DATA =>
				state_out <= "0110";
				write_data_reg <= '0';
				write_key_reg <= '0';
--				write_ram <= '0';
			when SEND_KEY =>
				state_out <= "0111";
				write_data_reg <= '0';
				write_key_reg <= '0';
			when SEND_KEY_EXPANSE =>
				state_out <= "1000";
				write_data_reg <= '0';
				write_key_reg <= '0';
			when SEND_SBOX_AUX =>
				state_out <= "1001";
				write_data_reg <= '0';
				write_key_reg <= '0';
			when SEND_SBOX =>
				state_out <= "1010";
				write_data_reg <= '0';
				write_key_reg <= '0';
			when DONE =>
				state_out <= "1011";
				write_data_reg <= '0';
				write_key_reg <= '0';
--				write_ram <= '0';
		end case; 
	end process;
	
	
end architecture;