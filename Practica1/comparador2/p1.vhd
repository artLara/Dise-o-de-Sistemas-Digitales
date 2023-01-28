library IEEE;
use ieee.std_logic_1164.all;

ENTITY p1 IS
	PORT(a:IN STD_LOGIC_VECTOR (1 downto 0);
	b:IN STD_LOGIC_VECTOR (1 downto 0);
	c:IN STD_LOGIC_VECTOR (1 downto 0);
	d:IN STD_LOGIC_VECTOR (1 downto 0);
	sel:IN STD_LOGIC_VECTOR (1 downto 0);
	ref:IN STD_LOGIC_VECTOR (1 downto 0);
	salida: OUT STD_LOGIC_VECTOR (3 downto 0));
	
	
	--ATTRIBUTE pin_numbers of p1: entity is
	--" a(0):2 a(1):1 " & 
	--" b(0):4 b(1):3 " &
	--" c(0):6 c(1):5 " &
	--" d(0):8 d(1):7 " &
	--" ref(0):10 ref(1):9 " &
	--" sel(0):22 sel(1):23 " &
	--" salida(0):14 salida(1):16 salida(2):17 salida(3):18 ";
END p1;

ARCHITECTURE flujo2 OF p1 IS
BEGIN
	PROCESS(a,b,c,d,ref,sel)
	BEGIN
		IF sel = "00" THEN --Para a
			IF ref = a THEN
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='0';
			ELSIF a > ref THEN
    			salida(0)<='1';
				salida(1)<='1';
				salida(2)<='1';
				salida(3)<='0';
		    ELSE
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='1';
			END IF;
		ELSIF sel = "01" THEN --Para b
			IF ref = b THEN
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='0';
			ELSIF b > ref THEN
    			salida(0)<='1';
				salida(1)<='1';
				salida(2)<='1';
				salida(3)<='0';
		    ELSE
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='1';
			END IF;
		ELSIF sel = "10" THEN --Para c
			IF ref = c THEN
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='0';
			ELSIF c > ref THEN
    			salida(0)<='1';
				salida(1)<='1';
				salida(2)<='1';
				salida(3)<='0';
		    ELSE
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='1';
			END IF;
		ELSE 				--para d
			IF ref = d THEN
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='0';
			ELSIF d > ref THEN
    			salida(0)<='1';
				salida(1)<='1';
				salida(2)<='1';
				salida(3)<='0';
		    ELSE
				salida(0)<='1';
				salida(1)<='1';
				salida(2)<='0';
				salida(3)<='1';
			END IF;
		END IF;
	END PROCESS;
END flujo2;						      