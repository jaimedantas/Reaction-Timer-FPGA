LIBRARY Ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.ALL;
ENTITY componete_comparador2 IS 

	GENERIC (n:INTEGER :=4);
	PORT ( D, E : In std_logic_vector(n-1 DOWNTO 0);
		SAIR : OUT std_logic );
		
END ENTITY ;

ARCHITECTURE arqui OF componete_comparador2 IS

BEGIN 
	SAIR <= '1' when D>=E else '0';
	
	END arqui;