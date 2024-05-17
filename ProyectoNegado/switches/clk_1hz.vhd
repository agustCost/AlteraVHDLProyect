library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_1hz is
	Port ( clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		tick: out STD_LOGIC
	);
end clk_1hz;

architecture Behavioural of clk_1hz is
	signal counter : integer range 0 to 24999999 := 0;
	signal tick_internal : STD_LOGIC := '0';
	
begin
	process(clk, reset)
	begin
		if reset = '1' then
			counter <= 0;
			tick_internal <= '0';
		elsif rising_edge(clk) then
			if counter = 24999999 then
				counter <= 0;
				tick_internal <= not tick_internal;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	tick <= tick_internal;
	
end Behavioural;
	