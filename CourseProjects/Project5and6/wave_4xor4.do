onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label prog_clk /tb_fpga/dut/prog_clk
add wave -noupdate -label prog_en /tb_fpga/dut/prog_en
add wave -noupdate -label {a b c d} /tb_fpga/dut/l_in
add wave -noupdate -label res /tb_fpga/dut/r_out
add wave -noupdate -label prog_in /tb_fpga/dut/prog_in
add wave -noupdate -divider cell4
add wave -noupdate -label prog_in /tb_fpga/dut/row(0)/col(0)/cell/prog_in
add wave -noupdate -label a /tb_fpga/dut/row(0)/col(0)/cell/l1_in
add wave -noupdate -label b /tb_fpga/dut/row(0)/col(0)/cell/l3_in
add wave -noupdate -label {a XOR b} /tb_fpga/dut/row(0)/col(0)/cell/r4_out
add wave -noupdate -label prog_out /tb_fpga/dut/row(0)/col(0)/cell/prog_out
add wave -noupdate -divider cell3
add wave -noupdate -label prog_in /tb_fpga/dut/row(0)/col(1)/cell/prog_in
add wave -noupdate -label {a XOR b} /tb_fpga/dut/row(0)/col(1)/cell/l1_in
add wave -noupdate -label {cXOR d} /tb_fpga/dut/row(0)/col(1)/cell/d4_in
add wave -noupdate -label {a XOR b XOR c XOR d} /tb_fpga/dut/row(0)/col(1)/cell/r4_out
add wave -noupdate -label /prog_out /tb_fpga/dut/row(0)/col(1)/cell/prog_out
add wave -noupdate -divider cell2
add wave -noupdate -label prog_in /tb_fpga/dut/row(1)/col(0)/cell/prog_in
add wave -noupdate -label c /tb_fpga/dut/row(1)/col(0)/cell/l1_in
add wave -noupdate -label d /tb_fpga/dut/row(1)/col(0)/cell/l3_in
add wave -noupdate -label {c XOR d} /tb_fpga/dut/row(1)/col(0)/cell/r4_out
add wave -noupdate -label prog_out /tb_fpga/dut/row(1)/col(0)/cell/prog_out
add wave -noupdate -divider cell1
add wave -noupdate -label prog_in /tb_fpga/dut/row(1)/col(1)/cell/prog_in
add wave -noupdate -label {c XOR d} /tb_fpga/dut/row(1)/col(1)/cell/l1_in
add wave -noupdate -label {c XOR d} /tb_fpga/dut/row(1)/col(1)/cell/u1_out
add wave -noupdate -label prog_out /tb_fpga/dut/row(1)/col(1)/cell/prog_out
add wave -noupdate -divider {FPGA prog_out}
add wave -noupdate /tb_fpga/dut/prog_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1295122 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 196
configure wave -valuecolwidth 55
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
WaveRestoreZoom {983448 ps} {1639080 ps}
