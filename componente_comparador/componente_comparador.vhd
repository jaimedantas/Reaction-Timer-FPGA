LIBRARY Ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all ;
ENTITY componente_comparador IS 

	GENERIC (n:INTEGER :=4);
	PORT ( A  : In std_logic_vector(n-1 DOWNTO 0);
		B:In std_logic_vector(n-1 DOWNTO 0);
		S : OUT std_logic );
		
END ENTITY ;

ARCHITECTURE arqui OF componente_comparador IS

BEGIN 
	S <= '1' when A>B else '0';
	
	END arqui;