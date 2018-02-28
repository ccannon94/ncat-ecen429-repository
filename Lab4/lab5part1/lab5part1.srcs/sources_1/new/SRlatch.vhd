----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2018 01:30:28 PM
-- Design Name: 
-- Module Name: SRlatch - Behavioral
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

entity SRlatch is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           not_Q :out STD_LOGIC;
           z : out STD_LOGIC_VECTOR(6 downto 0));
         
 end SRlatch;

architecture Behavioral of SRlatch is

signal tmp1:STD_LOGIC;
signal tmp2:STD_LOGIC;
signal q_n: STD_LOGIC;



begin
process(clk,S,R)
begin

Q<=tmp1;
not_Q<=tmp2;


if(clk'event and(clk='1')) then
 tmp1<= (q_n nand R);
 tmp2<= S nand(q_n nand R) ;
 
 
if ((S ='1') and (R='1'))then
z<= "1111101";
 
 
 
end if;
end process;
end  Behavioral;



