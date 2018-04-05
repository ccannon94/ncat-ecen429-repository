library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab9Part2 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sensors_EW : in STD_LOGIC_VECTOR(1 downto 0);
           north : out STD_LOGIC_VECTOR(4 downto 0);
           south : out STD_LOGIC_VECTOR(2 downto 0);
           east_west : out STD_LOGIC_VECTOR(2 downto 0);
           clock_led : out STD_LOGIC);
end Lab9Part2;

architecture Behavioral of Lab9Part2 is

component clock_divider is
     port(clk : in std_logic;
          start_timer : in std_logic;
	  FastClock,MediumClock,SlowClock, led0 : out std_logic);
end component clock_divider;

signal current_state : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal next_state : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal start_timer : STD_LOGIC := '0';
signal fast_clock : STD_LOGIC;
signal medium_clock : STD_LOGIC;
signal slow_clock : STD_LOGIC;

begin
    clk_div : clock_divider port map(clk, start_timer, fast_clock, medium_clock, slow_clock, clock_led);
    
    process(slow_clock, reset)
    begin
        if(reset = '1') then next_state <= "0000";
        elsif(slow_clock'event and slow_clock = '1') then
            case current_state is
                when "0000" =>
                    if(sensors_EW = "01" or sensors_EW = "10" or sensors_EW = "11") then
                        next_state <= "0001";
                    else 
                        next_state <= "0000";
                    end if;
                when "0001" =>
                    next_state <= "0010";
                when "0010" =>
                    next_state <= "0011";
                when "0011" =>
                    if(sensors_EW = "01" or sensors_EW = "10" or sensors_EW = "11") then
                        next_state <= "0011";
                    else
                        next_state <= "0100";
                    end if;
                when "0100" =>
                    next_state <= "0101";
                when "0101" =>
                    next_state <= "0110";
                when "0110" =>
                    next_state <= "0111";
                when "0111" =>
                    next_state <= "1000";
                when others =>
                    next_state <= "0000";
            end case;
        end if;
    end process;
    process(current_state)
    begin
        case current_state is
            when "0000" =>
                north <= "00001";
                south <= "001";
                east_west <= "100";
            when "0001" =>
                north <= "01000";
                south <= "010";
                east_west <= "100";
            when "0010" =>
                north <= "10000";
                south <= "100";
                east_west <= "100";
            when "0011" =>
                north <= "10000";
                south <= "100";
                east_west <= "001";
            when "0100" =>
                north <= "10000";
                south <= "100";
                east_west <= "010";
            when "0101" =>
                north <= "10000";
                south <= "100";
                east_west <= "100";
            when "0110" =>
                north <= "00011";
                south <= "100";
                east_west <= "100";
            when "0111" =>
                north <= "00101";
                south <= "100";
                east_west <= "100";
            when others =>
                north <= "00001";
                south <= "100";
                east_west <= "100";
        end case;
    end process;
    current_state <= next_state;
end Behavioral;