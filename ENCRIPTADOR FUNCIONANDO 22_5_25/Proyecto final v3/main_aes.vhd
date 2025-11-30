library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity main_AES is
port (
		clk, reset : in std_logic;
		ciphertext: out std_logic_vector (127 downto 0);
		
		--  test outputs
		round_out : out integer range 1 to 9;
		counter_out : out  integer range 0 to 15;
		state_out : out std_logic_vector (2 downto 0);
		sbox_out_test : out std_logic_vector (7 downto 0);
		--currentstate_out : out std_logic_vector (127 downto 0);
		plain_text_out : out std_logic_vector (127 downto 0)
--		add_test, sbox_test : out std_logic_vector (7 downto 0)
	);
end main_AES;

architecture behave of main_AES is

component register_state is
port (
		clk, e: in std_logic;
		data_in : in std_logic_vector(127 downto 0);
		data_out : out std_logic_vector(127 downto 0)
	);
end component;

component mux2to1 is
    Port (
        sel  : in  integer range 0 to 1;   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(127 downto 0);
        d1   : in  STD_LOGIC_VECTOR(127 downto 0);
		  y    : out std_logic_vector(127 downto 0)
		);
end component;

component sbox_rom is
    Port (
        clk, e     : in  std_logic;
        addr    : in  std_logic_vector(7 downto 0);  -- 8-bit input address
        q: out std_logic_vector(7 downto 0)   -- 8-bit output from S-Box
    );
end component;

component mux16to1 is
    Port (
        sel  : in  integer range 0 to 15;   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(7 downto 0);
        d1   : in  STD_LOGIC_VECTOR(7 downto 0);
        d2   : in  STD_LOGIC_VECTOR(7 downto 0);
        d3   : in  STD_LOGIC_VECTOR(7 downto 0);
        d4   : in  STD_LOGIC_VECTOR(7 downto 0);
        d5   : in  STD_LOGIC_VECTOR(7 downto 0);
        d6   : in  STD_LOGIC_VECTOR(7 downto 0);
        d7   : in  STD_LOGIC_VECTOR(7 downto 0);
        d8   : in  STD_LOGIC_VECTOR(7 downto 0);
        d9   : in  STD_LOGIC_VECTOR(7 downto 0);
        d10  : in  STD_LOGIC_VECTOR(7 downto 0);
        d11  : in  STD_LOGIC_VECTOR(7 downto 0);
        d12  : in  STD_LOGIC_VECTOR(7 downto 0);
        d13  : in  STD_LOGIC_VECTOR(7 downto 0);
        d14  : in  STD_LOGIC_VECTOR(7 downto 0);
        d15  : in  STD_LOGIC_VECTOR(7 downto 0);
        y    : out STD_LOGIC_VECTOR(7 downto 0)    -- Output
    );
end component;

component demux1to16 is
    Port (
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        sel      : in  INTEGER range 0 to 15;
        out0     : out STD_LOGIC_VECTOR(7 downto 0);
        out1     : out STD_LOGIC_VECTOR(7 downto 0);
        out2     : out STD_LOGIC_VECTOR(7 downto 0);
        out3     : out STD_LOGIC_VECTOR(7 downto 0);
        out4     : out STD_LOGIC_VECTOR(7 downto 0);
        out5     : out STD_LOGIC_VECTOR(7 downto 0);
        out6     : out STD_LOGIC_VECTOR(7 downto 0);
        out7     : out STD_LOGIC_VECTOR(7 downto 0);
        out8     : out STD_LOGIC_VECTOR(7 downto 0);
        out9     : out STD_LOGIC_VECTOR(7 downto 0);
        out10    : out STD_LOGIC_VECTOR(7 downto 0);
        out11    : out STD_LOGIC_VECTOR(7 downto 0);
        out12    : out STD_LOGIC_VECTOR(7 downto 0);
        out13    : out STD_LOGIC_VECTOR(7 downto 0);
        out14    : out STD_LOGIC_VECTOR(7 downto 0);
        out15    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;


component mix_columns is 
port (
		byte0, byte1, byte2, byte3 : in std_logic_vector (7 downto 0);
		out0,out1, out2, out3 : out std_logic_vector (7 downto 0)
	);
end component;

type state_block is array (0 to 15) of std_logic_vector(7 downto 0);
type expanded_key is array (1 to 10) of std_logic_vector(127 downto 0);
signal currentstate, aux_state, out_state : state_block;
signal address, sbox_out : std_logic_vector (7 downto 0);
signal  plain_text, plain_text_data_in, out_state_signal : std_logic_vector (127 downto 0);
signal pt_sel, lr_sel : integer range 0 to 1;
----------state machine signals -------------
type state_type is (idle, counting, start, int_state, inc_round);
signal state   : state_type;
signal counter : integer range 0 to 15;
signal round : integer range 1 to 11;
signal enable, stop, end_round, e_register : std_logic;

constant plain_text_in : std_logic_vector (127 downto 0) := X"3243F6A8885A308D313198A2E0370734";
constant key : std_logic_vector (127 downto 0) :=  X"2B7E151628AED2A6ABF7158809CF4F3C";
constant roundkey : expanded_key :=(
	X"A0FAFE1788542CB123A339392A6C7605",
	X"F2C295F27A96B9435935807A7359F67F",
	X"3D80477D4716FE3E1E237E446D7A883B",
	X"EF44A541A8525B7FB671253BDB0BAD00",
	X"D4D1C6F87C839D87CAF2B8BC11F915BC",
	X"6D88A37A110B3EFDDBF98641CA0093FD",
	X"4E54F70E5F5FC9F384A64FB24EA6DC4F",
	X"EAD27321B58DBAD2312BF5607F8D292F",
	X"AC7766F319FADC2128D12941575C006E",
	X"D014F9A8C9EE2589E13F0CC8B6630CA6"
	);

begin

	--plain_text_in <= X"3243F6A8885A308D313198A2E0370734";

--	plain_text(0) <= std_logic_vector(to_unsigned(25,8));
--	plain_text(1) <= std_logic_vector(to_unsigned(61,8));
--	plain_text(2) <= std_logic_vector(to_unsigned(227,8));
--	plain_text(3) <= std_logic_vector(to_unsigned(190,8));
--	plain_text(4) <= std_logic_vector(to_unsigned(160,8));
--	plain_text(5) <= std_logic_vector(to_unsigned(244,8));
--	plain_text(6) <= std_logic_vector(to_unsigned(226,8));
--	plain_text(7) <= std_logic_vector(to_unsigned(43,8));
--	plain_text(8) <= std_logic_vector(to_unsigned(154,8));
--	plain_text(9) <= std_logic_vector(to_unsigned(198,8));
--	plain_text(10) <= std_logic_vector(to_unsigned(141,8));
--	plain_text(11) <= std_logic_vector(to_unsigned(42,8));
--	plain_text(12) <= std_logic_vector(to_unsigned(233,8));
--	plain_text(13) <= std_logic_vector(to_unsigned(248,8));
--	plain_text(14) <= std_logic_vector(to_unsigned(72,8));
--	plain_text(15) <= std_logic_vector(to_unsigned(8,8));	

	--key <= X"2B7E151628AED2A6ABF7158809CF4F3C";

--	roundkey(1) <= X"A0" & X"FA" & X"FE" & X"17" & X"88" & X"54" & X"2C" & X"B1" & X"23" & X"A3" & X"39" & X"39" & X"2A" & X"6C" & X"76" & X"05"; 
--	roundkey(2) <= X"F2C295F27A96B9435935807A7359F67F";
--	roundkey(3) <= X"3D80477D4716FE3E1E237E446D7A883B";
--	roundkey(4) <= X"EF44A541A8525B7FB671253BDB0BAD00";
--	roundkey(5) <= X"D4D1C6F87C839D87CAF2B8BC11F915BC";
--	roundkey(6) <= X"6D88A37A110B3EFDDBF98641CA0093FD";
--	roundkey(7) <= X"4E54F70E5F5FC9F384A64FB24EA6DC4F";
--	roundkey(8) <= X"EAD27321B58DBAD2312BF5607F8D292F";
--	roundkey(9) <= X"AC7766F319FADC2128D12941575C006E";
	
	------------------------------------------state machine----------------------------------------------------------
	
	-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)



--------------------------------------------------------------------------------------------------------------	
	
	-------------------manejo del contador sin state machine
	
--	process (clk)
--		variable cnt : integer range 0 to 15;
--	begin
--		if enable = '0' then
--			cnt := 0;
----			address <= plain_text(0);
----			currentstate(0) <= sbox_out;
--		elsif rising_edge(clk) then	
--			cnt := cnt + 1;
--		end if;
--		counter <= cnt;
--	end process;
--	
--	process (aux_state, clk)
--	begin
--		if rising_edge(clk) and enable ='1' then
--			currentstate <= aux_state;
--		end if;
--	end process;
--	
--	--------------test--------------------------------
--	counter_out<=counter;
----	add_test<=address;
----	sbox_test<=sbox_out;


--	process (clk, reset)
--	begin
--		if reset = '1' then
--			state <= idle;
--			counter <= 0;
--			enable <= '0';
--			round <= 0;
--			stop <= '0';
--			plain_text <= plain_text_in;
--		elsif (rising_edge(clk)) then
--			if state = idle then
----				state_out <= 0;
--				counter <= 0;
--				round <= 0;
--				stop <= '0';
--				state <= counting;
--			elsif state = counting then
--			enable <= '1';
----			state_out <= 1;
--				if counter = 15 then
--					plain_text <= (out_state(0) & out_state(1) & out_state(2) & out_state(3) & out_state(4) & out_state(5) & out_state(6) & out_state(7) & out_state(8) & out_state(9) & out_state(10) & out_state(11) & out_state(12) & out_state(13) & out_state(14) & out_state(15)) xor roundkey(round);
--					counter <= 0;
--					if round = 8 then
--						stop <= '1';
--						state <= end_state;
--					else 
--						round <= round + 1;
--						state <= counting;
--					end if;
--				else
--					counter <= counter + 1;
--				end if;
--			else
--				state <= end_state;
--				counter <= 0;
--				round <= 0;
--				enable <= '0';
--				stop <='0';
----				state_out <= 2;
--			end if;
--		end if;
--	end process;
--	
	
	
	
	
	process (clk, reset, out_state)
	begin
		if reset = '1' then
			state <= start;
			counter <= 0;
			end_round <= '0';
			enable <= '0';
			round <= 1;
		elsif (rising_edge(clk)) then
			case state is
				when idle =>
					state_out <= "000";
					state <= idle;
					counter <= 0;
					round <= 11;
					enable <= '0';
					end_round <= '0';
					e_register <='0';
					pt_sel <= 0;
					lr_sel <= 1;
				when start =>
					state_out <= "001";
					state <= counting;
					counter <= 0;
					round <= 1;
					end_round <= '0';
					enable <= '0';
					e_register<='1';
					pt_sel <= 0;
					lr_sel <= 0;
					--plain_text_data_in <= plain_text_in xor key;
				when counting =>
					e_register <='0';
					pt_sel <= 0;
					state_out<="010";
					enable <= '1';
					end_round <= '0';
					if counter = 15 then
						counter <= 0;
						state <= int_state;					
					else
						counter <= counter + 1;
						state <= counting;
					end if;
				when int_state =>
					state_out <= "011";
					enable <= '1';
					e_register <= '0';
					pt_sel <= 1;
					lr_sel <= 0;
					end_round <= '0';
					counter <= 1;
					state <= inc_round;
					--plain_text_data_in<= out_state_signal;
				when inc_round =>
					state_out <= "100";
					enable <= '0';
					end_round <= '1';
					counter <= 0;
					e_register<='1';
					pt_sel <= 1;
					
					--plain_text_data_in <=(out_state(0) & out_state(1) & out_state(2) & out_state(3) & out_state(4) & out_state(5) & out_state(6) & out_state(7) & out_state(8) & out_state(9) & out_state(10) & out_state(11) & out_state(12) & out_state(13) & out_state(14) & out_state(15)) xor roundkey(round-1);
					--plain_text_data_in<= out_state_signal;
					if round = 10 then
						round <= 11;
						state <= idle;
						lr_sel <= 1;
					else
						round <= round + 1;
						state <= counting;
						lr_sel <= 0;
					end if;				
			end case;
		end if;
	end process;
	
	
	
	
	--------------------test------------------
	counter_out <= counter;
	round_out <= round;
	--currentstate_out <= currentstate;
	--currentstate_out <= currentstate(0) & currentstate(1) & currentstate(2) & currentstate(3) & currentstate(4) & currentstate(5) & currentstate(6) & currentstate(7) & currentstate(8) & currentstate(9) & currentstate(10) & currentstate(11) & currentstate(12) & currentstate(13) & currentstate(14) & currentstate(15);
	plain_text_out <= plain_text;
	sbox_out_test <= sbox_out;
	--------------------------------------
--	process (clk, counter)
--	begin
--		if rising_edge(clk) then
--			address <= plain_text (7+counter*8 downto counter*8);
--			currentstate(counter-1) <= sbox_out;
	
	------------------------------------------
	process (aux_state, clk, end_round, enable)
	begin
		if rising_edge(clk) and enable ='1' and end_round='0' then
			currentstate(counter - 1) <= aux_state(counter -1);
		end if;
	end process;
	
	mux_plain_text: mux2to1 port map (sel=> pt_sel, d0=>plain_text_in xor key, d1=>out_state_signal, y=>plain_text_data_in);
	
	mux_last_round: mux2to1 port map (sel=> lr_sel, d0=>(out_state(0) & out_state(1) & out_state(2) & out_state(3) & out_state(4) & out_state(5) & out_state(6) & out_state(7) & out_state(8) & out_state(9) & out_state(10) & out_state(11) & out_state(12) & out_state(13) & out_state(14) & out_state(15)) xor roundkey(round-1), d1=>(currentstate(0) & currentstate(5) & currentstate(10) &  currentstate(15) & currentstate(4) & currentstate(9) & currentstate(14) & currentstate(3) & currentstate(8) & currentstate(13) & currentstate(2) & currentstate(7) & currentstate(12) & currentstate(1) & currentstate(6) & currentstate(11)) xor roundkey(round-1), y=>out_state_signal) ;
	
	register_plain_text: register_state port map (clk=>clk,e=>e_register ,data_in=> plain_text_data_in, data_out=>plain_text);

	demux_out: demux1to16 port map (sel=>counter-1, data_in=>sbox_out, out0=>aux_state(0), out1=>aux_state(1), out2=>aux_state(2), out3=>aux_state(3),out4=>aux_state(4), out5=>aux_state(5), out6=>aux_state(6),out7=>aux_state(7), out8=>aux_state(8),out9=>aux_state(9),out10=>aux_state(10),out11=>aux_state(11), out12=>aux_state(12), out13=>aux_state(13), out14=>aux_state(14), out15=>aux_state(15));

	mux_in: mux16to1 port map ( sel=> counter, d15=>plain_text(7 downto 0),d14=>plain_text(15 downto 8),d13=>plain_text(23 downto 16),d12=>plain_text(31 downto 24),d11=>plain_text(39 downto 32),d10=>plain_text(47 downto 40),d9=>plain_text(55 downto 48),d8=>plain_text(63 downto 56),d7=>plain_text(71 downto 64),d6=>plain_text(79 downto 72),d5=>plain_text(87 downto 80),d4=>plain_text(95 downto 88),d3=>plain_text(103 downto 96),d2=>plain_text(111 downto 104),d1=>plain_text(119 downto 112),d0=>plain_text(127 downto 120),y=>address);
	
	u1: sbox_rom port map (clk => clk, addr => address, q => sbox_out, e=> enable);
		
	column1: mix_columns port map (byte0 => currentstate(0), byte1 => currentstate(5), byte2 => currentstate(10), byte3 => currentstate(15), out0 => out_state(0),out1 => out_state(1), out2 => out_state(2), out3 => out_state(3));
	column2: mix_columns port map (byte0 => currentstate(4), byte1 => currentstate(9), byte2 => currentstate(14), byte3 => currentstate(3), out0 => out_state(4),out1 => out_state(5), out2 => out_state(6), out3 => out_state(7));
	column3: mix_columns port map (byte0 => currentstate(8), byte1 => currentstate(13), byte2 => currentstate(2), byte3 => currentstate(7), out0 => out_state(8),out1 => out_state(9), out2 => out_state(10), out3 => out_state(11));
	column4: mix_columns port map (byte0 => currentstate(12), byte1 => currentstate(1), byte2 => currentstate(6), byte3 => currentstate(11), out0 => out_state(12),out1 => out_state(13), out2 => out_state(14), out3 => out_state(15));
	
	--ciphertext <=(out_state(0) & out_state(1) & out_state(2) & out_state(3) & out_state(4) & out_state(5) & out_state(6) & out_state(7) & out_state(8) & out_state(9) & out_state(10) & out_state(11) & out_state(12) & out_state(13) & out_state(14) & out_state(15)) xor roundkey(round-1);
	--out_state_signal <=(out_state(0) & out_state(1) & out_state(2) & out_state(3) & out_state(4) & out_state(5) & out_state(6) & out_state(7) & out_state(8) & out_state(9) & out_state(10) & out_state(11) & out_state(12) & out_state(13) & out_state(14) & out_state(15)) xor roundkey(round-1);
	ciphertext <= out_state_signal;
	  
end behave;	
