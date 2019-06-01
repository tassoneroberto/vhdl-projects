library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Coder is
    Port ( i : in  STD_LOGIC_VECTOR(3 downto 0);
           o : out  STD_LOGIC_VECTOR (1 downto 0));
end Coder;

architecture myCoder of Coder is


begin

o(1)<=(not i(3) and i(2) and not i(1) and not i(0)) or (i(3) and not i(2) and not i(1) and not i(0));
o(0)<=(not i(3) and not i(2) and i(1) and not i(0)) or (not i(3) and not i(2) and i(1) and not i(0));

end myCoder;

