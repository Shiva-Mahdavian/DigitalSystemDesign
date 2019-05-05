vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project3/fa.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project3/skipCarryBlock.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project3/skipCarryAdder.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project3/tb_skipCarryAdder.vhd
vsim work.tb_skipcarryadder
do wave_skipCarryAdder.do
run 70 ns
