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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab1part3 is
    Port ( x1 : in STD_LOGIC;
           x0 : in STD_LOGIC;
           y1 : in STD_LOGIC;
           y0 : in STD_LOGIC;
           z1 : out STD_LOGIC;
           z0 : out STD_LOGIC;
           cout : out STD_LOGIC);
end lab1part3;

architecture adder of lab1part3 is

begin

z1 <= (x1 and not y1 and not y0) or (x1 and not x0 and not y1) or (not x1 and not x0 and y1) or (not x1 and y1 and not y0) or (not x1 and x0 and not y1 and y0) or (x1 and x0 and y1 and y0);
z0 <= (x1 and x0 and y0) or (not x1 and x0 and not y0) or (x0 and y1 and not y0) or (x1 and not x0 and y1);
cout <= (x0 and y1 and y0) or (x1 and x0 and y0);

end adder;