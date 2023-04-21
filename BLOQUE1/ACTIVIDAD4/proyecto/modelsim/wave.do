onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/clk
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/nRst
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/we
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/rd
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/add
add wave -noupdate -expand -group DUT -radix hexadecimal /test_periferico_i2c/dut/dato_in
add wave -noupdate -expand -group DUT -radix hexadecimal /test_periferico_i2c/dut/dato_out
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/SDA
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/SCL
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/ini
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/dato_in_i2c
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/last_byte
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/fin_tx
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/tx_ok
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/fin_byte
add wave -noupdate -expand -group DUT /test_periferico_i2c/dut/dato_out_i2c
add wave -noupdate -expand -group U1 /test_periferico_i2c/U1_sim/put_tr
add wave -noupdate -expand -group U1 -radix hexadecimal /test_periferico_i2c/U1_sim/tr
add wave -noupdate -expand -group U1 /test_periferico_i2c/U1_sim/put_ibr
add wave -noupdate -expand -group U1 -radix hexadecimal /test_periferico_i2c/U1_sim/item_ibr
add wave -noupdate -expand -group U1 /test_periferico_i2c/U1_sim/put_seq_driver
add wave -noupdate -expand -group U1 /test_periferico_i2c/U1_sim/done_driver_seq
add wave -noupdate -expand -group U1 -radix hexadecimal /test_periferico_i2c/U1_sim/item_seq_driver
add wave -noupdate -expand -group U1 /test_periferico_i2c/U1_sim/put_colec_monitor
add wave -noupdate -expand -group U1 -radix hexadecimal /test_periferico_i2c/U1_sim/item_colec_monitor
add wave -noupdate -expand -group U2 /test_periferico_i2c/U2_sim/SCL
add wave -noupdate -expand -group U2 /test_periferico_i2c/U2_sim/SDA
add wave -noupdate -expand -group U2 -radix hexadecimal /test_periferico_i2c/U2_sim/transfer_i2c
add wave -noupdate -expand -group U2 /test_periferico_i2c/U2_sim/put_transfer_i2c
add wave -noupdate -expand -group U2 -radix hexadecimal /test_periferico_i2c/U2_sim/item_seq_resp
add wave -noupdate -expand -group U2 /test_periferico_i2c/U2_sim/get_resp_seq
add wave -noupdate -expand -group U2 -radix hexadecimal /test_periferico_i2c/U2_sim/item_col_mon
add wave -noupdate -expand -group U2 /test_periferico_i2c/U2_sim/put_col_mon
add wave -noupdate -expand -group U2 -radix hexadecimal /test_periferico_i2c/U2_sim/byte_i2c
add wave -noupdate -expand -group U2 /test_periferico_i2c/U2_sim/put_mon_seq
add wave -noupdate -expand -group U3 /test_periferico_i2c/U3_sim/put_ibr
add wave -noupdate -expand -group U3 /test_periferico_i2c/U3_sim/tr_item_ibr
add wave -noupdate -expand -group U3 /test_periferico_i2c/U3_sim/tr_item_slave_i2c
add wave -noupdate -expand -group U3 /test_periferico_i2c/U3_sim/put_slave_i2c
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/SCL
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/SDA
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/START
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/T_START
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/STOP
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/T_STOP
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/SCL_UP
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/T_SCL_UP
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/SCL_DOWN
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/T_SCL_DOWN
add wave -noupdate -expand -group U4 /test_periferico_i2c/U4_sim/SDA_event
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {98185000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 142
configure wave -valuecolwidth 100
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
WaveRestoreZoom {4817414163 ps} {5293762413 ps}
