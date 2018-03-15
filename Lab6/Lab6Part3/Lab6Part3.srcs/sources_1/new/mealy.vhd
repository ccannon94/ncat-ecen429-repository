library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           input : in STD_LOGIC;
           led0 : out STD_LOGIC;
           output : out STD_LOGIC);
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
signal current_state : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
    clock : Clockdivider port map(clk, enable, slowClock, mediumClock, fastClock, led0);
    process(slowClock, enable, input)
    begin
        

end Behavioral;
