library IEEE;
use ieee.std_logic_1164.all;

ENTITY datoEntity IS
	PORT(a:IN STD_LOGIC_VECTOR (1 downto 0);
	b:IN STD_LOGIC_VECTOR (1 downto 0);
	c:IN STD_LOGIC_VECTOR (1 downto 0);
	d:IN STD_LOGIC_VECTOR (1 downto 0);
	sel:IN STD_LOGIC_VECTOR (1 downto 0);
	salida: OUT STD_LOGIC_VECTOR (6 downto 0));
	
	
	ATTRIBUTE pin_numbers of datoEntity: entity is
	" a(0):2 a(1):1 " & 
	" b(0):4 b(1):3 " &
	" c(0):6 c(1):5 " &
	" d(0):8 d(1):7 " &
	" sel(0):22 sel(1):23 " &
	" salida(0):14 salida(1):16 salida(2):17 salida(3):18 salida(4):19 salida(5):20 salida(6):21";
END datoEntity;

ARCHITECTURE flujo2 OF datoEntity IS
SIGNAL datin : STD_LOGIC_VECTOR(1 downto 0);
BEGIN
	MUX:PROCESS(a,b,c,d,sel)
	BEGIN
		CASE sel IS
				WHEN "00" => datin <= a;
				WHEN "01" => datin <= b;
				WHEN "10" => datin <= c;
				WHEN OTHERS => datin <= d;
			END CASE;
	END PROCESS MUX;
	
	DECO:PROCESS(datin)
	BEGIN
		CASE datin IS
				WHEN "00" => salida <= "0000001";
				WHEN "01" => salida <= "1001111";
				WHEN "10" => salida <= "0010010";
				WHEN "11" => salida <= "1001100";
				WHEN OTHERS => salida <= "1111110";
		END CASE;
	END PROCESS DECO;
END flujo2;						      