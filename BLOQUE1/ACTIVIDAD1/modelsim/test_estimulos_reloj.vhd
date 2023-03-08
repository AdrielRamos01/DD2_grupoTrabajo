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

    -- Esperamos el final del Reset
    wait until nRst'event and nRst = '1';

    for i in 1 to 9 loop
       wait until clk'event and clk = '1';
    end loop;

    --MODO NORMAL: 
    -- --> Recordar:(0 --> AM, 1 --> PM)

    -- Cuenta en formato de 12 horas
    wait until clk'event and clk = '1';

    -- Esperar a las 11 y 58 AM
    esperar_hora(horas, minutos, AM_PM, clk, '0', X"11"&X"58"); 

    -- Cambio de 12h a 24 horas
    cambiar_modo_12_24(ena_cmd, cmd_tecla, clk); -- --> deberia mostrar las 12:00 PM

    --Esperar a las 23 y 58 y se cambia el modo 24h a 12 horas
    wait until clk'event and clk = '1';
    esperar_hora(horas, minutos, AM_PM, clk, '1', X"23"&X"58"); --> deberia mostrar las 00:00 AM
    cambiar_modo_12_24(ena_cmd, cmd_tecla, clk);
    
    ---------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- -->Hasta aqui se ha comprobado que el reloj cambia de 12h a 24h y viceversa, y que se realiza correctamente el cambio de AM a PM y viceversa en ambos modos.
    ---------------------------------------------------------------------------------------------------------------------------------------------------------------

    --Esperar a las 11 y 50 PM y se cambia de modo 12h a 24 horas
    wait until clk'event and clk = '1';
    esperar_hora(horas, minutos, AM_PM, clk, '1', X"11"&X"50"); 
    cambiar_modo_12_24(ena_cmd, cmd_tecla, clk); -- --> deberia mostrar las 23:50 PM

    --Esperar a las 13 y 10 y se cambia de modo 24h a 12 horas
    wait until clk'event and clk = '1';
    esperar_hora(horas, minutos, AM_PM, clk, '1', X"13"&X"10"); -- --> deberia mostrar las 1:10 PM
    cambiar_modo_12_24(ena_cmd, cmd_tecla, clk);

    ---------------------------------------------------------------------------
    -- --> Hasta aqui se ha comprobado que el reloj cambia de 12h a 24h en PM.
    ---------------------------------------------------------------------------

    --MODO PROGRAMACION:

    --Estamos en 12 h:

    --Entramos en modo programacion y...
    wait until clk'event and clk = '1';
    entrar_modo_prog(pulso_largo, cmd_tecla, clk, 15);

    wait until clk'event and clk = '1';
    fin_prog(ena_cmd, cmd_tecla, clk);
    --...salimos para probar la pulsacion corta de A.

    --------------------------------------------------------------------------------------------
    -- --> Hasta aqui se ha comprobado la salida del Modo Programacion con pulsacion corta de A.
    --------------------------------------------------------------------------------------------

    --Entramos de nuevo en modo Progamacion...
    wait until clk'event and clk = '1';
    entrar_modo_prog(pulso_largo, cmd_tecla, clk, 15);

    --...programamos las 6 y 13 AM...
    wait until clk'event and clk = '1';
    programar_hora_inc_corto(ena_cmd, cmd_tecla, horas, minutos, AM_PM, clk, '0', X"06"&X"13");
    fin_prog(ena_cmd, cmd_tecla, clk);
    --...y salimos del modo programacion.

    --------------------------------------------------------------------------------------------------------------------
    -- --> Hasta aqui se ha comprobado la edicion del reloj en el Modo Programacion y la salida de este modo pulsanco A.
    --------------------------------------------------------------------------------------------------------------------

    --Cambiamos modo, 12h --> 24h y esperamos hasta las 22 y 10.   
    wait until clk'event and clk = '1';
    cambiar_modo_12_24(ena_cmd, cmd_tecla, clk);
    esperar_hora(horas, minutos, AM_PM, clk, '1', X"22"&X"10"); 

    --Estamos en 24 h:

    --Volvemos a entrar en modo Progamacion para probarlo ahora en modo 24h...
    wait until clk'event and clk = '1';
    entrar_modo_prog(pulso_largo, cmd_tecla, clk, 15);

    --...programamos las 23 y 15...
    wait until clk'event and clk = '1';
    programar_hora_inc_corto(ena_cmd, cmd_tecla, horas, minutos, AM_PM, clk, '1', X"23"&X"15");
    time_out(clk);
    --...y salimos del modo programacion sin pulsar A y dejando pasar los 7 segundos.

    ------------------------------------------------------------------------------------------------------------------------------------
    -- --> Hasta aqui se ha comprobado la edicion del reloj en el Modo Programacion y la salida de este modo con el timer de 7 segundos. 
    ------------------------------------------------------------------------------------------------------------------------------------

    wait until clk'event and clk = '1';
    esperar_hora(horas, minutos, AM_PM, clk, '1', X"23"&X"20"); 

    --Tras esperar hasta la hora anterior, ahora el usuario introduce una hora directamente...
    wait until clk'event and clk = '1';
    entrar_modo_prog(pulso_largo, cmd_tecla, clk, 15);

    wait until clk'event and clk = '1';

    programar_hora_directa(ena_cmd, cmd_tecla, clk, X"10"&X"20");

    wait until clk'event and clk = '1';
    fin_prog(ena_cmd, cmd_tecla, clk);

    ----------------------------------------------------------------------------------------------------------------------
    -- --> Hasta aqui se ha comprobado la edicion del reloj en el Modo Programacion introduciendo los campos directamente.
    ----------------------------------------------------------------------------------------------------------------------

    --...y esperamos hasta las 15 y 00.
    esperar_hora(horas, minutos, AM_PM, clk, '1', X"15"&X"00"); 

    --Por ultimo, efectuamos una prueba mas del modo programacion con la pulsacion larga...
    wait until clk'event and clk = '1';
    entrar_modo_prog(pulso_largo, cmd_tecla, clk, 15);

    wait until clk'event and clk = '1';
    programar_hora_inc_largo(pulso_largo, ena_cmd, cmd_tecla, horas, minutos, AM_PM, clk, '1', X"16"&X"10");
    fin_prog(ena_cmd, cmd_tecla, clk);
    esperar_hora(horas, minutos, AM_PM, clk, '1', X"16"&X"15"); 

    --------------------------------------------------------------------------------------------------------------------
    -- --> Hasta aqui se ha comprobado la edicion del reloj en el Modo Programacion utilizando la pulsacion larga de C.
    --------------------------------------------------------------------------------------------------------------------

    --...tras esperar hasta las 16 h y 15 min --> FIN TEST-BENCH.

    assert false
    report "done"
    severity failure;
  end process;

end test;
