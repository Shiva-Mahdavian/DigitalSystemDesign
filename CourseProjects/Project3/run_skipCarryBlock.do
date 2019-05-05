vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project3/fa.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project3/skipCarryBlock.vhd
vcom -reportprogress 300 -work work /home/shiva/gitProject/DigitalSystemDesign/CourseProjects/Project3/tb_skipCarryBlock.vhd
do wave_skipCarryBlock.do
run 70 ns
