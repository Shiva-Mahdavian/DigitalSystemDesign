-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 12 May 2019
-- Author: Shivasadat Mahdavian
-- File: fpgaCell.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY fpgaCell IS
    PORT(
        prog_en, prog_in, prog_clk : IN  std_logic;
        prog_out                   : OUT std_logic;
        u2_in, u4_in, d2_in, d4_in : IN  std_logic;
        r1_in, r3_in, l1_in, l3_in : IN  std_logic;
        u1_out, u3_out, d3_out     : OUT std_logic;
        r4_out, r2_out, d1_out     : OUT std_logic;
        l4_out, l2_out             : OUT std_logic
        );
END fpgaCell;
------------------------------------------------------------------
ARCHITECTURE structural OF fpgaCell IS
    -------- Connection Block Component Declaration: --------
    COMPONENT connectionBlock IS
        PORT(
            r2_in, r4_in      : IN std_logic;
            r1_out, r3_out    : OUT std_logic;
            l1_in, l3_in      : IN std_logic;
            l4_out, l2_out    : OUT std_logic;
            prog_in, prog_en  : IN std_logic;
            prog_clk, clb_res : IN  std_logic;
            prog_out          : OUT std_logic;
            clb_clk_out       : OUT std_logic;
            clb_sel_out       : OUT std_logic_vector(1 DOWNTO 0)
            );
    END COMPONENT;
    -------- Configuarable logic Block Component Declaration: --------
    COMPONENT configurableLogicBlock IS
        PORT(
            prog_in, prog_en  : IN  std_logic;
            sel_in            : IN  std_logic_vector(1 DOWNTO 0);
            prog_clk, clk     : IN  std_logic;
            prog_out, clb_out : OUT std_logic
            );
    END COMPONENT;
    -------- Configuarable logic Block Component Declaration: --------
    COMPONENT switchBox IS
        PORT(
            r1_in, r3_in     : IN  std_logic;
            r4_out, r2_out   : OUT std_logic;
            l1_in, l3_in     : IN  std_logic;
            l4_out, l2_out   : OUT std_logic;
            u2_in, u4_in     : IN  std_logic;
            u1_out, u3_out   : OUT std_logic;
            d2_in, d4_in     : IN  std_logic;
            d1_out, d3_out   : OUT std_logic;
            prog_in, prog_en : IN std_logic;
            prog_clk         : IN std_logic;
            prog_out         : OUT std_logic
        );
    END COMPONENT;
    -------- Signal Declaration: ---------
    SIGNAL clb_progOut, cb_progOut  : std_logic;
    SIGNAL clb_clk, clb_res, cb2sb4 : std_logic;
    SIGNAL cb2sb1, cb2sb2, cb2sb3   : std_logic;
    SIGNAL clb_sel                  : std_logic_vector(1 DOWNTO 0);
BEGIN
    -------- clb Instantiation: --------
    clb : configurableLogicBlock
     PORT MAP (
        prog_en  => prog_en,
        prog_in  => prog_in,
        prog_out => clb_progOut,
        prog_clk => prog_clk,
        sel_in   => clb_sel,
        clk      => clb_clk,
        clb_out    => clb_res
        );
    -------- cb Instantiation: --------
    cb: connectionBlock
     PORT MAP (
        r2_in       => cb2sb2,
        r4_in       => cb2sb4,
        r1_out      => cb2sb1,
        r3_out      => cb2sb3,
        l1_in       => l1_in,
        l3_in       => l3_in,
        l2_out      => l2_out,
        l4_out      => l4_out,
        prog_in     => clb_progOut,
        prog_en     => prog_en,
        prog_clk    => prog_clk,
        prog_out    => cb_progOut,
        clb_clk_out => clb_clk,
        clb_sel_out => clb_sel,
        clb_res     => clb_res
        );
    -------- sb Instantiation: ---------
    sb: switchBox
     PORT MAP(
        l1_in    => cb2sb1,
        l3_in    => cb2sb3,
        r1_in    => r1_in,
        r3_in    => r3_in,
        d2_in    => d2_in,
        d4_in    => d4_in,
        u2_in    => u2_in,
        u4_in    => u4_in,
        prog_in  => cb_progOut,
        prog_en  => prog_en,
        prog_clk => prog_clk,
        prog_out => prog_out,
        l2_out   => cb2sb2,
        l4_out   => cb2sb4,
        r2_out   => r2_out,
        r4_out   => r4_out,
        u1_out   => u1_out,
        u3_out   => u3_out,
        d1_out   => d1_out,
        d3_out   => d3_out
        );

END structural;
