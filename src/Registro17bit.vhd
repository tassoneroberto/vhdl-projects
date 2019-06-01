library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro17bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(16 downto 0);
			Q: out std_logic_vector(16 downto 0));
end Registro17bit;

architecture Behavioral of Registro17bit is

begin
	process(clk, clear)
		begin
		   if clear='1' then
				Q<="00000000000000000";
			elsif clk'event and clk='1' then
				Q<=D;
			end if;
	end process;
end Behavioral;