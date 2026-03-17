library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity main_AES is
port (
		clk  				: in  std_logic;
		reset				: in  std_logic;
		AES_version		: in  std_logic_vector(1 downto 0);
		start				: in  std_logic;
--		data_in			: in  std_logic_vector(127 downto 0);
		done_o			: out std_logic;
		------------test----------
--		reg_text_out   : out std_logic_vector(127 downto 0);
		sub_text_out   : out std_logic_vector(127 downto 0);
		index_out		: out integer range 0 to 15;
		state_out		: out std_logic_vector(2 downto 0);
		sbox_out_test  : out std_logic_vector(7 downto 0);
		--------------------------
		ciphertext_out : out std_logic_vector (127 downto 0)
		
	);
end main_AES;

architecture behave of main_AES is


	component sbox_rom is -- lo modifico para que sea lectura asincronica, no necesito clk
    Port (
        clk : in std_logic;
		  e     : in  std_logic;
        addr    : in  std_logic_vector(7 downto 0);  -- 8-bit input address
        q: out std_logic_vector(7 downto 0)   -- 8-bit output from S-Box
		);
	end component;
	
	component mix_columns is 
	port (
		byte0, byte1, byte2, byte3 : in std_logic_vector (7 downto 0);
		out0,out1, out2, out3 : out std_logic_vector (7 downto 0)
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


	type state_type is (IDLE, START_s, SUB_BYTES, INC_ROUND, DONE);
	signal state   : state_type;
	
	type state_block is array (0 to 15) of std_logic_vector(7 downto 0);
	signal sub_text, mixed_text : state_block;
	signal reg_text : std_logic_vector(127 downto 0);
	
	constant plain_text : std_logic_vector(127 downto 0) := X"3243F6A8885A308D313198A2E0370734";
	
	type expanded_key is array (0 to 13) of std_logic_vector(127 downto 0);
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
		X"D014F9A8C9EE2589E13F0CC8B6630CA6",
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
					else
						state <= IDLE;
					end if;
						
				when START_s =>
					enable_sbox <= '1';
					reg_text <= plain_text xor key;
					if AES_version = "01" then
						Nr <= 9;
					elsif AES_version = "10" then
						Nr <= 11;
					else
						Nr <= 13;
					end if;
					state <= SUB_BYTES;
					
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
								state <= INC_ROUND;
							else 
								state <= DONE;
							end if;
					end if;
						
				when INC_ROUND =>
					enable_sbox <= '1';
					reg_text <= (mixed_text(0) & mixed_text(1) & mixed_text(2) & mixed_text(3) & mixed_text(4) & mixed_text(5) & mixed_text(6) & mixed_text(7) & mixed_text(8) & mixed_text(9) & mixed_text(10) & mixed_text(11) & mixed_text(12) & mixed_text(13) & mixed_text(14) & mixed_text(15)) xor roundkey(round);
					round <= round +1;
					state <= SUB_BYTES;
					if round < Nr-1 then
						last_round <= '0';
				--		round <= round +1;
					else 
				--		round <= 0;
						last_round <= '1';
					end if;
						
				when DONE =>
					done_o <= '1';
					ciphertext_out <= (sub_text(0) & sub_text(5) & sub_text(10) & sub_text(15) & sub_text(4) & sub_text(9) & sub_text(14) & sub_text(3) & sub_text(8) & sub_text(13) & sub_text(2) & sub_text(7) & sub_text(12) & sub_text(1) & sub_text(6) & sub_text(11)) xor roundkey(Nr);
					state <= IDLE;
					
			end case;
		end if;
	end process;
	
	
	u1: sbox_rom port map (clk => clk, addr => reg_text((8*(16-index))-1 downto 8*(15-index)), q => sbox_out, e=> enable_sbox);
	
	column1: mix_columns port map (byte0 => sub_text(0), byte1 => sub_text(5), byte2 => sub_text(10), byte3 => sub_text(15), out0 => mixed_text(0),out1 => mixed_text(1), out2 => mixed_text(2), out3 => mixed_text(3));
	column2: mix_columns port map (byte0 => sub_text(4), byte1 => sub_text(9), byte2 => sub_text(14), byte3 => sub_text(3), out0 => mixed_text(4),out1 => mixed_text(5), out2 => mixed_text(6), out3 => mixed_text(7));
	column3: mix_columns port map (byte0 => sub_text(8), byte1 => sub_text(13), byte2 => sub_text(2), byte3 => sub_text(7), out0 => mixed_text(8),out1 => mixed_text(9), out2 => mixed_text(10), out3 => mixed_text(11));
	column4: mix_columns port map (byte0 => sub_text(12), byte1 => sub_text(1), byte2 => sub_text(6), byte3 => sub_text(11), out0 => mixed_text(12),out1 => mixed_text(13), out2 => mixed_text(14), out3 => mixed_text(15));

	-------------test------------
--	reg_text_out <= reg_text;
	index_out <= index;
	sub_text_out <= sub_text(0) & sub_text(1) & sub_text(2) & sub_text(3) & sub_text(4) & sub_text(5) & sub_text(6) & sub_text(7) & sub_text(8) & sub_text(9) & sub_text(10) & sub_text(11) & sub_text(12) & sub_text(13) & sub_text(14) & sub_text(15);
	sbox_out_test <= sbox_out;
	
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
			when INC_ROUND =>
				state_out <= "100";
			when DONE =>
				state_out <= "101";
		end case;
	end process;
		
	-----------------------------
	
	
end behave;
						
					
						
						
					
						
						
					