library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contadorVel is
	Port(
		swtch : in STD_LOGIC_VECTOR(9 downto 0);
		count : out STD_LOGIC_VECTOR(15 downto 0);
		reset : in STD_LOGIC;
		clk   : in STD_LOGIC
	);
end contadorVel;

architecture Behavioral of contadorVel is
    signal counter_internal : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    signal prevStates : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
	 signal initialized : BOOLEAN := FALSE;
begin 
    process(clk, reset)
    begin
        if reset = '1' then
            counter_internal <= "0000000000000000";
        elsif rising_edge(clk) then
				if not initialized then
					for i in swtch'range loop
						prevStates(i) <= swtch(i);
					end loop;
					initialized <= TRUE;
				else
					for i in swtch'range loop
						if swtch(i) = '1' and prevStates(i) = '0' then
							counter_internal <= counter_internal + 1;
						end if;
						prevStates(i) <= swtch(i);
					end loop;
				end if;
        end if;
    end process;

    count <= counter_internal;
end Behavioral;