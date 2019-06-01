--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:07:57 11/24/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestCarrySave16bit.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySave16bit
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
 
ENTITY TestCarrySave16bit IS
END TestCarrySave16bit;
 
ARCHITECTURE behavior OF TestCarrySave16bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySave16bit
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         c : IN  std_logic_vector(15 downto 0);
         somme : OUT  std_logic_vector(15 downto 0);
         riporti : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal c : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal somme : std_logic_vector(15 downto 0);
   signal riporti : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySave16bit PORT MAP (
          a => a,
          b => b,
          c => c,
          somme => somme,
          riporti => riporti
        );

   -- Clock process definitions
   process
   begin		
		a<="0000000000000000";
      b<="0000010000000000";
		c<="0000000001000000";
		wait for 10ns;
		a<="0000000000000000";
      b<="1111111111111111";
		c<="0000000000000000";
		wait for 10ns;
		a<="1111111111111111";
      b<="1111111111111111";
		c<="1111111111111111";
		wait for 10ns;
		a<="0000000000000000";
      b<="0000000000000000";
		c<="0000000000000000";
		wait for 10ns;
		a<="0000000000000000";
      b<="1111111111111111";
		c<="1111111111111111";
		wait for 10ns;
		
   end process;

END;
