----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:53:51 03/27/2019 
-- Design Name: 
-- Module Name:    registroUniversal - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity registroUniversal is
	Port(
		D : in std_logic_vector (7 downto 0);
		SEL : in std_logic_vector (1 downto 0);
		ESCI, ESCD, CLR, CLK00 : in std_logic;
		CLK : INOUT std_logic;
		Q : INOUT std_logic_vector (7 downto 0)
	);
end registroUniversal;

architecture Behavioral of registroUniversal is

component div00
    Port ( clkd : in  STD_LOGIC;
           clkout : out  STD_LOGIC);
end component;
begin

	P00: div00 port map(
		clkout=>CLK,
		clkd=>clk00
	);
	
	PREG : Process( CLK, CLR )
	Begin
		if ( CLR = '1' ) then
			Q <= X"00";
		elsif (CLK'event and CLK ='1') then
		for I in 0 to 7 loop
			case SEL is
			when "00" => Q <= Q;
			when "01" => Q <= D;
			when "10" => Q <=TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SLL 1);
				Q(0) <= ESCI;
			when others => Q <= TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SRL 1);
				Q(7) <= ESCD;
			end case;
		end loop;
		end if;
	end process PREG;
end Behavioral;

