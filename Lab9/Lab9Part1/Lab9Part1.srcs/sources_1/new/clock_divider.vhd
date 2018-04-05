library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity Clockdivider is
     port(clk : in std_logic;
          start_timer : in std_logic;
	  FastClock,MediumClock,SlowClock, led0 : out std_logic);
end Clockdivider;



architecture clockdivider_arch of Clockdivider is



signal slowClock_sig : STD_LOGIC;



begin

    process  

    variable cnt :	std_logic_vector(26 downto 0):= "000000000000000000000000000";

    begin					 

        wait until ((clk'EVENT) AND (clk = '1'));

		if (start_timer = '1') then

	       cnt := "000000000000000000000000000";

	    else  

           cnt := STD_LOGIC_VECTOR(unsigned(cnt) + 1);

	    end if;



   	    FastClock <= cnt(22);

   	    MediumClock <= cnt(24);	

   	    SlowClock <= cnt(26);

        slowClock_sig <= cnt(26);

	

        if (slowClock_sig = '1') then

		  led0 <= '1';

	    else

		  led0 <= '0';

	    end if;

	end process;

end clockdivider_arch;