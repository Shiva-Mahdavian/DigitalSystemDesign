vcom -reportprogress 300 -work work {/home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/transmitter.vhd}
vcom -reportprogress 300 -work work {/home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/tb_transmitter.vhd}
vsim work.tb_transmitter
do /home/shiva/Desktop/DigitalSystemDesign/CourseProjects/Project2/wave_transmitter.do
run 400 ns
