--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:48:36 12/17/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestSommatore5PP18bit.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sommatore5PP18bit
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
 
ENTITY TestSommatore5PP18bit IS
END TestSommatore5PP18bit;
 
ARCHITECTURE behavior OF TestSommatore5PP18bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sommatore5PP18bit
    PORT(
         s0 : IN  std_logic_vector(17 downto 0);
         s1 : IN  std_logic_vector(17 downto 0);
         s2 : IN  std_logic_vector(17 downto 0);
         s3 : IN  std_logic_vector(17 downto 0);
         s4 : IN  std_logic_vector(17 downto 0);
         p : OUT  std_logic_vector(17 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s0 : std_logic_vector(17 downto 0) := (others => '0');
   signal s1 : std_logic_vector(17 downto 0) := (others => '0');
   signal s2 : std_logic_vector(17 downto 0) := (others => '0');
   signal s3 : std_logic_vector(17 downto 0) := (others => '0');
   signal s4 : std_logic_vector(17 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic_vector(17 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sommatore5PP18bit PORT MAP (
          s0 => s0,
          s1 => s1,
          s2 => s2,
          s3 => s3,
          s4 => s4,
          p => p
        );

   -- Clock process definitions
  process
   begin		
      -- hold reset state for 100 ns.
		s0<="000000110100110111";
		s1<="000000011110011100";
		s2<="000000010100110000";
		s3<="000100111111110111";
		s4<="000100101000110111";
		wait for 10ns;

      -- insert stimulus here 

      wait;
   end process;

END;
