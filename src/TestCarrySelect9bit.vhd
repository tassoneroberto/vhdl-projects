--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:24:33 12/17/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestCarrySelect9bit.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySelect9bit
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
 
ENTITY TestCarrySelect9bit IS
END TestCarrySelect9bit;
 
ARCHITECTURE behavior OF TestCarrySelect9bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySelect9bit
    PORT(
         A : IN  std_logic_vector(8 downto 0);
         B : IN  std_logic_vector(8 downto 0);
         C0 : IN  std_logic;
         S : OUT  std_logic_vector(8 downto 0);
         C9 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(8 downto 0) := (others => '0');
   signal B : std_logic_vector(8 downto 0) := (others => '0');
   signal C0 : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(8 downto 0);
   signal C9 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySelect9bit PORT MAP (
          A => A,
          B => B,
          C0 => C0,
          S => S,
          C9 => C9
        );

  process
   begin		
      -- hold reset state for 100 ns.
      A <= "010110101";
		B <= "000110100";
		C0 <='0';
		wait for 10ns;
		A <= "000000000";
		B <= "000000001";
		C0 <='0';
		wait for 10ns;
		

      -- insert stimulus here 

      wait;
   end process;

END;
