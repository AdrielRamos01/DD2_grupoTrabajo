onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/nRst
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/clk
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/tic
add wave -noupdate -expand -group dut -radix binary /test_ctrl_tec/dut/columna
add wave -noupdate -expand -group dut -radix binary /test_ctrl_tec/dut/fila
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/tecla_pulsada
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/pulso_largo
add wave -noupdate -expand -group dut -radix hexadecimal /test_ctrl_tec/dut/tecla
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/columna_activada
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/col_sinRebotes
add wave -noupdate -expand -group dut -radix unsigned /test_ctrl_tec/dut/cuenta
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/tic_2s
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/ena_corto
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/ena_largo
add wave -noupdate -expand -group dut /test_ctrl_tec/dut/modulo2s
add wave -noupdate -expand -group estim /test_ctrl_tec/estim/duracion_test
add wave -noupdate -expand -group estim -radix hexadecimal /test_ctrl_tec/estim/tecla_test
add wave -noupdate -expand -group estim -radix hexadecimal /test_ctrl_tec/estim/tecla_id
add wave -noupdate -expand -group estim /test_ctrl_tec/estim/pulsar_tecla
add wave -noupdate -expand -group mon /test_ctrl_tec/mon/pulsar_tecla
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 60
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
WaveRestoreZoom {0 ps} {262512 ps}
