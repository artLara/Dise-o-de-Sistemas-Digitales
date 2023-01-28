library ieee;
use ieee.std_logic_1164.all;

ENTITY multiplexor is port(
a,b,c,d,sel,ref: in std_logic_vector (1 downto 0);
display: out std_logic_vector (6 downto 0)
);

	ATTRIBUTE pin_numbers of multiplexor: entity is
	" a(0):2 a(1):1 " & 
	" b(0):4 b(1):3 " &
	" c(0):6 c(1):5 " &
	" d(0):8 d(1):7 " &
	" sel(0):22 sel(1):23 " &
	" ref(0):10 ref(1):9 " &
	" display(0):14 display(1):16 display(2):17 display(3):18 display(4):19 display(5):20 display(6):21";
end multiplexor;

ARCHITECTURE a_multiplexor OF multiplexor IS

SIGNAL dato: std_logic_vector(1 downto 0);
SIGNAL aux: std_logic_vector(2 downto 0);

BEGIN
	mux:process(sel)
	BEGIN
		CASE sel IS 
			WHEN "00" => dato <= a;
			WHEN "01" => dato <= b;
			WHEN "10" => dato <= c;
			WHEN OTHERS => dato <=d;
		END CASE;
	END PROCESS mux;

	comp:PROCESS(dato, ref)
	BEGIN
		IF(dato = ref) THEN
			aux <= "100";
		ELSIF (dato > ref) THEN
			aux <= "010";
		ELSE
			aux <= "001";
		END IF;
	END PROCESS comp;

	PROCESS(aux)
	BEGIN
		IF(aux = "100") THEN
			display <= "0110111";
		ELSIF (aux = "010") THEN
			display <= "0000111";
		ELSE
			display <= "0110001";
		END IF;
	END PROCESS;
END a_multiplexor;