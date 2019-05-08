-----------------------------------------------------------------
-- Digital System Design
-- Project: Modefied Booth multiplier (project3)
-- Date: 4 May 2019
-- Author: Shivasadat Mahdavian
-- File: boothDecoder.vhd
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY boothDecoder IS
	GENERIC (N : integer := 65);
	PORT(
		a_in  			 : IN  std_logic_vector(2 DOWNTO 0);
		y_in, y_l_in	 : IN  std_logic_vector(N-1 DOWNTO 0);   -- Multiplicand and -Multiplicand
		y2_in, y2_l_in   : IN  std_logic_vector(N-1 DOWNTO 0);   -- 2*Multiplicand and -2*Multiplicand
		z_out 			 : OUT std_logic_vector(N-1 DOWNTO 0)
		);
END boothDecoder;
-----------------------------------------------------------------
ARCHITECTURE decoder OF boothDecoder IS
BEGIN
	decode: PROCESS (a_in, y_in, y_l_in, y2_in, y2_l_in)
	BEGIN
		CASE a_in IS
			WHEN "000" =>
				z_out <= (OTHERS => '0');
			WHEN "001"|"010" =>
				z_out <= y_in;
			WHEN "011" =>
				z_out <= y2_in;
			WHEN "100" =>
				z_out <= y2_l_in;
			WHEN "101"|"110" =>
				z_out <=  y_l_in;
			WHEN "111" =>
				z_out <= (OTHERS => '0');
			WHEN OTHERS =>
				z_out <= (OTHERS => '0');
		END CASE;
	END PROCESS decode;
END decoder;
