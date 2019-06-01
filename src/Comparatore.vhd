library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparatore is
    Port ( A : in  STD_LOGIC_VECTOR (17 downto 0);
           B : in  STD_LOGIC_VECTOR (17 downto 0);
           O : out  STD_LOGIC);
end Comparatore;

architecture Behavioral of Comparatore is

component Complemento18bit is
    Port ( I : in  STD_LOGIC_VECTOR (17 downto 0);
           O : out  STD_LOGIC_VECTOR (17 downto 0));
end component;

component CarrySelect18bit is
    Port ( a : in  STD_LOGIC_VECTOR (17 downto 0);
           b : in  STD_LOGIC_VECTOR (17 downto 0);
           cin : in  STD_LOGIC;
           somma : out  STD_LOGIC_VECTOR (17 downto 0);
           cout : out  STD_LOGIC);
end component;

signal Bcomp, sottrazione: std_logic_vector(17 downto 0);
signal unused: std_logic;

begin

complemento18: Complemento18bit port map(B,Bcomp);
cselect: CarrySelect18bit port map (A, Bcomp, '0', sottrazione, unused);
O <= sottrazione(15);

end Behavioral;