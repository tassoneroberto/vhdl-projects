library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlop is
	PORT (clk, clear: in std_logic;
			D: in std_logic;
			Q: out std_logic);
end FlipFlop;

architecture Behavioral of FlipFlop is

begin
	process(clk, clear)
		begin
		   if clear='1' then
				Q<='0';
			elsif clk'event and clk='1' then
				Q<=D;
			end if;
	end process;
end Behavioral;