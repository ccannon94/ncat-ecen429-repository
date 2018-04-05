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
component mux_adder port(cin, y1, y2, z1, z2, sel : in STD_LOGIC; x2, x1 : out STD_LOGIC);
end component mux_adder;

signal c_sig bit;
signal x1_sig bit;
signal x2_sig bit;

begin

adder : mux_adder port map(cin => cin, y1 => a1, y2 => a2, z1 => b1, z2 => b2, sel_a => sel, x2 => x2_sig, x1 => x1_sig, cout => c_sig);

process (sel, x2, x1)
--when sel is  high then display shows 3,2,1,0 depend on x2 and x1 when sel is low then display shows 0, or 1 depend on cout
   begin
   case sel is 
   when '0' =>
    if cout = '0' then
      out1 <= '0';
      out2 <= '0';
      out3 <= '0';
      out4 <= '0';
      out5 <= '0';
      out6 <= '0';
      out7 <= '1';
   else
    out1 <= '1';
    out2 <= '0';
    out3 <= '0';
    out4 <= '1';
    out5 <= '1';
    out6 <= '1';
    out7 <= '1';
    end if;
   
                 
 when '1' =>   
 if (x2='0'and x1='0')then
                out1 <= '0';
                out2 <= '0';
                out3 <= '0';
                out4 <= '0';
                out5 <= '0';
                out6 <= '0';
                out7 <= '1';  
 elsif (x2='0'and x1='1')then
                 out1 <= '1';
                 out2 <= '0';
                 out3 <= '0';
                 out4 <= '1';
                 out5 <= '1';
                 out6 <= '1';
                 out7 <= '1'; 
 elsif (x2='1'and x1='0')then           
                 out1 <= '0';
                 out2 <= '0';
                 out3 <= '1';
                 out4 <= '0';
                 out5 <= '0';
                 out6 <= '1';
                 out7 <= '0'; 
                                 
   elsif (x2='1'and x1='1')then   
                 out1 <= '0';
                 out2 <= '0';
                 out3 <= '0';
                 out4 <= '0';
                 out5 <= '1';
                 out6 <= '1';
                 out7 <= '0';  
                 
   end if;                                   
                             
   end case;
   end process;              
end Behavioral;
