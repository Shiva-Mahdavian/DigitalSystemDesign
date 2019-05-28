onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label prog_clk /tb_fpga4x4_xor4/prg_clk
add wave -noupdate -label prog_en /tb_fpga4x4_xor4/prg_en
add wave -noupdate -label prog_in /tb_fpga4x4_xor4/prg_in
add wave -noupdate -label a /tb_fpga4x4_xor4/l_in(7)
add wave -noupdate -label b /tb_fpga4x4_xor4/l_in(6)
add wave -noupdate -label c /tb_fpga4x4_xor4/l_in(5)
add wave -noupdate -label d /tb_fpga4x4_xor4/l_in(4)
add wave -noupdate -label out /tb_fpga4x4_xor4/r(7)
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5156079 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 269
configure wave -valuecolwidth 115
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
WaveRestoreZoom {3865718 ps} {5217594 ps}
