----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 01:28:50 PM
-- Design Name: 
-- Module Name: rom - Behavioral
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

entity rom is
    Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           o : out STD_LOGIC_VECTOR(2 downto 0));
end entity rom;

architecture rom_arch of rom is
    
begin
process(a)
    begin
        case a is
            when "0000" => o <= "000";
            when "0001" => o <= "001";
            when "0010" => o <= "010";
            when "0011" => o <= "011";
            when "0100" => o <= "100";
            when "0101" => o <= "101";
            when "0110" => o <= "110";
            when "0111" => o <= "111";
            when "1000" => o <= "000";
            when "1001" => o <= "001";
            when "1010" => o <= "010";
            when "1011" => o <= "011";
            when "1100" => o <= "100";
            when "1101" => o <= "101";
            when "1110" => o <= "110";
            when "1111" => o <= "111";
        end case;
    end process;
end rom_arch;
