library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timer_five is
    Port ( clk, reset : in STD_LOGIC;
    done : out STD_LOGIC);
end timer_five;

architecture Behavioral of timer_five is

signal start_timer : std_logic := '0';
signal fast_clock, med_clock, slow_clock, clk_led : std_logic;
signal current_count : std_logic_vector(2 downto 0) := "000";

begin

    process(slow_clock, reset)
    begin
        if(reset = '1') then current_count <= "000";
        elsif(clk'event and clk = '1') then
            if(current_count <= "100") then
                current_count <= std_logic_vector(unsigned(current_count) + 1);
                done <= '0';
            else
                current_count <= "000";
                done <= '1';
            end if;
        end if;
    end process;


end Behavioral;
