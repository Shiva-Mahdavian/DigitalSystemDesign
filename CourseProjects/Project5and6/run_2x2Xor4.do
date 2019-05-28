vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/ff.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/ff_e.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/mux2.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/mux4.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/switchBox.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/configurableLogicBlock.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/connectionBlock.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/fpgaCell.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/fpga.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project5/tb_fpga2x2_xor4.vhd
vsim work.tb_fpga4_xor4
do wave_4xor4.do
run 1500 ns
