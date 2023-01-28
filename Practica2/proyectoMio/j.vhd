--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:43:17 03/27/2019
-- Design Name:   
-- Module Name:   D:/Documentos/ESCOM/DSD/Nueva carpeta/proyectoMio/j.vhd
-- Project Name:  proyectoMio
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pruebota
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY j IS
END j;
 
ARCHITECTURE behavior OF j IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pruebota
    PORT(
         led : OUT  std_logic;
         led2 : OUT  std_logic;
         clk00 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk00 : std_logic := '0';

 	--Outputs
   signal led : std_logic;
   signal led2 : std_logic;

   -- Clock period definitions
   constant clk00_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pruebota PORT MAP (
          led => led,
          led2 => led2,
          clk00 => clk00
        );

   -- Clock process definitions
   clk00_process :process
   begin
		clk00 <= '0';
		wait for clk00_period/2;
		clk00 <= '1';
		wait for clk00_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk00_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
