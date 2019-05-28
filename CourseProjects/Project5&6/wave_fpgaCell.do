onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fpgacell/sumComp/prog_clk
add wave -noupdate /tb_fpgacell/sumComp/l1_in
add wave -noupdate /tb_fpgacell/carryComp/u2_in
add wave -noupdate /tb_fpgacell/carryComp/r4_out
add wave -noupdate /tb_fpgacell/sumComp/r2_out
add wave -noupdate /tb_fpgacell/sumComp/prog_in
add wave -noupdate /tb_fpgacell/prg_en
add wave -noupdate /tb_fpgacell/sumComp/clb/regWire
add wave -noupdate /tb_fpgacell/sumComp/cb/regWire
add wave -noupdate /tb_fpgacell/sumComp/sb/regWire
add wave -noupdate /tb_fpgacell/carryComp/clb/regWire
add wave -noupdate /tb_fpgacell/carryComp/cb/regWire
add wave -noupdate /tb_fpgacell/carryComp/sb/regWire
add wave -noupdate /tb_fpgacell/carryComp/sb/l3_in
add wave -noupdate /tb_fpgacell/carryComp/cb/r3_out
add wave -noupdate /tb_fpgacell/carryComp/cb/clb_res
add wave -noupdate /tb_fpgacell/carryComp/clb/clb_out
add wave -noupdate /tb_fpgacell/carryComp/clb/mux1res
add wave -noupdate /tb_fpgacell/carryComp/clb/sel_in
add wave -noupdate /tb_fpgacell/sumComp/sb/l3_in
add wave -noupdate /tb_fpgacell/sumComp/sb/r2_out
add wave -noupdate /tb_fpgacell/sumComp/cb/r3_out
add wave -noupdate /tb_fpgacell/sumComp/cb/clb_res
add wave -noupdate /tb_fpgacell/sumComp/clb/clb_out
add wave -noupdate /tb_fpgacell/sumComp/clb/mux1res
add wave -noupdate /tb_fpgacell/sumComp/clb/sel_in
add wave -noupdate /tb_fpgacell/sumComp/cb/r1_out
add wave -noupdate /tb_fpgacell/sumComp/sb/l1_in
add wave -noupdate /tb_fpgacell/sumComp/sb/u1_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {657868 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 356
configure wave -valuecolwidth 165
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
WaveRestoreZoom {379586 ps} {1558970 ps}
