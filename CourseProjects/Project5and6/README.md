# Project 5
#### Building an FPGA Cell!
An FPGA Cell consists of three main parts:

1. Configurable Logic Block([CLB](./configurableLogicBlock.vhd))
2. Connection Block ([CB](./connectionBlock.vhd))
3. Switch Box ([SB](./switchBox.vhd))

![FPGA Cell][fpgaCell]

For configuring the FPGA Cell this is the bit stream format:

```bash
# switch box
#  d30 d31 d10 d11 r20 r21 r40 r41 u30 u31 u10 u11 l40 l41 l20 l21
    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
# connection block
#  l4s r3s l2s r1s s1c s0c s01 s00 s11 s10
    0   0   0   0   0   0   0   0   0   0
# configurable logic block
#  mux  3   2   1   0
    0   0   0   0   0
```

you can check the [FPGA Cell test bench](./tb_fpgaCell.vhd) which is a half adder made by two FPGA Cell,
and it's [input](./fpgaCell_input.txt) for a better understanding of configuration.

Also here is some pictures to help you more about what each of this bits does:

1. [Switch Box](./switchBox.vhd) muxes:

 <img src="https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/sb.jpg" alt="SB muxes" width="300"/>

 The selects of muxes shown in order (notice the numbers written on each select line) are configurable bits.

2. [Connection Block](./connectionBlock.vhd) muxes:

 ![CB muxes][CBMux]

  The selects of muxes shown in order(notice the numbers on each select line) are configurable bits.


 3. [Configurable logic Block](./configurableLogicBlock.vhd):

 ![CLB][clb]

 The registers (more precisely shift registers) shown in this picture, which are connected together are configurable bits of CLB.


# Project 6
#### Building an FPGA by cascading FPGA Cells from the last project.
I built this [FPGA](./fpga.vhd) by cascading M*N [fpgaCell](./fpgaCell.vhd). The exact amount of M and N are distinguished in the test bench files.
Two test benches are available:

+ [2x2 FPGA tested with a XOR b XOR c XOR d](./tb_fpga2x2_xor4.vhd).

   [input file](./xor4_2x2Cell_input.txt)
+ [4x4 FPGA tested with a XOR b XOR c XOR d](./tb_fpga4x4_xor4.vhd).

   [input file](./xor4_4x4Cell_input.txt)

[fpgaCell]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/fpgaCell.jpg
[SBMux]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/sb.jpg
[CBMux]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/cb.jpg
[clb]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/clb.jpg
