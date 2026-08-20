library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity controlador is
  port (
	 -----------test-----------
	 send_boton	: in std_logic;
	 reset_test : out std_logic;
	 -----------st_test--------
	 state_o	   : out std_logic_vector(2 downto 0);
	 --------------------------
    clk       		 : in  std_logic;
	 reset 			 : in  std_logic;
    data_valid     : in  std_logic;
	 RX_active		 : in  std_logic;
    data_in		    : in  std_logic_vector(7 downto 0);
	 byte_send		 : in  std_logic;
	 ram_address	 : out integer range 0 to 63;
	 write_ram		 : out std_logic;
	 trigger_send	 : out std_logic

    );
end controlador;
 
 
architecture RTL of controlador is
	

	type state_t is (IDLE, READ_COMAND, FILL_BUFFER, TIMEOUT, SEND_DATA, DONE);
	signal state : state_t := IDLE;
	
   signal index : integer range 0 to 15 := 0;
	signal s_ram_address : integer range 0 to 63 := 0;
	signal top_address	: integer range 0 to 63 := 0;
	
	signal timeout_counter : integer range 0 to 1023:=0;
	
	
	
begin

--	ram_address <= index;
	ram_address <= s_ram_address;
	
	process(clk, data_valid, data_in, reset)
	begin
	
		if reset = '0' then
			state <= IDLE;
			------------------------
			reset_test <= '1';
			------------------------
		elsif rising_edge(clk) then
			reset_test <= '0';		
			case state is
				
				when IDLE =>
					trigger_send <= '0';
--					write_ram <= '0';
					index <= 0;
					timeout_counter <= 0;
					s_ram_address <= 0;
		----------------------------------------			

					if data_valid = '1' then
						state <= reaD_COMAND;
					elsif send_boton = '0' then
						state <= SEND_DATA;
						trigger_send <= '1';
						----------------------
						s_ram_address <= 1;
						----------------------
					else
						state <= IDLE;
					end if;
		----------------------------------------
				when READ_COMAND =>
					if data_in = "11000011" then
						state <= FILL_BUFFER;
					elsif data_in = "10101010" then
						trigger_send <= '1';
						state <= SEND_DATA;
						----------------------
						s_ram_address <= 1;
						----------------------
					else
						state <= IDLE;
					end if;
				
				when FILL_BUFFER =>
					if data_valid = '1' then
--						write_ram <= '1';
						-------------------
						s_ram_address <= s_ram_address + 1;
						-------------------
                  if index = 15 then
							index <= 0;
							state <= TIMEOUT;
                  else
                     index <= index + 1;
							---------------------
--							s_ram_address <= s_ram_address + 1;
							---------------------
							state <= FILL_BUFFER;
                  end if;
					else 
--						write_ram <= '0';
						state <= FILL_BUFFER;
               end if;
					
				when TIMEOUT =>
					if timeout_counter < 1023 then
						timeout_counter <= timeout_counter + 1;
						if RX_active = '0' then
							state <= TIMEOUT;
						else
							state <= FILL_BUFFER;
							timeout_counter <= 0;
						end if;
					else
						state <= DONE;
						top_address <= s_ram_address; -- apunta a la siguinte direccion a la última ocupada
						s_ram_address <= 0;
					end if;
			
					
				when SEND_DATA =>
					if byte_send = '1' then
						if s_ram_address < top_address then
							trigger_send <= '1';
							s_ram_address <= s_ram_address + 1;
							state <= SEND_DATA;
						else
							state <= DONE;
							trigger_send <= '0';
						end if;
					else
						trigger_send <= '0';
						state <= SEND_DATA;
					end if;
					
				when DONE =>
				--------------------------------
					if send_boton = '0' then
						state <= DONE;
					else
						state <= IDLE;
					end if;	
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
				state_o <= "000";
				write_ram <= '0';
			when READ_COMAND =>
				state_o <= "001";
				write_ram <= '0';
			when FILL_BUFFER =>
				if data_valid = '1' then
					write_ram <= '1';
				else
					write_ram <= '0';
				end if;
				state_o <= "010";
			when TIMEOUT =>
				write_ram <= '0';
			when SEND_DATA =>
				write_ram <= '0';
				state_o <= "011";
			when DONE =>
				write_ram <= '0';
				state_o <= "100";
		end case; 
	end process;
	
	
end architecture;