onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_transmitter/clk_tb
add wave -noupdate /tb_transmitter/nrst
add wave -noupdate /tb_transmitter/start
add wave -noupdate /tb_transmitter/out_tb
add wave -noupdate /tb_transmitter/data
add wave -noupdate -divider {States and counter}
add wave -noupdate /tb_transmitter/dut/currentS
add wave -noupdate /tb_transmitter/dut/nextS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {367 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 291
configure wave -valuecolwidth 138
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {833 ps}
