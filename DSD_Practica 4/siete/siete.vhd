LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY siete IS
PORT (E: IN std_logic_vector(3 DOWNTO 0);
      S: OUT std_logic_vector(7 DOWNTO 0)); 
     
END siete;

ARCHITECTURE xx OF siete IS
BEGIN 

WITH E SELECT
S<="00000011" WHEN "0000",
	"10011111" WHEN "0001",
	"00100101" WHEN "0010",
	"00001101" WHEN "0011",
	"10011001" WHEN "0100",
	"01001001" WHEN "0101",
	"01000001" WHEN "0110",
	"00011011" WHEN "0111",
	"00000001" WHEN "1000",
	"00001001" WHEN "1001",
	"00110000" WHEN "1010",
	"00010001" WHEN "1011",
	"11110101" WHEN "1100",
	"11100001" WHEN "1101",
	"11010101" WHEN "1110",
	"11111111" WHEN "1111",
	"--------" WHEN OTHERS;
	
END xx;
	
	