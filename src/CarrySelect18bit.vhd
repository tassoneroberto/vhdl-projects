library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelect18bit is
    Port ( a   : in  STD_LOGIC_VECTOR (17 downto 0);
           b   : in  STD_LOGIC_VECTOR (17 downto 0);
           cin : in  STD_LOGIC;
           somma : out  STD_LOGIC_VECTOR (17 downto 0);
           cout : out  STD_LOGIC);
end CarrySelect18bit;

architecture Structural of CarrySelect18bit is

component CarrySelect9bit is
 Port ( A, B: in STD_LOGIC_VECTOR (8 downto 0);
 C0 : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (8 downto 0);
 C9 : out STD_LOGIC);
end component;

signal s0, s1: std_logic_vector(8 downto 0);
signal c9, c18_0, c18_1: std_logic;

begin

cs: CarrySelect9bit port map(a(8 downto 0), b(8 downto 0), cin, somma(8 downto 0), c9);
cs0: CarrySelect9bit port map(a(17 downto 9), b(17 downto 9), '0', s0, c18_0);
cs1: CarrySelect9bit port map(a(17 downto 9), b(17 downto 9), '1', s1, c18_1);

with c9 select
	somma(17 downto 9)<=s0 when '0',
						     s1 when '1',
							  "XXXXXXXXX" when others;
with c9 select
	cout<=c18_0 when '0',
			c18_1 when '1',
			'X' when others;

end Structural;