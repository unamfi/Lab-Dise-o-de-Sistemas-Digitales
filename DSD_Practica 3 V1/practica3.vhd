LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY practica3 IS 
	Port (e: in bit_vector (2 DOWNTO 0);
		  a: in bit_vector (1 DOWNTO 0);
		  s0: out bit;
		  s1: out bit);
		  

END practica3;		
		
ARCHITECTURE soop of practica3 IS
BEGIN 
	s0<= (not e(1) or e(0));
	s1<= (a(1) or a(0));
END soop; 