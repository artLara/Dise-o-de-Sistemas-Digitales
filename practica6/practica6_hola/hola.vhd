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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hola is

	PORT(
		CLR, C: in std_logic;
		CLK: INOUT STD_LOGIC;
		DISPLAY : INOUT std_logic_vector (7 downto 0);
		clk00: IN STD_LOGIC
		);
end hola;

architecture Behavioral of hola is

CONSTANT h: STD_LOGIC_VECTOR(7 downto 0):="10010001";
CONSTANT o: STD_LOGIC_VECTOR(7 downto 0):="00000011";
CONSTANT l: STD_LOGIC_VECTOR(7 downto 0):="11100011";
CONSTANT a: STD_LOGIC_VECTOR(7 downto 0):="00010001";
CONSTANT p: STD_LOGIC_VECTOR(7 downto 0):="00110001";
CONSTANT r: STD_LOGIC_VECTOR(7 downto 0):="11110101";
CONSTANT f: STD_LOGIC_VECTOR(7 downto 0):="01110001";
CONSTANT ex: STD_LOGIC_VECTOR(7 downto 0):="10111110";
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
	
	PROCESS(clk, display, clr)
	BEGIN
		IF(clr='0') THEN
			display<="11111111";
		ELSIF(clk'event AND clk='1') THEN
			CASE C IS
				WHEN '0' => CASE DISPLAY IS
									WHEN h=>display<=o;
									WHEN o=>display<=l;
									WHEN l=>display<=a;
									when others => display<=h;
								END CASE;
				WHEN OTHERS => CASE DISPLAY IS
									WHEN p=>display<=r;
									WHEN r=>display<=o;
									WHEN o=>display<=f;
									WHEN f=>display<=a;
									WHEN a=>display<=ex;
									when others => display<=p;
								END CASE;
					
			END CASE;							
		END IF;
	END PROCESS;

end Behavioral;