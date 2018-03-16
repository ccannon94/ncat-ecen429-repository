library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           clock_reset : in STD_LOGIC;
           reset : in STD_LOGIC;
           input : in STD_LOGIC;
           led0 : out STD_LOGIC;
           output : out STD_LOGIC_VECTOR(6 downto 0);
           state : out STD_LOGIC_VECTOR(4 downto 0));
end mealy;

architecture Behavioral of mealy is
component Clockdivider is
    Port ( clk : in STD_LOGIC;
           start_timer : in STD_LOGIC;
           FastClock,MediumClock,SlowClock,led0 : out STD_LOGIC);
end component Clockdivider;

signal slowClock : STD_LOGIC;
signal mediumClock : STD_LOGIC;
signal fastClock : STD_LOGIC;
signal current_state : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal output_signal : STD_LOGIC := '0'; 

begin
    clock : Clockdivider port map(clk, clock_reset, fastClock, mediumClock, slowClock, led0);
    process(slowClock, enable)
    begin
        if(reset = '1') then current_state <= "000";
        end if;
        if(slowClock'event and (slowClock = '1')) then
            if(enable = '1') then
                case current_state is
                    when "000" =>
                        if(input = '1') then 
                            current_state <= "010";
                            output_signal <= '0';
                        else 
                            current_state <= "001";
                            output_signal <= '0';
                        end if;
                    when "001" =>
                        if(input = '1') then 
                            current_state <= "011";
                            output_signal <= '0';
                        else
                            current_state <= "001";
                            output_signal <= '0';
                        end if;
                    when "010" =>
                        if(input = '1') then 
                            current_state <= "010";
                            output_signal <= '0';
                        else
                            current_state <= "100";
                            output_signal <= '0';
                        end if;
                    when "011" =>
                        if(input = '1') then 
                            current_state <= "010";
                            output_signal <= '0';
                        else
                            current_state <= "000";
                            output_signal <= '1';
                        end if;
                    when others =>
                        if(input = '1') then 
                            current_state <= "000";
                            output_signal <= '1';
                        else
                            current_state <= "001";
                            output_signal <= '0';
                        end if;
                end case;
            else
                current_state <= "000";
                output_signal <= '0';
            end if;
        end if;
    end process;
    process(output_signal)
    begin
        if(output_signal = '1') then
            output <= "1001111";
        else
            output <= "0000001";
        end if;
    end process;
    process(current_state)
    begin
        case current_state is
            when "000" => state <= "00001";
            when "001" => state <= "00010";
            when "010" => state <= "00100";
            when "011" => state <= "01000";
            when "100" => state <= "10000";
            when others => state <= "00000";
        end case;
    end process;
end Behavioral;
