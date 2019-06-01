--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:56:08 12/17/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestCarrySave18bit.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySave18bit
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
 
ENTITY TestCarrySave18bit IS
END TestCarrySave18bit;
 
ARCHITECTURE behavior OF TestCarrySave18bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySave18bit
    PORT(
         a : IN  std_logic_vector(17 downto 0);
         b : IN  std_logic_vector(17 downto 0);
         c : IN  std_logic_vector(17 downto 0);
         somme : OUT  std_logic_vector(17 downto 0);
         riporti : OUT  std_logic_vector(17 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(17 downto 0) := (others => '0');
   signal b : std_logic_vector(17 downto 0) := (others => '0');
   signal c : std_logic_vector(17 downto 0) := (others => '0');

 	--Outputs
   signal somme : std_logic_vector(17 downto 0);
   signal riporti : std_logic_vector(17 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySave18bit PORT MAP (
          a => a,
          b => b,
          c => c,
          somme => somme,
          riporti => riporti
        );

   -- Clock process definitions
   process
   begin		
      -- hold reset state for 100 ns.
      a<="000000110100110111";
		b<="000000011110011100";
		c<="000011001000110101";
		wait for 10ns;
      -- insert stimulus here 

      wait;
   end process;

END;
