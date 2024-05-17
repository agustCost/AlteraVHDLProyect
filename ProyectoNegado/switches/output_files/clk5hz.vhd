library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ClockDivider is
    Port ( clk_50MHz : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_5Hz : out STD_LOGIC);
end ClockDivider;

architecture Behavioral of ClockDivider is
    signal counter : integer range 0 to 5_000_000; -- Ajusta el rango según sea necesario
    signal clk_5Hz_int : STD_LOGIC;
begin
    process(clk_50MHz, rst)
    begin
        if rst = '1' then
            counter <= 0;
            clk_5Hz_int <= '0';
        elsif rising_edge(clk_50MHz) then
            if counter = 5_000_000 - 1 then -- Divide el reloj por 10,000,000 para obtener 5 Hz
                counter <= 0;
                clk_5Hz_int <= not clk_5Hz_int;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_5Hz <= clk_5Hz_int;

end Behavioral;