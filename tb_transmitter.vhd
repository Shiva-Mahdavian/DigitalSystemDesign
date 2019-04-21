------------------------------------------------------------------
-- Digital System Design
-- Project: UART design (project 2)
-- Date: 21-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: tb_transmitter.vhd
-- Design: ?
-------------------------------------------------------------------
-- Description: Testbench for Parallel to Serial transmitter
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY tb_transmitter IS
END tb_transmitter;
-------------------------------------------------------------------
ARCHITECTURE test OF tb_transmitter IS
    -------- DUT declaration: --------
    COMPONENT transmitter IS
    PORT(
        start_in : IN  std_logic;
        data_in  : IN  std_logic_vector(7 DOWNTO 0);
        clk      : IN  std_logic;
        nreset   : IN  std_logic;
        s_out    : OUT std_logic
        );
    END COMPONENT;
    -------- Signal declaration: --------
        SIGNAL clk_tb, nrst : std_logic;
        SIGNAL start, out_tb : std_logic;
        SIGNAL data         : std_logic_vector(7 DOWNTO 0);
    -------------------------------------
BEGIN
    -------- DUT instantiation: --------
    dut: transmitter
     PORT MAP (
        clk => clk_tb,
        nreset => nrst,
        start_in => start,
        data_in => data,
        s_out => out_tb
        );
    -------- Clock Generation: --------
    clock: PROCESS
    BEGIN
        clk_tb <= '0';  WAIT FOR 5 ns;
        clk_tb <= '1';  WAIT FOR 5 ns;
    END PROCESS clock;
    -------- Stimuli Generation: --------
    stimuli: PROCESS
    BEGIN
        nrst <= '1';    WAIT FOR 10 ns;
        start <= '0';
        nrst <= '0';    WAIT FOR 10 ns;
        nrst <= '1';
        data <= "11001100";
        start <= '1';   WAIT FOR 10 ns;
        start <= '0';   WAIT FOR 100 ns;
        data <= "10001010";
        start <= '1';   WAIT FOR 10 ns;
        start <= '0';   WAIT FOR 100 ns;
        data <= "10101010";
        start <= '1';   WAIT FOR 10 ns;
        start <= '0';   WAIT FOR 100 ns;
        start <= '1';   WAIT FOR 10 ns;
        start <= '0';   WAIT FOR 30 ns;
        nrst <= '0';    WAIT FOR 20 ns;
        WAIT;
    END PROCESS stimuli;
END test;
