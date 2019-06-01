--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:09:49 11/24/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestSommatorePP.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SommatorePP
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
 
ENTITY TestSommatorePP IS
END TestSommatorePP;
 
ARCHITECTURE behavior OF TestSommatorePP IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SommatorePP
    PORT(
         s0 : IN  std_logic_vector(15 downto 0);
         s1 : IN  std_logic_vector(15 downto 0);
         s2 : IN  std_logic_vector(15 downto 0);
         s3 : IN  std_logic_vector(15 downto 0);
         p : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s0 : std_logic_vector(15 downto 0) := (others => '0');
   signal s1 : std_logic_vector(15 downto 0) := (others => '0');
   signal s2 : std_logic_vector(15 downto 0) := (others => '0');
   signal s3 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SommatorePP PORT MAP (
          s0 => s0,
          s1 => s1,
          s2 => s2,
          s3 => s3,
          p => p
        );

  process
   begin		
     s0<="0000000000000000";
	  s1<="0000010000000000";
	  s2<="0000000001000000";
	  s3<="0000000000000010";
	  wait for 10ns;
	  s0<="0011111000000000";
	  s1<="0000010000000000";
	  s2<="0000011001000000";
	  s3<="0000000000000010";
	  wait for 10ns;
   end process;

END;
