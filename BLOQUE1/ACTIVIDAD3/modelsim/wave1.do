onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_basico_interfaz_i2c/dut/clk
add wave -noupdate /test_basico_interfaz_i2c/dut/nRst
add wave -noupdate /test_basico_interfaz_i2c/dut/ini
add wave -noupdate -radix hexadecimal /test_basico_interfaz_i2c/dut/dato_in
add wave -noupdate /test_basico_interfaz_i2c/dut/last_byte
add wave -noupdate /test_basico_interfaz_i2c/dut/fin_tx
add wave -noupdate /test_basico_interfaz_i2c/dut/tx_ok
add wave -noupdate /test_basico_interfaz_i2c/dut/fin_byte
add wave -noupdate -radix hexadecimal /test_basico_interfaz_i2c/dut/dato_out
add wave -noupdate /test_basico_interfaz_i2c/dut/SDA
add wave -noupdate /test_basico_interfaz_i2c/dut/SCL
add wave -noupdate /test_basico_interfaz_i2c/transfer_i2c
add wave -noupdate /test_basico_interfaz_i2c/put_transfer_i2c
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/ena_SCL
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/ena_out_SDA
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/ena_in_SDA
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/ena_stop_i2c
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/ena_start_i2c
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/SCL_up
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/SCL
add wave -noupdate -expand -group gen_SCL -radix unsigned /test_basico_interfaz_i2c/dut/U0/cnt_SCL
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/n_ctrl_SCL
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/n_ctrl_SCL_arreglada
add wave -noupdate -expand -group gen_SCL /test_basico_interfaz_i2c/dut/U0/start
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/ini
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/last_byte
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/tipo_op_nW_R
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/ena_in_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/ena_out_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/ena_stop_i2c
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/ena_start_i2c
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/SCL_up
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/fin_tx
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/tx_ok
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/fin_byte
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/ena_SCL
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/carga_reg_out_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/reset_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/preset_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/desplaza_reg_out_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/leer_bit_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/reset_reg_in_SDA
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/estado
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/cnt_pulsos_SCL
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/nWR_op
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/nWR
add wave -noupdate -expand -group ctrl_i2c /test_basico_interfaz_i2c/dut/U1/ACK_lectura
add wave -noupdate -expand -group reg_out_sda -radix hexadecimal /test_basico_interfaz_i2c/dut/U2/dato_in
add wave -noupdate -expand -group reg_out_sda /test_basico_interfaz_i2c/dut/U2/carga_reg_out_SDA
add wave -noupdate -expand -group reg_out_sda /test_basico_interfaz_i2c/dut/U2/reset_SDA
add wave -noupdate -expand -group reg_out_sda /test_basico_interfaz_i2c/dut/U2/preset_SDA
add wave -noupdate -expand -group reg_out_sda /test_basico_interfaz_i2c/dut/U2/desplaza_reg_out_SDA
add wave -noupdate -expand -group reg_out_sda /test_basico_interfaz_i2c/dut/U2/SDA_out
add wave -noupdate -expand -group reg_out_sda -radix hexadecimal /test_basico_interfaz_i2c/dut/U2/reg_SDA
add wave -noupdate -expand -group filtro_SDA /test_basico_interfaz_i2c/dut/U3/SDA_in
add wave -noupdate -expand -group filtro_SDA /test_basico_interfaz_i2c/dut/U3/SDA_filtrado
add wave -noupdate -expand -group filtro_SDA /test_basico_interfaz_i2c/dut/U3/SDA_in_T
add wave -noupdate -expand -group filtro_SDA /test_basico_interfaz_i2c/dut/U3/SDA_T_0
add wave -noupdate -expand -group filtro_SDA /test_basico_interfaz_i2c/dut/U3/SDA_T_0_flipflop
add wave -noupdate -expand -group reg_in_SDA /test_basico_interfaz_i2c/dut/U4/SDA_in
add wave -noupdate -expand -group reg_in_SDA /test_basico_interfaz_i2c/dut/U4/leer_bit_SDA
add wave -noupdate -expand -group reg_in_SDA /test_basico_interfaz_i2c/dut/U4/reset_reg_in_SDA
add wave -noupdate -expand -group reg_in_SDA -radix hexadecimal /test_basico_interfaz_i2c/dut/U4/dato_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 172
configure wave -valuecolwidth 52
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1554 ps}
