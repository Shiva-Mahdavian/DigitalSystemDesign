onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_clb/clk
add wave -noupdate /tb_clb/prog_in
add wave -noupdate /tb_clb/en
add wave -noupdate /tb_clb/res
add wave -noupdate /tb_clb/sel
add wave -noupdate /tb_clb/dut/prog_en
add wave -noupdate /tb_clb/dut/sel_in
add wave -noupdate /tb_clb/dut/prog_clk
add wave -noupdate /tb_clb/dut/clk
add wave -noupdate /tb_clb/dut/prog_out
add wave -noupdate /tb_clb/dut/z_out
add wave -noupdate /tb_clb/dut/prog_in
add wave -noupdate -expand /tb_clb/dut/regWire
add wave -noupdate /tb_clb/dut/mux1res
add wave -noupdate /tb_clb/dut/regOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 92
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
WaveRestoreZoom {0 ps} {203046 ps}
