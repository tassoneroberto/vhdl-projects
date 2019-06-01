LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
  
    COMPONENT CircuitoSequenziale
    PORT(
         clk, clear : IN  std_logic;
         op1 : IN  std_logic_vector(7 downto 0);
         op2 : IN  std_logic_vector(7 downto 0);
         op3 : IN  std_logic_vector(7 downto 0);
         op4 : IN  std_logic_vector(7 downto 0);
         op5 : IN  std_logic_vector(7 downto 0);
         op6 : IN  std_logic_vector(7 downto 0);
         op7 : IN  std_logic_vector(7 downto 0);
         op8 : IN  std_logic_vector(7 downto 0);
         op9 : IN  std_logic_vector(7 downto 0);
         O : OUT  std_logic);
    END COMPONENT;
    

   --Inputs
   signal clk, clear : std_logic := '0';
   signal op1 : std_logic_vector(7 downto 0) := (others => '0');
   signal op2 : std_logic_vector(7 downto 0) := (others => '0');
   signal op3 : std_logic_vector(7 downto 0) := (others => '0');
   signal op4 : std_logic_vector(7 downto 0) := (others => '0');
   signal op5 : std_logic_vector(7 downto 0) := (others => '0');
   signal op6 : std_logic_vector(7 downto 0) := (others => '0');
   signal op7 : std_logic_vector(7 downto 0) := (others => '0');
   signal op8 : std_logic_vector(7 downto 0) := (others => '0');
   signal op9 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CircuitoSequenziale PORT MAP (
          clk => clk,
			 clear => clear,
          op1 => op1,
          op2 => op2,
          op3 => op3,
          op4 => op4,
          op5 => op5,
          op6 => op6,
          op7 => op7,
          op8 => op8,
          op9 => op9,
          O => O);

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	 clear_process :process
   begin
		clear <= '1';
		wait for 1ns;
		clear <= '0';
		wait for 99ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		op1<="00000000";
 		op2<="11110100";
  	   op3<="11101100";
 		op4<="00101111";
 		op5<="11110101";
		op6<="00101101";
		op7<="00110011";
		op8<="00111100";
		op9<="01111100";
		
		wait for 10ns;
		
		op1<="00101000";
 		op2<="10010100";
  	   op3<="11101000";
 		op4<="00100111";
 		op5<="11110111";
		op6<="00101001";
		op7<="00100000";
		op8<="00101100";
		op9<="01110100";
		
		wait for 10ns;
		
		op1<="10000000";
		op2<="10000000";
		op3<="10000000";
		op4<="11100100";
		op5<="01010100";
		op6<="01001001";
		op7<="00111110";
		op8<="00000010";
		op9<="01110000";
 		
		wait for 10ns;
		
		op1<="01111111";
		op2<="01111111";
		op3<="00000011";
		op4<="00000111";
		op5<="11111001";
		op6<="11111110";
		op7<="00000110";
		op8<="00000011";
		op9<="11110011";
 
		wait for 10ns;
		
		op1<="00101100";
 		op2<="10010100";
  	   op3<="11101000";
 		op4<="00100111";
 		op5<="11110111";
		op6<="00101001";
		op7<="00100000";
		op8<="00101100";
		op9<="01110000";
		
		wait for 10ns;
		
      wait;
   end process;

END;
