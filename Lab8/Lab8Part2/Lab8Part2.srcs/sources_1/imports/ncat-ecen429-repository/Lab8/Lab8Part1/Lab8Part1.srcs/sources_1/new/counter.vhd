library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
    Port ( direction : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR(3 downto 0);
           clk_led : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR(6 downto 0));
end counter;

architecture Behavioral of counter is

component Clockdivider is
     port(clk : in std_logic;
          start_timer : in std_logic;
	  FastClock,MediumClock,SlowClock, led0 : out std_logic);
end component Clockdivider;

signal fastClock : STD_LOGIC;
signal mediumClock : STD_LOGIC;
signal slowClock : STD_LOGIC;
signal start_timer : STD_LOGIC := '0';
signal tmp_count : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
    clock_div : Clockdivider port map(clk, start_timer, fastClock, mediumClock, slowClock, clk_led);

    process(clk, reset)
    begin
        if(reset = '1') then tmp_count <= "0000";
        elsif(slowClock'event and (slowClock = '1') and enable = '1') then
            if(load = '1') then
                tmp_count <= input;
            elsif(direction = '1') then
                case tmp_count is
                    when "0000" =>
                        tmp_count <= "0001";
                    when "0001" =>
                        tmp_count <= "0010";
                    when "0010" =>
                        tmp_count <= "0011";
                    when "0011" =>
                        tmp_count <= "0100";
                    when "0100" =>
                        tmp_count <= "0101";
                    when "0101" =>
                        tmp_count <= "0110";
                    when "0110" =>
                        tmp_count <= "0111";
                    when "0111" =>
                        tmp_count <= "1000";
                    when "1000" =>
                        tmp_count <= "1001";
                    when others =>
                        tmp_count <= "0000";
                end case;
            else
                case tmp_count is
                    when "1001" =>
                        tmp_count <= "1000";
                    when "1000" =>
                        tmp_count <= "0111";
                    when "0111" =>
                        tmp_count <= "0110";
                    when "0110" =>
                        tmp_count <= "0101";
                    when "0101" =>
                        tmp_count <= "0100";
                    when "0100" =>
                        tmp_count <= "0011";
                    when "0011" =>
                        tmp_count <= "0010";
                    when "0010" =>
                        tmp_count <= "0001";
                    when "0001" =>
                        tmp_count <= "0000";
                    when others =>
                        tmp_count <= "1001";
                end case;
            end if;
        end if;
    end process;
    process(tmp_count)
    begin
        case tmp_count is
            when "0000" =>
                count <= "0000001";
            when "0001" =>
                count <= "1001111";
            when "0010" =>
                count <= "0010010";
            when "0011" =>
                count <= "0000110";
            when "0100" =>
                count <= "1001100";
            when "0101" =>
                count <= "0100100";
            when "0110" =>
                count <= "0100000";
            when "0111" =>
                count <= "0001111";
            when "1000" =>
                count <= "0000000";
            when "1001" =>
                count <= "0001100";
            when others =>
                count <= "1111111";
        end case;
    end process;    
    
end Behavioral;
