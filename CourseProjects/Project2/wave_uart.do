onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_uart/clk_tb
add wave -noupdate -label nreset /tb_uart/nrst
add wave -noupdate -label left_in /tb_uart/leftI
add wave -noupdate -label left_out /tb_uart/leftO
add wave -noupdate -label right_in /tb_uart/rightI
add wave -noupdate -label right_out /tb_uart/rightO
add wave -noupdate -divider {middle signals}
add wave -noupdate -label leftStart /tb_uart/leftStart
add wave -noupdate -label busOI /tb_uart/busOI
add wave -noupdate -label rightStart /tb_uart/rightStart
add wave -noupdate -label busIO /tb_uart/busIO
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75695 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 341
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
WaveRestoreZoom {0 ps} {258079 ps}
