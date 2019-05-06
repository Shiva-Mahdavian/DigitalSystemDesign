-----------------------------------------------------------------
-- Digital System Design
-- Project: Modefied Booth multiplier (project3)
-- Date: 6 May 2019
-- Author: Shivasadat Mahdavian
-- File: adder.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY adder IS
    GENERIC(N : integer := 64);
    PORT (
        a_in : IN  std_logic_vector(N-2 DOWNTO 0);
        b_in : IN  std_logic_vector(N DOWNTO 0);
        res  : OUT std_logic_vector(N DOWNTO 0)
        );
END adder;
------------------------------------------------------------------
ARCHITECTURE arch OF adder IS
    -------- Component Declaration --------
    COMPONENT rippleCarryAdder IS
        GENERIC(N : integer := 64);
        PORT(
            a_in, b_in : IN  std_logic_vector(N DOWNTO 0);
            res		   : OUT std_logic_vector(N+1 DOWNTO 0)
            );
    END COMPONENT;
    -------- Signal Declaration: ---------
    SIGNAL ext : std_logic_vector(N DOWNTO 0);
    SIGNAL rippleRes :  std_logic_vector(N+1 DOWNTO 0);
BEGIN
    ext <= a_in(N-2) & a_in(N-2) & a_in;
    ripple: rippleCarryAdder
     GENERIC MAP(N)
     PORT MAP(
        a_in => ext,
        b_in => b_in,
        res => rippleRes
        );
    res <= rippleRes(N DOWNTO 0);
END arch;
