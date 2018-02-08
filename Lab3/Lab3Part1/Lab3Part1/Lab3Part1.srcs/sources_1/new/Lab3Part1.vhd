----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2018 01:26:28 PM
-- Design Name: 
-- Module Name: Lab3Part1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is

    Port ( cin : in STD_LOGIC;

           a : in STD_LOGIC;

           b : in STD_LOGIC;

           cout : out STD_LOGIC;

           sum : out STD_LOGIC);

end full_adder;



architecture Behavioral of full_adder is



begin



sum <= (a and b and cin) or (a and (not b) and (not cin)) or (b and (not a) and (not cin)) or (cin and (not a) and (not b));

cout <= (cin and (a or b)) or (a and b);



end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab3Part1 is
    Port ( cin : in STD_LOGIC;
           a2 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           x2 : out STD_LOGIC;
           x1 : out STD_LOGIC;
           cout : out STD_LOGIC);
end Lab3Part1;

architecture Behavioral_Two of Lab3Part1 is

component full_adder port (a, b, cin : in STD_LOGIC; sum, cout : out STD_LOGIC);
end component full_adder;

signal c1 : STD_LOGIC;

begin
    adder_one : full_adder port map(a1, b1, cin, x1, c1);
    adder_two : full_adder port map(a2, b2, c1, x2, cout);

end Behavioral_Two;
