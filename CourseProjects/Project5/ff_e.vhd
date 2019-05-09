-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 9 May 2019
-- Author: Shivasadat Mahdavian
-- File: ff_e.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY ff_e IS
    PORT(
        en, clk, d_in : IN  std_logic;
        q             : OUT std_logic
    );
END ff_e;
----------------------------------------------------------------
ARCHITECTURE behavioral of ff_e IS
BEGIN
    PROCESS(clk)
    BEGIN
        IF clk = '1' AND en = '1' THEN
            q <= d_in;
        END IF;
    END PROCESS;
END behavioral;
