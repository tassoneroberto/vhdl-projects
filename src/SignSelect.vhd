library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignSelect is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           sign : out  STD_LOGIC);
end SignSelect;

architecture Behavioral of SignSelect is

signal bits: std_logic_vector(2 downto 0);

begin

bits(0)<=a;
bits(1)<=b;
bits(2)<=c;

with bits select
   sign<='0' when "000",
		   '1' when "001",
			'1' when "010",
			'0' when "011",
			'1' when "100",
			'0' when "101",
			'0' when "110",
			'1' when "111",
			'X' when others;

end Behavioral;