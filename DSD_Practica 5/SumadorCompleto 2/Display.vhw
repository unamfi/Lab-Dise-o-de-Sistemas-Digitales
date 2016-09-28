--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2.03i
--  \   \         Application : ISE
--  /   /         Filename : Display.vhw
-- /___/   /\     Timestamp : Sat Apr 02 00:39:29 2016
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: Display
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY Display IS
END Display;

ARCHITECTURE testbench_arch OF Display IS
    COMPONENT UnidadAritmetica
        PORT (
            PA : In std_logic_vector (3 DownTo 0);
            PB : In std_logic_vector (3 DownTo 0);
            SL : In std_logic_vector (1 DownTo 0);
            Cin : In std_logic;
            E : In std_logic;
            R : Out std_logic_vector (9 DownTo 0)
        );
    END COMPONENT;

    SIGNAL PA : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL PB : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL SL : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL Cin : std_logic := '0';
    SIGNAL E : std_logic := '1';
    SIGNAL R : std_logic_vector (9 DownTo 0) := "0000000000";

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : UnidadAritmetica
        PORT MAP (
            PA => PA,
            PB => PB,
            SL => SL,
            Cin => Cin,
            E => E,
            R => R
        );

        PROCESS
            PROCEDURE CHECK_R(
                next_R : std_logic_vector (9 DownTo 0);
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (R /= next_R) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns R="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, R);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_R);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  20ns
                WAIT FOR 20 ns;
                PA <= "0101";
                SL <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  40ns
                WAIT FOR 20 ns;
                PA <= "1100";
                SL <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  60ns
                WAIT FOR 20 ns;
                PA <= "1001";
                PB <= "0010";
                SL <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  80ns
                WAIT FOR 20 ns;
                Cin <= '1';
                PA <= "0001";
                PB <= "0011";
                SL <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  100ns
                WAIT FOR 20 ns;
                PA <= "1110";
                PB <= "1010";
                SL <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  120ns
                WAIT FOR 20 ns;
                PA <= "0111";
                PB <= "0110";
                SL <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  140ns
                WAIT FOR 20 ns;
                PB <= "1111";
                SL <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  160ns
                WAIT FOR 20 ns;
                Cin <= '0';
                PA <= "1010";
                PB <= "1010";
                SL <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  180ns
                WAIT FOR 20 ns;
                PA <= "0011";
                PB <= "0000";
                SL <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 20 ns;
                PA <= "0110";
                PB <= "1001";
                SL <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  220ns
                WAIT FOR 20 ns;
                PA <= "1100";
                PB <= "0100";
                SL <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  240ns
                WAIT FOR 20 ns;
                Cin <= '1';
                PA <= "0001";
                PB <= "0101";
                SL <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  260ns
                WAIT FOR 20 ns;
                PA <= "1000";
                PB <= "1001";
                SL <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  280ns
                WAIT FOR 20 ns;
                PB <= "0000";
                SL <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 20 ns;
                PA <= "0101";
                PB <= "0011";
                SL <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  320ns
                WAIT FOR 20 ns;
                Cin <= '0';
                PA <= "1100";
                PB <= "1111";
                SL <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  340ns
                WAIT FOR 20 ns;
                PB <= "0110";
                -- -------------------------------------
                -- -------------  Current Time:  360ns
                WAIT FOR 20 ns;
                PB <= "1011";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 40 ns;
                Cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  480ns
                WAIT FOR 80 ns;
                Cin <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  560ns
                WAIT FOR 80 ns;
                Cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  640ns
                WAIT FOR 80 ns;
                Cin <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  720ns
                WAIT FOR 80 ns;
                Cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 80 ns;
                Cin <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  880ns
                WAIT FOR 80 ns;
                Cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  960ns
                WAIT FOR 80 ns;
                Cin <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1040ns
                WAIT FOR 80 ns;
                Cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1120ns
                WAIT FOR 80 ns;
                Cin <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1200ns
                WAIT FOR 80 ns;
                Cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1280ns
                WAIT FOR 80 ns;
                Cin <= '0';
                WAIT FOR 320 ns;

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

