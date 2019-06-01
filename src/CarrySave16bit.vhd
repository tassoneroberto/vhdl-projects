library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySave16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           c : in  STD_LOGIC_VECTOR (15 downto 0);
           somme : out  STD_LOGIC_VECTOR (15 downto 0);
           riporti : out  STD_LOGIC_VECTOR (15 downto 0));
end CarrySave16bit;

architecture Structural of CarrySave16bit is

component FullAdder is
 Port ( a, b, Cin : in STD_LOGIC;
 s, Cout :out STD_LOGIC);
end component;

begin

FA0: FullAdder port map(a(0),b(0),c(0),somme(0),riporti(0));
FA1: FullAdder port map(a(1),b(1),c(1),somme(1),riporti(1));
FA2: FullAdder port map(a(2),b(2),c(2),somme(2),riporti(2));
FA3: FullAdder port map(a(3),b(3),c(3),somme(3),riporti(3));
FA4: FullAdder port map(a(4),b(4),c(4),somme(4),riporti(4));
FA5: FullAdder port map(a(5),b(5),c(5),somme(5),riporti(5));
FA6: FullAdder port map(a(6),b(6),c(6),somme(6),riporti(6));
FA7: FullAdder port map(a(7),b(7),c(7),somme(7),riporti(7));
FA8: FullAdder port map(a(8),b(8),c(8),somme(8),riporti(8));
FA9: FullAdder port map(a(9),b(9),c(9),somme(9),riporti(9));
FA10: FullAdder port map(a(10),b(10),c(10),somme(10),riporti(10));
FA11: FullAdder port map(a(11),b(11),c(11),somme(11),riporti(11));
FA12: FullAdder port map(a(12),b(12),c(12),somme(12),riporti(12));
FA13: FullAdder port map(a(13),b(13),c(13),somme(13),riporti(13));
FA14: FullAdder port map(a(14),b(14),c(14),somme(14),riporti(14));
FA15: FullAdder port map(a(15),b(15),c(15),somme(15),riporti(15));

end Structural;

