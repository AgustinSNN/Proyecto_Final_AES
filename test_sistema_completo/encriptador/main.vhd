library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity main is
port (
		clk  				: in  std_logic;
		reset				: in  std_logic;
		UART_data_in	: in  std_logic;
		UART_data_out	: out std_logic;
		---------- DEBUG ----------
		state_out : out std_logic_vector(3 downto 0);
		FLAG_KEY_READY, FLAG_DATA_READY, FLAG_SEND, FLAG_SBOX_GEN , FLAG_INVALID_DATA  : out std_logic;
		done_key_128_out, done_key_192_out, done_key_256_out, done_lorenz_out, done_mlog_out, done_rossler_out, done_sbox_out, done_cypher_out : out std_logic
--		block_counter_out : out integer range 0 to 16383
		
	);
end main;

architecture behave of main is

-----------BLOQUES PRINCIPALES-------------------

component controlador is
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
	 sel_Uart_TX	 : out std_logic;
	 enable_sbox_read : out std_logic;
	 sbox_counter_out : out std_logic_vector(7 downto 0);
	 generate_sbox	 : out std_logic;
	 sel_sbox		 : out std_logic;
	 sel_sbox_generator : out std_logic_vector(1 downto 0);
	 enable_sbox_generator : out std_logic_vector(3 downto 0);
	 sel_sbox_addr	: out std_logic_vector(2 downto 0);
	 start_sbox_generator : out std_logic;
	 state_out : out std_logic_vector(3 downto 0);
	 FLAG_KEY_READY, FLAG_DATA_READY, FLAG_SEND, FLAG_INVALID_DATA   : out std_logic

    );
end component;

component main_AES is
port (
		clk  				: in  std_logic;
		reset				: in  std_logic;
		AES_version		: in  std_logic_vector(1 downto 0);
		start				: in  std_logic;
		done_o			: out std_logic;
		
		plain_text		: in  std_logic_vector(127 downto 0);
		key				: in std_logic_vector(127 downto 0);
		round_key		: in std_logic_vector(127 downto 0);
		round_out		: out integer range 0 to 13;
		
		sbox_addr		: out std_logic_vector(7 downto 0);
		sbox_out			: in std_logic_vector(7 downto 0);
		enable_sbox		: out std_logic;

		ciphertext_out : out std_logic_vector (127 downto 0);
		reg_out 			: out std_logic 
		
	);
end component;

component UART_RX is
  generic (
    g_CLKS_PER_BIT : integer := 434     -- Needs to be set correctly
    );
  port (
    i_Clk       : in  std_logic;
    i_RX_Serial : in  std_logic;
	 ---------------------------
	 o_RX_active : out std_logic;
	 ---------------------------
    o_RX_DV     : out std_logic;
    o_RX_Byte   : out std_logic_vector(7 downto 0)
    );
end component;

component UART_TX is
  generic (
    g_CLKS_PER_BIT : integer := 434     -- Needs to be set correctly
    );
  port (
    i_Clk       : in  std_logic;
    i_TX_DV     : in  std_logic;
    i_TX_Byte   : in  std_logic_vector(7 downto 0);
    o_TX_Active : out std_logic;
    o_TX_Serial : out std_logic;
    o_TX_Done   : out std_logic
    );
end component;

component key_expansion_128 is
  Port (
        clk, reset, start_in  : in  std_logic;
		  key			  : in std_logic_vector(127 downto 0);
		  sbox_enable : out std_logic;
		  addr_sbox	  : out std_logic_vector(7 downto 0);
		  sbox_out	  : in std_logic_vector(7 downto 0);
		  
		  key_word	  : out std_logic_vector(31 downto 0);
		  ram_addr	  : out integer range 0 to 15;
		  data_valid  : out std_logic;
		  counter_out : out integer range 0 to 3;
		  done_o		  : out std_logic
		  
    );
end component;

component key_expansion_192 is
  Port (
        clk, reset, start_in  : in  std_logic;
		  key			  : in std_logic_vector(191 downto 0);
		  sbox_enable : out std_logic;
		  addr_sbox	  : out std_logic_vector(7 downto 0);
		  sbox_out	  : in std_logic_vector(7 downto 0);
		  
		  key_word	  : out std_logic_vector(31 downto 0);
		  ram_addr	  : out integer range 0 to 15;
		  data_valid  : out std_logic;
		  counter_out : out integer range 0 to 3;
		  done_o		  : out std_logic

    );
end component;

component key_expansion_256 is
  Port (
        clk, reset, start_in  : in  std_logic;
		  key			  : in std_logic_vector(255 downto 0);
		  sbox_enable : out std_logic;
		  addr_sbox	  : out std_logic_vector(7 downto 0);
		  sbox_out	  : in std_logic_vector(7 downto 0);
		  
		  key_word	  : out std_logic_vector(31 downto 0);
		  ram_addr	  : out integer range 0 to 15;
		  data_valid  : out std_logic;
		  counter_out : out integer range 0 to 3;
		  done_o		  : out std_logic

    );
end component;

component sbox_rom is
    Port (
		  clk : in std_logic;
        e     : in  std_logic;
        addr    : in  std_logic_vector(7 downto 0);  -- 8-bit input address
        q: out std_logic_vector(7 downto 0)   -- 8-bit output from S-Box
    );
end component;

component sbox_caotica is
	generic (
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 6
	);
	port (
		clk		: in std_logic;
		addr	: in std_logic_vector(ADDR_WIDTH-1 downto 0);
		data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
		we		: in std_logic := '1';
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);
end component;

component sbox_generator is
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
		  FLAG_SBOX_GEN : out std_logic

    );
end component;

-----------BLOQUES CAÓTICOS-------------------------
component lorenz is
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
	 data_in : in std_logic_vector(255 downto 0);
	 generate_sbox : in std_logic;  -- 0 para expansión de clave/ 1 para generar s-box
--	 key_enable	: out std_logic;
	 data_out   : out std_logic_vector(N+M-1 downto 0); -- salida
	 data_valid : out std_logic;
	 counter_out : out integer range 0 to 3;
	 ram_addr	: out integer range 0 to 15  
  );
end component;

component rossler is
  generic (
    N : integer := 24;  -- número total de bits 
	 M : integer := 16; -- numero de bits fraccionarios
	 a : integer := 3; -- shift_right
	 b : integer := 3; -- shift_right
	 c : integer := 4; -- shift_left 
	 time_step : integer := 4 -- shift_right
  );
  port (
    clk     : in  std_logic;
    start   : in  std_logic;              -- cuando =0 carga x_init
	 reset   : in  std_logic;
	 done_out : out std_logic;
	 AES_version : in std_logic_vector(1 downto 0);
	 data_in : in std_logic_vector(255 downto 0);
	 generate_sbox : in std_logic;  -- 0 para expansión de clave/ 1 para generar s-box
--	 key_enable	: out std_logic;
	 data_out   : out std_logic_vector(N-1 downto 0); -- salida
	 data_valid : out std_logic;
	 counter_out : out integer range 0 to 3;
	 ram_addr	: out integer range 0 to 15
--	 y_out   : out signed(N+M-1 downto 0);
--  z_out   : out signed(N+M-1 downto 0)  
  );
end component;

component mapa_logistico is
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
end component;

-----------BLOQUES AUXILIARES-----------------------


component single_port_ram is
	generic 
	(
		DATA_WIDTH : integer := 8;
		ADDR_WIDTH : integer := 4
	);
	port 
	(
		clk	: in std_logic;
		addr	: in integer range 0 to (2**ADDR_WIDTH)-1;
		data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
		we		: in std_logic := '1';
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);
end component;

component register_bank is
    generic (
        N : integer := 16;  -- number of words
        M : integer := 8    -- bits per word
    );
    port (
        clk      : in  std_logic;
        we       : in  std_logic;
        w_addr   : in  integer range 0 to N-1;
        data_in  : in  std_logic_vector(M-1 downto 0);
        data_out : out std_logic_vector(N*M-1 downto 0)  -- ALL words
    );
end component;

component register_out is
    Port (
        clk      : in  STD_LOGIC;
--      we       : in  STD_LOGIC; -- write enable
        data_in  : in  STD_LOGIC_VECTOR(127 downto 0);
        addr     : in  integer range 0 to 15; -- for read
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

component decoder_2to4 is
    Port (
        A : in  integer range 0 to 3; -- 2-bit input
        Y : out STD_LOGIC_VECTOR(3 downto 0)  -- 4 outputs
    );
end component;

component mux4to1 is
	 generic (
        M : integer := 8    -- bits per word
    );
    Port (
        sel  : in  std_logic_vector (1 downto 0);   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(M-1 downto 0);
        d1   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d2   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  d3   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  y    : out std_logic_vector(M-1 downto 0)
		);
end component;

component mux2to1 is
	 generic (
        M : integer := 8    -- bits per word
    );

    Port (
        sel  : in  std_logic;   -- 4-bit select input
        d0   : in  STD_LOGIC_VECTOR(M-1 downto 0);
        d1   : in  STD_LOGIC_VECTOR(M-1 downto 0);
		  y    : out std_logic_vector(M-1 downto 0)
		);
end component;

component mux_generic is
    generic (
        DATA_WIDTH  : positive := 8;   -- bits per data channel
        NUM_INPUTS  : positive := 4    -- number of inputs (must be >= 2)
    );
    port (
        -- Input bus: NUM_INPUTS channels, each DATA_WIDTH bits wide
        data_in  : in  std_logic_vector(NUM_INPUTS * DATA_WIDTH - 1 downto 0);

        -- Select: wide enough to address every input
        sel      : in  std_logic_vector(integer(ceil(log2(real(NUM_INPUTS)))) - 1 downto 0);

        -- Selected output
        data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
end component;
	
	-------------UART-----------------
	signal RX_data_valid, RX_active, TX_trigger_send, TX_done, TX_active : std_logic;
	signal RX_byte, TX_byte, TX_byte_block : std_logic_vector(7 downto 0);
	signal out_block_index : integer range 0 to 15; -- recorre el ciphertext de 16 bytes
	signal sel_uart_TX : std_logic;	
	
	------------- CIPHER-----------------
	
	signal write_data_reg, start_cypher, done_cypher : std_logic;
	signal data_reg_add : integer range 0 to 15;
	signal AES_version  : std_logic_vector(1 downto 0);
	signal plain_text, ciphertext : std_logic_vector(127 downto 0);
	
	------------- KEY EXPANSION ----------
	
	signal key_word_128, key_word_192, key_word_256, data_out_mlog, data_out_lorenz, data_out_rossler, key_word : std_logic_vector(31 downto 0);
	signal key : std_logic_vector(255 downto 0);
	signal key_reg_add : integer range 0 to 31;
	signal write_key_reg, start_key_expance, done_key_128, done_key_192, done_key_256 : std_logic;
	signal enable_key_version : std_logic_vector(2 downto 0);
	
	-------- ROUND KEY ------------------
	
	signal round_key128_addr, round_key192_addr, round_key256_addr, round_key_addr, round_key_lorenz_addr, round_key_rossler_addr, round_key_mlog_addr, key_round_out : integer range 0 to 15;
	signal data_valid_128, data_valid_192, data_valid_256, data_valid_mlog, data_valid_lorenz, data_valid_rossler : std_logic;
	signal counter_out_128, counter_out_192, counter_out_256, counter_out_mlog, counter_out_lorenz, counter_out_rossler : integer range 0 to 3;
	signal round_key : std_logic_vector(127 downto 0);
	signal sel_sbox : std_logic;

	
	------------- S-BOX ------------------
	
	signal sbox_addr_key128, sbox_addr_key192, sbox_addr_key256, sbox_addr_cipher : std_logic_vector(7 downto 0);
	signal sbox_out, sbox_out_AES, sbox_out_caotica : std_logic_vector(7 downto 0);
	signal sbox_mux : std_logic_vector(7 downto 0);
	signal sbox_mux_sel : std_logic_vector(1 downto 0);
	signal sbox_enable_key128, sbox_enable_key192, sbox_enable_key256, sbox_enable_cipher : std_logic;
	signal sbox_load_values : std_logic;
	
	signal generate_sbox : std_logic;
	signal data_out_sbox_generator, sbox_addr_generator :std_logic_vector(7 downto 0);
	
	signal sel_sbox_generator : std_logic_vector(1 downto 0);
	signal enable_sbox_generator : std_logic_vector(3 downto 0);
	signal load_sbox_generator : std_logic;
	signal sel_sbox_addr : std_logic_vector(2 downto 0);
	signal done_sbox : std_logic;
	signal sbox_counter : std_logic_vector(7 downto 0);
	signal enable_sbox_read : std_logic;
	
	------------- SEÑALES AUXILIARES ------------
	signal select_key_version : std_logic_vector(5 downto 0);
	signal enable_reg_out : std_logic;
	signal deco_out : std_logic_vector(3 downto 0);
	signal counter : std_logic_vector(1 downto 0);
	signal mux_out_addr_sbox : std_logic_vector(7 downto 0);
	signal sel_block : std_logic_vector(2 downto 0);
	signal out_mux_round : std_logic_vector(3 downto 0);
	signal data_valid_key : std_logic;
	signal out_block, block_data_out : std_logic_vector(127 downto 0);
	signal block_counter : integer range 0 to 16383; --(2**14-1)
	signal sel_data_out	: std_logic_vector(1 downto 0);
--	signal sel_Uart_TX	: std_logic;
	signal start_sbox_generator : std_logic;
--	signal key_enable_lorenz, key_enable_rossler, key_enable_mlog : std_logic;
	signal done_lorenz, done_rossler, done_mlog : std_logic;
	signal data_valid_sbox : std_logic;
	
	signal chaotic_values : std_logic_vector(23 downto 0);
	
	
begin
	
	-------------------- DEBUG ---------------------
--	block_counter_out <= block_counter;

	done_cypher_out <= done_cypher;
	done_key_128_out <= done_key_128;
	done_key_192_out <= done_key_192;
	done_key_256_out <= done_key_256;
	done_mlog_out <= done_mlog;
	done_lorenz_out <= done_lorenz;
	done_rossler_out <= done_rossler;
	done_sbox_out <= done_sbox;
	------------------------------------------------
	
	data_valid_key <= (data_valid_128 or data_valid_192 or data_valid_256 or data_valid_mlog or data_valid_lorenz or data_valid_rossler) and (not generate_sbox); 
	
	RX: UART_RX generic map(g_cLKS_PER_BIT => 434) port map(i_clk => clk, i_RX_Serial => UART_data_in, o_RX_active => RX_active, o_RX_DV => RX_data_valid, o_RX_Byte => RX_byte);
	TX: UART_TX generic map(g_CLKS_PER_BIT => 434) port map(i_clk => clk, i_TX_DV => TX_trigger_send, i_TX_Byte => TX_byte, o_TX_Active => TX_active, o_TX_Serial => UART_data_out, o_TX_Done => TX_done);
	
	data_register: register_bank generic map(N => 16, M => 8) port map(clk => clk, we => write_data_reg, w_addr => data_reg_add, data_in => RX_byte, data_out => plain_text);
	key_register: register_bank generic map(N => 32, M => 8) port map(clk => clk, we => write_key_reg, w_addr => key_reg_add, data_in => RX_byte, data_out => key);
	
	------------INSTANCIO CONTROLADOR--------------
	ins_controlador: controlador port map(
	clk => clk, reset => reset,
	
	data_valid => RX_data_valid,
	RX_active => RX_active,
	data_in => RX_byte,
	byte_send => TX_done,
	trigger_send => TX_trigger_send,
	
	enable_key_version => select_key_version,
	AES_version_out => AES_version,
	sel_block => sel_block,
	start_cypher => start_cypher, start_key_expance => start_key_expance, done_cypher => done_cypher, done_key => (done_key_128 and done_key_192 and done_key_256 and done_mlog and done_lorenz and done_rossler),
	done_sbox => done_sbox,
	write_data_reg => write_data_reg, write_key_reg => write_key_reg,
	data_reg_add => data_reg_add, key_reg_add => key_reg_add,
	out_block_index => out_block_index,
	block_counter => block_counter,
	key_round => key_round_out,
	state_out => state_out,
	sel_data_out => sel_data_out,
	sel_uart_TX => sel_uart_TX,
	enable_sbox_read => enable_sbox_read,
	sbox_counter_out => sbox_counter,
	generate_sbox => generate_sbox,
	sel_sbox => sel_sbox,
	sel_sbox_generator => sel_sbox_generator,
	sel_sbox_addr => sel_sbox_addr,
	start_sbox_generator => start_sbox_generator,
	enable_sbox_generator => enable_sbox_generator,
	
	FLAG_DATA_READY => FLAG_DATA_READY,
	FLAG_KEY_READY => FLAG_KEY_READY,
	FLAG_SEND => FLAG_SEND,
	FLAG_INVALID_DATA => FLAG_INVALID_DATA
	);
	
	-----------------INSTANCIO KEY_128------------
	key_128: key_expansion_128 port map (
	clk => clk, reset => reset, 
	start_in => select_key_version(0) and start_key_expance,
	key => key(255 downto 128),
	
	sbox_enable => sbox_enable_key128,
	addr_sbox => sbox_addr_key128,
	sbox_out => sbox_out,
	
	key_word => key_word_128,
	ram_addr => round_key128_addr,
	data_valid => data_valid_128,
	counter_out => counter_out_128,
	done_o => done_key_128	
	);
	
	
	-----------------INSTANCIO KEY_192------------
	key_192: key_expansion_192 port map (
	clk => clk, reset => reset, 
	start_in => select_key_version(1) and start_key_expance,
	key => key(255 downto 64),
	
	sbox_enable => sbox_enable_key192,
	addr_sbox => sbox_addr_key192,
	sbox_out => sbox_out,
	
	key_word => key_word_192,
	ram_addr => round_key192_addr,
	data_valid => data_valid_192,
	counter_out => counter_out_192,
	done_o => done_key_192	
	);
	
	-----------------INSTANCIO KEY_256------------
	key_256: key_expansion_256 port map (
	clk => clk, reset => reset, 
	start_in => select_key_version(2) and start_key_expance,
	key => key(255 downto 0),
	
	sbox_enable => sbox_enable_key256,
	addr_sbox => sbox_addr_key256,
	sbox_out => sbox_out,
	
	key_word => key_word_256,
	ram_addr => round_key256_addr,
	data_valid => data_valid_256,
	counter_out => counter_out_256,
	done_o => done_key_256	
	);
	
	----------------INSTANCIO CYPHER---------------
	cypher: main_AES port map(
	clk => clk, reset => reset,
	AES_version => AES_version,
	start => start_cypher,
	done_o => done_cypher,
	
	plain_text => plain_text,
	key => key(255 downto 128),
	round_key => round_key,
	round_out => round_key_addr,
	
	sbox_addr => sbox_addr_cipher,
	sbox_out => sbox_out,
	enable_sbox => sbox_enable_cipher,
	
	ciphertext_out => ciphertext,
	reg_out => enable_reg_out
	);
	
	-------------- INSTANCIO GENERADOR DE SBOX -----------
	algoritmo_sbox: sbox_generator port map(
	clk => clk,
	reset => reset,
	start => start_sbox_generator,
	data_in => chaotic_values,
	load => load_sbox_generator,
	done_out => done_sbox,
	test_out => sbox_load_values,
	counter_out => sbox_addr_generator,
	sbox_out => data_out_sbox_generator,
	FLAG_SBOX_GEN => FLAG_SBOX_GEN
	);
	
	-------------- INSTANCIO BLOQUES CAÓTICOS ------------
	-------------- LORENZ --------------------------------
	sist_lorenz: lorenz generic map(N => 7, M=> 25, sigma => 3, b => 1, r => 5, time_step => 6) port map (
	clk => clk,
	reset => reset,
	start => (load_sbox_generator and enable_sbox_generator(2)) or (start_key_expance and select_key_version(4)) ,
	done_out => done_lorenz,
	AES_version => AES_version,
	data_in => key,
	generate_sbox => generate_sbox,
--	key_enable => key_enable_lorenz,
	data_out => data_out_lorenz,
	data_valid => data_valid_lorenz,
	counter_out => counter_out_lorenz,
	ram_addr => round_key_lorenz_addr
	);
	
	-------------- ROSSLER -------------------------------
	sist_rossler: rossler generic map(N => 32, M => 24, a => 3, b => 3, c => 4, time_step => 4) port map (
	clk => clk, 
	reset => reset,
	start => (load_sbox_generator and enable_sbox_generator(3)) or (start_key_expance and select_key_version(5)),
	done_out => done_rossler,
	AES_version => AES_version,
	data_in => key,
	generate_sbox => generate_sbox,
--	key_enable => key_enable_rossler,
	data_out => data_out_rossler,
	data_valid => data_valid_rossler,
	counter_out => counter_out_rossler,
	ram_addr => round_key_rossler_addr
	); 
	
	-------------- MAPA LOGÍSTICO ---------------------------
	m_log: mapa_logistico generic map(N => 32) port map(
	clk => clk,
	reset => reset,
	start => (load_sbox_generator and enable_sbox_generator(0)) or (start_key_expance and select_key_version(3)),
	AES_version => AES_version,
	data_in => key,
	generate_sbox => generate_sbox,
--	key_enable => key_enable_mlog,
	data_out => data_out_mlog,
	data_valid => data_valid_mlog,
	counter_out => counter_out_mlog,
	ram_addr => round_key_mlog_addr,
	done_out => done_mlog
	);
	---------------------------------------------------------
	-------------- S-BOX -------------------------
	
	sbox: sbox_rom port map (clk => clk, e => (sbox_enable_cipher or sbox_enable_key128 or sbox_enable_key192 or sbox_enable_key256 or enable_sbox_read), addr => mux_out_addr_sbox, q => sbox_out_AES);
	
	sbox2: sbox_caotica generic map(DATA_WIDTH => 8, ADDR_WIDTH => 8) port map(clk => clk, we => sbox_load_values, addr => mux_out_addr_sbox, data => data_out_sbox_generator, q => sbox_out_caotica);
	
	mux_sbox_out: mux2to1 generic map(M => 8) port map(sel => sel_sbox, d0 => sbox_out_AES, d1 => sbox_out_caotica, y => sbox_out);
	
	-------------- paginado de 4 memorias de 32b para la calve expandida
	
	ram_0: single_port_ram generic map(DATA_WIDTH => 32, ADDR_WIDTH => 4) port map(clk => clk, addr => to_integer(unsigned(out_mux_round)), data => key_word, we => deco_out(0) and data_valid_key, q=> round_key(127 downto 96));
	ram_1: single_port_ram generic map(DATA_WIDTH => 32, ADDR_WIDTH => 4) port map(clk => clk, addr => to_integer(unsigned(out_mux_round)), data => key_word, we => deco_out(1) and data_valid_key, q=> round_key(95 downto 64));
	ram_2: single_port_ram generic map(DATA_WIDTH => 32, ADDR_WIDTH => 4) port map(clk => clk, addr => to_integer(unsigned(out_mux_round)), data => key_word, we => deco_out(2) and data_valid_key, q=> round_key(63 downto 32));
	ram_3: single_port_ram generic map(DATA_WIDTH => 32, ADDR_WIDTH => 4) port map(clk => clk, addr => to_integer(unsigned(out_mux_round)), data => key_word, we => deco_out(3) and data_valid_key, q=> round_key(31 downto 0));
	
	-------------- Registro de salida para enviar los datos a UART_TX--------
	ram_TX: single_port_ram generic map(DATA_WIDTH => 128, ADDR_WIDTH => 14) port map(clk => clk, addr => block_counter, data => ciphertext, we => enable_reg_out, q => block_data_out); 
	registro_salida: register_out port map(clk => clk, data_in => out_block, addr => out_block_index, data_out => TX_byte_block);
	
	mux_uart_TX: mux2to1 generic map(M => 8) port map(sel => sel_uart_TX, d0 => TX_byte_block, d1 => sbox_out, y => TX_byte);
	mux_send: mux4to1 generic map (M => 128) port map (sel => sel_data_out, d0 => block_data_out, d1 => key(255 downto 128), d2 => round_key, d3 => round_key, y => out_block);

	-------------- Decodificador para manejar las 4 memorias ----------------	
	deco: decoder_2to4 port map (A => to_integer(unsigned(counter)), Y => deco_out);
	
	-------------- mux para las direcciones de la sbox ----------------------
	
									---------------------------------------------------------------
--	mux_sbox_addr: mux4to1 generic map(M => 8) port map(sel => sel_sbox_addr(1 downto 0), d0 => sbox_addr_key128, d1 => sbox_addr_key192, d2 => sbox_addr_key256, d3 => sbox_addr_cipher, y => mux_out_addr_sbox_aux);
--	mux_sbox_caotica_addr: mux2to1 generic map (M => 8) port map (sel => sel_sbox_addr(2), d0 => mux_out_addr_sbox_aux, d1 => sbox_addr_generator, y=> mux_out_addr_sbox);	
									---------------------------------------------------------------
	mux_sbox_addr: mux_generic generic map(DATA_WIDTH => 8, NUM_INPUTS => 8) port map(sel => sel_sbox_addr, data_in =>
	sbox_counter &
	sbox_counter &
	sbox_counter &
	sbox_addr_generator &
	sbox_addr_cipher &
	sbox_addr_key256 &
	sbox_addr_key192 &
	sbox_addr_key128,
	data_out => mux_out_addr_sbox
	);								
									
									
	------- mux para elejir el bloque que alimenta al generador de sbox ---------------------
	
	mux_sox_generator_data: mux4to1 generic map(M => 24) port map(sel => sel_sbox_generator, d0 => data_out_mlog(23 downto 0), d1 => data_out_mlog(23 downto 0), d2 => data_out_lorenz(23 downto 0), d3 => data_out_rossler(23 downto 0), y => chaotic_values);
--	deco_sbox_generator: decoder_2to4 port map(A => to_integer(unsigned(sel_sbox_generator)), Y => enable_sbox_generator); 
	
	-------------- mux para acceder a la clave expandida ---------------------
--	mux_round_key_addr: mux4to1 generic map(M => 4) port map(sel => sel_block(1 downto 0), d0 => std_logic_vector(to_unsigned(round_key128_addr, 4)), d1 => std_logic_vector(to_unsigned(round_key192_addr, 4)), d2 => std_logic_vector(to_unsigned(round_key256_addr, 4)) , d3 => std_logic_vector(to_unsigned(round_key_addr, 4)), y => out_mux_round); 
--	mux_round_key_addr_2: mux2to1 generic map(M => 4) port map (sel => sel_block(2), d0 => out_mux_round, d1 => std_logic_vector(to_unsigned(key_round_out, 4)), y => out_mux_round_2);
	
	mux_round_key_addr: mux_generic generic map(DATA_WIDTH => 4, NUM_INPUTS => 8) port map(sel => sel_block, data_in => 
	std_logic_vector(to_unsigned(key_round_out, 4)) & 					--sel = 111		señal que viene del controlador para LEER la clave
	std_logic_vector(to_unsigned(round_key_addr, 4)) &					--sel = 110		señal que viene del encriptador para hacer XOR con cada round_key 
	std_logic_vector(to_unsigned(round_key_rossler_addr, 4)) &		--sel = 101
	std_logic_vector(to_unsigned(round_key_lorenz_addr, 4)) &			--sel = 100
	std_logic_vector(to_unsigned(round_key_mlog_addr, 4)) &			--sel = 011
	std_logic_vector(to_unsigned(round_key256_addr, 4)) &				--sel = 010
	std_logic_vector(to_unsigned(round_key192_addr, 4)) &				--sel = 001
	std_logic_vector(to_unsigned(round_key128_addr, 4)),				--sel = 000
	data_out => out_mux_round
	);
	
	-------------- mux para elegir el expansor de clave ----------------------
--	mux_key_word: mux4to1 generic map(M => 32) port map (sel => sel_block(1 downto 0), d0 => key_word_128, d1 => key_word_192, d2 => key_word_256, d3 => key_word_256, y => key_word);
--	mux_counter_word: mux4to1 generic map(M => 2) port map (sel => sel_block(1 downto 0), d0 => std_logic_vector(to_unsigned(counter_out_128, 2)), d1 => std_logic_vector(to_unsigned(counter_out_192, 2)), d2 => std_logic_vector(to_unsigned(counter_out_256, 2)), d3 => std_logic_vector(to_unsigned(counter_out_256, 2)), y => counter);
	mux_key_word: mux_generic generic map(DATA_WIDTH => 32, NUM_INPUTS => 8) port map(sel => sel_block, data_in =>
	"00000000000000000000000000000000" &
	"00000000000000000000000000000000" &
	data_out_rossler &
	data_out_lorenz &
	data_out_mlog &
	key_word_256 &
	key_word_192 &
	key_word_128,
	data_out => key_word
	);
	mux_counter_word: mux_generic generic map(DATA_WIDTH => 2, NUM_INPUTS => 8) port map(sel => sel_block, data_in =>
	"00" &
	"00" &
	std_logic_vector(to_unsigned(counter_out_rossler, 2)) &
	std_logic_vector(to_unsigned(counter_out_lorenz, 2)) &
	std_logic_vector(to_unsigned(counter_out_mlog, 2)) &
	std_logic_vector(to_unsigned(counter_out_256, 2)) &
	std_logic_vector(to_unsigned(counter_out_192, 2)) &
	std_logic_vector(to_unsigned(counter_out_128, 2)),
	data_out => counter
	);
		
end behave;