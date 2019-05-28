-----------------------------------------------------------------
-- Digital System Design
-- Project: FPGA with NxN cells (project6)
-- Date: 20 May 2019
-- Author: Shivasadat Mahdavian
-- File: fpga.vhd
-----------------------------------------------------------------
-- $LOG$:
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-----------------------------------------------------------------
ENTITY fpga IS
    GENERIC(
        N : integer := 3;
        M : integer := 2
        );
    PORT(
        prog_en, prog_in, prog_clk : IN  std_logic;
        prog_out                   : OUT std_logic;
        r_in, l_in                 : IN  std_logic_vector(2*N-1 DOWNTO 0);
        u_in, d_in                 : IN  std_logic_vector(2*M-1 DOWNTO 0);
        r_out, l_out               : OUT std_logic_vector(2*N-1 DOWNTO 0);
        u_out, d_out               : OUT std_logic_vector(2*M-1 DOWNTO 0)
        );
    ---------- TYPE Declaration ---------
    SUBTYPE cellInOut IS std_logic_vector(3 DOWNTO 0);
    TYPE vRow       IS ARRAY(0 TO M-1) OF cellInOut;
    TYPE hRow       IS ARRAY(0 TO M)   OF cellInOut;
    TYPE vertical   IS ARRAY(0 TO N)   OF vRow;
    TYPE horizontal IS ARRAY(0 TO N-1) OF hRow;
END fpga;
-----------------------------------------------------------------
ARCHITECTURE structural OF fpga IS
    -------- Component Declaration ---------
    COMPONENT fpgaCell IS
        PORT(
            prog_en, prog_in, prog_clk : IN  std_logic;
            prog_out                   : OUT std_logic;
            u2_in, u4_in, d2_in, d4_in : IN  std_logic;
            r1_in, r3_in, l1_in, l3_in : IN  std_logic;
            u1_out, u3_out, d3_out     : OUT std_logic;
            r4_out, r2_out, d1_out     : OUT std_logic;
            l4_out, l2_out             : OUT std_logic
            );
    END COMPONENT;
    -------- Signal Declaration ---------
    SIGNAL v         : vertical;   -- vertical wires
    SIGNAL h         : horizontal; -- horizontal wire
    SIGNAL progInOut : std_logic_vector(0 TO M*N);
    --SIGNAL cellNum   : integer := 0;
BEGIN
    progInOut(0) <= prog_in;
    prog_out     <= progInOut(M*N);
    ---------
    row: FOR i IN 0 TO N-1 GENERATE
        col: FOR j IN 0 TO M-1 GENERATE
            cell: fpgaCell
             PORT MAP(
                prog_en  => prog_en,
                prog_in  => progInOut(i*M+j),
                prog_out => progInOut(i*M+j+1),
                prog_clk => prog_clk,
                l1_in    => h(i)(j)(0),
                l2_out   => h(i)(j)(1),
                l3_in    => h(i)(j)(2),
                l4_out   => h(i)(j)(3),
                r4_out   => h(i)(j+1)(0),
                r3_in    => h(i)(j+1)(1),
                r2_out   => h(i)(j+1)(2),
                r1_in    => h(i)(j+1)(3),
                u4_in    => v(i)(j)(0),
                u3_out   => v(i)(j)(1),
                u2_in    => v(i)(j)(2),
                u1_out   => v(i)(j)(3),
                d1_out   => v(i+1)(j)(0),
                d2_in    => v(i+1)(j)(1),
                d3_out   => v(i+1)(j)(2),
                d4_in    => v(i+1)(j)(3)
                );
        END GENERATE col;
    END GENERATE row;
    -------- Connect up ports --------
    upInOut: FOR i IN 0 TO M-1 GENERATE
        v(0)(i)(2)   <= u_in(2*(M-1-i));
        u_out(2*(M-1-i))   <= v(0)(i)(3);
        v(0)(i)(0)   <= u_in(2*(M-1-i)+1);
        u_out(2*(M-1-i)+1) <= v(0)(i)(1);
    END GENERATE upInOut;
    -------- connect down ports --------
    downInOut: FOR i IN 0 TO M-1 GENERATE
        d_out(2*(M-1-i))   <= v(N)(i)(2);
        v(N)(i)(3)   <= d_in(2*(M-1-i));
        d_out(2*(M-1-i)+1) <= v(N)(i)(0);
        v(N)(i)(1)   <= d_in(2*(M-1-i)+1);
    END GENERATE downInOut;
    --------- connect right ports --------
    rightInOut: FOR i IN 0 TO N-1 GENERATE
        r_out(2*(N-1-i))   <= h(i)(M)(2);
        h(i)(M)(3)   <= r_in(2*(N-1-i));
        r_out(2*(N-1-i)+1) <= h(i)(M)(0);
        h(i)(M)(1)   <= r_in(2*(N-1-i)+1);
    END GENERATE rightInOut;
    -------- connect left ports --------
    leftInOut: FOR i IN 0 TO N-1 GENERATE
        h(i)(0)(2)   <= l_in(2*(N-1-i));
        l_out(2*(N-1-i))   <= h(i)(0)(3);
        h(i)(0)(0)   <= l_in(2*(N-1-i)+1);
        l_out(2*(N-i-1)+1) <= h(i)(0)(1);
    END GENERATE leftInOut;
END structural;
