library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelect16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           somma : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end CarrySelect16bit;

architecture Structural of CarrySelect16bit is

component CarrySelect8bit is
 Port ( A, B: in STD_LOGIC_VECTOR (7 downto 0);
 C0 : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (7 downto 0);
 C8 : out STD_LOGIC);
end component;

signal s, s0, s1: std_logic_vector(7 downto 0);
signal c8, c16_0, c16_1: std_logic;

begin

cs: CarrySelect8bit port map(a(7 downto 0), b(7 downto 0), cin, somma(7 downto 0), c8);
cs0: CarrySelect8bit port map(a(15 downto 8), b(15 downto 8), '0', s0, c16_0);
cs1: CarrySelect8bit port map(a(15 downto 8), b(15 downto 8), '1', s1, c16_1);

with c8 select
	somma(15 downto 8)<=s0 when '0',
						     s1 when '1',
							  "XXXXXXXX" when others;
with c8 select
	cout<=c16_0 when '0',
			c16_1 when '1',
			'X' when others;

end Structural;

