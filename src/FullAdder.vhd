library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FullAdder is
 Port ( a, b, Cin : in STD_LOGIC;
 s, Cout :out STD_LOGIC);
end FullAdder;
architecture Behavioral of FullAdder is
signal p : STD_LOGIC;
begin
p <= a xor b;
s <= p xor Cin;
with p select
Cout <= a when '0',
 Cin when '1',
 'X' when others;
end Behavioral;