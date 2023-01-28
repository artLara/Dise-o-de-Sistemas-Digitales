----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:33:10 03/26/2019 
-- Design Name: 
-- Module Name:    div00 - Behavioral 
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

entity div00 is
    Port ( clkd : in  STD_LOGIC;
           clkout : out  STD_LOGIC);
end div00;

architecture Behavioral of div00 is
SIGNAL contador: std_logic_vector(21 downto 0);
begin
	PROCESS(clkd)
	BEGIN
		IF(clkd'event and clkd='1') THEN
			if(contador<"1111111111111111111111") then
				contador<=contador+'1';
			else
				contador<=(others=>'0');
			end if;
			if(contador<"100000000000000000000") then
				clkout<='1';
			else
				clkout<='0';
			end if;
		END IF;
	END PROCESS;
	
end Behavioral;

