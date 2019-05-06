-----------------------------------------------------------------
-- Digital System Design
-- Project: Modefied Booth multiplier (project3)
-- Date: 6 May 2019
-- Author: Shivasadat Mahdavian
-- File: tb_boothMultiplier.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY tb_boothMultiplier IS
END tb_boothMultiplier;
-----------------------------------------------------------------
ARCHITECTURE test OF tb_boothMultiplier IS
    COMPONENT boothMultiplier IS
    	GENERIC (N : integer := 64);
    	PORT(
    		multiplier, multiplicand : IN  std_logic_vector(N-1 DOWNTO 0);
    		result					 : OUT std_logic_vector(2*N-1 DOWNTO 0)
    		);
    END COMPONENT;
    -------- Signal Declaration: --------
    SIGNAL m1, m2 : std_logic_vector(5 DOWNTO 0);
    SIGNAL result : std_logic_vector(11 DOWNTO 0);
BEGIN
    DUT: boothMultiplier
     GENERIC MAP(6)
     PORT MAP(
        m1, m2, result
        );
    m1 <= "000000", "001011" AFTER 10 ns;
    m2 <= "010011";
END test;
