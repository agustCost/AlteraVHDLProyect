library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sixteenBinaryToSegments is
	Port ( binary_input : in integer range 0 to 65535;
		segment_a, segment_b : out STD_LOGIC_VECTOR(6 downto 0);
		reset : in STD_LOGIC;
		clk : in STD_LOGIC
	);
end sixteenBinaryToSegments;

architecture Behavioral of sixteenBinaryToSegments is
	signal decimal_value : integer range 0 to 99 := 0;
	signal display_value : integer range 0 to 99 := 0;
	signal segment_pattern_a, segment_pattern_b : STD_LOGIC_VECTOR(6 downto 0);
	
	type segment_array is array(0 to 9) of STD_LOGIC_VECTOR(6 downto 0);
	constant seven_segment_mapping : segment_array := ("0111111", "0000110", "1011011", "1001111", "1100110", "1101101", "1111101", "0000111", "1111111", "1100111");

begin
	process(clk, reset)
		begin
			if reset = '1' then
				decimal_value <= 0;
				display_value <= 0;
			elsif rising_edge(clk) then
				decimal_value <= binary_input;
				if decimal_value < 100 then
					display_value <= decimal_value;
				else
					display_value <= 99;
				end if;
			end if;
	end process;
	
	process(display_value)
		begin
			if display_value < 10 then
				segment_pattern_a <= seven_segment_mapping(display_value);
				segment_pattern_b <= "0000000";
			else
				segment_pattern_a <= seven_segment_mapping(display_value mod 10);
				segment_pattern_b <= seven_segment_mapping(display_value / 10);
			end if;
		end process;
		
	segment_a <= not(segment_pattern_a);
	segment_b <= not(segment_pattern_b);
	
end Behavioral;
		
