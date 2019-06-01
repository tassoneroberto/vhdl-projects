library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro10bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(9 downto 0);
			Q: out std_logic_vector(9 downto 0));
end Registro10bit;

architecture Behavioral of Registro10bit is

begin
process(clk, clear)
		begin
		   if clear='1' then
				Q<="0000000000";
			elsif clk'event and clk='1' then
				Q<=D;
			end if;
	end process;
end Behavioral;