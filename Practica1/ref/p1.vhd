library IEEE;
use ieee.std_logic_1164.all;

ENTITY datoEntity IS PORT(ref: IN STD_LOGIC_VECTOR (1 downto 0);
	salida: OUT STD_LOGIC_VECTOR (6 downto 0));
	
	
	ATTRIBUTE pin_numbers of datoEntity: entity is --Si se quiere simular comentar esto
	" ref(0):2 ref(1):1 " &--Esto
	" salida(0):14 salida(1):16 salida(2):17 salida(3):18 salida(4):19 salida(5):20 salida(6):21"; --Y esto
END datoEntity;

ARCHITECTURE flujo2 OF datoEntity IS
BEGIN
	DECO:PROCESS(ref)
	BEGIN
		CASE ref IS
				WHEN "00" => salida <= "0000001";
				WHEN "01" => salida <= "1001111";
				WHEN "10" => salida <= "0010010";
				WHEN "11" => salida <= "1001100";
				WHEN OTHERS => salida <= "1111110";
		END CASE;
	END PROCESS DECO;
END flujo2;						      