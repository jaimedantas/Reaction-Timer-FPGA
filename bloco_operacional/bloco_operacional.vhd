LIBRARY Ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.ALL;
ENTITY bloco_operacional is 
GENERIC (n:INTEGER :=4);
	PORT(load_reg:IN STD_LOGIC ;
		clock:IN STD_LOGIC ;
		clear:IN STD_LOGIC ;
		comp,compdois: OUT STD_LOGIC);
		
		
END bloco_operacional;

ARCHITECTURE behav OF bloco_operacional is
SIGNAL sinal_sd: std_logic_vector(3 DOWNTO 0);

COMPONENT  componente_contador
	PORT ( cnt,ck,cl:IN STD_LOGIC;
		tc : OUT STD_LOGIC;
		C : OUT STD_LOGIC_vector(3 downto 0));
END COMPONENT;

COMPONENT componente_comparador 

	GENERIC (n:INTEGER);
	PORT ( A: In STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		 B : In STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		S : OUT STD_LOGIC  );
		END COMPONENT;
		

COMPONENT componete_comparador2 

	GENERIC (n:INTEGER :=4);
	PORT ( D, E : In std_logic_vector(n-1 DOWNTO 0);
		SAIR : OUT std_logic );
END COMPONENT;

BEGIN
	cont1: componente_contador PORT MAP (cnt=>load_reg,ck=>clock,cl=>clear,tc =>OPEN,C=>sinal_sd);
	compa2: componente_comparador GENERIC MAP(4) PORT MAP(A=>sinal_sd,B=>"1100",S=>comp);
	compa3: componete_comparador2 GENERIC MAP(4) PORT MAP (D=>sinal_sd,E=>"1100",SAIR=>compdois);
	end behav;
	