----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2018 02:41:05 PM
-- Design Name: 
-- Module Name: Lab3Part3 - Behavioral
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

entity Lab3Part3 is
    Port ( a2 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           cin : in STD_LOGIC;
           sel : in STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC;
           out3 : out STD_LOGIC;
           out4 : out STD_LOGIC;
           out5 : out STD_LOGIC;
           out6 : out STD_LOGIC;
           out7 : out STD_LOGIC);
end Lab3Part3;

architecture Behavioral of Lab3Part3 is
component mux_adder port(cin, a1, a2, b1, b2, sel : in STD_LOGIC; x2, x1 : out STD_LOGIC);
end component mux_adder;

begin
   out1 <= 
   out2 <= 
   out3 <= 
   out4 <= 
   out5 <= 
   out6 <=
   out7 <= 

end Behavioral;
