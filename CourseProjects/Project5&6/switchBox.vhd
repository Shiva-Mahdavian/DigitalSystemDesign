-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA Cell (project5)
-- Date: 9 May 2019
-- Author: Shivasadat Mahdavian
-- File: switchBox.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY switchBox IS
    PORT(
        r1_in, r3_in     : IN  std_logic;
        r4_out, r2_out   : OUT std_logic;
        l1_in, l3_in     : IN  std_logic;
        l4_out, l2_out   : OUT std_logic;
        u2_in, u4_in     : IN  std_logic;
        u1_out, u3_out   : OUT std_logic;
        d2_in, d4_in     : IN  std_logic;
        d1_out, d3_out   : OUT std_logic;
        prog_in, prog_en : IN std_logic;
        prog_clk         : IN std_logic;
        prog_out         : OUT std_logic
    );
END switchBox;
-----------------------------------------------------------------
ARCHITECTURE structural OF switchBox IS
    --------- Component mux4 Declaration: ---------
    COMPONENT mux4 IS
        PORT (
            m_in  : IN  std_logic_vector(0 TO 3);
            sel   : IN  std_logic_vector(1 DOWNTO 0);
            m_out : OUT std_logic
            );
    END COMPONENT;
    -------- Component FF with enable Declaration: --------
    COMPONENT ff_e IS
        PORT(
            en, clk, d_in : IN  std_logic;
            q             : OUT std_logic
        );
    END COMPONENT;
    -------- Signal Declaration: --------
    SIGNAL regWire : std_logic_vector(0 TO 16);
BEGIN
    -------- ShiftRegister Instantiation: --------
    regWire(0) <= prog_in;
    prog_out   <= regWire(16);
    regGen: FOR i IN 0 TO 15 GENERATE
        reg: ff_e
         PORT MAP(
            en   => prog_en,
            clk  => prog_clk,
            d_in => regWire(i),
            q    => regWire(i+1)
            );
    END GENERATE regGen;
    -------- Mux4 Declaration: --------
    muxL2: mux4
     PORT MAP(
        m_in(0) => d4_in,
        m_in(1) => r3_in,
        m_in(2) => u4_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(2),
        sel(1)  => regWire(1),
        m_out   => l2_out
        );
    muxL4: mux4
     PORT MAP(
        m_in(0) => d2_in,
        m_in(1) => r1_in,
        m_in(2) => u2_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(4),
        sel(1)  => regWire(3),
        m_out   => l4_out
        );
    muxU1: mux4
     PORT MAP(
        m_in(0) => l1_in,
        m_in(1) => d4_in,
        m_in(2) => r1_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(6),
        sel(1)  => regWire(5),
        m_out   => u1_out
        );
    muxU3: mux4
     PORT MAP(
        m_in(0) => l3_in,
        m_in(1) => d2_in,
        m_in(2) => r3_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(8),
        sel(1)  => regWire(7),
        m_out   => u3_out
        );
    muxR4: mux4
     PORT MAP(
        m_in(0) => u2_in,
        m_in(1) => l1_in,
        m_in(2) => d4_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(10),
        sel(1)  => regWire(9),
        m_out   => r4_out
        );
    muxR2: mux4
     PORT MAP(
        m_in(0) => u4_in,
        m_in(1) => l3_in,
        m_in(2) => d2_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(12),
        sel(1)  => regWire(11),
        m_out   => r2_out
        );
    muxD1: mux4
     PORT MAP(
        m_in(0) => r3_in,
        m_in(1) => u4_in,
        m_in(2) => l1_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(14),
        sel(1)  => regWire(13),
        m_out   => d1_out
        );
    muxD3: mux4
     PORT MAP(
        m_in(0) => r1_in,
        m_in(1) => u2_in,
        m_in(2) => l3_in,
        m_in(3) => 'Z',
        sel(0)  => regWire(16),
        sel(1)  => regWire(15),
        m_out   => d3_out
        );
END structural;
