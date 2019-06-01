--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:26:40 12/17/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestRippleCarry5bit.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RippleCarry5bit
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
 
ENTITY TestRippleCarry5bit IS
END TestRippleCarry5bit;
 
ARCHITECTURE behavior OF TestRippleCarry5bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RippleCarry5bit
    PORT(
         C0 : IN  std_logic;
         A : IN  std_logic_vector(4 downto 0);
         B : IN  std_logic_vector(4 downto 0);
         S : OUT  std_logic_vector(4 downto 0);
         C5 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal C0 : std_logic := '0';
   signal A : std_logic_vector(4 downto 0) := (others => '0');
   signal B : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(4 downto 0);
   signal C5 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleCarry5bit PORT MAP (
          C0 => C0,
          A => A,
          B => B,
          S => S,
          C5 => C5
        );

   process
   begin		
      -- hold reset state for 100 ns.
      A <= "01111";
		B <= "01111";
		C0 <='0';
		wait for 10ns;
		A <= "00000";
		B <= "00001";
		C0 <='0';
		wait for 10ns;

      wait;
   end process;

END;
