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

entity full_adder is port(a, b, cin: in STD_LOGIC; sum, cout :out STD_LOGIC);
end entity full_adder;

architecture adder_arch of full_adder is
begin
    process(a, b, cin);
    begin
    if (a = '0' and b = '0' and cin = '0') then (cout <= '0' & sum <= '0');
		elsif (a = '0' and b = '0' and cin = '1') then (cout <= '0' & sum <= '1');
		elsif (a = '0' and b = '1' and cin = '0') then (cout <= '0' & sum <= '1');
		elsif (a = '0' and b = '1' and cin = '1') then (cout <= '1' & sum <= '0');
		elsif (a = '1' and b = '0' and cin = '0') then (cout <= '0' & sum <= '1');
		elsif (a = '1' and b = '0' and cin = '1') then (cout <= '1' & sum <= '1');
		elsif (a = '1' and b = '1' and cin = '0') then (cout <= '1' & sum <= '0');
		elsif (a = '1' and b = '1' and cin = '1') then (cout <= '1' & sum <= '1');
	end if;
	end process;
end architecture adder_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
signal tmpcarry:STD_LOGIC;

component full_adder port(a,b,cin : in STD_LOGIC; sum, cout : out STD_LOGIC);
end component full_adder;

begin
    component_0 : full_adder port map (x0, y0, '0', z0, tmpcarry);
    component_2 : full_adder port map (x1, y1, tmpcarry, z1, cout);

end adder;