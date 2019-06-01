library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CircuitoSequenziale is
    Port ( clk, clear : in std_logic;
			  op1 : in  STD_LOGIC_VECTOR (7 downto 0);
           op2 : in  STD_LOGIC_VECTOR (7 downto 0);
           op3 : in  STD_LOGIC_VECTOR (7 downto 0);
           op4 : in  STD_LOGIC_VECTOR (7 downto 0);
           op5 : in  STD_LOGIC_VECTOR (7 downto 0);
           op6 : in  STD_LOGIC_VECTOR (7 downto 0);
           op7 : in  STD_LOGIC_VECTOR (7 downto 0);
           op8 : in  STD_LOGIC_VECTOR (7 downto 0);
           op9 : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC);
end CircuitoSequenziale;

architecture Structural of CircuitoSequenziale is

component FlipFlop is
	PORT (clk, clear: in std_logic;
			D: in std_logic;
			Q: out std_logic);
end component;

component Registro8bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0));
end component;

component Registro10bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(9 downto 0);
			Q: out std_logic_vector(9 downto 0));
end component;

component Registro16bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(15 downto 0);
			Q: out std_logic_vector(15 downto 0));
end component;

component Registro17bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(16 downto 0);
			Q: out std_logic_vector(16 downto 0));
end component;

component Registro18bit is
	PORT (clk, clear: in std_logic;
			D: in std_logic_vector(17 downto 0);
			Q: out std_logic_vector(17 downto 0));
end component;

component CarrySave8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : in  STD_LOGIC_VECTOR (7 downto 0);
           somme : out  STD_LOGIC_VECTOR (7 downto 0);
           riporti : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component CarrySelect9bit is
 Port ( A, B: in STD_LOGIC_VECTOR (8 downto 0);
        C0 : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (8 downto 0);
        C9 : out STD_LOGIC);
end component;

component CarrySelect16bit is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           somma : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end component;

component Moltiplicatore8X10bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (9 downto 0);
           P : out  STD_LOGIC_VECTOR (17 downto 0));
end component;

component Moltiplicatore8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component CarrySave17bit is
    Port ( a : in  STD_LOGIC_VECTOR (16 downto 0);
           b : in  STD_LOGIC_VECTOR (16 downto 0);
           c : in  STD_LOGIC_VECTOR (16 downto 0);
           somme : out  STD_LOGIC_VECTOR (16 downto 0);
           riporti : out  STD_LOGIC_VECTOR (16 downto 0));
end component;
component CarrySelect18bit is
    Port ( a   : in  STD_LOGIC_VECTOR (17 downto 0);
           b   : in  STD_LOGIC_VECTOR (17 downto 0);
           cin : in  STD_LOGIC;
           somma : out  STD_LOGIC_VECTOR (17 downto 0);
           cout : out  STD_LOGIC);
end component;

component Comparatore is
    Port ( A : in  STD_LOGIC_VECTOR (17 downto 0);
           B : in  STD_LOGIC_VECTOR (17 downto 0);
           O : out  STD_LOGIC);
end component;

component SignSelect is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           sign : out  STD_LOGIC);
end component;

signal op1out, op2out, op3out, op4out, op5out, op6out, op7out, op8out, op9out: std_logic_vector (7 downto 0);
signal vsomma3op, vriporti3op, vsomma3opout, vriporti3opout: std_logic_vector (7 downto 0);
signal vsomma3opfixed, vriporti3opfixed: std_logic_vector (8 downto 0);
signal somma3op9: std_logic_vector (8 downto 0);
signal cSomma3op: std_logic;
signal somma3op10: std_logic_vector (9 downto 0);
signal somma3op10out: std_logic_vector (9 downto 0);
signal k, y1, y2, y3, kout1, kout2, kout3, y1out, y2out, y3out: std_logic_vector (7 downto 0);
signal out1, out2, out1out, out1out2, out2out: std_logic_vector (17 downto 0);
signal p1, p2, p3, p1out, p2out, p3out: std_logic_vector (15 downto 0);
signal op5ext, op7ext, op9ext, op5extout, op7extout, op9extout: std_logic_vector (15 downto 0):= (others => '0');
signal somma1, somma2, somma3: std_logic_vector (15 downto 0);
signal cSomma1, cSomma2, cSomma3: std_logic;
signal somma1_17, somma2_17, somma3_17, somma1_17out, somma2_17out, somma3_17out: std_logic_vector (16 downto 0);
signal vsomme, vriporti, vsommeout, vriportiout: std_logic_vector (16 downto 0);
signal vsommefixed, vriportifixed: std_logic_vector (17 downto 0);
signal Cin0, Cin0out1, Cin0out2, Cin1, Cin1out1, Cin1out2, Cin2, Cin2out1, Cin2out2, Cin3, Cin3out1, Cin3out2, Cin4, Cin4out1, Cin4out2, Cin4out3, Cin4out4, unused, output, outputout: std_logic:=('0');

begin

-- Registri per gli operandi in ingresso
regOp1: Registro8bit port map (clk,clear,op1,op1out);
regOp2: Registro8bit port map (clk,clear,op2,op2out);
regOp3: Registro8bit port map (clk,clear,op3,op3out);
regOp4: Registro8bit port map (clk,clear,op4,op4out);
regOp5: Registro8bit port map (clk,clear,op5,op5out);
regOp6: Registro8bit port map (clk,clear,op6,op6out);
regOp7: Registro8bit port map (clk,clear,op7,op7out);
regOp8: Registro8bit port map (clk,clear,op8,op8out);
regOp9: Registro8bit port map (clk,clear,op9,op9out);

-- RAMO SINISTRO
-- Sommo i primi tre operandi
carrySave1: CarrySave8bit port map (op1out, op2out, op3out, vsomma3op, vriporti3op);
regsomme: Registro8bit port map (clk, clear, vsomma3op, vsomma3opout);
regriporti: Registro8bit port map (clk, clear, vriporti3op, vriporti3opout);
vriporti3opfixed<=vriporti3opout & '0';
vsomma3opfixed(7 downto 0)<=vsomma3opout;
vsomma3opfixed(8)<=vsomma3opout(7);
Cin0<='0';
ffCin0_1: FlipFlop port map (clk, clear, Cin0, Cin0out1);
ffCin0_2: FlipFlop port map (clk, clear, Cin0out1, Cin0out2);
carrySelect: CarrySelect9bit port map (vsomma3opfixed, vriporti3opfixed, Cin0out2, somma3op9, cSomma3op);
somma3op10(8 downto 0)<=somma3op9;
signCarrySelect9bit: SignSelect port map(vsomma3opout(7), vriporti3opfixed(8), cSomma3op, somma3op10(9));
regSomma3op: Registro10bit port map (clk, clear, somma3op10, somma3op10out);
-- Moltiplico k="85" per la somma dei primi tre operandi
k<="01010101";
regk1: Registro8bit port map(clk, clear, k, kout1);
regk2: Registro8bit port map(clk, clear, kout1, kout2);
regk3: Registro8bit port map(clk, clear, kout2, kout3);
mulKx3op: Moltiplicatore8X10bit port map (kout3, somma3op10out, out1);
regOut1: Registro18bit port map (clk, clear, out1, out1out);	
reg2Out1: Registro18bit port map (clk, clear, out1out, out1out2);

-- RAMO DESTRO
-- OP4 OP5
y1<="01100111";
regy1: Registro8bit port map (clk, clear, y1, y1out);
mul1: Moltiplicatore8bit port map (op4out, y1out, p1);
regmul1: Registro16bit port map (clk, clear, p1, p1out);
op5ext(7 downto 0)<=op5out;
with op5out(7) select
	op5ext(15 downto 8)<= "00000000" when '0',
							    "11111111" when '1',
								 "XXXXXXXX" when others;
reg1: Registro16bit port map (clk, clear, op5ext, op5extout);
Cin1<='0';
ffCin1_1: FlipFlop port map (clk, clear, Cin1, Cin1out1);
ffCin1_2: FlipFlop port map (clk, clear, Cin1out1, Cin1out2);
carrySelect1: CarrySelect16bit port map (p1out, op5extout, Cin1out2, somma1, cSomma1);
somma1_17(15 downto 0)<=somma1;
signCarrySelect16bit1: SignSelect port map(p1out(15), op5extout(15), cSomma1, somma1_17(16));
reg1_17: Registro17bit port map (clk, clear, somma1_17, somma1_17out);
-- OP6 OP7
y2<="01000111";
regy2: Registro8bit port map (clk, clear, y2, y2out);
mul2: Moltiplicatore8bit port map (op6out, y2out, p2);
regmul2: Registro16bit port map (clk, clear, p2, p2out);
op7ext(7 downto 0)<=op7out;
with op7out(7) select
	op7ext(15 downto 8)<= "00000000" when '0',
							    "11111111" when '1',
								 "XXXXXXXX" when others;
reg2: Registro16bit port map (clk, clear, op7ext, op7extout);
Cin2<='0';
ffCin2_1: FlipFlop port map (clk, clear, Cin2, Cin2out1);
ffCin2_2: FlipFlop port map (clk, clear, Cin2out1, Cin2out2);
carrySelect2: CarrySelect16bit port map (p2out, op7extout, Cin2out2, somma2, cSomma2);
somma2_17(15 downto 0)<=somma2;
signCarrySelect16bit2: SignSelect port map(p2out(15), op7extout(15), cSomma2, somma2_17(16));
reg2_17: Registro17bit port map (clk, clear, somma2_17, somma2_17out);
-- OP8 OP9
y3<="00010001";
regy3: Registro8bit port map (clk, clear, y3, y3out);
mul3: Moltiplicatore8bit port map (op8out, y3out, p3);
regmul3: Registro16bit port map (clk, clear, p3, p3out);
op9ext(7 downto 0)<=op9out;
with op9out(7) select
	op9ext(15 downto 8)<= "00000000" when '0',
							    "11111111" when '1',
								 "XXXXXXXX" when others;
reg3: Registro16bit port map (clk, clear, op9ext, op9extout);
Cin3<='0';
ffCin3_1: FlipFlop port map (clk, clear, Cin3, Cin3out1);
ffCin3_2: FlipFlop port map (clk, clear, Cin3out1, Cin3out2);
carrySelect3: CarrySelect16bit port map (p3out, op9extout, Cin3out2, somma3, cSomma3);
somma3_17(15 downto 0)<=somma3;
signCarrySelect16bit3: SignSelect port map(p3out(15), op9extout(15), cSomma3, somma3_17(16));
reg3_17: Registro17bit port map (clk, clear, somma3_17, somma3_17out);
-- Sommo i tre risultati
carrySave2: CarrySave17bit port map (somma1_17out, somma2_17out, somma3_17out, vsomme, vriporti);
regsomme2: Registro17bit port map (clk, clear, vsomme, vsommeout);
regriporti2: Registro17bit port map (clk, clear, vriporti, vriportiout);
vsommefixed(16 downto 0)<=vsommeout;
vsommefixed(17)<=vsommeout(16);
vriportifixed<= vriportiout & '0';
Cin4<='0';
ffCin4_1: FlipFlop port map (clk, clear, Cin4, Cin4out1);
ffCin4_2: FlipFlop port map (clk, clear, Cin4out1, Cin4out2);
ffCin4_3: FlipFlop port map (clk, clear, Cin4out2, Cin4out3);
ffCin4_4: FlipFlop port map (clk, clear, Cin4out3, Cin4out4);
carrySelectOut2: CarrySelect18bit port map (vsommefixed, vriportifixed, Cin4out4, out2, unused);
regout2: Registro18bit port map (clk, clear, out2, out2out);

-- COMPARATORE FINALE
comp: Comparatore port map (out1out2, out2out, output);
ffout: FlipFlop port map (clk, clear, output, outputout);
O<=outputout;

end Structural;