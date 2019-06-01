library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sommatore5PP18bit is
    Port ( s0 : in  STD_LOGIC_VECTOR (17 downto 0);
           s1 : in  STD_LOGIC_VECTOR (17 downto 0);
           s2 : in  STD_LOGIC_VECTOR (17 downto 0);
           s3 : in  STD_LOGIC_VECTOR (17 downto 0);
           s4 : in  STD_LOGIC_VECTOR (17 downto 0);
           p : out  STD_LOGIC_VECTOR (17 downto 0));
end Sommatore5PP18bit;

architecture Structural of Sommatore5PP18bit is

component CarrySave18bit is
    Port ( a : in  STD_LOGIC_VECTOR (17 downto 0);
           b : in  STD_LOGIC_VECTOR (17 downto 0);
           c : in  STD_LOGIC_VECTOR (17 downto 0);
           somme : out  STD_LOGIC_VECTOR (17 downto 0);
           riporti : out  STD_LOGIC_VECTOR (17 downto 0));
end component;

component CarrySelect18bit is
    Port ( a : in  STD_LOGIC_VECTOR (17 downto 0);
           b : in  STD_LOGIC_VECTOR (17 downto 0);
           cin : in  STD_LOGIC;
           somma : out  STD_LOGIC_VECTOR (17 downto 0);
           cout : out  STD_LOGIC);
end component;

signal somme1, riporti1, somme2, riporti2, somme3, riporti3, riporti1fixed, riporti2fixed, riporti3fixed: std_logic_vector(17 downto 0):= (others => '0');
signal unused: std_logic;

begin
-- Sommo i primi tre prodotti parziali usando un CarrySave a 18 bit  --
csave1: CarrySave18bit port map(s0, s1, s2, somme1, riporti1);
riporti1fixed(17 downto 1)<=riporti1(16 downto 0);
-- Sommo gli output del primo CarrySave ed il quarto prodotto parziale con un CarrySave a 18 bit --
csave2: CarrySave18bit port map(somme1, riporti1fixed, s3, somme2, riporti2);
riporti2fixed(17 downto 1)<=riporti2(16 downto 0);
-- Sommo gli output del secondo CarrySave ed il quinto prodotto parziale con un CarrySave a 18 bit --
csave3: CarrySave18bit port map(somme2, riporti2fixed, s4, somme3, riporti3);
riporti3fixed(17 downto 1)<=riporti3(16 downto 0);
-- Sommo gli output del terzo CarrySave con un CarrySelect a 18 bit --
cselect: CarrySelect18bit port map(somme3, riporti3fixed, '0', p, unused);

end Structural;

