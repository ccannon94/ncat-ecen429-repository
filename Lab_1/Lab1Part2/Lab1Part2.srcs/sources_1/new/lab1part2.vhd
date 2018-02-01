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

-- This entity has 3 inputs, the master switch, vibration sensor, and door sensor
-- described in the car alarm problem. The siren is the only output.
entity lab1part2 is
    Port ( m : in STD_LOGIC;
           v : in STD_LOGIC;
           d : in STD_LOGIC;
           s : out STD_LOGIC);
end lab1part2;

architecture Behavioral of lab1part2 is

-- tmp1 is required to carry the sensor state from the sensor OR gate to the master
-- switch AND gate
signal tmp1 : STD_LOGIC;

begin

    --tmp1 tells whether or not a sensor is active
    tmp1 <= v or d;
    --'S' will be set to high when both the master switch AND a sensor are active
    s <= m and tmp1;

end Behavioral;
