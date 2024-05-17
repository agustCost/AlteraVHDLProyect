library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity SwitchCounter is
	Port (
		clock : in STD_LOGIC;
		reset : in STD_LOGIC;
		switches : in STD_LOGIC_VECTOR(9 downto 0);
		count : out integer range 0 to 15
	);
end entity;
architecture Behavioral of SwitchCounter is
	type State is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9,S10);
	signal next_state: State;
	
	signal switch_count : integer range 0 to 15;

begin
	process (clock, reset)
	begin
		if reset = '1' then
			next_state <= S0;
			switch_count <= 0;
		elsif rising_edge(clock) then			
			case next_state is
				when S0 =>
					if switches(0) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S1;
						
				when S1 =>
					if switches(1) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S2;
						
				when S2 =>
					if switches(2) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S3;
						
				when S3 =>
					if switches(3) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S4;
						
				when S4 =>
					if switches(4) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S5;
						
				when S5 =>
					if switches(5) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S6;
						
				when S6 =>
					if switches(6) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S7;
						
				when S7 =>
					if switches(7) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S8;
						
				when S8 =>
					if switches(8) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S9;
						
				when S9 =>
					if switches(9) = '0' then
						switch_count <= switch_count + 1;
					end if;
					next_state <= S10;
						
				when S10 =>
					count<=switch_count;
					switch_count <= 0;
					next_state <= S0;
				end case;
			end if;
		end process;		
end architecture Behavioral;


























