library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lorenz is
  generic (
    N : integer := 7;  -- número de bits enteros
	 M : integer := 7;
	 sigma : integer := 3; -- shift_left = *8
	 b : integer := 1; -- shift_left = *2
	 r : integer := 5; -- shift_left = *32 
	 time_step : integer := 6 -- shift_right = *0.125
  );
  port (
    clk     : in  std_logic;
    load    : in  std_logic;              -- cuando =0 carga x_init
    --x_init  : in  signed(N-1 downto 0); -- valor inicial
--	 y_init  : in  signed(N-1 downto 0);
--	 z_init  : in  signed(N-1 downto 0);
	
--	 clk_test : out std_logic;
	
	 x_out   : out signed(N+M-1 downto 0); -- salida 
	 y_out   : out signed(N+M-1 downto 0);
    z_out   : out signed(N+M-1 downto 0)  
  );
end entity;

architecture behave of lorenz is

--	component clk_div is
--		port	(	clk: in  std_logic ;
--				clkOut	: out std_logic
--		);
--	end component;

	constant x_init : signed (N+M-1 downto 0) := "00010100000000";
	constant y_init : signed (N+M-1 downto 0) := "11101100000000";
	constant z_init : signed (N+M-1 downto 0) := "00100000000000";
	
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
				x_reg <= resize(x_reg_resized + x_aux_shifted, N+M);	-- siguiente valor de la variable
				y_reg <= resize(shift_right(y_reg_resized + y_aux_shifted , M), N+M);
				z_reg <= resize(shift_right(z_reg_resized + z_aux_shifted , M), N+M);
				
			end if;
		end if;
  end process; 
  
 end architecture;
  ---------------------------------------------------------------
