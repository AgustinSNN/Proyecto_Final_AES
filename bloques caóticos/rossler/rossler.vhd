library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rossler is
  generic (
    N : integer := 18;  -- número total de bits 
	 M : integer := 8; -- numero de bits fraccionarios
	 a : integer := 3; -- shift_right
	 b : integer := 3; -- shift_right
	 c : integer := 4; -- shift_left 
	 time_step : integer := 4 -- shift_right
  );
  port (
    clk     : in  std_logic;
    load    : in  std_logic;              -- cuando =0 carga x_init
    --x_init  : in  signed(N-1 downto 0); -- valor inicial
--	 y_init  : in  signed(N-1 downto 0);
--	 z_init  : in  signed(N-1 downto 0);
	
--	 clk_test : out std_logic;
	
	 x_out   : out signed(N-1 downto 0); -- salida 
	 y_out   : out signed(N-1 downto 0);
    z_out   : out signed(N-1 downto 0)  
  );
end entity;

architecture behave of rossler is

--	component clk_div is
--		port	(	clk: in  std_logic ;
--				clkOut	: out std_logic
--		);
--	end component;

	constant x_init : signed (N-1 downto 0) := "000000000100000000";
	constant y_init : signed (N-1 downto 0) := "000000000100000000";
	constant z_init : signed (N-1 downto 0) := "000000000000000000";
	
	constant b_constant : signed(2*N downto 0):= shift_left(to_signed(1,2*N+1), 2*M-b);
	
--	signal clk_2 :std_logic;

	signal x_reg  : signed(N-1 downto 0); -- valor actual (registro)
	signal y_reg  : signed(N-1 downto 0); -- valor actual (registro)
	signal z_reg  : signed(N-1 downto 0); -- valor actual (registro)
	
	signal x_aux : signed(N downto 0); -- asumo que no hay overflow
	signal y_aux : signed(N downto 0); 
	signal z_aux : signed(2*N downto 0);
	
	signal prod_xz : signed (2*N-1 downto 0);

begin

--	--------clock----------
--	clock: clk_div port map (clk => clk, clkOut => clk_2);
--	clk_test <= clk_2;
--	-----------------------
	
	x_aux <= -resize(y_reg, N+1) - resize(z_reg, N+1);
	
	y_aux <= resize(x_reg, N+1) + shift_right(resize(y_reg, N+1), a);
	
	prod_xz <= x_reg*z_reg;
	z_aux <= b_constant + resize(prod_xz, 2*N+1) - shift_left(resize(z_reg, 2*N+1), c+M);
	
	-- salidas
	x_out <= x_reg;
	y_out <= y_reg;
	z_out <= z_reg;
		
	process (clk, load)
	begin
		if rising_edge(clk) then 
			if load = '0' then
				x_reg <= x_init;  -- carga inicial cuando load=0
				y_reg <= y_init;
				z_reg <= z_init;
			else
				x_reg <= x_reg + resize(shift_right(x_aux, time_step), N);	-- siguiente valor de la variable
				y_reg <= y_reg + resize(shift_right(y_aux, time_step), N);
				z_reg <= z_reg + resize(shift_right(z_aux, time_step + M), N);
				
			end if;
		end if;
  end process;
  
end architecture; 