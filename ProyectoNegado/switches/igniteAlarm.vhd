library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity igniteAlarm is
	Port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(3 downto 0);
		input : in STD_LOGIC
	);
end igniteAlarm;

architecture Behavioural of igniteAlarm is
	signal output_internal : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
	process(input,reset)
		begin
			if reset = '1' then
				output_internal <= "0000";
			end if;
			if input = '1' then
				output_internal <= "1100";
			else
				output_internal <= "0000";
			end if;
		end process;
		output <= not(output_internal);
end Behavioural;