vcom -reportprogress 300 -work work /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/receiver.vhd
vcom -reportprogress 300 -work work /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/tb_receiver.vhd
vsim work.tb_receiver
do /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/wave_receiver.do
run 150 ns
