library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro8bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0));
end Registro8bit;

architecture Behavioral of Registro8bit is

begin
	process(clk, clear)
		begin
		   if clear='1' then
				Q<="00000000";
			elsif clk'event and clk='1' then
				Q<=D;
			end if;
	end process;
end Behavioral;