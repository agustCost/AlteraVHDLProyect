library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity ledDisplay is
	Port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		binary_input : in STD_LOGIC_VECTOR(3 downto 0);
		led_output : out STD_LOGIC_VECTOR(9 downto 0)
		
	);
end ledDisplay;

architecture Behavioral of ledDisplay is
	signal segment_data : STD_LOGIC_VECTOR(9 downto 0);
	
begin
	process(clk, reset, binary_input)
		begin	
					case binary_input is
					when "0000" => segment_data<= "1000000000";
					when "0001" => segment_data<= "0100000000";
					when "0010" => segment_data<= "0010000000";
					when "0011" => segment_data<= "0001000000";
					when "0100" => segment_data<= "0000100000";
					when "0101" => segment_data<= "0000010000";
					when "0110" => segment_data<= "0000001000";
					when "0111" => segment_data<= "0000000100";
					when "1000" => segment_data<= "0000000010";
					when "1001" => segment_data<= "0000000001";
					when "1010" => segment_data<= "1111100000";
					when "1011" => segment_data<= "0000011111";
					when others => segment_data<= "1111111111";
					end case;
		end process;
	led_output <= segment_data;
end Behavioral;