--    Designer: DTE
--    Versi�n: 1.0
--    Fecha: 28-11-2016 


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.pack_agente_slave_i2c.all;

entity test_prototipo_medida_TH is
end entity;

architecture test of test_prototipo_medida_TH is
  signal clk:      std_logic;
  signal nRst:     std_logic;
  signal seg:      std_logic_vector(6 downto 0);
  signal mux_disp: std_logic_vector(4 downto 0);
  signal SDA:      std_logic;                    
  signal SCL:      std_logic;                     


  signal transfer_i2c:     t_transfer_i2c;
  signal put_transfer_i2c: std_logic;       

  constant Tclk:   time := 20 ns; 

  constant add_i2c: std_logic_vector(6 downto 0) := "1000000";

  constant escalado: natural := 150;

begin
  dut: entity work.prototipo_medida_TH(estructural)
       generic map(fdc_timer_2_5ms => escalado)              -- Factor de escala
       port map(clk         => clk,
                nRst        => nRst,
                seg         => seg,
                mux_disp    => mux_disp,
                SDA         => SDA,
                SCL         => SCL);

  SDA <= 'H';  --Pull-ups
  SCL <= 'H';

  U0_sim: entity work.driver_clk_nRst(sim)
          generic map(Tclk => Tclk)
          port map(clk  => clk,
                   nRst => nRst);

  U1_slv: entity work.agente_slave_i2c(sim_struct)
          generic map(config_item => (slave_id => hdc_1000, add => add_i2c)) 
          port map(nRst             => nRst,
                   SCL              => SCL,
                   SDA              => SDA,
                   transfer_i2c     => transfer_i2c,
                   put_transfer_i2c => put_transfer_i2c);   

  U2_mon: entity work.monitor_bus_i2c(sim)
          port map(SCL => SCL,
                   SDA => SDA); 

end test;
