library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity moore_machine is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
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
    
    clock : Clockdivider port map(clk, enable, slowClock, mediumClock, fastClock, led0);
    process(clk, enable)
    begin
        if(clk'event and (clk = '1') and (enable = '1')) then
            if(current_state = "1001") then
                current_state <= "0000";
            else
                current_state <= std_logic_vector( unsigned(current_state) + 1 );
            end if;
            if((current_state = "0100") or (current_state = "1000")) then
                output <= "1001111";
            else
                output <= "1111111";
            end if;
        end if;
    end process;    
            

end moore_arch;