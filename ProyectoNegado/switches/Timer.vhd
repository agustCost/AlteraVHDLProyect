library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Timer is
	Port( clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			switch : in STD_LOGIC;
			umbral : in STD_LOGIC_VECTOR(15 downto 0);
			alarma : out boolean;
			timer_out : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;
architecture Behavioral of Timer is
	signal count : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
	type StateType is (IDLE, COUNTING);
	signal state : StateType := IDLE;
	signal alarma_internal : boolean := false;
	
begin
	process(clk, reset, switch)
	begin
		if reset = '1' then
			state <= IDLE;
			count <= "0000000000000000";
		elsif rising_edge(clk) then
			case state is
				when IDLE =>
					if switch = '1' then
						state <= COUNTING;
						count <= "0000000000000000";
					end if;
				when COUNTING =>
						if switch = '0' then
							state <= IDLE;
							count <= "0000000000000000";
						else
							count <= count +1;
						end if;
			end case;
			if count = umbral  or count > umbral then
				alarma_internal <= true;
			else
				alarma_internal <= false;
			end if;
		end if;
	end process;
	timer_out <= count;
	alarma <= alarma_internal;
	
end Behavioral;