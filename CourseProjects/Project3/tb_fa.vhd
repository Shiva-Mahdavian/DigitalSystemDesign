------------------------------------------------------------------
-- Digital System Design
-- Project: Carry-skip Adder design (project 3)
-- Date: 29-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: tb_fa.vhd
-- Design: Data Flow model
-------------------------------------------------------------------
-- Description: Testbench for fa
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY tb_fa IS
END tb_fa;
-------------------------------------------------------------------
ARCHITECTURE testbench OF tb_fa IS
    -------- DUT Declaration: ---------
    COMPONENT fa IS
        PORT(
            a_in, b_in, c_in  : IN  std_logic;
            s_out, p_out, c_out : OUT std_logic
            );
    END COMPONENT;
    -------- Signal Declaration: --------
    SIGNAL a, b, cin, s, p, cout : std_logic;
BEGIN
    --------- DUT instantiation: --------
    dut: fa
     PORT MAP (
        a_in  => a,
        b_in  => b,
        c_in  => cin,
        s_out => s,
        p_out => p,
        c_out => cout
        );
    -------- Stimuli instantiation: --------
    a   <= '0',
           '1' AFTER 40 ns;
    b   <= '0',
           '1' AFTER 20 ns,
           '0' AFTER 40 ns,
           '1' AFTER 60 ns;
    cin <= '0',
           '1' AFTER 10 ns,
           '0' AFTER 20 ns,
           '1' AFTER 30 ns,
           '0' AFTER 40 ns,
           '1' AFTER 50 ns,
           '0' AFTER 60 ns,
           '1' AFTER 70 ns;
END testbench;
