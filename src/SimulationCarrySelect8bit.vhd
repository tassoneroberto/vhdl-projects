LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY SimulationCarrySelect8bit IS
END SimulationCarrySelect8bit;

ARCHITECTURE behavior OF SimulationCarrySelect8bit IS

    COMPONENT CarrySelect8bit
        PORT(   A, B : IN std_logic_vector(7 downto 0);
                C0 : IN std_logic;
                S : OUT std_logic_vector(7 downto 0);
                C8 : OUT std_logic
        );
    END COMPONENT;

signal A, B, S : std_logic_vector(7 downto 0);
signal C0 : std_logic;
signal C8 : std_logic;

BEGIN
    uut: CarrySelect8bit PORT MAP ( A, B, C0, S, C8 );
        process
            begin
                A <= "00000000";
                B <= "00000000";
                C0 <= '1';
                wait for 10 ns;
                A <= "00000000";
                B <= "00000001";
                C0 <= '1';
                wait for 10 ns;
                A <= "00000000";
                B <= "00011111";
                C0 <= '0';
                wait for 10 ns;
                A <= "00000000";
                B <= "11111111";
                C0 <= '0';
                wait for 10 ns;
                A <= "00000001";
                B <= "00000001";
                C0 <= '0';
                wait for 10 ns;
                A <= "00001111";
                B <= "00111000";
                C0 <= '1';
                wait for 10 ns;
                A <= "00001111";
                B <= "00111111";
                C0 <= '1';
                wait for 10 ns;
                A <= "00111111";
                B <= "11110100";
                C0 <= '0';
                wait for 10 ns;
                A <= "11111111";
                B <= "11111111";
                C0 <= '0';
                wait for 10 ns;
                A <= "11111111";
                B <= "11111111";
                C0 <= '1';
                wait for 10 ns;
        end process;
END;