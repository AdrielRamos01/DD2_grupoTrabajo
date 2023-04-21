library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ctrl_tec is
port (
nRst: in std_logic;
clk: in std_logic;
tic: in std_logic;
columna: in std_logic_vector (3 downto 0);
fila: buffer std_logic_vector (3 downto 0);
tecla_pulsada: buffer std_logic;
pulso_largo: buffer std_logic;
tecla: buffer std_logic_vector(3 downto 0));
end ctrl_tec;

architecture rtl of ctrl_tec is
signal columna_activada: std_logic;
signal col_sinRebotes: std_logic_vector(3 downto 0);
signal cuenta: std_logic_vector(8 downto 0);
signal tic_2s: std_logic;
signal ena_corto: std_logic;
signal ena_largo : std_logic;
signal tecla_aux: std_logic_vector(3 downto 0);

constant modulo2s: natural := 10;


begin

-- Or columnas
columna_activada <= '1' when columna /= "1111" else
                    '0';


-- Muestreo de las filas
process(clk, nRst)
begin
if nRst = '0' then
  fila <= "1110";
elsif clk'event and clk = '1' then
  if tic = '1' then 
    if columna_activada = '0'  then
    fila <= fila(2 downto 0)&fila(3);
    end if;
  end if;
end if;
end process;

-- Gestion de rebotes
process(clk, nRst)
begin
if nRst = '0' then
  col_sinRebotes <= "1111";
elsif clk'event and clk = '1' then
  if tic = '1' then
    col_sinRebotes <= columna;
  end if;
end if;
end process;



-- Proceso para cuenta de 2s
process (clk, nRst)
begin

  if nRst = '0' then
    cuenta <= (others => '0');
  elsif clk'event and clk = '1' then
    if tic = '1' then
      if columna_activada = '0' then   -- cuando no hay columnas activadas se resetea
        cuenta <= (others => '0');
      elsif cuenta <= modulo2s then
        cuenta <= cuenta + 1;
         
      end if;
    end if;
  end if;
end process;

-- activacion fin de cuenta del tic 2s
tic_2s <= '1' when cuenta = modulo2s else
          '0';




-- proceso conformador de pulso (pulsacion corta)
process(clk, nRst)
begin
  if nRst = '0' then
    ena_corto <= '0';
  elsif clk'event and clk = '1' then
    ena_corto <= columna_activada;
  end if;
end process;

tecla_pulsada <= '1' when ena_corto = '0' and columna_activada = '1' and pulso_largo = '0' else   
                 '0';

-- proceso para determinar pulso largo
process(clk, nRst)
begin
  if nRst = '0' then
    ena_largo <= '0';
  elsif clk'event and clk = '1' then
    ena_largo <= pulso_largo;
  end if;
end process;

pulso_largo <= '1' when columna_activada = '1' and tic_2s = '1' else
              '0'; 


-- Detectar la tecla pulsada
tecla_aux <= "0000" when fila(3) = '0' and col_sinRebotes(1) = '0' else -- 0
             "0001" when fila(0) = '0' and col_sinRebotes(0) = '0' else -- 1
             "0010" when fila(0) = '0' and col_sinRebotes(1) = '0' else -- 2
             "0011" when fila(0) = '0' and col_sinRebotes(2) = '0' else -- 3
             "0100" when fila(1) = '0' and col_sinRebotes(0) = '0' else -- 4
             "0101" when fila(1) = '0' and col_sinRebotes(1) = '0' else -- 5
             "0110" when fila(1) = '0' and col_sinRebotes(2) = '0' else -- 6
             "0111" when fila(2) = '0' and col_sinRebotes(0) = '0' else -- 7
             "1000" when fila(2) = '0' and col_sinRebotes(1) = '0' else -- 8
             "1001" when fila(2) = '0' and col_sinRebotes(2) = '0' else -- 9
             "1010" when fila(3) = '0' and col_sinRebotes(0) = '0' else -- A
             "1011" when fila(3) = '0' and col_sinRebotes(2) = '0' else -- B
             "1100" when fila(3) = '0' and col_sinRebotes(3) = '0' else -- C
             "1101" when fila(2) = '0' and col_sinRebotes(3) = '0' else -- D
             "1110" when fila(1) = '0' and col_sinRebotes(3) = '0' else -- E
             "1111" when fila(0) = '0' and col_sinRebotes(3) = '0' else -- F
             "XXXX"; 	

tecla <= tecla_aux when tecla_pulsada = '1' else
	 tecla_aux when pulso_largo = '1' else
         "XXXX";				         

end rtl;

