------------------------------------------------------------------
-- Digital System Design
-- Project: UART design (project 2)
-- Date: 21-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: tb_receiver.vhd
-- Design: ?
-------------------------------------------------------------------
-- Description: Serial to Parallel receiver
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY tb_receiver IS
END tb_receiver;
-------------------------------------------------------------------
ARCHITECTURE testbench OF tb_receiver IS
    -------- DUT declaration: --------
    COMPONENT receiver IS
        PORT(
            clk      : IN  std_logic;
            nreset   : IN  std_logic;
            rx       : IN  std_logic;
            strobe   : OUT std_logic;
            data_out : OUT std_logic_vector(7 DOWNTO 0)
            );
    END COMPONENT;
    --------- Signal declaration: --------
    SIGNAL clk_tb, nrst  : std_logic;
    SIGNAL strobe, tb_in : std_logic;
    SIGNAL tb_out        : std_logic_vector(7 DOWNTO 0);
BEGIN
    -------- DUT instantiation: --------
    dut: receiver
     PORT MAP (
        clk => clk_tb,
        nreset => nrst,
        rx => tb_in,
        strobe => strobe,
        data_out => tb_out
        );
    -------- clock generation: --------
    clock: PROCESS
    BEGIN
        clk_tb <= '0';  WAIT FOR 5 ns;
        clk_tb <= '1';  WAIT FOR 5 ns;
    END PROCESS clock;
    -------- stimuli generation: --------
    stimuli: PROCESS
    BEGIN
        nrst    <= '1';    WAIT FOR 10 ns;
        tb_in   <= '1';
        nrst    <= '0';    WAIT FOR 20 ns;
        nrst    <= '1';
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '0';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        tb_in   <= '1';    WAIT FOR 4 ns;
        WAIT;
    END PROCESS stimuli;
END testbench;
