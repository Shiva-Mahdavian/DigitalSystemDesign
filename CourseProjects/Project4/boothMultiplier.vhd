-----------------------------------------------------------------
-- Digital System Design
-- Project: Modefied Booth multiplier (project3)
-- Date: 4 May 2019
-- Author: Shivasadat Mahdavian
-- File: boothMultiplier.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY boothMultiplier IS
	GENERIC (N : integer := 64);
	PORT(
		multiplier, multiplicand : IN  std_logic_vector(N-1 DOWNTO 0);
		result					 : OUT std_logic_vector(2*N-1 DOWNTO 0)
		);
	TYPE ARR2d IS ARRAY (0 TO N/2) OF std_logic_vector(N DOWNTO 0);
	TYPE BARR2d IS ARRAY  (0 TO N/2) OF std_logic_vector(N+1 DOWNTO 0);
END boothMultiplier;
-----------------------------------------------------------------
ARCHITECTURE concurrent OF boothMultiplier IS
	-------- 1st Component Declaration: --------
	COMPONENT boothDecoder IS
		GENERIC(N : integer := 64);
		PORT(
		a_in  			 : IN  std_logic_vector(2 DOWNTO 0);
		y_in, y_l_in	 : IN  std_logic_vector(N DOWNTO 0);   -- Multiplicand and -Multiplicand
		y2_in, y2_l_in   : IN  std_logic_vector(N DOWNTO 0);   -- 2*Multiplicand and -2*Multiplicand
		z_out 			 : OUT std_logic_vector(N DOWNTO 0)
		);
	END COMPONENT;
	-------- 2nd Component Declaration: --------
	COMPONENT partialProductGen IS
	 	GENERIC(N : integer := 64);
		PORT(
		m_in 	 : IN  std_logic_vector(N-1 DOWNTO 0);
		m_l_out  : OUT std_logic_vector(N DOWNTO 0);
		m2_out   : OUT std_logic_vector(N DOWNTO 0);
		m2_l_out : OUT std_logic_vector(N DOWNTO 0)
		);
	END COMPONENT;
	-------- 3rd Component Declaration --------
	COMPONENT adder IS
		GENERIC(N : integer := 64);
		PORT (
			a_in : IN  std_logic_vector(N-2 DOWNTO 0);
			b_in : IN  std_logic_vector(N DOWNTO 0);
			res  : OUT std_logic_vector(N DOWNTO 0)
			);
	END COMPONENT;
	-------- Signal Declaration: ---------
	SIGNAL m, twicemulMinus   : std_logic_vector(N DOWNTO 0);
	SIGNAL extMultiplicand    : std_logic_vector(N DOWNTO 0);
	SIGNAL mulMinus, twiceMul : std_logic_vector(N DOWNTO 0);
	SIGNAL decodersRes		  : ARR2d;
	SIGNAL layerRes		      : ARR2d;
BEGIN
	-------- Add leading 0 to multiplier ---------
	m <= multiplier & '0';
	-------- SignExtend multiplicand: --------
	extMultiplicand <= multiplicand(N) & multiplicand;
	-------- partialProductGen instantiation: ---------
	ppgen: partialProductGen
	 GENERIC MAP(N)
	 PORT MAP(
		m_in     => multiplicand,
		m_l_out  => mulMinus,
		m2_out   => twiceMul,
		m2_l_out => twicemulMinus
		);
	-------- boothDecoder instantiation: ---------
	decoderGeneration: FOR i IN 0 TO N/2 GENERATE
		decoder: boothDecoder
		 GENERIC MAP(N)
		 PORT MAP (
		 	a_in(2) => m(2*i + 2),
			a_in(1) => m(2*i+1),
			a_in(0) => m(2*i),
			y_in	=> extMultiplicand,
			y_l_in  => mulMinus,
			y2_l_in => twicemulMinus,
			y2_in   => twiceMul,
			z_out   => decodersRes(i)
			);
	END GENERATE decoderGeneration;
	-------- adder and output mapping: --------
	layerRes(0) <= decodersRes(0);
	adderGeneration: FOR i IN 0 TO N/2-1 GENERATE
		result(2*i+1 DOWNTO 2*i) <= layerRes(i);
		a: adder
		 GENERIC MAP(N)
		 PORT MAP (
			a_in => layerRes(i)(N DOWNTO 2),
			b_in => decodersRes(i+1),
			res  => layerRes(i+1)
			);
	END GENERATE adderGeneration;
	result(2*N-2 DOWNTO N-2) <= layerRes(N/2);
END concurrent;
--------------------------------------------------------------------
