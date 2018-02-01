----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2018 02:48:15 PM
-- Design Name: 
-- Module Name: Lab2Part3 - Behavioral
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

entity Lab2Part3 is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end Lab2Part3;

architecture Behavioral of Lab2Part3 is

begin

sum <= ((not a) and b and cin) or (a and (not b) and cin) or (a and b and (not cin)) or (a and b and cin) or (a and (not b) and (not cin)) or (b and (not a) and (not cin)) or (cin and (not a) and (not b));
cout <= (cin and (a or b)) or (a and b);

end Behavioral;
