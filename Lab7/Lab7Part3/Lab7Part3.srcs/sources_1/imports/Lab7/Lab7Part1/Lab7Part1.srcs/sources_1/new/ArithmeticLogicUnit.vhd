library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_and is port(a, b : in STD_LOGIC_VECTOR(1 downto 0); v: out STD_LOGIC_VECTOR(1 downto 0));
end entity bitwise_and;

architecture and_arch of bitwise_and is
begin
    v <= a and b;
end architecture and_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_or is port(c, d : in STD_LOGIC_VECTOR(1 downto 0); x: out STD_LOGIC_VECTOR(1 downto 0));
end entity bitwise_or;

architecture or_arch of bitwise_or is
begin
  x <= c or d;
end architecture or_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_lsr is port(e, f : in STD_LOGIC_VECTOR(1 downto 0); y : out STD_LOGIC_VECTOR(1 downto 0));
end bitwise_lsr;

architecture lsr_arch of bitwise_lsr is
begin
    process(e, f)
    begin
        case f is
        when "00" =>
            y <= e;
        when "01" =>
            if(e = "00") then y <= "00";
            elsif(e = "01") then y <= "00";
            else y <= "01";
            end if;
        when others =>
            y <= "00";
        end case;
     end process;
end lsr_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_lsl is port(g, h : in STD_LOGIC_VECTOR(1 DOWNTO 0); z : out STD_LOGIC_VECTOR(1 downto 0));
end bitwise_lsl;

architecture lsl_arch of bitwise_lsl is
begin
    process(g, h)
    begin
        case h is
        when "00" =>
            z <= g;
        when "01" =>
            if(g = "11") then z <= "10";
            elsif(g = "01") then z <="10";
            else z <= "00";
            end if;
        when others =>
            z <= "00";
        end case;
    end process;
end lsl_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmeticLogicUnit is
    Port ( in1 : in STD_LOGIC_VECTOR(1 downto 0);
           in2 : in STD_LOGIC_VECTOR(1 downto 0);
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           output : out STD_LOGIC_VECTOR(1 downto 0));
end ArithmeticLogicUnit;

architecture Behavioral of ArithmeticLogicUnit is
component bitwise_and is port(a, b : in STD_LOGIC_VECTOR(1 downto 0); v : out STD_LOGIC_VECTOR(1 downto 0));
end component bitwise_and;

component bitwise_or is port(c, d : in STD_LOGIC_VECTOR(1 downto 0); x : out STD_LOGIC_VECTOR(1 downto 0));
end component bitwise_or;

component bitwise_lsr is port(e, f : in STD_LOGIC_VECTOR(1 downto 0); y : out STD_LOGIC_VECTOR(1 downto 0));
end component bitwise_lsr;

component bitwise_lsl is port(g, h : in STD_LOGIC_VECTOR(1 DOWNTO 0); z : out STD_LOGIC_VECTOR(1 downto 0));
end component bitwise_lsl;

signal and_output : STD_LOGIC_VECTOR(1 downto 0);
signal or_output : STD_LOGIC_VECTOR(1 downto 0);
signal lsr_output : STD_LOGIC_VECTOR(1 downto 0);
signal lsl_output : STD_LOGIC_VECTOR(1 downto 0);

begin
    and_comp : bitwise_and port map(in1, in2, and_output);
    or_comp : bitwise_or port map(in1, in2, or_output);
    lsr_comp : bitwise_lsr port map(in1, in2, lsr_output);
    lsl_comp : bitwise_lsl port map(in1, in2, lsl_output);
    
    process(sel)
    begin
        case sel is
            when "00" =>
                output <= and_output;
            when "01" =>
                output <= or_output;
            when "10" =>
                output <= lsr_output;
            when "11" =>
                output <= lsl_output;
        end case;
    end process;                

end Behavioral;


