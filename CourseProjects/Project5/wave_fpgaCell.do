onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fpgacell/dut/prog_en
add wave -noupdate /tb_fpgacell/dut/prog_in
add wave -noupdate /tb_fpgacell/dut/prog_clk
add wave -noupdate /tb_fpgacell/dut/clb/regWire
add wave -noupdate /tb_fpgacell/dut/cb/regWire
add wave -noupdate /tb_fpgacell/dut/sb/regWire
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 241
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {915 ps}
