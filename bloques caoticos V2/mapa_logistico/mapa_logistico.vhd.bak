library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mapa_logistico is
  generic (
    N : integer := 16  -- número de bits fraccionarios
  );
  port (
    clk     : in  std_logic;
    load    : in  std_logic;              -- cuando =0 carga x_init
    x_init  : in  unsigned(N-1 downto 0); -- valor inicial
    x_out   : out unsigned(N-1 downto 0)  -- salida del mapa
  );
end entity;

architecture rtl of mapa_logistico is
  signal x_reg  : unsigned(N downto 0); -- valor actual (registro)
  signal diff   : unsigned(N-1 downto 0); -- (1 - x)
  signal prod   : unsigned(2*N-1 downto 0); -- 4x*(1-x)
  signal diff_1   : unsigned(N downto 0); -- (1 - x)
  signal x_out_MSB   : unsigned(N-1 downto 0); -- siguiente valor

  constant one : unsigned(N downto 0) := (N => '1', others => '0'); 
  -- 1.0 en Q1.N
begin

  -- cálculo combinacional sobre el valor actual
  diff_1 <= one - x_reg;
  diff <= diff_1(N-1 downto 0);
  prod  <= x_reg(N-1 downto 0) * diff;
  
  x_out_MSB  <= prod(2*N-3 downto N-2);--hay q desprecias los dos bits mas significativos y quedarse con los N sguientes

  -- registro con carga de inicialización
  reg: process(clk,load)
  begin
  if rising_edge(clk) then 
      if load = '0' then
        x_reg <= '0' & x_init;  -- carga inicial cuando load=0
      else
        x_reg <= '0' &  x_out_MSB;    -- siguiente valor del mapa
      end if;
end if;
  end process;

  x_out <= x_reg(N-1 downto 0);

end architecture;
