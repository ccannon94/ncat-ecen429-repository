library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_control is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           input : in STD_LOGIC;
           output : out STD_LOGIC);
end fsm_control;

architecture Behavioral of fsm_control is

component Clockdivider is
     port(clk : in std_logic;
          start_timer : in std_logic;
	  FastClock,MediumClock,SlowClock, led0 : out std_logic);
end component Clockdivider;

signal state : STD_LOGIC_VECTOR(3 downto 0);
signal fastClock : STD_LOGIC;
signal mediumClock : STD_LOGIC;
signal slowClock : STD_LOGIC;
signal slowClockLed : STD_LOGIC;
signal start_timer : STD_LOGIC := '0';

begin
    clk_div : Clockdivider port map(clk, start_timer, fastClock, mediumClock, slowClock, slowClockLed);
    
     

end Behavioral;
