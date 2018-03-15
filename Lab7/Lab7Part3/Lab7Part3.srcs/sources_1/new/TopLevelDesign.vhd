library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopLevelDesign is
    Port ( input1 : in STD_LOGIC_VECTOR(1 downto 0);
           input2 : in STD_LOGIC_VECTOR(1 downto 0);
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR(1 downto 0);
           clock_led : out STD_LOGIC;
           operation : out STD_LOGIC_VECTOR(1 downto 0));
end TopLevelDesign;

architecture Behavioral of TopLevelDesign is
component FSM is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           output_sel : out STD_LOGIC_VECTOR(1 downto 0);
           clock_led : out STD_LOGIC);
end component FSM;

component ArithmeticLogicUnit is
    Port ( in1 : in STD_LOGIC_VECTOR(1 downto 0);
           in2 : in STD_LOGIC_VECTOR(1 downto 0);
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           output : out STD_LOGIC_VECTOR(1 downto 0));
end component ArithmeticLogicUnit;

signal select_signal : STD_LOGIC_VECTOR(1 downto 0);

begin
    stateMachine : FSM port map(clk, enable, reset, select_signal, clock_led);
    logicUnit : ArithmeticLogicUnit port map(input1, input2, select_signal, output);
    operation <= select_signal;
end Behavioral;
