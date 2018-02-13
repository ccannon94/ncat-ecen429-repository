----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2018 02:01:01 PM
-- Design Name: 
-- Module Name: Lab3Part2 - Behavioral
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

entity two_bit_adder is
    Port ( cin : in STD_LOGIC;
           a2 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           x2 : out STD_LOGIC;
           x1 : out STD_LOGIC;
           cout : out STD_LOGIC);
end two_bit_adder;

architecture Behavioral_Two of two_bit_adder is

component full_adder port (a, b, cin : in STD_LOGIC; sum, cout : out STD_LOGIC);
end component full_adder;

signal c1 : STD_LOGIC;

begin
    adder_one : full_adder port map(a1, b1, cin, x1, c1);
    adder_two : full_adder port map(a2, b2, c1, x2, cout);

end Behavioral_Two;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab3Part2 is
    Port ( cin : in STD_LOGIC;
           a1 : in STD_LOGIC;
           a2 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           sel : in STD_LOGIC;
           x2 : out STD_LOGIC;
           x1: out STD_LOGIC);
end Lab3Part2;

architecture Behavioral_Three of Lab3Part2 is
component two_bit_adder port(cin, a2, a1, b2, b1 : in STD_LOGIC; x2, x1, cout : out STD_LOGIC);
end component two_bit_adder;
signal sum1 : STD_LOGIC;
signal sum2 : STD_LOGIC;
signal tmpc : STD_LOGIC;

begin
    adder : two_bit_adder port map(cin, a2, a1, b2, b1, sum2, sum1, tmpc);
    
    x2 <= '0' when (sel = '0') else sum2;
    x1 <= tmpc when (sel = '0') else sum1;
    

end Behavioral_Three;
