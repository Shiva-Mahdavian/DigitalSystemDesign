-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA (project6)
-- Date: 27 May 2019
-- Author: Shivasadat Mahdavian
-- File: tb_fpga4x4_xor4.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
-----------------------------------------------------------------
ENTITY tb_fpga4x4_xor4 IS
END tb_fpga4x4_xor4;
-----------------------------------------------------------------
ARCHITECTURE test OF tb_fpga4x4_xor4 IS
    -------- DUT Declaration: --------
    COMPONENT fpga IS
        GENERIC(
            N : integer := 3;
            M : integer := 2
            );
        PORT(
            prog_en, prog_in, prog_clk : IN  std_logic;
            prog_out                   : OUT std_logic;
            r_in, l_in                 : IN  std_logic_vector(2*N-1 DOWNTO 0);
            u_in, d_in                 : IN  std_logic_vector(2*M-1 DOWNTO 0);
            r_out, l_out               : OUT std_logic_vector(2*N-1 DOWNTO 0);
            u_out, d_out               : OUT std_logic_vector(2*M-1 DOWNTO 0)
            );
    END COMPONENT;
    -------- Constant Declaration: --------
    CONSTANT progClkP : time := 10 ns;
    CONSTANT clbClkP  : time := 60 ns;
    CONSTANT nCell    : integer := 16;
    -------- Signal Declaration: --------
    SIGNAL prg_clk, clb_clk : std_logic;
    SIGNAL prg_in, prg_en   : std_logic;
    SIGNAL l_in             : std_logic_vector(2*4-1 DOWNTO 0);
    SIGNAL r                : std_logic_vector(2*4-1 DOWNTO 0);
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
    dut: fpga
     GENERIC MAP (
        N => 4,
        M => 4
        )
     PORT MAP(
        prog_clk => prg_clk,
        prog_en  => prg_en,
        prog_in  => prg_in,
        prog_out => OPEN,
        r_in     => (OTHERS => 'Z'),
        d_in     => (OTHERS => 'Z'),
        u_in     => (OTHERS => 'Z'),
        l_in     => l_in,
        l_out    => OPEN,
        d_out    => OPEN,
        u_out    => OPEN,
        r_out    => r
        );
    -------- READ FROM FILE --------
    PROCESS
        VARIABLE v_line : line;
        VARIABLE v_tab  : character;
        VARIABLE v_bit  : std_logic;
    BEGIN
        -------- Open file in read mode ---------
        file_open(file_in, "../../xor4_4x4Cell_input.txt", read_mode);
        -------- read comment ---------
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        -------- read prog en
        readline(file_in, v_line);
        read(v_line, v_bit);
        prg_en <= v_bit;
        WAIT FOR progClkP;
        readline(file_in, v_line);
        read(v_line, v_bit);
        prg_en <= v_bit;
        WAIT FOR progClkP;
        -------- Configuration: --------
        conf: FOR j IN 0 TO nCell-1 LOOP
            ---- read comment
            readline(file_in, v_line);
            readline(file_in, v_line);
            readline(file_in, v_line);

            ---- read switchBox config bits
            readline(file_in, v_line);
            sb: FOR i in 0 to 15 LOOP
                read(v_line, v_tab);
                read(v_line, v_bit);
                prg_in <= v_bit;
                WAIT FOR progClkP;
            END LOOP sb;
            ---- read comment
            readline(file_in, v_line);
            readline(file_in, v_line);
            ---- read connection block config bits
            readline(file_in, v_line);
            cb: FOR i in 0 to 9 LOOP
                read(v_line, v_tab);
                read(v_line, v_bit);
                prg_in <= v_bit;
                WAIT FOR progClkP;
            END LOOP cb;
            ---- read comment
            readline(file_in, v_line);
            readline(file_in, v_line);
            ---- read configurabel logic block config bits
            readline(file_in, v_line);
            clb: FOR i in 0 to 4 LOOP
                read(v_line, v_tab);
                read(v_line, v_bit);
                prg_in <= v_bit;
                WAIT FOR progClkP;
            END LOOP clb;
        END LOOP conf;
        -------- read comment --------
        readline(file_in, v_line);
        -------- read prog en
        readline(file_in, v_line);
        read(v_line, v_bit);
        prg_en <= v_bit;
        -------- read comment ---------
        readline(file_in, v_line);
        readline(file_in, v_line);
        readline(file_in, v_line);
        -------- Stimuli reading: --------
        lineRead: FOR i in 0 to 15 LOOP
            readline(file_in, v_line);
            bitRead: FOR j in 7 DOWNTO 0 LOOP
                read(v_line, v_tab);
                read(v_line, v_bit);
                l_in(j) <= v_bit;
            END LOOP bitRead;
            WAIT FOR progClkP;
        END LOOP lineRead;
        --------- close file --------
        file_close(file_in);

        WAIT;
    END PROCESS;
END test;
