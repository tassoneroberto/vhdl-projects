--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:25:51 01/10/2015
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/CircuitoSequenziale/TestDemux.vhd
-- Project Name:  CircuitoSequenziale
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Demux
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
 
ENTITY TestDemux IS
END TestDemux;
 
ARCHITECTURE behavior OF TestDemux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Demux
    PORT(
         i : IN  std_logic;
         s : IN  std_logic_vector(1 downto 0);
         o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Demux PORT MAP (
          i => i,
          s => s,
          o => o
        );
	process
   begin		
		
		i<='1';
		s<="10";
		
		wait for 20ns;
		
		i<='1';
		s<="01";
		
      wait;
   end process;

END;
