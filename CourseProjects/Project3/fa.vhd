------------------------------------------------------------------
-- Digital System Design
-- Project: Carry-skip Adder design (project 3)
-- Date: 21-Apr-2019
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
        a, b, cin  : IN  std_logic;
        s, p, cout : OUT std_logic
        );
END fa;
-------------------------------------------------------------------
ARCHITECTURE dataFlow of fa IS
    SIGNAL g, mp : std_logic;
BEGIN
    mp <= a XOR b;
    g <= a AND b;
    s <= mp XOR cin;
    cout <= g OR (mp AND cin);
    p <= mp;
END dataFlow;
