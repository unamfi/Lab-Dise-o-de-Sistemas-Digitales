Library IEEE;
Use ieee.std_logic_1164.all;

ENTITY decodificadores IS

port( d: in std_logic_vector (2 downto 0);
 E: in std_logic;
 y: out std_logic_vector(7 downTo 0));

END decodificadores;

 
ARCHITECTURE Behavioral OF decodificadores IS

SIGNAL entrada : std_logic_vector(3 downto 0);

BEGIN

entrada(3) <= E;
entrada(2 downto 0) <= d;

with entrada select

y <= "00000001" when x"0",
 "00000010" when x"1",
 "00000100" when x"2",
 "00001000" when x"3",
 "00010000" when x"4",
 "00100000" when x"5",
 "01000000" when x"6",
 "10000000" when x"7",
 "00000000" when others;

 END Behavioral;
 
 