--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:49:56 11/24/2014
-- Design Name:   
-- Module Name:   C:/Users/Roberto/Documents/Xilinx Projects/Moltiplicatore8bit/TestProdottiParziali.vhd
-- Project Name:  Moltiplicatore8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProdottiParziali
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
 
ENTITY TestProdottiParziali IS
END TestProdottiParziali;
 
ARCHITECTURE behavior OF TestProdottiParziali IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProdottiParziali
    PORT(
         booth : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(7 downto 0);
         PP : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal booth : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal PP : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProdottiParziali PORT MAP (
          booth => booth,
          A => A,
          PP => PP
        );

  process
   begin		
      
		booth<="000";
		A<="00000001";
		wait for 10ns;
		booth<="010";
		A<="00000001";
		wait for 10ns;
		booth<="010";
		A<="01110101";
		wait for 10ns;
		booth<="011";
		A<="01110101";
		wait for 10ns;
		booth<="100";
		A<="01110101";
		wait for 10ns;
		booth<="101";
		A<="01110101";
		wait for 10ns;
		booth<="110";
		A<="01110101";
		wait for 10ns;
		booth<="111";
		A<="01110101";
		wait for 10ns;
		
   end process;

END;
