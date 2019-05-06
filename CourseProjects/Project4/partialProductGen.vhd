-----------------------------------------------------------------
-- Digital System Design
-- Project: Modefied Booth multiplier (project3)
-- Date: 4 May 2019
-- Author: Shivasadat Mahdavian
-- File: partialProductGen.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

use ieee.numeric_std.all;
-----------------------------------------------------------------
ENTITY partialProductGen IS
	GENERIC (N : integer := 64);
	PORT(
		m_in 	 : IN  std_logic_vector(N-1 DOWNTO 0);
		m_l_out  : OUT std_logic_vector(N DOWNTO 0);
		m2_out   : OUT std_logic_vector(N DOWNTO 0);
		m2_l_out : OUT std_logic_vector(N DOWNTO 0)
		);
END partialProductGen;
-----------------------------------------------------------------
ARCHITECTURE ppGen OF partialProductGen IS
	-------- Component Declaration: --------
	COMPONENT rippleCarryAdder IS
		GENERIC(N : integer := 64);
		PORT(
			a_in, b_in : IN  std_logic_vector(N DOWNTO 0);
			res		   : OUT std_logic_vector(N+1 DOWNTO 0)
			);
	END COMPONENT;
	-------- Signal Declaration: --------
	SIGNAL twice, nTwice      : std_logic_vector(N DOWNTO 0);
	SIGNAL extM, nExtm, one   : std_logic_vector(N DOWNTO 0);
	SIGNAL extOut             : std_logic_vector(N+1 DOWNTO 0);
BEGIN
	--m_l_out <= SIGNED'(NOT m_in) + '1';
	one <= (0 => '1', OTHERS =>'0');
	extM <= m_in(N-1) & m_in;
	nExtm <= NOT extM;
	adder1: rippleCarryAdder
	 GENERIC MAP(N-1)
	 PORT MAP(
	 	a_in => one,
		b_in => nExtm,
		res => m_l_out
	 	);

	twice    <= (m_in & '0');
	m2_out 	 <= twice;
	nTwice   <= NOT twice;
	--m2_l_out <= SIGNED'(NOT twice) + '1';
	adder2: rippleCarryAdder
	 GENERIC MAP(N)
	 PORT MAP(
		a_in => one,
		b_in => nTwice,
		res => extOut
		);
	m2_l_out <= extOut(N DOWNTO 0);
END ppGen;
