--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:55:15 01/11/2015
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/CircuitoSequenziale/TestDecoder.vhd
-- Project Name:  CircuitoSequenziale
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
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
 
ENTITY TestDecoder IS
END TestDecoder;
 
ARCHITECTURE behavior OF TestDecoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         i : IN  std_logic_vector(1 downto 0);
         o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          i => i,
          o => o
        );

   -- Clock process definitions
process
   begin		
     
      i<="00";
		wait for 20ns;
		i<="01";
		wait for 20ns;
		i<="10";
		wait for 20ns;
		i<="11";
		wait for 20ns;
		
		
		wait for 100 ns;	

      wait;
   end process;

END;
