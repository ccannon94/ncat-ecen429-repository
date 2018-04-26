library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gum_candy_counter is
    Port ( clk, candy, gum, reset : in STD_LOGIC;
    candy_count, gum_count : out STD_LOGIC_VECTOR(1 downto 0));
end gum_candy_counter;

architecture Behavioral of gum_candy_counter is
signal current_candy_count, current_gum_count : std_logic_vector(1 downto 0) := "00";

begin
    process(clk, reset) 
    begin
        if(reset = '1') then
            current_candy_count <= "00";
            current_gum_count <= "00";
        elsif(clk'event and clk = '1') then
            if(candy = '1') then
                current_candy_count <= std_logic_vector(unsigned(current_candy_count) + 1);
            elsif(gum = '1') then
                current_gum_count <= std_logic_vector(unsigned(current_gum_count) + 1);
            end if;
        end if;
    end process;
    candy_count <= current_candy_count;
    gum_count <= current_gum_count;

end Behavioral;
