------------------------------------------------------------------
-- Digital System Design
-- Project: UART design (project 2)
-- Date: 22-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: tb_uart.vhd
-- Design: ?
-------------------------------------------------------------------
-- Description: testbench for UART module
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY tb_uart IS
END tb_uart;
-------------------------------------------------------------------
ARCHITECTURE testbench OF tb_uart IS
    -------- DUT declaration: --------
    COMPONENT uart IS
        PORT(
            start, rx   : IN  std_logic;
            nreset, clk : IN  std_logic;
            data_in     : IN  std_logic_vector(7 DOWNTO 0);
            data_out    : OUT std_logic_vector(7 DOWNTO 0);
            strobe, tx  : OUT std_logic
            );
    END COMPONENT;
    -------- Signal declaration --------
    SIGNAL clk_tb, nrst          : std_logic;
    SIGNAL busIO, busOI          : std_logic_vector(7 DOWNTO 0);
    SIGNAL leftStart, rightStart : std_logic;
    SIGNAL rightI, rightO        : std_logic;
    SIGNAL leftI, leftO          : std_logic;
BEGIN
    -------- 1st DUT stantiation --------
    right: uart
     PORT MAP(
        start => rightStart,
        rx => rightI,
        nreset => nrst,
        clk => clk_tb,
        data_in => busIO,
        data_out => busOI,
        strobe => leftStart,
        tx => rightO
        );
    -------- 2nd DUT stantiation --------
    left: uart
     PORT MAP(
        start => leftStart,
        rx => leftI,
        nreset => nrst,
        clk => clk_tb,
        data_in => busOI,
        data_out => busIO,
        strobe => rightStart,
        tx => leftO
        );
    -------- clock generation --------
    clock: PROCESS
    BEGIN
        clk_tb <= '0';  WAIT FOR 5 ns;
        clk_tb <= '1';  WAIT FOR 5 ns;
    END PROCESS clock;
    -------- stimuli generation --------
    stimuli: PROCESS
    BEGIN
        nrst   <= '1';    WAIT FOR 10 ns;
        nrst   <= '0';    WAIT FOR 5 ns;
        nrst   <= '1';
        rightI <= '1';
        leftI  <= '1';    WAIT FOR 15 ns;
        leftI  <= '0';    WAIT FOR 10 ns;
        leftI  <= '1';    WAIT FOR 10 ns;
        rightI <= '0';
        leftI  <= '0';    WAIT FOR 10 ns;
        rightI <= '1';
        leftI  <= '1';    WAIT FOR 10 ns;
        rightI <= '0';
        leftI  <= '0';    WAIT FOR 10 ns;
        rightI <= '1';
        leftI  <= '1';    WAIT FOR 10 ns;
        rightI <= '0';
        leftI  <= '1';    WAIT FOR 10 ns;
        rightI <= '1';
        leftI  <= '0';    WAIT FOR 10 ns;
        rightI <= '1';
        leftI  <= '1';    WAIT FOR 10 ns;
        rightI <= '0';
        leftI  <= '1';    WAIT FOR 10 ns;
        rightI <= '1';
        leftI  <= '1';    WAIT FOR 10 ns;
        rightI <= '1';
        leftI  <= '1';    WAIT FOR 10 ns;
        WAIT;
    END PROCESS stimuli;
END testbench;
