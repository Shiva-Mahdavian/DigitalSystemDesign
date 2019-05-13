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
    -------- DUT Instantiation: --------
    dut: fpgaCell
     PORT MAP (
        prog_clk => prg_clk,
        prog_en  => prg_en,
        prog_in  => prg_in,
        prog_out => OPEN,
        u1_out   => OPEN,
        u3_out   => OPEN,
        d1_out   => OPEN,
        d3_out   => OPEN,
        r2_out   => OPEN,
        r4_out   => OPEN,
        l2_out   => OPEN,
        l4_out   => OPEN,
        u2_in    => u2,
        u4_in    => u4,
        d2_in    => d2,
        d4_in    => d4,
        l1_in    => l1,
        l3_in    => l3,
        r1_in    => r1,
        r3_in    => r3
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
        ---- read switchBox config bits
        readline(file_in, v_line);
        bitRead1: FOR i in 0 to 15 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP bitRead1;
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        ---- read connection block config bits
        readline(file_in, v_line);
        bitRead2: FOR i in 0 to 9 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP bitRead2;
        ---- read comment
        readline(file_in, v_line);
        readline(file_in, v_line);
        ---- read configurabel logic block config bits
        readline(file_in, v_line);
        bitRead3: FOR i in 0 to 4 LOOP
            read(v_line, v_tab);
            read(v_line, v_bit);
            prg_in <= v_bit;
            WAIT FOR progClkP;
        END LOOP bitRead3;
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
            r1 <= v_bit;
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
