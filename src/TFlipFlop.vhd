library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--------------------------------------------------------------------------------
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--------------------------------------------------------------------------------
entity TFlipFlop is
    Port ( T : in std_logic;
           CLOCK : in std_logic;
           Q : inout std_logic;
           QN : inout std_logic);
end TFlipFlop;
architecture Behavioral of TFlipFlop is
begin
            process(CLOCK,T)
            begin
                        if (CLOCK = '1' and CLOCK'event) then
                        if (T='1')then
                        Q <= NOT Q;
                        QN <= NOT Q after 0.5ns;
                        else
                        Q <= Q;
                        QN <= NOT Q after 0.5ns;
                        end if;
                        end if;
            end process;
end Behavioral;