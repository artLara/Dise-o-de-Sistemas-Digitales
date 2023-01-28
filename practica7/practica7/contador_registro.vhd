----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:21:46 04/03/2019 
-- Design Name: 
-- Module Name:    contadorDecada - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador_registro is

	PORT(
		CLR: in std_logic;
		CLK: INOUT STD_LOGIC;
		Q : INOUT std_logic_vector (3 downto 0);
		clk00: IN STD_LOGIC;
		E: IN STD_LOGIC_VECTOR(3 downto 0);
		C: IN STD_LOGIC_VECTOR(2 downto 0)
		);
end contador_registro;

architecture Behavioral of contador_registro is
SIGNAL aux2: STD_LOGIC_VECTOR(3 downto 0);

component div00
	Port ( 
	clkd : in  STD_LOGIC;
	clkout : out  STD_LOGIC);
end component;

begin
	P00: div00 port map(
		clkout=>clk,
		clkd=>clk00
	);
	
	PROCESS(clk, c, clr)
	BEGIN
		IF(clr='0') THEN
			Q<="0000";
			aux2<="0000";
		ELSIF(clk'event AND clk='1') THEN
			CASE C IS
				WHEN "000" => Q<=Q+1;
				WHEN "001" => Q<=Q-1;
				WHEN "010" => Q<=E;
				aux2<=E;
				WHEN "011" => Q<=Q;
				WHEN "100" => Q <=TO_STDLOGICVECTOR(TO_BITVECTOR(Q) ROR 1);
				WHEN "101" => Q <=TO_STDLOGICVECTOR(TO_BITVECTOR(Q) ROL 1);
				WHEN "110" => 
					Q<=(TO_STDLOGICVECTOR(TO_BITVECTOR(aux2+1) SRL 1)) XOR (aux2+1);
					aux2<=aux2+1;
				WHEN OTHERS => 
					Q<=(TO_STDLOGICVECTOR(TO_BITVECTOR(aux2-1) SRL 1)) XOR (aux2-1);
					aux2<=aux2-1;
			END CASE;							
		END IF;
	END PROCESS;
end Behavioral;

