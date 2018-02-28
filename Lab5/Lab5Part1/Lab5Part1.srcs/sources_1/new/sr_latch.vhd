library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sr_latch is
    Port ( s : in STD_LOGIC;
           r : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : inout STD_LOGIC;
           qbar : inout STD_LOGIC;
           error : out STD_LOGIC_VECTOR(6 downto 0));
end sr_latch;

architecture sr_arch of sr_latch is

begin
    process(clk)
    begin
        if(clk'event and (clk='1')) then
            if((r = '1') and (s = '1')) then
                q <= '0';
                qbar <= '0';
                error <= "0000000";
            else
                q <= r nor qbar;
                qbar <= s nor q;
                error <= "1111111";
            end if;
        end if;
    end process;
end sr_arch;
