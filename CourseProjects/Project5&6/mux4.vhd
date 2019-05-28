-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 9 May 2019
-- Author: Shivasadat Mahdavian
-- File: mux4.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY mux4 IS
    PORT (
        m_in  : IN  std_logic_vector(0 TO 3);
        sel   : IN  std_logic_vector(1 DOWNTO 0);
        m_out : OUT std_logic
        );
END mux4;
-----------------------------------------------------------------
ARCHITECTURE behavioral OF mux4 IS
BEGIN
    PROCESS (m_in, sel)
    BEGIN
        CASE sel IS
            WHEN "00" =>
                m_out <= m_in(0);
            WHEN "01" =>
                m_out <= m_in(1);
            WHEN "10" =>
                m_out <= m_in(2);
            WHEN "11" =>
                m_out <= m_in(3);
            WHEN OTHERS =>
                m_out <= 'Z';
        END CASE;
    END PROCESS;
END behavioral;
