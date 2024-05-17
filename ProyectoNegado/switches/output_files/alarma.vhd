library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alarma is
	Port(
		clk : in STD_LOGIC;
		btn_1 : in STD_LOGIC;
		btn_2 : in STD_LOGIC;
		reset : in STD_LOGIC;
		count : out STD_LOGIC_VECTOR(15 downto 0)
	);
end alarma;

architecture Behavioral of alarma is
	signal counter_internal : STD_LOGIC_VECTOR(15 downto 0) := "0000000000101101";

begin 
	 process(clk)
    begin
        if rising_edge(clk) then
				if reset = '1' then
					counter_internal <= "0000000000101101";
				end if;
            if btn_1 = '0' then
                if counter_internal = "0000000000000000" then
                    counter_internal <= "0000000001100011";
                else
                    counter_internal <= counter_internal - 1;
                end if;
            elsif btn_2 = '0' then
                if counter_internal = "0000000001100011" then
                    counter_internal <= "0000000000000000";
                else
                    counter_internal <= counter_internal + 1;
                end if;
            end if;
        end if;
    end process;

	count <= counter_internal;
end Behavioral;