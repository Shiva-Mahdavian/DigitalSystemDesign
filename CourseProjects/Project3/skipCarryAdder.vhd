------------------------------------------------------------------
-- Digital System Design
-- Project: Carry-skip Adder design (project 3)
-- Date: 29-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: skipCarryAdder.vhd
-- Design: Structural
-------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY skipCarryAdder IS
    GENERIC (N : integer := 16;
             M : integer := 4);
    PORT(
        a_in, b_in : IN  std_logic_vector(N-1 DOWNTO 0);
        c_in       : IN  std_logic;
        sum_out    : OUT std_logic_vector(N-1 DOWNTO 0);
        c_out      : OUT std_logic
        );
END skipCarryAdder;
-------------------------------------------------------------------
ARCHITECTURE structural OF skipCarryAdder IS
    -------- Component Declaratation: --------
    COMPONENT skipCarryBlock IS
        GENERIC (M: integer := 4);
        PORT (
            a_in, b_in : IN  std_logic_vector(M-1 DOWNTO 0);
            c_in       : IN  std_logic;
            c_out      : OUT std_logic;
            s_out      : OUT std_logic_vector(M-1 DOWNTO 0)
            );
    END COMPONENT skipCarryBlock;
    -------- Signal declaratoin: --------
    SIGNAL c : std_logic_vector(0 to N/M);
BEGIN
    c(0)  <= c_in;
    c_out <= c(N/M);
    -------- Components instantiation: --------
    instant: FOR i in 0 to N/M-1 GENERATE
        skipCBlock: skipCarryBlock GENERIC MAP(M)
         PORT MAP(
            a_in  => a_in((i+1)*M-1 DOWNTO i*M),
            b_in  => b_in((i+1)*M-1 DOWNTO i*M),
            s_out => sum_out((i+1)*M-1 DOWNTO i*M),
            c_in  => c(i),
            c_out => c(i+1)
            );
    END GENERATE instant;

END structural;
