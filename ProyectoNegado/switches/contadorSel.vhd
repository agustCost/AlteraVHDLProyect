library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contadorSel is
	Port(
		btn : in STD_LOGIC;
		count : out STD_LOGIC_VECTOR(3 downto 0);
		reset : in STD_LOGIC
	);
end contadorSel;

architecture Behavioral of contadorSel is
	signal counter_internal : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin 
	process(btn)
	begin
		if rising_edge(btn) then
			if counter_internal = "1011" or reset = '1' then
				counter_internal <= "0000";
			else
				counter_internal <= counter_internal+1;
			end if;
		end if;
	end process;
	
	count <= counter_internal;
end Behavioral;