-------------------------------------------------------------------
-- Digital System Design
-- Project: Carry-skip Adder design (project 3)
-- Date: 29-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: tb_skipCarryBlock.vhd
-- Design: -
-------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY tb_skipCarryBlock IS
END tb_skipCarryBlock;
-------------------------------------------------------------------
ARCHITECTURE testbench OF tb_skipCarryBlock IS
    --------- DUT Declaration: --------
    COMPONENT skipCarryBlock IS
        GENERIC (M: integer := 4);
        PORT (
            a_in, b_in : IN  std_logic_vector(M-1 DOWNTO 0);
            c_in       : IN  std_logic;
            c_out      : OUT std_logic;
            s_out      : OUT std_logic_vector(M-1 DOWNTO 0)
            );
    END COMPONENT;
    -------- Signal Declaration: ---------
    SIGNAL a, b, sum : std_logic_vector(3 DOWNTO 0);
    SIGNAL cin, cout : std_logic;
BEGIN
    --------- DUT Instantiation: ---------
    dut: skipCarryBlock GENERIC MAP (M => 4)
     PORT MAP(
        a_in  => a,
        b_in  => b,
        c_in  => cin,
        c_out => cout,
        s_out => sum
        );
    -------- Stimuli instantiation: ---------
    a <= "0101",
         "1000" AFTER 10 ns,
         "1010" AFTER 20 ns,
         "1000" AFTER 30 ns,
         "1011" AFTER 40 ns,
         "0011" AFTER 50 ns,
         "0100" AFTER 60 ns;
    b <= "1010",
         "1010" AFTER 10 ns,
         "0010" AFTER 20 ns,
         "0111" AFTER 30 ns,
         "1001" AFTER 40 ns,
         "0010" AFTER 50 ns,
         "0101" AFTER 60 ns;
    cin <= '0',
           '1' AFTER 5 ns,
           '0' AFTER 10 ns,
           '1' AFTER 15 ns,
           '0' AFTER 20 ns,
           '1' AFTER 25 ns,
           '0' AFTER 30 ns,
           '1' AFTER 35 ns,
           '0' AFTER 40 ns,
           '1' AFTER 45 ns,
           '0' AFTER 50 ns,
           '1' AFTER 55 ns,
           '0' AFTER 60 ns,
           '1' AFTER 65 ns;
END testbench;
