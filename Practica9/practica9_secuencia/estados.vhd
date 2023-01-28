----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:37:01 05/29/2019 
-- Design Name: 
-- Module Name:    estados - Behavioral 
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

entity estados is
	PORT(CLR: in std_logic;
		CLK: INOUT STD_LOGIC;
		ent: IN std_logic_vector (7 downto 0);
		SEL: IN std_logic_vector (1 downto 0);
		q: INOUT std_logic_vector (7 downto 0);
		led,entS: out std_logic;
		clk00: IN STD_LOGIC);
end estados;

architecture Behavioral of estados is
type estadosM is (a,b,c,d,e,f);
signal estado_presente, estado_futuro : estadosM;
SIGNAL entrada: std_logic;
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
	
	Process( CLK, CLR )
	Begin
		if ( CLR = '0' ) then
			Q <= X"00";
			--estado_presente<=a;
		elsif (CLK'event and CLK ='1') then
		for I in 0 to 7 loop
			case SEL is
			when "00" => Q <= Q;
			when "01" => Q <= ent;
			when "10" => 
				entrada<=Q(7);
				Q <=TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SLL 1);
			when others => 
				entrada<=Q(0);
				Q <= TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SRL 1);
			end case;
		end loop;
		end if;
	end process;
	
	PROCESS(clk, clr, entrada)
	BEGIN
	IF(clr='0') THEN
			estado_presente<=a;
	ELSIF(clk'event AND clk='1') THEN
		entS<=entrada;
		CASE estado_presente IS
			WHEN a => 
			led<='0';
				IF(entrada='1') THEN
					estado_presente<=a;
				ELSE
					estado_presente<=b;
				END IF;
			WHEN b => 
				led<='0';
				IF(entrada='1') THEN
					estado_presente<=c;
				ELSE
					estado_presente<=b;
				END IF;
			WHEN c => 
				led<='0';
				IF(entrada='1') THEN
					estado_presente<=d;
				ELSE
					estado_presente<=b;
				END IF;	
			WHEN d => 
				led<='0';
				IF(entrada='1') THEN
					estado_presente<=a;
				ELSE
					estado_presente<=e;
				END IF;
				
			WHEN e => 
				IF(entrada='1') THEN
					led<='1';
					estado_presente<=f;
				ELSE
					estado_presente<=b;
				END IF;
				
			WHEN f => 
				led<='1';
				IF(entrada='1') THEN
					estado_presente<=a;
				ELSE
					estado_presente<=b;
				END IF;
			END CASE;
		END IF;
	END PROCESS;
	
	--process(estado_presente)
	--begin
	--	CASE estado_presente IS
	--		WHEN f => led <= '1';
	--		WHEN OTHERS=> led <= '0';
	--	END CASE;
	--END PROCESS;
end Behavioral;

