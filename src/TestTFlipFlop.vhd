--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:27:48 01/11/2015
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/CircuitoSequenziale/TestTFlipFlop.vhd
-- Project Name:  CircuitoSequenziale
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TFlipFlop
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
 
ENTITY TestTFlipFlop IS
END TestTFlipFlop;
 
ARCHITECTURE behavior OF TestTFlipFlop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TFlipFlop
    PORT(
         T : IN  std_logic;
         CLOCK : IN  std_logic;
         Q : INOUT  std_logic;
         QN : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal CLOCK : std_logic := '0';

	--BiDirs
   signal Q : std_logic:='1';

 	--Outputs
   signal QN : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TFlipFlop PORT MAP (
          T => T,
          CLOCK => CLOCK,
          Q => Q,
          QN => QN
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
	
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 50ns;
		T<='1';
		wait for 20ns;
		
		T<='0';
		wait for 20ns;
		T<='1';
		wait for 20ns;
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
