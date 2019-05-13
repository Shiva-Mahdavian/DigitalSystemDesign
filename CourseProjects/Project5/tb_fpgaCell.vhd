-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 13 May 2019
-- Author: Shivasadat Mahdavian
-- File: tb_fpgaCell.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
-----------------------------------------------------------------
ENTITY tb_fpgaCell IS
END tb_fpgaCell;
-----------------------------------------------------------------
ARCHITECTURE test OF tb_fpgaCell IS
    -------- DUT Declaration: --------
    COMPONENT fpgaCell IS
        PORT(
            prog_en, prog_in, prog_clk : IN  std_logic;
            prog_out                   : OUT std_logic;
            u2_in, u4_in, d2_in, d4_in : IN  std_logic;
            r1_in, r3_in, l1_in, l3_in : IN  std_logic;
            u1_out, u3_out, d3_out     : OUT std_logic;
            r4_out, r2_out, d1_out     : OUT std_logic;
            l4_out, l2_out             : OUT std_logic
            );
    END COMPONENT;
    -------- Constant Declaration: --------
    CONSTANT progClkP : time := 10 ns;
    CONSTANT clbClkP  : time := 60 ns;
    -------- Signal Declaration: --------
    SIGNAL prg_clk, clb_clk : std_logic;
    SIGNAL prg_in, prg_en   : std_logic;
    SIGNAL u2, u4, d2, d4   : std_logic;
    SIGNAL l1, l3, r1, r3   : std_logic;
    SIGNAL progOut1         : std_logic;
    SIGNAL sum2carry        : std_logic_vector(1 TO 4);
    SIGNAL carry1, sum1     : std_logic;
    -------- File Declaration: --------
    FILE file_in : text;
BEGIN
    -------- prog_clk Generation: --------
    prog_clk: PROCESS
    BEGIN
        prg_clk <= '0'; WAIT FOR progClkP/2;
        prg_clk <= '1'; WAIT FOR progClkP/2;
    END PROCESS prog_clk;
    -------- clb_clk Generation: --------
    clb_clock: PROCESS
    BEGIN
        clb_clk <= '0'; WAIT FOR clbClkP/2;
        clb_clk <= '1'; WAIT FOR clbClkP/2;
    END PROCESS clb_clock;
    -------- DUT1 Instantiation: --------
    sumComp: fpgaCell
     PORT MAP (
        prog_clk => prg_clk,
        prog_en  => prg_en,
        prog_in  => prg_in,
        prog_out => progOut1,
        u1_out   => sum2carry(1),
        u3_out   => sum2carry(3),
        d1_out   => OPEN,
        d3_out   => OPEN,
        r2_out   => sum1,
        r4_out   => OPEN,
        l2_out   => OPEN,
        l4_out   => OPEN,
        u2_in    => sum2carry(2),
        u4_in    => sum2carry(4),
        d2_in    => 'Z',
        d4_in    => 'Z',
        l1_in    => l1,
        l3_in    => 'Z',
        r1_in    => 'Z',
        r3_in    => 'Z'
     );

     -------- DUT2 Instantiation: --------
     carryComp: fpgaCell
      PORT MAP (
         prog_clk => prg_clk,
         prog_en  => prg_en,
         prog_in  => progOut1,
         prog_out => OPEN,
         u1_out   => OPEN,
         u3_out   => OPEN,
         d1_out   => sum2carry(4),
         d3_out   => sum2carry(2),
         r2_out   => OPEN,
         r4_out   => carry1,
         l2_out   => OPEN,
         l4_out   => OPEN,
         u2_in    => u2,
         u4_in    => 'Z',
         d2_in    => sum2carry(3),
         d4_in    => sum2carry(1),
         l1_in    => 'Z',
         l3_in    => 'Z',
         r1_in    => 'Z',
         r3_in    => 'Z'
      );
    -------- Read From file ----------
    PROCESS
        VARIABLE v_line : line;
        VARIABLE v_tab  : character;
        VARIABLE v_bit  : std_logic;
    BEGIN
        ----  Open file in read mode
        file_open(file_in, "../../fpgaCell_input.txt", read_mode);
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        -------- Configuration: --------
        ---- read prog en
        readline(file_in, v_line);
        read(v_line, v_bit);
        prg_en <= v_bit;
        WAIT FOR progClkP;
        readline(file_in, v_line);
        read(v_line, v_bit);
        prg_en <= v_bit;
        WAIT FOR progClkP;
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        -------- carryComp --------
        ---- read switchBox config bits
        readline(file_in, v_line);
        carrySB1: FOR i in 0 to 15 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP carrySB1;
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        ---- read connection block config bits
        readline(file_in, v_line);
        carryCB1: FOR i in 0 to 9 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP carryCB1;
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        ---- read configurabel logic block config bits
        readline(file_in, v_line);
        carryCLB1: FOR i in 0 to 4 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP carryCLB1;
        -------- sumComp --------
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        ---- read switchBox config bits
        readline(file_in, v_line);
        sumSB1: FOR i in 0 to 15 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP sumSB1;
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        ---- read connection block config bits
        readline(file_in, v_line);
        sumCB1: FOR i in 0 to 9 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP sumCB1;
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        ---- read configurabel logic block config bits
        readline(file_in, v_line);
        sumCLB1: FOR i in 0 to 4 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP sumCLB1;
        ---- read comment
        readline(file_in, v_line);
        ---- read prog en
        readline(file_in, v_line);
        read(v_line, v_bit);
        prg_en <= v_bit;
        -------- Stimuli reading: --------
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        bitRead4: FOR i in 0 to 3 LOOP
            readline(file_in, v_line);
            read(v_line, v_tab);
            read(v_line, v_bit);
            u2 <= v_bit;
            read(v_line, v_tab);
            read(v_line, v_bit);
            l1 <= v_bit;
            WAIT FOR progClkP;
        END LOOP bitRead4;
        ---- close file
        file_close(file_in);

        WAIT;
    END PROCESS;


END test;
