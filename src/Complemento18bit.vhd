library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Complemento18bit is
    Port ( I : in  STD_LOGIC_VECTOR (17 downto 0);
           O : out  STD_LOGIC_VECTOR (17 downto 0));
end Complemento18bit;

architecture Behavioral of Complemento18bit is

begin

O <= std_logic_vector(unsigned((not I)+1));

end Behavioral;