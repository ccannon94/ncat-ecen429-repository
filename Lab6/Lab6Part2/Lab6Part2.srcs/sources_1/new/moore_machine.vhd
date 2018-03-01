library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity moore_machine is
    Port ( input : in STD_LOGIC;
           led0 : out STD_LOGIC;
           state : out STD_LOGIC;
           output : out STD_LOGIC;
           clk : in STD_LOGIC);
end moore_machine;

architecture moore_arch of moore_machine is

begin


end moore_arch;
