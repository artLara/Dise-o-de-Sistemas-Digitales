----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:23 04/02/2019 
-- Design Name: 
-- Module Name:    contadorBinario - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dado is

	PORT(
		CLR, C : in std_logic;
		CLK: INOUT STD_LOGIC;
		DISPLAY : INOUT std_logic_vector (6 downto 0);
		clk00: IN STD_LOGIC
		);
end dado;
	

architecture Behavioral of dado is
SIGNAL J,K,Q: STD_LOGIC_VECTOR(2 downto 0);
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
	
	PROCESS(clk, q, clr, c)
	BEGIN
		IF(clr='0') THEN
			Q<="000";
			DISPLAY <= "1111111";
		ELSIF(clk'event AND clk='1') THEN
			J(0)<= NOT C;
			K(0)<= NOT C;
			Q(0)<= (J(0) AND (NOT Q(0))) OR ((NOT K(0) AND Q(0)));
			J(1)<= (NOT C) AND (NOT ((J(2) AND (NOT Q(2))) OR ((NOT k(2) AND Q(2))))) AND ((J(0) AND (NOT Q(0))) OR ((NOT k(0) AND Q(0))));
			K(1)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT K(0) AND Q(0))));
			Q(1)<= (J(1) AND (NOT Q(1))) OR ((NOT k(1) AND Q(1)));
			J(2)<= (NOT C) AND ((J(1) AND (NOT Q(1))) OR ((NOT k(1) AND Q(1)))) AND ((J(0) AND (NOT Q(0))) OR ((NOT K(0) AND Q(0))));
			K(2)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT K(0) AND Q(0))));
			Q(2)<= (J(2) AND (NOT Q(2))) OR ((NOT K(2) AND Q(2)));
			
			CASE Q IS
            WHEN "000" => DISPLAY <= "1001111";
            WHEN "001" => DISPLAY <= "0010010";
            WHEN "010" => DISPLAY <= "0000110";
            WHEN "011" => DISPLAY <= "1001100";
            WHEN "100" => DISPLAY <= "0100100";
            WHEN OTHERS => DISPLAY <= "0100000";
			END CASE;
		END IF;
	END PROCESS;
	
	
end Behavioral;

