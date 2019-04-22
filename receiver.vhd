------------------------------------------------------------------
-- Digital System Design
-- Project: UART design (project 2)
-- Date: 21-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: receiver.vhd
-- Design: ?
-------------------------------------------------------------------
-- Description: Serial to Parallel receiver
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY receiver IS
    PORT(
        clk      : IN  std_logic;
        nreset   : IN  std_logic;
        rx       : IN  std_logic;
        strobe   : OUT std_logic;
        data_out : OUT std_logic_vector(7 DOWNTO 0)
        );
END receiver;
-------------------------------------------------------------------
ARCHITECTURE moore OF receiver IS
    TYPE State_t IS  (idle, start, t0, t1, t2, t3, t4, t5, t6, t7);
    SIGNAL currentS, nextS : State_t;
BEGIN
    -------- Lower Section: --------
    seq: PROCESS(clk, nreset)
    BEGIN
        IF nreset = '0' THEN
            currentS <= idle;
        ELSIF clk'EVENT AND clk = '1' THEN
            currentS <= nextS;
        END IF;
    END PROCESS seq;
    -------- Upper Section: --------
    comb: PROCESS (currentS, rx)
    BEGIN
        stateChange: CASE currentS IS
            WHEN idle =>
                strobe <= '0';
                data_out <= (OTHERS => 'X');
                IF rx = '0' THEN
                    nextS <= start;
                ELSE
                    nextS <= idle;
                END IF;
            WHEN start =>
                strobe <= '0';
                data_out(0) <= rx;
                nextS <= t0;
            WHEN t0 =>
                strobe <= '0';
                data_out(1) <= rx;
                nextS <= t1;
            WHEN t1 =>
                strobe <= '0';
                data_out(2) <= rx;
                nextS <= t2;
            WHEN t2 =>
                strobe <= '0';
                data_out(3) <= rx;
                nextS <= t3;
            WHEN t3 =>
                strobe <= '0';
                data_out(4) <= rx;
                nextS <= t4;
            WHEN t4 =>
                strobe <= '0';
                data_out(5) <= rx;
                nextS <= t5;
            WHEN t5 =>
                strobe <= '0';
                data_out(6) <= rx;
                nextS <= t6;
            WHEN t6 =>
                strobe <= '0';
                data_out(7) <= rx;
                nextS <= t7;
            WHEN t7 =>
                strobe <= '1';
                nextS <= idle;
        END CASE stateChange;
    END PROCESS comb;
END moore;
