library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fewLeftAlarm is
	Port(		input : in STD_LOGIC_VECTOR(3 downto 0);
				output : out boolean
	);
end fewLeftAlarm;
architecture Behavioural of fewLeftAlarm is
	signal output_internal : boolean := false;

begin
	process(input)
		begin
			if input < 2 or input = 2 then
				output_internal <= true;
			else
				output_internal <= false;
			end if;
		end process;
		output <= output_internal;
end Behavioural;