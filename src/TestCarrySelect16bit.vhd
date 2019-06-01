--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:30:08 11/24/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestCarrySelect16bit.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySelect16bit
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
 
ENTITY TestCarrySelect16bit IS
END TestCarrySelect16bit;
 
ARCHITECTURE behavior OF TestCarrySelect16bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySelect16bit
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         cin : IN  std_logic;
         somma : OUT  std_logic_vector(15 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal somma : std_logic_vector(15 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySelect16bit PORT MAP (
          a => a,
          b => b,
          cin => cin,
          somma => somma,
          cout => cout
        );

   
   -- Stimulus process
  process
   begin		
      a<="0000111110110001";
      b<="1111111111101111";
		cin<='0';
		wait for 10ns;
		a<="0000000000000001";
      b<="0000000000000001";
		cin<='0';
		wait for 10ns;
		a<="0000000000000111";
      b<="0000000000000111";
		cin<='0';
		wait for 10ns;
		a<="0111110100101111";
      b<="0000011110001001";
		cin<='0';
		wait for 10ns;
   end process;

END;
