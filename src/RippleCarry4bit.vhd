library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RippleCarry4bit is
 Port ( C0 : in STD_LOGIC;
        A, B : in STD_LOGIC_VECTOR (3 downto 0);
        S : out STD_LOGIC_VECTOR(3 downto 0);
        C4 : out STD_LOGIC);
end RippleCarry4bit;
architecture Structural of RippleCarry4bit is
component FullAdder
 Port ( a, b, Cin : in STD_LOGIC;
        s, Cout: out STD_LOGIC);
end component;
signal C1, C2, C3 : STD_LOGIC;
begin
FA1:FullAdder port map(A(0), B(0), C0, S(0), C1);
FA2:FullAdder port map(A(1), B(1), C1, S(1), C2);
FA3:FullAdder port map(A(2), B(2), C2, S(2), C3);
FA4:FullAdder port map(A(3), B(3), C3, S(3), C4);
end Structural;