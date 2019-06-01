--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:33:45 12/17/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestMoltiplicatore8X10bit.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Moltiplicatore8X10bit
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
 
ENTITY TestMoltiplicatore8X10bit IS
END TestMoltiplicatore8X10bit;
 
ARCHITECTURE behavior OF TestMoltiplicatore8X10bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Moltiplicatore8X10bit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(9 downto 0);
         P : OUT  std_logic_vector(17 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(17 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Moltiplicatore8X10bit PORT MAP (
          A => A,
          B => B,
          P => P
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   process
   begin		
      -- hold reset state for 100 ns.
      A<="01101100";
		B<="0001101001";
		wait for 10ns;
		 A<="01101100";
		B<="1111000000";
		wait for 10ns;
		 A<="01101100";
		B<="0111111111";
		wait for 10ns;

      -- insert stimulus here 

      wait;
   end process;

END;
