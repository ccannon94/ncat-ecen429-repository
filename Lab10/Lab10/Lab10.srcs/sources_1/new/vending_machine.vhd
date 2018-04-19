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

signal current_state : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal next_state : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal reset_clock : STD_LOGIC := '0';
signal fast_clock, medium_clock, slow_clock : STD_LOGIC;

begin

    cd : clock_divider port map(clk, reset_clock, fast_clock, medium_clock, slow_clock, clock_led);

    process(slow_clock, reset)
    begin
        if(reset = '1') then next_state <= "000";
        elsif(slow_clock'event and slow_clock = '1') then
            case current_state is
                when "000" =>
                    if(dime = '1') then next_state <= "010";
                    elsif(nickel = '1') then next_state <= "001";
                    else next_state <= "000";
                    end if;
                when "001" =>
                    if(dime = '1') then next_state <= "011";
                    elsif(nickel = '1') then next_state <= "010";
                    else next_state <= "001";
                    end if;
                when "010" =>
                    if(dime = '1') then next_state <= "100";
                    elsif(nickel = '1') then next_state <= "011";
                    else next_state <= "010";
                    end if;
                when "011" =>
                    if(dime = '1' or nickel = '1') then next_state <= "100";
                    elsif(gum = '1') then next_state <= "101";
                    else next_state <= "011";
                    end if;
                when "100" =>
                    if(candy = '1') then next_state <= "110";
                    elsif(gum = '1') then next_state <= "101";
                    else next_state <= "100";
                    end if;
                when others =>
                    next_state <= "000";
            end case;
        end if;
    end process;
    process(current_state)
    begin
        case current_state is
            when "000" =>
                amount <= "00001";
                dispense_gum <= '0';
                dispense_candy <= '0';
            when "001" =>
                amount <= "00010";
                dispense_gum <= '0';
                dispense_candy <= '0';
            when "010" =>
                amount <= "00100";
                dispense_gum <= '0';
                dispense_candy <= '0';
            when "011" =>
                amount <= "01000";
                dispense_gum <= '0';
                dispense_candy <= '0';
            when "100" =>
                amount <= "10000";
                dispense_gum <= '0';
                dispense_candy <= '0';
            when "101" =>
                amount <= "00001";
                dispense_gum <= '1';
                dispense_candy <= '0';
            when "110" =>
                amount <= "00001";
                dispense_gum <= '0';
                dispense_candy <= '1';
            when others =>
                amount <= "00001";
                dispense_gum <= '0';
                dispense_candy <= '0';
        end case;
    end process;
    current_state <= next_state;

end Behavioral;
