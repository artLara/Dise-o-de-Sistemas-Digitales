----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:12 04/30/2019 
-- Design Name: 
-- Module Name:    teclado - Behavioral 
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

entity teclado is
	PORT(F: INOUT STD_LOGIC_VECTOR(3 downto 0);
	C: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	CLR: IN STD_LOGIC;
	clk00: IN STD_LOGIC;
	CLK: INOUT STD_LOGIC;
	DISPLAY:INOUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
	--port( 
     --   CLK00: in std_logic ;
     -- CLK: INOUT STD_LOGIC;
		  --CLR: IN STD_LOGIC;
        --COLUMNS, COLS : INOUT UNSIGNED (2 DOWNTO 0);
        --ROWS : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        --OUTROWS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  --DISPLAY: INOUT std_logic_vector ( 0 TO 6 )
    --);
end teclado;

architecture Behavioral of teclado is
SIGNAL aux: STD_LOGIC_VECTOR(6 downto 0);
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
CONSTANT np: STD_LOGIC_VECTOR(6 downto 0):="1111111";
CONSTANT gato: STD_LOGIC_VECTOR(6 downto 0):="1000001";
CONSTANT a: STD_LOGIC_VECTOR(6 downto 0):="0001000";
CONSTANT b: STD_LOGIC_VECTOR(6 downto 0):="1100000";
CONSTANT c1: STD_LOGIC_VECTOR(6 downto 0):="0110001";
CONSTANT d: STD_LOGIC_VECTOR(6 downto 0):="1000010";
CONSTANT ast: STD_LOGIC_VECTOR(6 downto 0):="1001000";


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
	
	ANILLO:process(clk,clr,F)
	BEGIN
		IF(CLR='0') THEN
			C<="0111";
			DISPLAY<=np;
		ELSIF(clk'event AND CLK='1') THEN
			C<=TO_STDLOGICVECTOR(TO_BITVECTOR(C) ROR 1);
			IF(F="1111") THEN
				DISPLAY<=DISPLAY;
			ELSE
				DISPLAY<=aux;
			END IF;
		END IF;
	END PROCESS ANILLO;
	
	DECO:PROCESS(F,C)
	BEGIN
		CASE F&C IS 
			WHEN "0111"&"0111"=> aux<=dig1;
			WHEN "0111"&"1011"=> aux<=dig2;
			WHEN "0111"&"1101"=> aux<=dig3;
			WHEN "0111"&"1110"=> aux<=a;
			WHEN "1011"&"0111"=> aux<=dig4;
			WHEN "1011"&"1011"=> aux<=dig5;
			WHEN "1011"&"1101"=> aux<=dig6;
			WHEN "1011"&"1110"=> aux<=b;
			WHEN "1101"&"0111"=> aux<=dig7;
			WHEN "1101"&"1011"=> aux<=dig8;
			WHEN "1101"&"1101"=> aux<=dig9;
			WHEN "1101"&"1110"=> aux<=c1;
			WHEN "1110"&"0111"=> aux<=gato;
			WHEN "1110"&"1011"=> aux<=dig0;
			WHEN "1110"&"1101"=> aux<=ast;
			WHEN "1110"&"1110"=> aux<=d;
			WHEN OTHERS=> aux<=np;
		END CASE;
	END PROCESS DECO;
	
	--REG:PROCESS(CLK,CLR,aux,F)
	--BEGIN
	--	IF(CLR='0') THEN
	--			C<="011";
	--	ELSIF(clk'event AND CLK='1') THEN
	--		IF(F="1111") THEN
	--			DISPLAY<=DISPLAY;
	--		ELSE
	--			DISPLAY<=aux;
	--		END IF;
	--	END IF;
	--END PROCESS REG;
end Behavioral;

