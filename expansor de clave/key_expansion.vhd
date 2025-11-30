library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity key_expansion is
  Port (
        clk, reset  : in  std_logic;
		  --TEST--
		  key_word	  : out std_logic_vector(31 downto 0);
		  rcon_out	  : out std_logic_vector(31 downto 0);
		  aux_out	  : out std_logic_vector(31 downto 0);
		  state_out   : out std_logic_vector(2 downto 0);
		  counter_out : out integer range 0 to 3
    );
end key_expansion;


architecture behave of key_expansion is

component sbox_rom is
    Port (
        addr    : in  std_logic_vector(7 downto 0);  -- 8-bit input address
        q: out std_logic_vector(7 downto 0)   -- 8-bit output from S-Box
    );
end component;

component word_register is
  Port (
         clk, e     : in  std_logic;
			in0, in1, in2, in3 : in std_logic_vector (7 downto 0);
			out0, out1, out2, out3 : out std_logic_vector (7 downto 0)
    );
end component;

component byte_register is
  Port (
        clk, enable : in  std_logic;
		  data_in	  : in std_logic_vector(7 downto 0);
		  data_out	  : out std_logic_vector(7 downto 0)
    );
end component;

component mux2to1_32 is
    Port (
        sel  : in  std_logic;  
        d0   : in  STD_LOGIC_VECTOR(31 downto 0);
        d1   : in  STD_LOGIC_VECTOR(31 downto 0);
		  y    : out std_logic_vector(31 downto 0)
		);
end component;

component mux4to1_8 is
    Port (
        sel  : in  std_logic_vector (1 downto 0);   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(7 downto 0);
        d1   : in  STD_LOGIC_VECTOR(7 downto 0);
		  d2   : in  STD_LOGIC_VECTOR(7 downto 0);
		  d3   : in  STD_LOGIC_VECTOR(7 downto 0);
		  y    : out std_logic_vector(7 downto 0)
		);
end component;

component demux1to4 is
    Port (
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        sel      : in  std_logic_vector(1 downto 0);
        out0     : out STD_LOGIC_VECTOR(7 downto 0);
        out1     : out STD_LOGIC_VECTOR(7 downto 0);
        out2     : out STD_LOGIC_VECTOR(7 downto 0);
        out3    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

	type state_type is (start, idle, shift_words, sub_bytes_0, sub_bytes_1, sub_bytes_2, sub_bytes_3, end_round);
	signal state   : state_type;
	
	type word is array (3 downto 0) of std_logic_vector (7 downto 0);
	signal w0, w1, w2, w3, w_aux, out_mux0, out_mux1, out_mux2, out_mux3, w_aux_in, rcon: word;
	
	signal out_mux_aux : std_logic_vector (31 downto 0);
	
	signal word_enable, sel_mux, sel_mux_aux, aux_enable_0, aux_enable_1, aux_enable_2 ,aux_enable_3 : std_logic;
	signal counter : integer range 0 to 3;
	signal round : integer range 0 to 10;
	
	signal sel_addr : std_logic_vector(1 downto 0);
	signal addr_sbox, sbox_out : std_logic_vector (7 downto 0);

	constant key : std_logic_vector (127 downto 0):= X"2b7e151628aed2a6abf7158809cf4f3c";
	
begin
	------------------------------------------------------------------
	-----------TEST
	key_word <= w3(3) & w3(2) & w3(1) & w3(0);
	rcon_out <= rcon(3) & rcon(2) & rcon(1) & rcon(0);
	counter_out <= counter;
	aux_out <= w_aux(3) & w_aux(2) & w_aux(1) & w_aux(0);
	------------------------------------------------------------------
	process (clk, reset)
	begin
		if reset = '1' then
			state <= start;
		elsif (rising_edge(clk)) then
			case state is
				when idle=>
					state <= idle;
					counter <= 0;
					round <= 0;
				when start=>
					state <= sub_bytes_0;
					counter <= 1;
					round <= 0;
					rcon(0)<= X"00";
					rcon(1)<= X"00";
					rcon(2)<= X"00";
					rcon(3)<= X"00";
				when shift_words=>
					counter <= counter + 1;
					if counter = 2 then
						if round =10 then
							state <= idle;
						else
							state <= shift_words;
						end if;
					elsif counter = 3 then
						state <= sub_bytes_0;
					else
						state <= shift_words;
					end if;
				when sub_bytes_0=>
					state <= sub_bytes_1;
					counter <= 1;
					round <= round + 1;
					if round = 0 then
						rcon(3) <= X"01";
					elsif round = 8 then
						rcon(3)<= X"1B";
					else
						rcon(3) <= std_logic_vector(shift_left(unsigned(rcon(3)), 1));
					end if;
				when sub_bytes_1=>
					state <= sub_bytes_2;
				when sub_bytes_2=>
					state <= sub_bytes_3;
				when sub_bytes_3=>		
					state <= end_round;
				when end_round =>
					state <= shift_words;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state, counter, round, rcon)
	begin
		case state is
			when start =>
				aux_enable_0 <= '0'; aux_enable_1 <= '0'; aux_enable_2 <= '0'; aux_enable_3 <= '0';
				state_out <= "001";
				sel_mux <= '0';
				word_enable <= '1';
				sel_mux_aux <= '0';
				sel_addr <= "00";
			when idle =>
				aux_enable_0 <= '0'; aux_enable_1 <= '0'; aux_enable_2 <= '0'; aux_enable_3 <= '0';
				state_out <= "000";
				sel_mux <= '0';
				word_enable <= '0';
				sel_mux_aux <= '0';
				sel_addr <= "00";
			when shift_words =>
				aux_enable_0 <= '0'; aux_enable_1 <= '0'; aux_enable_2 <= '0'; aux_enable_3 <= '0';
				state_out <= "010";
				sel_mux <= '1';
				word_enable <= '1';
				sel_mux_aux <= '0';
				sel_addr <= "00";
			when sub_bytes_0 =>
				aux_enable_0 <= '1'; aux_enable_1 <= '0'; aux_enable_2 <= '0'; aux_enable_3 <= '0';
				state_out <= "011";
				sel_mux <= '1';
				word_enable <= '0';
				sel_addr <= "00";
				sel_mux_aux <= '1';
			when sub_bytes_1 =>
				aux_enable_0 <= '0'; aux_enable_1 <= '1'; aux_enable_2 <= '0'; aux_enable_3 <= '0';
				state_out <= "100";
				sel_mux <= '1';
				word_enable <= '0';
				sel_addr <= "01";
				sel_mux_aux <= '1';
			when sub_bytes_2 =>
				aux_enable_0 <= '0'; aux_enable_1 <= '0'; aux_enable_2 <= '1'; aux_enable_3 <= '0';
				state_out <= "101";
				sel_mux <= '1';
				word_enable <= '0';
				sel_addr <= "10";
				sel_mux_aux <= '1';
			when sub_bytes_3 =>
				aux_enable_0 <= '0'; aux_enable_1 <= '0'; aux_enable_2 <= '0'; aux_enable_3 <= '1';
				state_out <= "110";
				sel_mux <= '1';
				word_enable <= '0';
				sel_addr <= "11";
				sel_mux_aux <= '1';
			when end_round =>
				aux_enable_0 <= '0'; aux_enable_1 <= '0'; aux_enable_2 <= '0'; aux_enable_3 <= '0';
				state_out <= "111";
				sel_mux <= '1';
				word_enable <= '1';
				sel_addr <= "00";
				sel_mux_aux <= '1';
		end case;
	end process;
	

word_0: word_register port map (clk => clk, e=>word_enable, out0=>w0(0), out1=>w0(1), out2=>w0(2), out3=>w0(3), in0=>out_mux0(0), in1=>out_mux0(1), in2=>out_mux0(2), in3=>out_mux0(3));
word_1: word_register port map (clk => clk, e=>word_enable, out0=>w1(0), out1=>w1(1), out2=>w1(2), out3=>w1(3), in0=>out_mux1(0), in1=>out_mux1(1), in2=>out_mux1(2), in3=>out_mux1(3));
word_2: word_register port map (clk => clk, e=>word_enable, out0=>w2(0), out1=>w2(1), out2=>w2(2), out3=>w2(3), in0=>out_mux2(0), in1=>out_mux2(1), in2=>out_mux2(2), in3=>out_mux2(3));
word_3: word_register port map (clk => clk, e=>word_enable, out0=>w3(0), out1=>w3(1), out2=>w3(2), out3=>w3(3), in0=>out_mux3(0), in1=>out_mux3(1), in2=>out_mux3(2), in3=>out_mux3(3));


mux_w0: mux2to1_32 port map (sel=>sel_mux, d0=>key(127 downto 96), d1=>w1(3) & w1(2) & w1(1) & w1(0), y(31 downto 24)=>out_mux0(3), y(23 downto 16)=>out_mux0(2), y(15 downto 8)=>out_mux0(1), y(7 downto 0)=>out_mux0(0));
mux_w1: mux2to1_32 port map (sel=>sel_mux, d0=>key(95 downto 64), d1=>w2(3) & w2(2) & w2(1) & w2(0), y(31 downto 24)=>out_mux1(3), y(23 downto 16)=>out_mux1(2), y(15 downto 8)=>out_mux1(1), y(7 downto 0)=>out_mux1(0));
mux_w2: mux2to1_32 port map (sel=>sel_mux, d0=>key(63 downto 32), d1=>w3(3) & w3(2) & w3(1) & w3(0), y(31 downto 24)=>out_mux2(3), y(23 downto 16)=>out_mux2(2), y(15 downto 8)=>out_mux2(1), y(7 downto 0)=>out_mux2(0));
mux_w3: mux2to1_32 port map (sel=>sel_mux, d0=>key(31 downto 0), d1=>out_mux_aux, y(31 downto 24)=>out_mux3(3), y(23 downto 16)=>out_mux3(2), y(15 downto 8)=>out_mux3(1), y(7 downto 0)=>out_mux3(0));

mux_aux: mux2to1_32 port map (sel=>sel_mux_aux, d0=>(w3(3) xor w0(3)) & (w3(2) xor w0(2)) & (w3(1) xor w0(1)) & (w3(0) xor w0(0)), d1=> (w_aux(3) xor rcon(3) xor w0(3)) & (w_aux(2) xor rcon(2) xor w0(2)) & (w_aux(1) xor rcon(1) xor w0(1)) & (w_aux(0) xor rcon(0) xor w0(0)), y=> out_mux_aux);	

-- hago rotword cambiando el orden en que los bytes de w3 entran al mux
sbox_mux: mux4to1_8 port map (sel=>sel_addr, d0=>w3(3), d1=>w3(0), d2=>w3(1), d3=>w3(2), y=> addr_sbox );
AES_sbox: sbox_rom port map (addr => addr_sbox, q => sbox_out);
demux_out_sbox : demux1to4 port map (data_in => sbox_out, out0=>w_aux_in(0), out1=>w_aux_in(1), out2=>w_aux_in(2), out3=>w_aux_in(3), sel=> sel_addr);

aux_register_0: byte_register port map (clk=>clk, enable=>aux_enable_0, data_in=>w_aux_in(0), data_out=>w_aux(0));
aux_register_1: byte_register port map (clk=>clk, enable=>aux_enable_1, data_in=>w_aux_in(1), data_out=>w_aux(1));
aux_register_2: byte_register port map (clk=>clk, enable=>aux_enable_2, data_in=>w_aux_in(2), data_out=>w_aux(2));
aux_register_3: byte_register port map (clk=>clk, enable=>aux_enable_3, data_in=>w_aux_in(3), data_out=>w_aux(3));

end architecture;

