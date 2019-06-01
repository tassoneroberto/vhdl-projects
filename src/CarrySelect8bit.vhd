library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CarrySelect8bit is
 Port ( A, B: in STD_LOGIC_VECTOR (7 downto 0);
 C0 : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (7 downto 0);
 C8 : out STD_LOGIC);
end CarrySelect8bit;
architecture Structural of CarrySelect8bit is
component RippleCarry4bit is
 Port ( C0 : in STD_LOGIC;
 A, B : in STD_LOGIC_VECTOR (3 downto 0); S : out STD_LOGIC_VECTOR(3 downto 0);
 C4 : out STD_LOGIC);
end component;
signal Cr, Cr0, Cr1 : STD_LOGIC;
signal S0, S1 : STD_LOGIC_VECTOR (3 downto 0);
begin
RC:RippleCarry4bit port map(C0, A(3 downto 0), B(3 downto 0), S(3 downto 0), Cr);
RC0:RippleCarry4bit port map('0', A(7 downto 4), B(7 downto 4), S0(3 downto 0), Cr0);
RC1:RippleCarry4bit port map('1', A(7 downto 4), B(7 downto 4), S1(3 downto 0), Cr1);
with Cr select
S(7 downto 4) <= S0 (3 downto 0)when '0',
 S1 (3 downto 0)when '1',
 "XXXX" when others;
with Cr select
C8 <= Cr0 when '0',
 Cr1 when '1',
 'X' when others;
end Structural;