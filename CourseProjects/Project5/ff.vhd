-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 9 May 2019
-- Author: Shivasadat Mahdavian
-- File: ff.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY ff IS
    PORT(
        clk, d_in : IN  std_logic;
        q             : OUT std_logic
    );
END ff;
----------------------------------------------------------------
ARCHITECTURE behavioral of ff IS
BEGIN
    PROCESS(clk)
    BEGIN
        IF clk = '1' THEN
            q <= d_in;
        END IF;
    END PROCESS;
END behavioral;
