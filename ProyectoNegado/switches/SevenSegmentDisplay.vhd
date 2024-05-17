library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity SevenSegmentDisplay is
	Port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		binary_input : in STD_LOGIC_VECTOR(3 downto 0);
		segment_output : out STD_LOGIC_VECTOR(13 downto 0)
		
	);
end SevenSegmentDisplay;

architecture Behavioral of SevenSegmentDisplay is
	signal segment_data : STD_LOGIC_VECTOR(13 downto 0);
begin
	
	process(clk, reset, binary_input)
		begin	
			--if reset = '1' then
				--segment_output <= (others => '0');
				--elsif rising_edge(clk) then 
					case binary_input is
					when "0000" => segment_data<= "01111110000000";
					when "0001" => segment_data<= "00001100000000";
					when "0010" => segment_data<= "10110110000000";
					when "0011" => segment_data<= "10011110000000";
					when "0100" => segment_data<= "11001100000000";
					when "0101" => segment_data<= "11011010000000";
					when "0110" => segment_data<= "11111010000000";
					when "0111" => segment_data<= "00001110000000";
					when "1000" => segment_data<= "11111110000000";
					when "1001" => segment_data<= "11001110000000";
					when "1010" => segment_data<= "01111110000110";
					when others => segment_data<= "11111111111111";
					end case;
			--end if;
		end process;
		segment_output<=not(segment_data);
		
end Behavioral;