-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 9 May 2019
-- Author: Shivasadat Mahdavian
-- File: connectionBlock.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY connectionBlock IS
    PORT(
        r2_in, r4_in      : IN std_logic;
        r1_out, r3_out    : OUT std_logic;
        l1_in, l3_in      : IN std_logic;
        l4_out, l2_out    : OUT std_logic;
        prog_in, prog_en  : IN std_logic;
        prog_clk, clb_res : IN  std_logic;
        prog_out          : OUT std_logic;
        clb_clk_out       : OUT std_logic;
        clb_sel_out       : OUT std_logic_vector(1 DOWNTO 0)
        );
END connectionBlock;
-----------------------------------------------------------------
ARCHITECTURE structural OF connectionBlock IS
    -------- Component ff with en Declaration: ---------
    COMPONENT ff_e IS
        PORT(
            en, clk, d_in : IN  std_logic;
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
    SIGNAL regWire : std_logic_vector(0 TO 10);
    SIGNAL mux4Res : std_logic_vector(0 TO 2);
    SIGNAL mux2Res : std_logic_vector(0 TO 3);
    SIGNAL mux2in  : std_logic_vector(0 TO 3);
BEGIN
    -------- ShiftRegister Instantiation: --------
    ---- the first 6 are for 3 mux4 selects
    ---- the latter 4 are for 4 mux2 selects
    regWire(0) <= prog_in;
    prog_out <= regWire(10);
    regGen: FOR i IN 0 TO 9 GENERATE
        reg: ff_e
         PORT MAP(
            en   => prog_en,
            clk  => prog_clk,
            d_in => regWire(i),
            q    => regWire(i+1)
            );
    END GENERATE regGen;
    -------- mux4 Instantiation: --------
    mux4Gen: FOR i IN 0 TO 2 GENERATE
        mux_4: mux4
         PORT MAP(
             m_in(0) => r2_in,
             m_in(1) => l1_in,
             m_in(2) => r4_in,
             m_in(3) => l3_in,
             sel(0)  => regWire(2*i+1),
             sel(1)  => regWire(2*i+2),
             m_out   => mux4Res(i)
            );
    END GENERATE mux4Gen;
    --------
    clb_sel_out(0) <= mux4Res(1);
    clb_sel_out(1) <= mux4Res(0);
    clb_clk_out    <= mux4Res(2);
    -------- mux2 Instantiation: --------
    mux2Gen: FOR i IN 0 TO 3 GENERATE
        mux_2 : mux2
         PORT MAP(
            m_in(0) => mux2in(i),
            m_in(1) => clb_res,
            sel     => regWire(i+7),
            m_out   => mux2Res(i)
            );
    END GENERATE mux2Gen;
    --------
    mux2in <= r2_in & l1_in & r4_in & l3_in;
    l2_out <= mux2Res(0);
    r1_out <= mux2Res(1);
    l4_out <= mux2Res(2);
    r3_out <= mux2Res(3);
END structural;
