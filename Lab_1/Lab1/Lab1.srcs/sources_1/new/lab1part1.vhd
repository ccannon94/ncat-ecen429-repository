----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2018 02:30:36 PM
-- Design Name: 
-- Module Name: lab1part1 - Behavioral
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

-- This entity will perform 2 operations with 3 inputs. The result of each operation
-- will be output to a bit.
entity lab1part1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : out STD_LOGIC;
           e : out STD_LOGIC);
end lab1part1;

architecture Behavioral of lab1part1 is

begin
    -- Output 'D' will be the result of 'A' AND 'B'
    d <= a and b;
    -- Output 'E' will be the result of 'B' OR 'C'
    e <= b or c;

end Behavioral;
