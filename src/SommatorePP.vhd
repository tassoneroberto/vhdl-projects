library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sommatore4PP16bit is
    Port ( s0 : in  STD_LOGIC_VECTOR (15 downto 0);
           s1 : in  STD_LOGIC_VECTOR (15 downto 0);
           s2 : in  STD_LOGIC_VECTOR (15 downto 0);
           s3 : in  STD_LOGIC_VECTOR (15 downto 0);
           p : out  STD_LOGIC_VECTOR (15 downto 0));
end Sommatore4PP16bit;

architecture Structural of Sommatore4PP16bit is

component CarrySave16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           c : in  STD_LOGIC_VECTOR (15 downto 0);
           somme : out  STD_LOGIC_VECTOR (15 downto 0);
           riporti : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component CarrySelect16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           somma : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end component;

signal somme1, riporti1, somme2, riporti2, riporti1fixed, riporti2fixed: std_logic_vector(15 downto 0):= (others => '0');
signal unused: std_logic;

begin

-- Sommo i primi tre prodotti parziali usando un CarrySave a 16 bit  --
csave1: CarrySave16bit port map(s0, s1, s2, somme1, riporti1);
riporti1fixed(15 downto 1)<=riporti1(14 downto 0);
-- Sommo gli output del CarrySave ed il quarto prodotto parziale con un CarrySave a 16 bit --
csave2: CarrySave16bit port map(somme1, riporti1fixed, s3, somme2, riporti2);
riporti2fixed(15 downto 1)<=riporti2(14 downto 0);
-- Sommo il vettore delle somme e quello dei riporti con un CarrySelect a 16 bit --
cselect: CarrySelect16bit port map(somme2, riporti2fixed, '0', p, unused);

end Structural;

