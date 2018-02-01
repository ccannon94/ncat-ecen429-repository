----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2018 02:16:54 PM
-- Design Name: 
-- Module Name: Lab2Part1 - Behavioral
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

entity Lab2Part1 is
    Port ( x : in STD_LOGIC_VECTOR(3 downto 0);
           da : out STD_LOGIC;
           db : out STD_LOGIC;
           dc : out STD_LOGIC;
           dd : out STD_LOGIC;
           de : out STD_LOGIC;
           df : out STD_LOGIC;
           dg : out STD_LOGIC);
end Lab2Part1;

architecture Behavioral of Lab2Part1 is

begin

    process(x)
        begin
        case x is
        when "0000" =>
            da <= '0';
            db <= '0';
            dc <= '0';
            dd <= '0';
            de <= '0';
            df <= '0';
            dg <= '1';
        when others =>
            da <= '1';
            db <= '1';
            dc <= '1';
            dd <= '1';
            de <= '1';
            df <= '1';
            dg <= '1';
        end case;
    end process;
end Behavioral;
