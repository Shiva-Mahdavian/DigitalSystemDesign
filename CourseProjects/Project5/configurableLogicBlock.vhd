-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 8 May 2019
-- Author: Shivasadat Mahdavian
-- File: configurableLogicBlock.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY configurableLogicBlock IS
    PORT(
        prog_in, prog_en  : IN  std_logic;
        sel_in            : IN  std_logic_vector(1 DOWNTO 0);
        prog_clk, clk     : IN  std_logic;
        prog_out, clb_out : OUT std_logic
        );
END configurableLogicBlock;
----------------------------------------------------------------
ARCHITECTURE structural OF configurableLogicBlock IS
    -------- Component FF with enable Declaration: --------
    COMPONENT ff_e IS
        PORT(
            en, clk, d_in : IN  std_logic;
            q             : OUT std_logic
        );
    END COMPONENT;
    -------- Component FF Declaration: --------
    COMPONENT ff IS
        PORT(
            clk, d_in     : IN  std_logic;
            q             : OUT std_logic
        );
    END COMPONENT;
    --------- Component mux4 Declaration: ---------
    COMPONENT mux4 IS
        PORT (
            m_in  : IN  std_logic_vector(0 TO 3);
            sel   : IN  std_logic_vector(1 DOWNTO 0);
            m_out : OUT std_logic
            );
    END COMPONENT;
    -------- Component mux2 Declaration: --------
    COMPONENT mux2 IS
        PORT (
            m_in  : IN  std_logic_vector(0 TO 1);
            sel   : IN  std_logic;
            m_out : OUT std_logic
            );
    END COMPONENT;
    -------- Signal Declaration: --------
    SIGNAL regWire         : std_logic_vector(5 DOWNTO 0);
    SIGNAL mux1res, regOut : std_logic;
BEGIN
    -------- CLB register Instantiation: --------
    clbReg: ff
     PORT MAP(
        clk  => clk,
        d_in => mux1res,
        q    => regOut
        );
    -------- 1st MUX input ShRegs Instantiation: --------
    regWire(0) <= prog_in;
    regGen: FOR i in 0 TO 3 GENERATE
        reg: ff_e
         PORT MAP(
            en   => prog_en,
            clk  => prog_clk,
            d_in => regWire(i),
            q    => regWire(i+1)
            );
    END GENERATE regGen;
    -------- 2nd MUX select ShReg Instantiation: --------
    sel: ff_e
     PORT MAP(
        clk  => prog_clk,
        d_in => regWire(4),
        en   => prog_en,
        q    => regWire(5)
        );
    prog_out <= regWire(5);
    --------- 1st MUX Instantiation: --------
    firstMux : mux4
     PORT MAP(
        m_in(0) => regWire(1),
        m_in(1) => regWire(2),
        m_in(2) => regWire(3),
        m_in(3) => regWire(4),
        sel     => sel_in,
        m_out   => mux1res
        );
    --------- 2nd MUX Instantiation: --------
    secondMux : mux2
     PORT MAP(
        m_in(0) => regOut,
        m_in(1) => mux1res,
        sel     => regWire(5),
        m_out   => clb_out
        );
END structural;
