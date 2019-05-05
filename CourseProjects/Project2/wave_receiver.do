onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_receiver/clk_tb
add wave -noupdate /tb_receiver/dut/clk
add wave -noupdate /tb_receiver/nrst
add wave -noupdate /tb_receiver/tb_in
add wave -noupdate /tb_receiver/dut/currentS
add wave -noupdate /tb_receiver/dut/nextS
add wave -noupdate /tb_receiver/strobe
add wave -noupdate /tb_receiver/dut/data_out
add wave -noupdate /tb_receiver/tb_out
add wave -noupdate /tb_receiver/dut/nreset
add wave -noupdate /tb_receiver/dut/rx
add wave -noupdate /tb_receiver/dut/strobe
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 151
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
WaveRestoreZoom {0 ps} {487775 ps}
