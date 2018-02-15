library IEEE;

use IEEE.STD_LOGIC_1164.ALL;





entity full_adder is



    Port ( cin : in STD_LOGIC;



           a : in STD_LOGIC;



           b : in STD_LOGIC;



           cout : out STD_LOGIC;



           sum : out STD_LOGIC);



end full_adder;



architecture Behavioral of full_adder is

begin

sum <= (a and b and cin) or (a and (not b) and (not cin)) or (b and (not a) and (not cin)) or (cin and (not a) and (not b));

cout <= (cin and (a or b)) or (a and b);

end Behavioral;



library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity two_bit_adder is

    Port ( cin : in STD_LOGIC;

           a2 : in STD_LOGIC;

           a1 : in STD_LOGIC;

           b2 : in STD_LOGIC;

           b1 : in STD_LOGIC;

           x2 : out STD_LOGIC;

           x1 : out STD_LOGIC;

           cout : out STD_LOGIC);

end two_bit_adder;



architecture Behavioral_Two of two_bit_adder is



component full_adder port (a, b, cin : in STD_LOGIC; sum, cout : out STD_LOGIC);

end component full_adder;



signal c1 : STD_LOGIC;



begin

    adder_one : full_adder port map(a1, b1, cin, x1, c1);

    adder_two : full_adder port map(a2, b2, c1, x2, cout);



end Behavioral_Two;



library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity mux_adder is

    Port ( cin : in STD_LOGIC;

           y1 : in STD_LOGIC;

           y2 : in STD_LOGIC;

           z1 : in STD_LOGIC;

           z2 : in STD_LOGIC;

           sel_a : in STD_LOGIC;

           x2 : out STD_LOGIC;

           x1: out STD_LOGIC);

end mux_adder;



architecture Behavioral_Three of mux_adder is

component two_bit_adder port(cin, a2, a1, b2, b1 : in STD_LOGIC; x2, x1, cout : out STD_LOGIC);

end component two_bit_adder;

signal sum1 : STD_LOGIC;

signal sum2 : STD_LOGIC;

signal tmpc : STD_LOGIC;



begin

    adder : two_bit_adder port map(cin, y2, y1, z2, z1, sum2, sum1, tmpc);

    

    x2 <= '0' when (sel_a = '0') else sum2;

    x1 <= tmpc when (sel_a = '0') else sum1;

    



end Behavioral_Three;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab3Part3Rev3 is
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
end Lab3Part3Rev3;

architecture Behavioral of Lab3Part3Rev3 is
component mux_adder port(cin, y1, y2, z1, z2, sel_a : in STD_LOGIC; x2, x1 : out STD_LOGIC);
end component mux_adder; 

signal x1_sig : STD_LOGIC;
signal x2_sig : STD_LOGIC;

begin


    adder : mux_adder port map(cin => cin , y1 => a1, y2 => a2, z1 => b1, z2 => b2, sel_a => sel, x2 => x2_sig, x1 => x1_sig);
    
    process(sel, x1_sig, x2_sig)
        begin
        case sel is
            when '0' => 
                if (x1_sig = '0') then
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
            if (x2_sig='0'and x1_sig='0')then
            
                            out1 <= '0';
            
                            out2 <= '0';
            
                            out3 <= '0';
            
                            out4 <= '0';
            
                            out5 <= '0';
            
                            out6 <= '0';
            
                            out7 <= '1';  
            
             elsif (x2_sig='0'and x1_sig='1')then
            
                             out1 <= '1';
            
                             out2 <= '0';
            
                             out3 <= '0';
            
                             out4 <= '1';
            
                             out5 <= '1';
            
                             out6 <= '1';
            
                             out7 <= '1'; 
            
             elsif (x2_sig='1'and x1_sig='0')then           
            
                             out1 <= '0';
            
                             out2 <= '0';
            
                             out3 <= '1';
            
                             out4 <= '0';
            
                             out5 <= '0';
            
                             out6 <= '1';
            
                             out7 <= '0'; 
            
                                             
            
               elsif (x2_sig='1'and x1_sig='1')then   
            
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
