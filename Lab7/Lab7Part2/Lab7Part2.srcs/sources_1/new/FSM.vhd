library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           output_sel : out STD_LOGIC_VECTOR(1 downto 0);
           clock_led : out STD_LOGIC);
end FSM;

architecture Behavioral of FSM is
component Clockdivider is 
          Port (clk : in std_logic;
          start_timer : in std_logic;
	      FastClock,MediumClock,SlowClock, led0 : out std_logic);
end component Clockdivider;

signal fastclocksig :STD_LOGIC;
signal medclocksig :STD_LOGIC;
signal slowclocksig :STD_LOGIC;
signal current_state : STD_LOGIC_VECTOR(1 downto 0) := "00";

begin
    clockDiv : Clockdivider port map(clk, reset, fastclocksig, medclocksig, slowclocksig, clock_led);
    
    process(slowclocksig, reset)
    begin
        if(reset = '1') then
            current_state <= "00";
            output_sel <= "00";
        end if;
        if(slowclocksig'event and (slowclocksig = '1')) then
            if(enable = '1') then
            case current_state is
                when "00" =>
                    current_state <= "01";
                    output_sel <= "01";
                when "01" =>
                    current_state <= "10";
                    output_sel <= "10";
                when "10" =>
                    current_state <= "11";
                    output_sel <= "11";
                when "11" =>
                    current_state <= "00";
                    output_sel <= "00";
            end case;
            else
                current_state <= "00";
                output_sel <= "00";
            end if;
        end if;
    end process;
    
    output_sel <= current_state;
end Behavioral;
