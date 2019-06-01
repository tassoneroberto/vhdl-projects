LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestMoltiplicatore8bit IS
END TestMoltiplicatore8bit;
 
ARCHITECTURE behavior OF TestMoltiplicatore8bit IS 
  
    COMPONENT Moltiplicatore8bit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         P : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal P : std_logic_vector(15 downto 0); 
 
BEGIN
 
   uut: Moltiplicatore8bit PORT MAP (
          A => A,
          B => B,
          P => P
        );

   process
   begin		
      A <= "11010111";
		B <= "01111111";
		wait for 10ns;
		A <= "00100101";
		B <= "00000001";
		wait for 10ns;
		A <= "00001111";
		B <= "00001111";
		wait for 10ns;
		A <= "11111111";
		B <= "00100011";
		wait for 10ns;
		A <= "01111111";
		B <= "01111111";
		wait for 10ns;
   end process;

END;
