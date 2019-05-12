-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 9 May 2019
-- Author: Shivasadat Mahdavian
-- File: tb_clb.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY tb_clb IS
END tb_clb;
-----------------------------------------------------------------
ARCHITECTURE test OF tb_clb IS
    --------- DUT Declaration: --------
    COMPONENT configurableLogicBlock IS
        PORT(
            prog_in, prog_en : IN  std_logic;
            sel_in           : IN  std_logic_vector(1 DOWNTO 0);
            prog_clk, clk    : IN  std_logic;
            prog_out, clb_out  : OUT std_logic
            );
    END COMPONENT;
    -------- Signal Declaration: --------
    SIGNAL clk, prog_in, en, res: std_logic;
    SIGNAL sel                  : std_logic_vector(1 DOWNTO 0);
    CONSTANT sh : integer := 5;
    CONSTANT l  : integer := 10;
BEGIN
    -------- DUT Instantiation: --------
    dut: configurableLogicBlock
     PORT MAP(
        prog_in => prog_in,
        prog_en => en,
        sel_in => sel,
        prog_clk => clk,
        clk => clk,
        clb_out => res,
        prog_out => OPEN
        );
    -------- clk Generation: --------
    clock: PROCESS
    BEGIN
        clk <= '0';  WAIT FOR 5 ns;
        clk <= '1';  WAIT FOR 5 ns;
    END PROCESS clock;
    -------- stimuli Generation: --------
    en <= '0','1' AFTER 10 ns, '0' AFTER 60 ns, '1' AFTER 80 ns, '0' AFTER 130 ns;
    prog_in <= '1',
               '1' AFTER 20 ns,
               '0' AFTER 30 ns,
               '0' AFTER 40 ns,
               '0' AFTER 50 ns,
               '1' AFTER 80 ns,
               '0' AFTER 90 ns,
               '1' AFTER 110 ns;
    sel <= "11",
           "00" AFTER 63 ns,
           "01" AFTER 66 ns,
           "10" AFTER 69 ns,
           "00" AFTER 135 ns,
           "11" AFTER 140 ns,
           "01" AFTER 145 ns;

END test;
