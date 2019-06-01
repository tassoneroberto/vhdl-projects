library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelect9bit is
 Port ( A, B: in STD_LOGIC_VECTOR (8 downto 0);
        C0 : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (8 downto 0);
        C9 : out STD_LOGIC);
end CarrySelect9bit;

architecture Structural of CarrySelect9bit is

component RippleCarry4bit is
 Port ( C0 : in STD_LOGIC;
        A, B : in STD_LOGIC_VECTOR (3 downto 0);
        S : out STD_LOGIC_VECTOR(3 downto 0);
        C4 : out STD_LOGIC);
end component;

component RippleCarry5bit is
 Port ( C0 : in STD_LOGIC;
        A, B : in STD_LOGIC_VECTOR (4 downto 0);
        S : out STD_LOGIC_VECTOR(4 downto 0);
        C5 : out STD_LOGIC);
end component;

signal Cr, Cr0, Cr1 : STD_LOGIC;
signal S0, S1 : STD_LOGIC_VECTOR (4 downto 0);

begin
RC:RippleCarry4bit port map(C0, A(3 downto 0), B(3 downto 0), S(3 downto 0), Cr);
RC0:RippleCarry5bit port map('0', A(8 downto 4), B(8 downto 4), S0(4 downto 0), Cr0);
RC1:RippleCarry5bit port map('1', A(8 downto 4), B(8 downto 4), S1(4 downto 0), Cr1);
with Cr select
	S(8 downto 4) <= S0 (4 downto 0)when '0',
			  			  S1 (4 downto 0)when '1',
						  "XXXXX" when others;
with Cr select
	C9 <= Cr0 when '0',
         Cr1 when '1',
         'X' when others;
end Structural;