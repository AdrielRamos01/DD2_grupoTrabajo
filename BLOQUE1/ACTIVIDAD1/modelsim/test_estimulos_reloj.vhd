library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.pack_test_reloj.all;

entity test_estimulos_reloj is
port(clk:     	  in std_logic;
     nRst:        in std_logic;
     tic_025s:    out std_logic;
     tic_1s:      out std_logic;
     ena_cmd:     out std_logic;
     cmd_tecla:   out std_logic_vector(3 downto 0);
     pulso_largo: out std_logic;
     modo:        in std_logic;
     segundos:    in std_logic_vector(7 downto 0);
     minutos:     in std_logic_vector(7 downto 0);
     horas:       in std_logic_vector(7 downto 0);
     AM_PM:       in std_logic;
     info:        in std_logic_vector(1 downto 0)
    );
end entity;

architecture test of test_estimulos_reloj is
 signal suma_horas: std_logic_vector(7 downto 0);
 signal AM_PM_aux:  std_logic;
begin
  -- Tic para el incremento continuo de campo. Escalado. 
  process
  begin
    tic_025s <= '0';
    for i in 1 to 3 loop
       wait until clk'event and clk = '1';
    end loop;

    tic_025s <= '1';
    wait until clk'event and clk = '1';

  end process;
  -- Tic de 1 seg. Escalado.
  process
  begin
    tic_1s <= '0';
    for i in 1 to 15 loop
       wait until clk'event and clk = '1';
    end loop;

    tic_1s <= '1';
    wait until clk'event and clk = '1';

  end process;


  process
  begin
    ena_cmd  <= '0';
    cmd_tecla <= (others => '0');
    pulso_largo <= '0';
    suma_horas <= (others => '0');
    AM_PM_aux <= '0';
    -- Esperamos el final del Reset
    wait until nRst'event and nRst = '1';

    for i in 1 to 9 loop
       wait until clk'event and clk = '1';
    end loop;
----------------------------------------------------------------------------------------------------------
----------------------------------    COMIENZO DE LOS TEST    --------------------------------------------
----------------------------------------------------------------------------------------------------------


-- TEST 1: Comprobamos que la hora puede representarse de forma correcta en AM y en PM
--         Para ello, esperamos 1 hora (con ayuda de un aux) y cmabiamos a 12h y de nuevo a 24h
--         Este proceso lo repetimos para todas las horas, incluyendo el cambio de 23.59 a 0.00

   for i in 1 to 24 loop
   cambiar_modo_12_24(ena_cmd, cmd_tecla, clk); -- MODO 24
   wait until clk'event and clk = '1';
   esperar_hora(horas, minutos, AM_PM, clk, AM_PM_aux ,suma_horas&X"00");

   suma_horas(3 downto 0) <= suma_horas(3 downto 0)+1;
   wait until clk'event and clk = '1';

   cambiar_modo_12_24(ena_cmd, cmd_tecla, clk); -- MODO 12
   wait until clk'event and clk = '1';

   --CONTROL DEL VALOR AUXILIAR DE HORAS
     if(suma_horas(3 downto 0) > 9) then
	suma_horas(3 downto 0) <=(others => '0');
        suma_horas(7 downto 4) <= suma_horas(7 downto 4)+1;
     end if;
   --CONTROL DEL VALOR AUXILIAR DE AM-PM
     if (suma_horas = X"12") then
       AM_PM_aux <= not AM_PM_aux;
     end if;
   end loop;
  
   --RESET DE VALORES AUXILIARES
   suma_horas <= (others => '0');
   AM_PM_aux <= '0';

   wait until clk'event and clk = '1';
   cambiar_modo_12_24(ena_cmd, cmd_tecla, clk); -- MODO 24, es más comodo para nosotros
   wait until clk'event and clk = '1';

   report "TEST 1 ACABADO";

-- TEST 2: Comprobamos que la funcionalidad de incrementar la hora con pulsaciones cortas funciona
--         Para ello, entramos en modo programacion y hacemos todos los incrementos
--         Antes de entrar pondremos el reloj en una hora reconocible. Por ejemplo las 00.00 e incrementamos hasta
--         las 23.59, para cubrir todas las posibilidades.
--         Evidentemente nos ayudamos del procedimiento "programar hora corto"

    -- Preparamos la hora en valor reconocible 00.00
    esperar_hora(horas, minutos, AM_PM, clk, '0', X"00"&X"00"); 
    wait until clk'event and clk = '1';

    entrar_modo_prog(pulso_largo,cmd_tecla,clk,15);
    wait until clk'event and clk = '1';

    -- Incrimentamos hasta las 23.59
    programar_hora_inc_corto(ena_cmd,cmd_tecla,horas,minutos,AM_PM,clk,'1',X"2359");
    wait until clk'event and clk = '1';

    fin_prog(ena_cmd,cmd_tecla,clk);
    wait until clk'event and clk = '1';

    report "TEST 2 ACABADO";

-- TEST 3: Comprobamos que la funcionalidad de incrementar la hora con pulsaciones largas funciona
--         Para ello, entramos en modo programacion y hacemos todos los incrementos
--         Antes de entrar pondremos el reloj en una hora reconocible. Por ejemplo las 00.00 e incrementamos hasta
--         las 23.59, para cubrir todas las posibilidades.
--         Evidentemente nos ayudamos del procedimiento "programar hora largo"

    -- Preparamos la hora en valor reconocible 00.00
    esperar_hora(horas, minutos, AM_PM, clk, '0', X"00"&X"00"); 
    wait until clk'event and clk = '1';

    entrar_modo_prog(pulso_largo,cmd_tecla,clk,15);
    wait until clk'event and clk = '1';

    -- Incrimentamos hasta las 23.59
    programar_hora_inc_largo(pulso_largo,ena_cmd,cmd_tecla,horas,minutos,AM_PM,clk,'1',X"2359");
    wait until clk'event and clk = '1';

    fin_prog(ena_cmd,cmd_tecla,clk);
    wait until clk'event and clk = '1';

    report "TEST 3 ACABADO";

-- TEST 4: Comprobamos que la funcionalidad de programar hora directa
--         Para ello, entramos en modo programacion y hacemos varias programaciones
--         Antes de entrar pondremos el reloj en una hora reconocible. Por ejemplo las 00.00
--         Evidentemente nos ayudamos del procedimiento "programar hora directa"

    -- Programamos las 7.30 (1 unidad en decenas en AM)
    entrar_modo_prog(pulso_largo,cmd_tecla,clk,15);
    wait until clk'event and clk = '1'; 
    programar_hora_directa(ena_cmd,cmd_tecla,clk,X"0730");
    wait until clk'event and clk = '1';
    fin_prog(ena_cmd,cmd_tecla,clk);
    wait until clk'event and clk = '1';

    -- Programamos las 11.15 (2 unidades en decenas en AM)
    entrar_modo_prog(pulso_largo,cmd_tecla,clk,15);
    wait until clk'event and clk = '1'; 
    programar_hora_directa(ena_cmd,cmd_tecla,clk,X"1115");
    wait until clk'event and clk = '1';
    fin_prog(ena_cmd,cmd_tecla,clk);
    wait until clk'event and clk = '1';

    -- Programamos las 17.45 (2 unidad en decenas en PM)
    entrar_modo_prog(pulso_largo,cmd_tecla,clk,15);
    wait until clk'event and clk = '1'; 
    programar_hora_directa(ena_cmd,cmd_tecla,clk,X"1745");
    wait until clk'event and clk = '1';
    fin_prog(ena_cmd,cmd_tecla,clk);
    wait until clk'event and clk = '1';

    -- Programamos las 23.59 (Caso límite)
    entrar_modo_prog(pulso_largo,cmd_tecla,clk,15);
    wait until clk'event and clk = '1'; 
    programar_hora_directa(ena_cmd,cmd_tecla,clk,X"2359");
    wait until clk'event and clk = '1';
    fin_prog(ena_cmd,cmd_tecla,clk);
    wait until clk'event and clk = '1';

    report "TEST 4 ACABADO";

-- TEST 5: Comprobamos que la funcionalidad del TimeOut de 7 segundos
--         Para ello, entramos en modo programacion y esperamos un total de 7 segundos
--         No es necesario colocar el reloj en reconocible antes de hacer este test
--         Evidentemente nos ayudamos del procedimiento "time_out"

    entrar_modo_prog(pulso_largo,cmd_tecla,clk,15);
    wait until clk'event and clk = '1'; 
    time_out (clk);
    wait until clk'event and clk = '1'; 

    report "TEST 5 ACABADO";
----------------------------------------------------------------------------------------------------------
------------------------------------    FINAL DE LOS TEST    ---------------------------------------------
----------------------------------------------------------------------------------------------------------
 
  assert false report "FIN DE SIMULACION" severity failure;
  end process;

end test;
