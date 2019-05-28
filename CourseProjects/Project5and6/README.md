# Project 5
#### Building an FPGA Cell!
An FPGA Cell consists of three main parts:

1. Configurable Logic Block(CLB)
2. Connection Block (CB)
3. Switch Box (SB)

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

you can check the FPGA Cell test bench which is a half adder made by two FPGA Cell,
and it's input for a better understanding of configuration.

Also here is some pictures to help you more about what each of this bits does:

1. Switch Box muxes:

 ![SB muxes][SBMux]

 The selects of muxes shown in order(notice the numbers written in order on each select line) are configurable bits.

2. Connection Block muxes:

 ![CB muxes][CBMux]

  The selects of muxes shown in order(notice the numbers written in order on each select line) are configurable bits.


 3. Configurable logic Block:

 ![CLB][clb]

 The registers (more precisely shift registers) shown in this picture, which are connected together are configurable bits of CLB.


# Project 6
#### Building an FPGA by cascading FPGA Cells from the last project.
I built this [FPGA](./fpga.vhd) by cascading M*N [fpgaCell](./fpgaCell.vhd). The exact amount of M and N are distinguished in the test bench files.
Two test benches are available:
+ [2x2 FPGA tested with a XOR b XOR c XOR d](./tb_fpga2x2_xor4.vhd)
+ [4x4 FPGA tested with a XOR b XOR c XOR d](./tb_fpga4x4_xor4.vhd)

[fpgaCell]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/fpgaCell.jpg
[SBMux]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/sb.jpg
[CBMux]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/cb.jpg
[clb]:https://github.com/Shiva-Mahdavian/DigitalSystemDesign/blob/master/CourseProjects/readme_Images/clb.jpg
