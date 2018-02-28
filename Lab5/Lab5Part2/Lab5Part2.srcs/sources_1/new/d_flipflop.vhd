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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flipflop is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : inout STD_LOGIC;
           qbar : inout STD_LOGIC);
end d_flipflop;

architecture d_arch of d_flipflop is

component sr_latch is port( s : in STD_LOGIC;
           r : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : inout STD_LOGIC;
           qbar : inout STD_LOGIC;
           error : out STD_LOGIC_VECTOR(6 downto 0));
end component sr_latch;

signal error_sig : STD_LOGIC_VECTOR(6 downto 0);
signal dbar : STD_LOGIC;

begin
    sr_comp : sr_latch port map(d, dbar, clk, q, qbar, error_sig);
    
    process(clk)
    begin
        if(clk'event and (clk='1')) then
            dbar <= not d;
        end if;
    end process;
end d_arch;
