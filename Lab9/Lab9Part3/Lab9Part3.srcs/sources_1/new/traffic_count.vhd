library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity traffic_count is
    port(clk, e_signal, w_signal : in STD_LOGIC;
    nt_signal : in STD_LOGIC;
    output_count : out STD_LOGIC_VECTOR(6 downto 0);
    output_mux : out STD_LOGIC_VECTOR(3 downto 0));
end entity traffic_count;

architecture Behavioral of traffic_count is
signal ew_count : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal nt_count : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
    process(e_signal, w_signal)
    begin
        if(e_signal = '1' or w_signal = '1') then ew_count <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(ew_count)) + 1, 4));
        end if;
    end process;
    process(nt_signal)
    begin
        if(nt_signal = '1') then nt_count <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(ew_count)) + 1, 4));
        end if;
    end process;
    
    process(ew_count, nt_count)
    begin
        output_mux <= "0001";
        case ew_count is
            when "0000" =>
                output_count <= "0000001";
            when "0001" =>
                output_count <= "1001111";
            when "0010" =>
                output_count <= "0010010";
            when "0011" =>
                output_count <= "0000110";
            when "0100" =>
                output_count <= "1001100";
            when "0101" =>
                output_count <= "0100100";
            when "0110" =>
                output_count <= "0100000";
            when "0111" =>
                output_count <= "0001111";
            when "1000" =>
                output_count <= "0000000";
            when "1001" =>
                output_count <= "0001100";
            when others =>
                output_count <= "1111111";
        end case;
        output_mux <= "0100";
        case nt_count is
            when "0000" =>
                output_count <= "0000001";
            when "0001" =>
                output_count <= "1001111";
            when "0010" =>
                output_count <= "0010010";
            when "0011" =>
                output_count <= "0000110";
            when "0100" =>
                output_count <= "1001100";
            when "0101" =>
                output_count <= "0100100";
            when "0110" =>
                output_count <= "0100000";
            when "0111" =>
                output_count <= "0001111";
            when "1000" =>
                output_count <= "0000000";
            when "1001" =>
                output_count <= "0001100";
            when others =>
                output_count <= "1111111";
        end case;
    end process;
end Behavioral;