-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 9 May 2019
-- Author: Shivasadat Mahdavian
-- File: mux2.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY mux2 IS
    PORT (
        m_in  : IN  std_logic_vector(0 TO 1);
        sel   : IN  std_logic;
        m_out : OUT std_logic
        );
END mux2;
-----------------------------------------------------------------
ARCHITECTURE behavioral OF mux2 IS
BEGIN
    PROCESS (m_in, sel)
    BEGIN
        CASE sel IS
            WHEN '0' =>
                m_out <= m_in(0);
            WHEN '1' =>
                m_out <= m_in(1);
            WHEN OTHERS =>
                m_out <= 'Z';
        END CASE;
    END PROCESS;
END behavioral;
