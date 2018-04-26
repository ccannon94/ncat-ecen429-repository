library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vending_machine is
    Port ( clk, reset, nickel, dime, gum, candy : in STD_LOGIC;
    amount : out STD_LOGIC_VECTOR(4 downto 0);
    dispense_gum, dispense_candy, clock_led : out STD_LOGIC);
end vending_machine;

architecture Behavioral of vending_machine is

component clock_divider is
     port(clk : in std_logic;
          start_timer : in std_logic;
	  FastClock,MediumClock,SlowClock, led0 : out std_logic);
end component clock_divider;

component timer_five is
    Port ( clk, reset : in STD_LOGIC;
    done : out STD_LOGIC);
end component timer_five;

type state_type is(zero, zero_nickel, zero_dime, five, five_dime, five_nickel, ten, ten_dime, ten_nickel, fifteen, fifteen_nickel_dime, twenty, dispense_gum_state, dispense_candy_state); 
signal current_state : state_type;
signal next_state : state_type;
signal reset_clock : STD_LOGIC := '0';
signal fast_clock, medium_clock, slow_clock : STD_LOGIC;
signal timer_done : STD_LOGIC := '0';
signal timer_reset : std_logic := '0';

begin
    cd : clock_divider port map(clk, reset_clock, fast_clock, medium_clock, slow_clock, clock_led);
    timer : timer_five port map(slow_clock, timer_reset, timer_done);

    process(slow_clock, reset)
    begin
        if(reset = '1') then next_state <= zero;
        elsif(slow_clock'event and slow_clock = '1') then
            case current_state is
                when zero =>
                    if(dime = '1') then next_state <= zero_dime;
                    elsif(nickel = '1') then next_state <= zero_nickel;
                    else next_state <= zero;
                    end if;
                when zero_nickel =>
                    next_state <= five;
                when zero_dime =>
                    next_state <= ten;
                when five =>
                    if(dime = '1') then next_state <= five_dime;
                    elsif(nickel = '1') then next_state <= five_nickel;
                    elsif(gum = '1' or candy = '1') then next_state <= zero_nickel;
                    elsif(timer_done = '1') then next_state <= zero;
                    else next_state <= five;
                    end if;
                when five_nickel =>
                    next_state <= ten;
                when five_dime =>
                    next_state <= fifteen;
                when ten =>
                    if(dime = '1') then next_state <= ten_dime;
                    elsif(nickel = '1') then next_state <= ten_nickel;
                    elsif(gum = '1' or candy = '1') then next_state <= five_nickel;
                    elsif(timer_done = '1') then next_state <= zero;
                    else next_state <= ten;
                    end if;
                when ten_nickel =>
                    next_state <= fifteen;
                when ten_dime =>
                    next_state <= twenty;
                when fifteen =>
                    if(dime = '1' or nickel = '1') then next_state <= fifteen_nickel_dime;
                    elsif(gum = '1') then next_state <= dispense_gum_state;
                    elsif(candy = '1') then next_state <= ten_nickel;
                    elsif(timer_done = '1') then next_state <= zero;
                    else next_state <= fifteen;
                    end if;
                when fifteen_nickel_dime =>
                    next_state <= twenty;
                when twenty =>
                    if(candy = '1') then next_state <= dispense_candy_state;
                    elsif(gum = '1') then next_state <= dispense_gum_state;
                    elsif(timer_done = '1') then next_state <= zero;
                    else next_state <= twenty;
                    end if;
                when others =>
                    next_state <= zero;
            end case;
        end if;
    end process;
    process(current_state)
    begin
        case current_state is
            when zero =>
                amount <= "00001";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when zero_nickel =>
                amount <= "00010";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when zero_dime =>
                amount <= "00100";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when five =>
                amount <= "00010";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '0';
            when five_nickel =>
                amount <= "00100";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when five_dime =>
                amount <= "01000";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when ten =>
                amount <= "00100";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '0';
            when ten_nickel =>
                amount <= "01000";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when ten_dime =>
                amount <= "10000";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when fifteen =>
                amount <= "01000";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '0';
            when fifteen_nickel_dime =>
                amount <= "10000";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '1';
            when twenty =>
                amount <= "10000";
                dispense_gum <= '0';
                dispense_candy <= '0';
                timer_reset <= '0';
            when dispense_gum_state =>
                amount <= "00001";
                dispense_gum <= '1';
                dispense_candy <= '0';
                timer_reset <= '0';
            when dispense_candy_state =>
                amount <= "00001";
                dispense_gum <= '0';
                dispense_candy <= '1';
                timer_reset <= '0';
            when others =>
                amount <= "00001";
                dispense_gum <= '0';
                dispense_candy <= '0';
        end case;
    end process;
    current_state <= next_state;
end Behavioral;