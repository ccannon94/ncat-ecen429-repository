----------------------------------------------------------------------------------
-- School: North Carolina A&T State University
-- Engineer: Chris Cannon
--           Nikiyah
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

-- The following two lines declare the full_adder, which will later be used as a
-- component. The full adder takes two 1-bit numbers and a carry-in, and adds them
entity full_adder is port(a, b, cin: in STD_LOGIC; sum, cout :out STD_LOGIC);
end entity full_adder;

architecture adder_arch of full_adder is
begin
    -- The comparison of a, b, and cin will determine the output
    process(a, b, cin);
    begin
    -- Every possible case is documented and outputs are assigned for the addition
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

-- This entity is the top-level entity of this program. It will add two 2-bit numbers.
-- The carry-in for the least significant bit addition is assumed to be 0 for this 
-- closed system.
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
-- This signal is needed to relay the carry-out of the least significant bit operation
-- to the carry-in of the most significant bit operation.
signal tmpcarry:STD_LOGIC;

-- This declares a full_adder component based on the entity above. This declaration
-- is only needed once in order to use the full_adder twice.
component full_adder port(a,b,cin : in STD_LOGIC; sum, cout : out STD_LOGIC);
end component full_adder;

begin
    -- This adder performs the least significant bit operation
    component_0 : full_adder port map (x0, y0, '0', z0, tmpcarry);
    -- This adder performs the most significant bit operation
    component_2 : full_adder port map (x1, y1, tmpcarry, z1, cout);

end adder;