onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label A /tb_skipcarryblock/a
add wave -noupdate -label B /tb_skipcarryblock/b
add wave -noupdate -label S /tb_skipcarryblock/sum
add wave -noupdate -label Cin /tb_skipcarryblock/cin
add wave -noupdate -label Cout /tb_skipcarryblock/cout
add wave -noupdate -divider {skip Carry block}
add wave -noupdate -label {middle carry} /tb_skipcarryblock/dut/c
add wave -noupdate -label {instance p} /tb_skipcarryblock/dut/p
add wave -noupdate -label {& P} /tb_skipcarryblock/dut/propagate
add wave -noupdate -divider {Adder 0}
add wave -noupdate -label a /tb_skipcarryblock/dut/sumLogic(0)/adder/a_in
add wave -noupdate -label b /tb_skipcarryblock/dut/sumLogic(0)/adder/b_in
add wave -noupdate -label cin /tb_skipcarryblock/dut/sumLogic(0)/adder/c_in
add wave -noupdate -label s /tb_skipcarryblock/dut/sumLogic(0)/adder/s_out
add wave -noupdate -label p /tb_skipcarryblock/dut/sumLogic(0)/adder/p_out
add wave -noupdate -label cout /tb_skipcarryblock/dut/sumLogic(0)/adder/c_out
add wave -noupdate -label g /tb_skipcarryblock/dut/sumLogic(0)/adder/g
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3162 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 122
configure wave -valuecolwidth 78
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
WaveRestoreZoom {0 ps} {71435 ps}
