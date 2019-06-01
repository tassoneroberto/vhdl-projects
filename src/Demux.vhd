library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Demux is
    Port ( i : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end Demux;

architecture myDemux of Demux is


begin

with s select
     o(0)<= i when "00",
	         '0' when others;

with s select
     o(1)<= i when "01",
	         '0' when others;
with s select
     o(2)<= i when "10",
	         '0' when others;
	               
with s select
     o(3)<= i when "11",
	         '0' when others;
	

end Behavioral;

