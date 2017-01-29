LIBRARY Ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.ALL;

ENTITY Projeto_final IS
	GENERIC (n: INTEGER :=4);
	PORT (reset,bot: INOUT STD_LOGIC ;
	leno, lentoo:OUT STD_LOGIC );
	END Projeto_final ;
	
ARCHITECTURE behav OF Projeto_final is
SIGNAL sinal_load,sinal_clear,sinal_clock,sinal_rel1,sinal_rel2: std_logic;

COMPONENT bloco_operacional is 
GENERIC (n:INTEGER :=4);
	PORT(load_reg:IN STD_LOGIC ;
		clock:IN STD_LOGIC ;
		clear:IN STD_LOGIC ;
		comp,compdois: OUT STD_LOGIC);
		
		
END COMPONENT ;

COMPONENT bloco_controle IS
	--GENERIC (rtempo: INTEGER := 10);
	PORT(clk,clr_r,load_r,comp,comp2,rst, b: INOUT STD_LOGIC;--entradas relogio, reset e botao
		len, lento: OUT STD_LOGIC;--saida led e lento
		--rtempo: BUFFER INTEGER RANGE 0 TO 2000;--saida tempo de 10 bits
		estado: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)--estados da maquina em binario para depuracao
		);



END COMPONENT ;

 BEGIN 
operation : bloco_operacional GENERIC MAP(4) PORT MAP (load_reg => sinal_load,clock => sinal_clock,clear => sinal_clear,
comp =>sinal_rel1,compdois =>sinal_rel2);
controller: bloco_controle  PORT MAP (clk => sinal_clock,clr_r =>sinal_clear,
load_r =>sinal_load,comp =>sinal_rel1, comp2 =>sinal_rel2,rst => reset,b =>bot,len => leno, 
lento =>lentoo);
 END behav ;