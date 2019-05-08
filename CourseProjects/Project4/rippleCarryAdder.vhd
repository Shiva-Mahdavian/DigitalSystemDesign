-----------------------------------------------------------------
-- Digital System Design
-- Project: Modefied Booth multiplier (project3)
-- Date: 4 May 2019
-- Author: Shivasadat Mahdavian
-- File: rippleCarryAdder.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY rippleCarryAdder IS
	GENERIC (N : integer := 65);
	PORT(
		a_in, b_in : IN  std_logic_vector(N-1 DOWNTO 0);
		res		   : OUT std_logic_vector(N DOWNTO 0)
		);
END rippleCarryAdder;
-----------------------------------------------------------------
ARCHITECTURE adder OF rippleCarryAdder IS
	-------- Component Declarataion: ---------
	COMPONENT fa IS
		PORT(
	        a_in, b_in, c_in  : IN  std_logic;
	        s_out, p_out, c_out : OUT std_logic
	        );
	END COMPONENT;
	-------- Signal Declaration: --------
	SIGNAL c : std_logic_vector(N DOWNTO 0);
BEGIN
	c(0) <= '0';
	adderGen: FOR i IN 0 TO N-1 GENERATE
		fullAdder: fa
		 PORT MAP(
		 	a_in => a_in(i),
			b_in => b_in(i),
			c_in => c(i),
			c_out => c(i+1),
			s_out => res(i),
			p_out => OPEN
		 	);
	END GENERATE adderGen;
	res(N) <= c(N);
END adder;
