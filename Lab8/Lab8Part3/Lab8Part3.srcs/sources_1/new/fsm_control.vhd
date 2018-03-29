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
           load : in STD_LOGIC;
           enable : in STD_LOGIC;
           state_input : in STD_LOGIC;
           load_input : in STD_LOGIC_VECTOR(3 downto 0);
           output : out STD_LOGIC_VECTOR(6 downto 0));
end fsm_control;

architecture Behavioral of fsm_control is

component counter is
    Port ( direction : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR(3 downto 0);
           clk_led : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR(6 downto 0));
end component counter;

signal state : STD_LOGIC_VECTOR(2 downto 0);
signal slowClock : STD_LOGIC;
signal count : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
signal direction : STD_LOGIC;

begin
    counter_comp : counter port map(direction, reset, load, enable, clk, load_input, slowClock, count);
    
    process(slowClock, reset, state)
    begin
        if(reset = '1') then
            state <= "000";
        elsif(slowClock'event and slowClock = '1') then
            case state is
                when "000" =>
                    if(state_input = '1') then
                        state <= "001";
                    else
                        state <= "100";
                    end if;
                when "001" =>
                    if(state_input = '1') then
                        state <= "001";
                    else
                        state <= "010";
                    end if;
                when "010" =>
                    if(state_input = '1') then
                        state <= "011";
                        direction <= '1';
                    else
                        state <= "100";
                    end if;
                when "011" =>
                    state <= "000";
                when "100" =>
                    if(state_input = '1') then
                        state <= "101";
                    else
                        state <= "100";
                    end if;
                when "101" =>
                    if(state_input = '1') then
                        state <= "001";
                    else
                        state <= "110";
                        direction <= '0';
                    end if;
                when others =>
                    state <= "000";
            end case;
        end if;
    end process; 


    output <= count;

end Behavioral;
