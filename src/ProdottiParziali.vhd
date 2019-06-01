library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity ProdottiParziali is
    Port ( booth : in  STD_LOGIC_VECTOR (2 downto 0);
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           PP : out  STD_LOGIC_VECTOR (8 downto 0));
end ProdottiParziali;

architecture Behavioral of ProdottiParziali is

signal dueA, menodueA, extA, menoA, notA:std_logic_vector(8 downto 0):= (others => '0');

begin

extA(7 downto 0)<=A;
with extA(7) select
	extA(8)<='0' when '0',
				'1' when '1',
				'X' when others;
notA<=not extA;
dueA<=extA(7 downto 0) & '0';
menoA<=std_logic_vector(unsigned(notA+1));
menodueA(8 downto 1)<=menoA(7 downto 0);
menodueA(0)<='0';

with booth(2 downto 0) select
	PP<="000000000" when "000",
		 extA when "001",
		 extA when "010",
		 dueA when "011",
		 menodueA when "100",
		 menoA when "101",
		 menoA when "110",
		 "000000000" when "111",
		 "XXXXXXXXX" when others;

end Behavioral;