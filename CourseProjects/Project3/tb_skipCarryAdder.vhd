-------------------------------------------------------------------
-- Digital System Design
-- Project: Carry-skip Adder design (project 3)
-- Date: 29-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: tb_skipCarryAdder.vhd
-- Design: -
-------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY tb_skipCarryAdder IS
END tb_skipCarryAdder;
-------------------------------------------------------------------
ARCHITECTURE testbench OF tb_skipCarryAdder IS
    --------- DUT Declaration: --------
    COMPONENT skipCarryAdder IS
        GENERIC (N : integer := 16;
                 M : integer := 4);
        PORT(
            a_in, b_in : IN  std_logic_vector(N-1 DOWNTO 0);
            c_in       : IN  std_logic;
            sum_out    : OUT std_logic_vector(N-1 DOWNTO 0);
            c_out      : OUT std_logic
            );
    END COMPONENT;
    -------- Signal Declaration: --------
    SIGNAL a, b, sum : std_logic_vector(15 DOWNTO 0);
    SIGNAL cin, cout : std_logic;
BEGIN
    --------- DUT Instantiation: ---------
    dut: skipCarryAdder
     GENERIC MAP (
        M => 4,
        N => 16
        )
     PORT MAP(
        a_in    => a,
        b_in    => b,
        c_in    => cin,
        c_out   => cout,
        sum_out => sum
        );
    -------- Stimuli instantiation: ---------
    a <= "0000000000000000",
         "1111111111111111" AFTER 10 ns,
         "1010101010010110" AFTER 20 ns,
         "1111111111110001" AFTER 30 ns,
         "1111000110101001" AFTER 40 ns,
         "1000000000011111" AFTER 50 ns,
         "1111111111111111" AFTER 60 ns;
    b <= "1101010101111110",
         "1011010111100001" AFTER 10 ns,
         "1111111111111111" AFTER 20 ns,
         "1010101011100000" AFTER 30 ns,
         "0010101010101110" AFTER 40 ns,
         "0101010100111011" AFTER 50 ns,
         "1111111111111111" AFTER 60 ns;
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
