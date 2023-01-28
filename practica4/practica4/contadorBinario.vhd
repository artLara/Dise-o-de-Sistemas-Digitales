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

entity contadorBinario is

	PORT(
		CLR, C : in std_logic;
		CLK: INOUT STD_LOGIC;
		Q : INOUT std_logic_vector (7 downto 0);
		clk00: IN STD_LOGIC
		);
end contadorBinario;
	

architecture Behavioral of contadorBinario is
SIGNAL j: STD_LOGIC_VECTOR(7 downto 0);
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
			Q<="00000000";
		ELSIF(clk'event AND clk='1') THEN
			J(0)<= NOT C;
			Q(0)<= (J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0)));
			J(1)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0))));
			Q(1)<= (J(1) AND (NOT Q(1))) OR ((NOT J(1) AND Q(1)));
			J(2)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0)))) AND ((J(1) AND (NOT Q(1))) OR ((NOT J(1) AND Q(1))));
			Q(2)<= (J(2) AND (NOT Q(2))) OR ((NOT J(2) AND Q(2)));
			J(3)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0)))) AND ((J(1) AND (NOT Q(1))) OR ((NOT J(1) AND Q(1)))) AND ((J(2) AND (NOT Q(2))) OR ((NOT J(2) AND Q(2))));
			Q(3)<= (J(3) AND (NOT Q(3))) OR ((NOT J(3) AND Q(3)));
			J(4)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0)))) AND ((J(1) AND (NOT Q(1))) OR ((NOT J(1) AND Q(1)))) AND ((J(2) AND (NOT Q(2))) OR ((NOT J(2) AND Q(2)))) AND ((J(3) AND (NOT Q(3))) OR ((NOT J(3) AND Q(3))));
			Q(4)<= (J(4) AND (NOT Q(4))) OR ((NOT J(4) AND Q(4)));
			J(5)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0)))) AND ((J(1) AND (NOT Q(1))) OR ((NOT J(1) AND Q(1)))) AND ((J(2) AND (NOT Q(2))) OR ((NOT J(2) AND Q(2)))) AND ((J(3) AND (NOT Q(3))) OR ((NOT J(3) AND Q(3)))) AND ((J(4) AND (NOT Q(4))) OR ((NOT J(4) AND Q(4))));
			Q(5)<= (J(5) AND (NOT Q(5))) OR ((NOT J(5) AND Q(5)));
			J(6)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0)))) AND ((J(1) AND (NOT Q(1))) OR ((NOT J(1) AND Q(1)))) AND ((J(2) AND (NOT Q(2))) OR ((NOT J(2) AND Q(2)))) AND ((J(3) AND (NOT Q(3))) OR ((NOT J(3) AND Q(3)))) AND ((J(4) AND (NOT Q(4))) OR ((NOT J(4) AND Q(4)))) AND ((J(5) AND (NOT Q(5))) OR ((NOT J(5) AND Q(5))));
			Q(6)<= (J(6) AND (NOT Q(6))) OR ((NOT J(6) AND Q(6)));
			J(7)<= (NOT C) AND ((J(0) AND (NOT Q(0))) OR ((NOT J(0) AND Q(0)))) AND ((J(1) AND (NOT Q(1))) OR ((NOT J(1) AND Q(1)))) AND ((J(2) AND (NOT Q(2))) OR ((NOT J(2) AND Q(2)))) AND ((J(3) AND (NOT Q(3))) OR ((NOT J(3) AND Q(3)))) AND ((J(4) AND (NOT Q(4))) OR ((NOT J(4) AND Q(4)))) AND ((J(5) AND (NOT Q(5))) OR ((NOT J(5) AND Q(5)))) AND ((J(6) AND (NOT Q(6))) OR ((NOT J(6) AND Q(6))));
			Q(7)<= (J(7) AND (NOT Q(7))) OR ((NOT J(7) AND Q(7)));
			
			END IF;
	END PROCESS;
end Behavioral;

