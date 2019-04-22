------------------------------------------------------------------
-- Digital System Design
-- Project: UART design (project 2)
-- Date: 21-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: uart.vhd
-- Design: ?
-------------------------------------------------------------------
-- Description: uart module
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY uart IS
    PORT(
        start, rx   : IN  std_logic;
        nreset, clk : IN  std_logic;
        data_in     : IN  std_logic_vector(7 DOWNTO 0);
        data_out    : OUT std_logic_vector(7 DOWNTO 0);
        strobe, tx  : OUT std_logic
        );
END uart;
-------------------------------------------------------------------
ARCHITECTURE structural OF uart IS
    -------- 1st Component declaration --------
    COMPONENT transmitter IS
    PORT(
        start_in : IN  std_logic;
        data_in  : IN  std_logic_vector(7 DOWNTO 0);
        clk      : IN  std_logic;
        nreset   : IN  std_logic;
        s_out    : OUT std_logic
        );
    END COMPONENT;
    -------- 2nd Component declaration --------
    COMPONENT receiver IS
        PORT(
            clk      : IN  std_logic;
            nreset   : IN  std_logic;
            rx       : IN  std_logic;
            strobe   : OUT std_logic;
            data_out : OUT std_logic_vector(7 DOWNTO 0)
            );
    END COMPONENT;
    -------- Signal declaration --------
    SIGNAL stable_data : std_logic_vector(7 DOWNTO 0);
BEGIN
    -------- receiver statntiation --------
    s2p : receiver
     PORT MAP(
        clk      => clk,
        nreset   => nreset,
        rx       => rx,
        strobe   => strobe,
        data_out => data_out
        );
    -------- transmitter statntiation --------
    p2s : transmitter
     PORT MAP(
        start_in => start,
        data_in  => stable_data,
        clk      => clk,
        nreset   => nreset,
        s_out    => tx
        );
    -------- FlipFlop --------
    ff: PROCESS (clk)
    BEGIN
        IF clk'EVENT AND clk = '1' AND start='1' THEN
            stable_data <= data_in;
        END IF;
    END PROCESS ff;
END structural;
