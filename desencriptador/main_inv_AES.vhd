library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity main_inv_AES is
port (
		clk  				: in  std_logic;
		reset				: in  std_logic;
		AES_version		: in  std_logic_vector(1 downto 0);
		start				: in  std_logic;
--		data_in			: in  std_logic_vector(127 downto 0);
		done_o			: out std_logic;
		------------test----------
		reg_text_out   : out std_logic_vector(127 downto 0);
--		sub_text_out   : out std_logic_vector(127 downto 0);
		pre_mixed_text_out : out std_logic_vector(127 downto 0);
		index_out		: out integer range 0 to 15;
		state_out		: out std_logic_vector(2 downto 0);
		sbox_out_test  : out std_logic_vector(7 downto 0);
		--------------------------
		ciphertext_out : out std_logic_vector (127 downto 0)
		
	);
end main_inv_AES;

architecture behave of main_inv_AES is


	component inv_sbox_rom is -- lo modifico para que sea lectura asincronica, no necesito clk
    Port (
        clk : in std_logic;
		  e     : in  std_logic;
        addr    : in  std_logic_vector(7 downto 0);  -- 8-bit input address
        q: out std_logic_vector(7 downto 0)   -- 8-bit output from S-Box
		);
	end component;
	
	component inv_mix_columns is 
	port (
		byte0, byte1, byte2, byte3 : in std_logic_vector (7 downto 0);
		out0,out1, out2, out3 : out std_logic_vector (7 downto 0)
		);
	end component;
	
--	component mux2to1 is
--   Port (
--        sel  : in  integer range 0 to 1;   -- 4-bit select input
--        d0   : in  STD_LOGIC_VECTOR(127 downto 0);
--        d1   : in  STD_LOGIC_VECTOR(127 downto 0);
--		  y    : out std_logic_vector(127 downto 0)
--		);
--	end component;


	type state_type is (IDLE, START_s, SUB_BYTES, DEC_ROUND, DONE);
	signal state   : state_type;
	
	type state_block is array (0 to 15) of std_logic_vector(7 downto 0);
	signal sub_text, mixed_text : state_block;
	signal reg_text, pre_mixed_text : std_logic_vector(127 downto 0);
	
	constant plain_text : std_logic_vector(127 downto 0) := X"69c4e0d86a7b0430d8cdb78070b4c55a";
	
	type expanded_key is array (0 to 13) of std_logic_vector(127 downto 0);
	constant key : std_logic_vector (127 downto 0) :=  X"000102030405060708090a0b0c0d0e0f";
	constant roundkey : expanded_key :=(
		X"d6aa74fdd2af72fadaa678f1d6ab76fe",
		X"b692cf0b643dbdf1be9bc5006830b3fe",
		X"b6ff744ed2c2c9bf6c590cbf0469bf41",
		X"47f7f7bc95353e03f96c32bcfd058dfd",
		X"3caaa3e8a99f9deb50f3af57adf622aa",
		X"5e390f7df7a69296a7553dc10aa31f6b",
		X"14f9701ae35fe28c440adf4d4ea9c026",
		X"47438735a41c65b9e016baf4aebf7ad2",
		X"549932d1f08557681093ed9cbe2c974e",
		X"13111d7fe3944a17f307a78b4d2b30c5",
		X"00000000000000000000000000000000",
		X"00000000000000000000000000000000",
		X"00000000000000000000000000000000",
		X"00000000000000000000000000000000"
		);
	
	signal sbox_out : std_logic_vector(7 downto 0);
	signal enable_sbox : std_logic;
	
	signal round : integer range 0 to 13;
	signal Nr : integer range 0 to 13;
	signal last_round : std_logic;
	signal index : integer range 0 to 16;
	
begin
	
--	process (AES_version)
--	begin
--		case AES_version is
--			when "00" =>
--				Nr <= 9;
--			when "01" =>
--				Nr <= 11;
--			when "10" =>
--				Nr <= 13;
--			when others =>
--				Nr <= 9;
--		end case;
--	end process;
	
	process (clk, reset, start)
	begin
		if reset = '0' then
			state <= IDLE;
			round <= 0;
			index <= 0;
			last_round <= '0';
		elsif rising_edge(clk) then
			case state is
					
				when IDLE =>
					done_o <= '0';
					enable_sbox <= '0';
					round <= 0;
					index <= 0;
					last_round <= '0';
					if start = '1' then
						state <= START_s;
						if AES_version = "01" then
							Nr <= 9;
						elsif AES_version = "10" then
							Nr <= 11;
						else
							Nr <= 13;
						end if;
					else
						state <= IDLE;
					end if;
						
				when START_s =>
					enable_sbox <= '1';
					reg_text <= plain_text xor roundkey(Nr);
					state <= SUB_BYTES;
					------------------------
					round <= Nr-1;
					------------------------
--				when AUX_STATE => --uso este estado para leer el primer byte de la memoria y que no se desface por la lectura asincrónica
--					state <= SUB_BYTES;	
				
				when SUB_BYTES =>
					sub_text(index-1) <= sbox_out;
					if index < 16 then
						index <= index + 1;
						state <= SUB_BYTES;
					else
						index <= 0;
						enable_sbox <= '0';
							if last_round = '0' then
								state <= DEC_ROUND;
							else 
								state <= DONE;
							end if;
					end if;
						
				when DEC_ROUND =>
					enable_sbox <= '1';
					-------------------------------
					-------------------------------
					reg_text <= (mixed_text(0) & mixed_text(1) & mixed_text(2) & mixed_text(3) & mixed_text(4) & mixed_text(5) & mixed_text(6) & mixed_text(7) & mixed_text(8) & mixed_text(9) & mixed_text(10) & mixed_text(11) & mixed_text(12) & mixed_text(13) & mixed_text(14) & mixed_text(15));
					round <= round - 1;
					state <= SUB_BYTES;
					if round > 0 then
						last_round <= '0';
				--		round <= round +1;
					else 
				--		round <= 0;
						last_round <= '1';
					end if;
						
				when DONE =>
					done_o <= '1';
--					ciphertext_out <= (sub_text(0) & sub_text(13) & sub_text(10) & sub_text(7) & sub_text(4) & sub_text(1) & sub_text(14) & sub_text(11) & sub_text(8) & sub_text(5) & sub_text(2) & sub_text(15) & sub_text(12) & sub_text(9) & sub_text(6) & sub_text(3)) xor key;
					state <= IDLE;
					
			end case;
		end if;
	end process;
	
	-------------shift + add_round_key--------------------
	
	pre_mixed_text <= (sub_text(0) & sub_text(13) & sub_text(10) & sub_text(7) & sub_text(4) & sub_text(1) & sub_text(14) & sub_text(11) & sub_text(8) & sub_text(5) & sub_text(2) & sub_text(15) & sub_text(12) & sub_text(9) & sub_text(6) & sub_text(3)) xor roundkey(round);
	------------------------------------------------------				
	
	ciphertext_out <= (sub_text(0) & sub_text(13) & sub_text(10) & sub_text(7) & sub_text(4) & sub_text(1) & sub_text(14) & sub_text(11) & sub_text(8) & sub_text(5) & sub_text(2) & sub_text(15) & sub_text(12) & sub_text(9) & sub_text(6) & sub_text(3)) xor key;

	
	
	u1: inv_sbox_rom port map (clk => clk, addr => reg_text((8*(16-index))-1 downto 8*(15-index)), q => sbox_out, e=> enable_sbox);
	
	column1: inv_mix_columns port map (byte0 => pre_mixed_text(127 downto 120), byte1 => pre_mixed_text(119 downto 112), byte2 => pre_mixed_text(111 downto 104), byte3 => pre_mixed_text(103 downto 96), out0 => mixed_text(0),out1 => mixed_text(1), out2 => mixed_text(2), out3 => mixed_text(3));
	column2: inv_mix_columns port map (byte0 => pre_mixed_text(95 downto 88), byte1 => pre_mixed_text(87 downto 80), byte2 => pre_mixed_text(79 downto 72), byte3 => pre_mixed_text(71 downto 64), out0 => mixed_text(4),out1 => mixed_text(5), out2 => mixed_text(6), out3 => mixed_text(7));
	column3: inv_mix_columns port map (byte0 => pre_mixed_text(63 downto 56), byte1 => pre_mixed_text(55 downto 48), byte2 => pre_mixed_text(47 downto 40), byte3 => pre_mixed_text(39 downto 32), out0 => mixed_text(8),out1 => mixed_text(9), out2 => mixed_text(10), out3 => mixed_text(11));
	column4: inv_mix_columns port map (byte0 => pre_mixed_text(31 downto 24), byte1 => pre_mixed_text(23 downto 16), byte2 => pre_mixed_text(15 downto 8), byte3 => pre_mixed_text(7 downto 0), out0 => mixed_text(12),out1 => mixed_text(13), out2 => mixed_text(14), out3 => mixed_text(15));

	-------------test------------
	reg_text_out <= reg_text;
	index_out <= index;
--	sub_text_out <= sub_text(0) & sub_text(13) & sub_text(10) & sub_text(7) & sub_text(4) & sub_text(1) & sub_text(14) & sub_text(11) & sub_text(8) & sub_text(5) & sub_text(2) & sub_text(15) & sub_text(12) & sub_text(9) & sub_text(6) & sub_text(3);
	sbox_out_test <= sbox_out;
	pre_mixed_text_out <= (sub_text(0) & sub_text(13) & sub_text(10) & sub_text(7) & sub_text(4) & sub_text(1) & sub_text(14) & sub_text(11) & sub_text(8) & sub_text(5) & sub_text(2) & sub_text(15) & sub_text(12) & sub_text(9) & sub_text(6) & sub_text(3)) xor roundkey(round-1);
	
	
	
	process(state)
	begin
		case state is 
			when IDLE =>
				state_out <= "000";
			when START_s =>
				state_out <= "001";
--			when AUX_STATE =>
--				state_out <= "010";
			when SUB_BYTES => 
				state_out <= "011";
			when DEC_ROUND =>
				state_out <= "100";
			when DONE =>
				state_out <= "101";
		end case;
	end process;
		
	-----------------------------
	
	
end behave;
						
					
						
						
					
						
						
					