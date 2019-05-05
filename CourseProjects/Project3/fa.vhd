------------------------------------------------------------------
-- Digital System Design
-- Project: Carry-skip Adder design (project 3)
-- Date: 29-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: fa.vhd
-- Design: Data Flow model
-------------------------------------------------------------------
-- Description: A full adder with propagate output.
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY fa IS
    PORT(
        a_in, b_in, c_in  : IN  std_logic;
        s_out, p_out, c_out : OUT std_logic
        );
END fa;
-------------------------------------------------------------------
ARCHITECTURE dataFlow of fa IS
    SIGNAL g, mp : std_logic;
BEGIN
    mp <= a_in XOR b_in;
    g <= a_in AND b_in;
    s_out <= mp XOR c_in;
    c_out <= g OR (mp AND c_in);
    p_out <= mp;
END dataFlow;
