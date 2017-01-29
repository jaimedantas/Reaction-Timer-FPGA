--Projeto final RTL de medidor de tempo de reação
--Jaime Dantas

--bibliotecas:
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL; 

ENTITY 	bloco_controle IS
	--GENERIC (rtempo: INTEGER := 10);
	PORT(clk,clr_r,load_r,comp,comp2,rst, b: INOUT STD_LOGIC;--entradas relogio, reset e botao
		len, lento: OUT STD_LOGIC;--saida led e lento
		--rtempo: BUFFER INTEGER RANGE 0 TO 2000;--saida tempo de 10 bits
		estado: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)--estados da maquina em binario para depuracao
		);



END ENTITY;

ARCHITECTURE arquitetura OF bloco_controle IS   

TYPE TIPO_DE_ESTADO IS (INICIAR,SLOW, RESULTADO,CONTADOR1,LIGA,CONTADOR2);--5 estados da maquina
SIGNAL estado_atual, estado_seguinte: TIPO_DE_ESTADO;
SIGNAL estado_teste: STD_LOGIC_VECTOR (2 DOWNTO 0);--estado para depracao
   
BEGIN 
	PROCESS(estado_atual,comp,comp2,b,rst)--muda de valor no process
BEGIN 
	CASE estado_atual IS
		WHEN INICIAR =>
		len <= '0';
		clr_r <= '1';
		--led apagado
		lento<='0';
		load_r<='0';	
			estado_seguinte <= CONTADOR1;
		estado_teste <= "000";--depuracao
		
		WHEN CONTADOR1 =>--espera 10s para partir para o contador
		--rtempo <= 0;--tempo zerado
		load_r<='1';
		clr_r<='0';
		len<='0';
		lento <= '0';
		IF (comp='0' AND rst='0') THEN--conta ate 10s
			estado_seguinte <= CONTADOR1;
		ELSIF (comp='1' AND rst='0') THEN
			estado_seguinte <= LIGA;
		ELSIF(rst='1') THEN 
						estado_seguinte <= INICIAR;
		END IF;
		estado_teste <= "001";--depuracao
		
		WHEN LIGA =>
		load_r<='0';
		clr_r<='1';
		len<='1';
		lento <= '0';
		IF (rst='1')  THEN--conta ate 2 milisegundos
			estado_seguinte <= INICIAR;
		ELSE   
			estado_seguinte <= CONTADOR2;
		END IF;
		estado_teste <= "010";--depracao
		
		WHEN CONTADOR2 =>--estado lento
		load_r<='1';
		clr_r<='0';
		len<='1';
		lento <= '0';
		if(b='0' and rst='0' and comp2='0') THEN
		estado_seguinte <= CONTADOR2;
		ELSIF (b='0' and rst='0' and comp2='1')THEN 
		estado_seguinte <= SLOW;
		ELSIF(b='1' and rst='0') THEN
		estado_seguinte <= RESULTADO;
		ELSIF( rst='1') THEN
		estado_seguinte <= INICIAR;
		END IF;
		estado_teste <= "011";--depuracao
		
		WHEN SLOW=>
		load_r<='0';
		clr_r<='0';
		len<='1';
		lento <= '1';
		IF(rst='0') THEN 
		estado_seguinte <= SLOW;
		ELSIF( rst='1') THEN
		estado_seguinte <= INICIAR;--reinicio
		END IF;
		estado_teste <= "100";--depuracao
		
		WHEN RESULTADO =>
		load_r<='0';
		clr_r<='0';
		len<='0';
		lento <= '0';
		IF (rst='0') THEN
		estado_seguinte <= RESULTADO;
		ELSIF ( rst='1') THEN
		estado_seguinte <= INICIAR;
		estado_teste<="101";
		END IF;
	END CASE;
	END PROCESS;
PROCESS(clk)--mudanca de estado no relogio
	BEGIN 
	IF (clk'EVENT AND clk = '1') THEN 
		estado_atual <= estado_seguinte;
	END IF;
END PROCESS;
estado <= estado_teste;--depuracao
		
END ARCHITECTURE;