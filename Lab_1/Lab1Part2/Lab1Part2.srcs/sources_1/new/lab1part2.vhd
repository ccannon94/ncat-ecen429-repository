----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2018 02:44:14 PM
-- Design Name: 
-- Module Name: lab1part2 - Behavioral
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

entity lab1part2 is
    Port ( m : in STD_LOGIC;
           v : in STD_LOGIC;
           d : in STD_LOGIC;
           s : out STD_LOGIC);
end lab1part2;

architecture Behavioral of lab1part2 is

signal tmp1 : STD_LOGIC;

begin

tmp1 <= v or d;
s <= m and tmp1;

end Behavioral;
