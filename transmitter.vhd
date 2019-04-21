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
        data_in  : IN  std_logic_vector(8 DOWNTO 0);
        clk      : IN  std_logic;
        nreset   : IN  std_logic;
        s_out    : OUT std_logic
        );
END transmitter;
--------------------------------------------------------------------
ARCHITECTURE moore OF transmitter IS
    TYPE State_t IS (idle, start, transmit);
    SIGNAL currentS, nextS: State_t;
    SIGNAL cntr           : INTEGER;
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
    comb: PROCESS (start_in, data_in, currentS)
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
                cntr  <= 0;
                IF start_in = '1' THEN
                    nextS <= start;
                ELSE
                    nextS <= transmit;
                END IF;
            WHEN transmit =>
                s_out <= data_in(cntr);
                cntr <= cntr + 1;
                IF start_in = '1' THEN
                    nextS <= start;
                ELSIF cntr = 8 THEN
                    nextS <= idle;
                ELSE
                    nextS <= transmit;
                END IF;
        END CASE stateChange;
    END PROCESS comb;
END moore;
