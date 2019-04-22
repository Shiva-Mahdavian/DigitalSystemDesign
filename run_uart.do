vcom -reportprogress 300 -work work /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/receiver.vhd
vcom -reportprogress 300 -work work /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/transmitter.vhd
vcom -reportprogress 300 -work work /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/uart.vhd
vcom -reportprogress 300 -work work /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/tb_uart.vhd
vsim work.tb_uart
do wave_uart.do
run 300 ns
