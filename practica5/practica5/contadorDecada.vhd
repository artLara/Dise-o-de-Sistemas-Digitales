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

entity contadorDecada is

	PORT(
		CLR: in std_logic;
		CLK: INOUT STD_LOGIC;
		DISPLAY : INOUT std_logic_vector (6 downto 0);
		clk00: IN STD_LOGIC;
		DISP: OUT STD_LOGIC;
		E: IN STD_LOGIC_VECTOR(9 downto 0);
		C: IN STD_LOGIC_VECTOR(1 downto 0)
		);
end contadorDecada;

architecture Behavioral of contadorDecada is

CONSTANT dig0: STD_LOGIC_VECTOR(6 downto 0):="0000001";
CONSTANT dig1: STD_LOGIC_VECTOR(6 downto 0):="1001111";
CONSTANT dig2: STD_LOGIC_VECTOR(6 downto 0):="0010010";
CONSTANT dig3: STD_LOGIC_VECTOR(6 downto 0):="0000110";
CONSTANT dig4: STD_LOGIC_VECTOR(6 downto 0):="1001100";
CONSTANT dig5: STD_LOGIC_VECTOR(6 downto 0):="0100100";
CONSTANT dig6: STD_LOGIC_VECTOR(6 downto 0):="0100000";
CONSTANT dig7: STD_LOGIC_VECTOR(6 downto 0):="0001111";
CONSTANT dig8: STD_LOGIC_VECTOR(6 downto 0):="0000000";
CONSTANT dig9: STD_LOGIC_VECTOR(6 downto 0):="0000100";
--SIGNAL aux: STD_LOGIC_VECTOR(3 downto 0);
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
	
	PROCESS(clk, display, clr,E)
	BEGIN
		DISP <= '0';
		IF(clr='0') THEN
			DISP <= '0';
			display<="1111111";
		ELSIF(clk'event AND clk='1') THEN
			CASE C IS
				WHEN "00" => CASE DISPLAY IS
									WHEN dig0=>display<=dig1;
									WHEN dig1=>display<=dig2;
									WHEN dig2=>display<=dig3;
									WHEN dig3=>display<=dig4;
									WHEN dig4=>display<=dig5;
									WHEN dig5=>display<=dig6;
									WHEN dig6=>display<=dig7;
									WHEN dig7=>display<=dig8;
									WHEN dig8=>display<=dig9;
									when others => display<=dig0;
								END CASE;
				WHEN "01" => CASE DISPLAY IS
									WHEN dig9=>display<=dig8;
									WHEN dig8=>display<=dig7;
									WHEN dig7=>display<=dig6;
									WHEN dig6=>display<=dig5;
									WHEN dig5=>display<=dig4;
									WHEN dig4=>display<=dig3;
									WHEN dig3=>display<=dig2;
									WHEN dig2=>display<=dig1;
									WHEN dig1=>display<=dig0;
									when others => display<=dig9;
								END CASE;
								
				WHEN "10" => display <= display;
				
				WHEN OTHERS =>
				
					IF(E(0)='1' AND E(1)='0' AND E(2)='0' AND E(3)='0' AND E(4)='0' AND E(5)='0' AND E(6)='0' AND E(7)='0' AND E(8)='0' AND E(9)='0') THEN 
						display<=dig0;
					ELSIF(E(1)='1' AND E(2)='0' AND E(3)='0' AND E(4)='0' AND E(5)='0' AND E(6)='0' AND E(7)='0' AND E(8)='0' AND E(9)='0') THEN
						display<=dig1;
					ELSIF(E(2)='1' AND E(3)='0' AND E(4)='0' AND E(5)='0' AND E(6)='0' AND E(7)='0' AND E(8)='0' AND E(9)='0') THEN
						display<=dig2;
					ELSIF(E(3)='1' AND E(4)='0' AND E(5)='0' AND E(6)='0' AND E(7)='0' AND E(8)='0' AND E(9)='0') THEN
						display<=dig3;
					ELSIF(E(4)='1' AND E(5)='0' AND E(6)='0' AND E(7)='0' AND E(8)='0' AND E(9)='0') THEN
						display<=dig4;
					ELSIF(E(5)='1' AND E(6)='0' AND E(7)='0' AND E(8)='0' AND E(9)='0') THEN
						display<=dig5;
					ELSIF(E(6)='1' AND E(7)='0' AND E(8)='0' AND E(9)='0') THEN
						display<=dig6;
					ELSIF(E(7)='1' AND E(8)='0' AND E(9)='0') THEN
						display<=dig7;
					ELSIF(E(8)='1' AND E(9)='0') THEN
						display<=dig8;
					ELSIF(E(9)='1') THEN
						display<=dig9;
					ELSE
						display<="0110000";
					END IF;
					--CASE aux IS
					--	WHEN "0000"=> display<=dig0;
					--	WHEN "0001"=> display<=dig1;
					--	WHEN "0010"=> display<=dig2;
					--	WHEN "0011"=> display<=dig3;
					--	WHEN "0100"=> display<=dig4;
						--WHEN "0101"=> display<=dig3;
						--WHEN "0110"=> display<=dig6;
						--WHEN "0111"=> display<=dig7;
						--WHEN "1000"=> display<=dig8;
					--	WHEN "1001"=> display<=dig9;
						--WHEN OTHERS => display<="1111111";
					--END CASE;
			END CASE;							
		END IF;
	END PROCESS;

end Behavioral;