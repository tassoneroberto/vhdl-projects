library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Moltiplicatore8X10bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (9 downto 0);
           P : out  STD_LOGIC_VECTOR (17 downto 0));
end Moltiplicatore8X10bit;

architecture Structural of Moltiplicatore8X10bit is

-- Importo i componenti --
component ProdottiParziali is
    Port ( booth : in  STD_LOGIC_VECTOR (2 downto 0);
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           PP : out  STD_LOGIC_VECTOR (8 downto 0));
end component;

component Sommatore5PP18bit is
    Port ( s0 : in  STD_LOGIC_VECTOR (17 downto 0);
           s1 : in  STD_LOGIC_VECTOR (17 downto 0);
           s2 : in  STD_LOGIC_VECTOR (17 downto 0);
           s3 : in  STD_LOGIC_VECTOR (17 downto 0);
			  s4 : in  STD_LOGIC_VECTOR (17 downto 0);
           p : out  STD_LOGIC_VECTOR (17 downto 0));
end component;

-- Inizializzo i segnali intermedi
signal booth5: std_logic_vector(2 downto 0);
signal s0, s1, s2, s3, s4 : std_logic_vector(8 downto 0);
signal s0fixed, s1fixed, s2fixed, s3fixed, s4fixed : std_logic_vector(17 downto 0):= (others => '0');

begin

-- Creo l'ultima terna di booth --
booth5(2 downto 1)<=b(1 downto 0);
booth5(0)<='0';
-- Calcolo i prodotti parziali a 9 bit --
pp0: ProdottiParziali port map(B(9 downto 7), A, s4);
pp1: ProdottiParziali port map(B(7 downto 5), A, s3);
pp2: ProdottiParziali port map(B(5 downto 3), A, s2);
pp3: ProdottiParziali port map(B(3 downto 1), A, s1);
pp4: ProdottiParziali port map(booth5, A, s0);

-- Aggiusto i prodotti parziali portandoli a 18 bit --
-- 1° Prodotto Parziale
s0fixed(8 downto 0)<=s0;
with s0(8) select
	s0fixed(17 downto 9)<= "111111111" when '1',
								  "000000000" when '0',
								  "XXXXXXXXX" when others;
-- 2° Prodotto Parziale							 
s1fixed(10 downto 2)<=s1;
with s1(8) select
	s1fixed(17 downto 11)<="1111111" when '1',
								  "0000000" when '0',
								  "XXXXXXX" when others;
-- 3° Prodotto Parziale							  
s2fixed(12 downto 4)<=s2;
with s2(8) select
	s2fixed(17 downto 13)<="11111" when '1',
								  "00000" when '0',
								  "XXXXX" when others;
-- 4° Prodotto Parziale						  
s3fixed(14 downto 6)<=s3;
with s3(8) select
	s3fixed(17 downto 15)<="111" when '1',
								  "000" when '0',
								  "XXX" when others;
-- 5° Prodotto Parziale						  
s4fixed(16 downto 8)<=s4;
s4fixed(17)<=s4(8);

-- Sommo i prodotti parziali --
sommatore: Sommatore5PP18bit port map(s0fixed, s1fixed, s2fixed, s3fixed, s4fixed,P);

end Structural;