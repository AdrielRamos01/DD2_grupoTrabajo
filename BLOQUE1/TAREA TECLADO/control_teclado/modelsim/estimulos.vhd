--------------------------------------------------------------------------------------------------
-- Autor: DTE
-- Version:3.0
-- Fecha: 17-02-2021
--------------------------------------------------------------------------------------------------
-- Estimulos para el test del controlador de teclado.
-- El reloj y el reset as�ncrono se aplican directamente en elnivel superior de la jerarquia del
-- test
--------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.pack_test_teclado.all;

entity estimulos is port(
  clk: in std_logic;
  tic: in std_logic;
  duracion_test: buffer time;
  tecla_test: buffer std_logic_vector(3 downto 0);
  tecla_id: buffer std_logic_vector(3 downto 0);
  pulsar_tecla: buffer std_logic
  );
end entity;

architecture test of estimulos is

begin

stim: process
  begin
    tecla_id <= (others => '0');
    pulsar_tecla <= '0';
    wait for 30*T_CLK;
    wait until clk'event and clk = '1';
    -- Para completar por los estudiantes (inicio)
    -- ...

    --TEST 1: 16 PULSACIONES CORTAS DE 3000ns cada una
  
   for i in 0 to 15  loop
      pulsa_tecla(clk, tecla_id, pulsacion_corta, tecla_test, duracion_test, pulsar_tecla);
      espera_TIC(clk, tic, 20);
      tecla_id <= tecla_id + 1;
    end loop; -- <name>
    tecla_id <= (others => '0');
    report "se ha acabado el test de las pulsaciones cortas de 3000ns";

    --TEST 2: 16 PULSACIONES LARGAS DE 8000ns cada una

    for i in 0 to 15  loop
      pulsa_tecla(clk, tecla_id, pulsacion_larga, tecla_test, duracion_test, pulsar_tecla);
      espera_TIC(clk, tic, 20);
      tecla_id <= tecla_id + 1;
    end loop; -- <name>
    tecla_id <= (others => '0');
    report "se ha acabado el test de las pulsaciones largas de 8000ns";

        --TEST 3: 16 PULSACIONES CORTAS_MAXIMAS DE 5000ns cada una
  
   for i in 0 to 15  loop
    pulsa_tecla(clk, tecla_id, pulsacion_corta, tecla_test, duracion_test, pulsar_tecla);
    espera_TIC(clk, tic, 10);
    tecla_id <= tecla_id + 1;
  end loop; -- <name>
  tecla_id <= (others => '0');
  report "se ha acabado el test de las pulsaciones cortas de 5000ns";

  --TEST 4: 16 PULSACIONES LARGAS_MINIMAS DE 7000ns cada una

  for i in 0 to 15  loop
    pulsa_tecla(clk, tecla_id, pulsacion_larga, tecla_test, duracion_test, pulsar_tecla);
    espera_TIC(clk, tic, 10);
    tecla_id <= tecla_id + 1;
  end loop; -- <name>
  tecla_id <= (others => '0');
  report "se ha acabado el test de las pulsaciones largas de 7000ns";

	
    -- Para completar por los estudiantes (fin) 
    assert(false) report "******************************Fin del test************************" severity failure;
  end process;

end test;