------------------------------------------------------------------
-- Digital System Design
-- Project: UART design (project 2)
-- Date: 21-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: transmitter.vhd
-- Design: ?
-------------------------------------------------------------------
-- Description: Parallel to Serial transmitter
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY transmitter IS
    PORT(
        start_in : IN  std_logic;
        data_in  : IN  std_logic_vector(7 DOWNTO 0);
        clk      : IN  std_logic;
        nreset   : IN  std_logic;
        s_out    : OUT std_logic
        );
END transmitter;
--------------------------------------------------------------------
ARCHITECTURE moore OF transmitter IS
    TYPE State_t IS (idle, start, t0, t1, t2, t3, t4, t5, t6, t7);
    SIGNAL currentS, nextS: State_t;
BEGIN
    -------- Lower Section --------
    seq: PROCESS (nreset, clk)
    BEGIN
        IF nreset = '0' THEN
            currentS <= idle;
        ELSIF clk'EVENT AND clk = '1' THEN
            currentS <= nextS;
        END IF;
    END PROCESS seq;
    -------- Upper Section --------
    comb: PROCESS (start_in, currentS)
    BEGIN
        stateChange: CASE currentS IS
            WHEN idle =>
                s_out <= 'X';
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= idle;
                END IF;
            WHEN start =>
                s_out <= '0';
                --cntr  <= 0;
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t0;
                END IF;
            WHEN t0 =>
                s_out <= data_in(0);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t1;
                END IF;
            WHEN t1 =>
                s_out <= data_in(1);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t2;
                END IF;
            WHEN t2 =>
                s_out <= data_in(2);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t3;
                END IF;
            WHEN t3 =>
                s_out <= data_in(3);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t4;
                END IF;
            WHEN t4 =>
                s_out <= data_in(4);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t5;
                END IF;
            WHEN t5 =>
                s_out <= data_in(5);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t6;
                END IF;
            WHEN t6 =>
                s_out <= data_in(6);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= t7;
                END IF;
            WHEN t7 =>
                s_out <= data_in(7);
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= idle;
                END IF;
        END CASE stateChange;
    END PROCESS comb;
END moore;
