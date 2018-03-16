library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity moore_machine is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           timer_restart : in STD_LOGIC;
           reset : in STD_LOGIC;
           led0 : out STD_LOGIC;
           state : out STD_LOGIC_VECTOR(9 downto 0);
           output : out STD_LOGIC_VECTOR(6 downto 0));
end moore_machine;

architecture moore_arch of moore_machine is
component Clockdivider is
    Port ( clk : in STD_LOGIC;
           start_timer : in STD_LOGIC;
           FastClock,MediumClock,SlowClock,led0 : out STD_LOGIC);
end component Clockdivider;

signal slowClock : STD_LOGIC;
signal mediumClock : STD_LOGIC;
signal fastClock : STD_LOGIC;
signal current_state : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin  
    clock : Clockdivider port map(clk, timer_restart, fastClock, mediumClock, slowClock, led0);
    process(slowClock, enable)
    begin
        if(reset = '1') then current_state <= "0000";
        end if;
        if(slowClock'event and (slowClock = '1')) then
            if(enable = '1') then
                if(current_state = "1001") then
                    current_state <= "0000";
                else
                    current_state <= std_logic_vector( unsigned(current_state) + 1 );
                end if;
            else current_state <= "0000";
            end if;
        end if;
    end process;
    process(current_state)
    begin
        if((current_state = "0100") or (current_state = "1000")) then
            output <= "1001111";
        else
            output <= "1000000";
        end if;
        case current_state is
            when "0000" => state <= "0000000001";
            when "0001" => state <= "0000000010";
            when "0010" => state <= "0000000100";
            when "0011" => state <= "0000001000";
            when "0100" => state <= "0000010000";
            when "0101" => state <= "0000100000";
            when "0110" => state <= "0001000000";
            when "0111" => state <= "0010000000";
            when "1000" => state <= "0100000000";
            when "1001" => state <= "1000000000";
            when others => state <= "0000000000";
        end case;
    end process;
end moore_arch;
