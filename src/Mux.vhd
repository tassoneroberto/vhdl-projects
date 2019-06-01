library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( i : in  STD_LOGIC_VECTOR(3 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC);
end Mux;

architecture myMux of Mux is

begin

with s select
     o <= i(0) when "00",
			 i(1) when "01",
			 i(2) when "10",
			 i(3) when "11",
			 'X' when others;
	
end myMux;