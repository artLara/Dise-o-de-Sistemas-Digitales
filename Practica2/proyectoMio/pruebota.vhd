----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:14:02 03/26/2019 
-- Design Name: 
-- Module Name:    pruebota - Behavioral 
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

entity pruebota is
	PORT(
		clr, pre, entrada1, entrada2: IN STD_LOGIC;
		q, nq, clk: INOUT STD_LOGIC;
		clk00: IN STD_LOGIC;
		--led: OUT STD_LOGIC;
		sel: IN STD_LOGIC_VECTOR (1 downto 0)
	);
end pruebota;

architecture Behavioral of pruebota is
component div00
    Port ( clkd : in  STD_LOGIC;
           clkout : out  STD_LOGIC);
end component;

--component flipFlop
--    Port ( c : OUT  STD_LOGIC);
--end component;

begin
	P00: div00 port map(
		clkout=>clk,
		clkd=>clk00
	);
	
	--P01: flipFlop port map(
	--	c=>led2
	--);
	PROCESS(clk,clr,pre,entrada1, entrada2, sel)
    BEGIN
		--led<=clk;
		IF(clr = '0') THEN
	   		q <= '0';
			nq <= '1';
		ELSIF(clk'EVENT AND clk='1') THEN
			IF(pre='1') THEN
				q <= '1';
				nq <= '0';
			ELSIF(sel="00") THEN --SR
				q <= entrada1 OR (entrada2 AND q);
				nq <= NOT (entrada1 OR (entrada2 AND q));
			ELSIF(sel="01") THEN --JK  J=entrada1 y K=entrada2
				q<= ((NOT entrada2) AND q) OR (entrada1 AND (NOT q));
				nq <= NOT (((NOT entrada2) AND q) OR (entrada1 AND (NOT q)));
			ELSIF(sel="10") THEN --T  T=entrada1
				q<= ((NOT entrada1) AND q) OR (entrada1 AND (NOT q));
				nq <= NOT (((NOT entrada1) AND q) OR (entrada1 AND (NOT q)));
			ELSIF(sel="11") THEN --D  D=entrada1
				q<= (entrada1 AND (NOT q)) OR  (entrada1 AND q);
				nq <= NOT ((entrada1 AND (NOT q)) OR  (entrada1 AND q));
			END IF;
		END IF;
	END PROCESS;
end Behavioral;
