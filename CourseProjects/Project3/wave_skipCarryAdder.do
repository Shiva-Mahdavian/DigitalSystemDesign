onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label a /tb_skipcarryadder/a
add wave -noupdate -label b /tb_skipcarryadder/b
add wave -noupdate -label sum /tb_skipcarryadder/sum
add wave -noupdate -label cin /tb_skipcarryadder/cin
add wave -noupdate -label cout /tb_skipcarryadder/cout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 139
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
WaveRestoreZoom {0 ps} {147 ns}
