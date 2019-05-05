------------------------------------------------------------------
-- Digital System Design
-- Project: Carry-skip Adder design (project 3)
-- Date: 29-Apr-2019
-- Authur: Shivasadat Mahdavian
-- File: skipCarryBlock.vhd
-- Design: Data Flow model
-------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------
--$LOG$:
-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-------------------------------------------------------------------
ENTITY skipCarryBlock IS
    GENERIC (M: integer := 4);
    PORT (
        a_in, b_in : IN  std_logic_vector(M-1 DOWNTO 0);
        c_in       : IN  std_logic;
        c_out      : OUT std_logic;
        s_out      : OUT std_logic_vector(M-1 DOWNTO 0)
        );
END skipCarryBlock;
-------------------------------------------------------------------
ARCHITECTURE dataFlow OF skipCarryBlock IS
    -------- Component Declaration: ---------
    COMPONENT fa IS
        PORT(
            a_in, b_in, c_in    : IN  std_logic;
            s_out, p_out, c_out : OUT std_logic
            );
    END COMPONENT;
    -------- Signal Declaration: --------
    SIGNAL c            : std_logic_vector(M DOWNTO 0);
    SIGNAL p, propagate : std_logic_vector(M-1 DOWNTO 0);
BEGIN
    -------- Sum Logic: --------
    c(0) <= c_in;
    sumLogic: FOR i IN 0 to M-1 GENERATE
        adder: fa
         PORT MAP(
            c_in   => c(i),
            c_out => c(i+1),
            a_in  => a_in(i),
            b_in  => b_in(i),
            s_out => s_out(i),
            p_out => p(i)
            );
    END GENERATE sumLogic;
    -------- Propagate Logic: --------
    propagate(0) <= p(0);
    propagateLogic: FOR i IN 1 to M-1 GENERATE
        propagate(i) <= p(i) AND propagate(i-1);
    END GENERATE propagateLogic;
    -------- Skip Carry Logic: --------
    c_out <= c_in WHEN propagate(M-1)='1' ELSE c(M);
END dataFlow;
