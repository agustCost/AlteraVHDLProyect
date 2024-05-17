library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk1Mhz is
    Port ( clk_50M : in STD_LOGIC;
           reset    : in STD_LOGIC;
           output : out STD_LOGIC);
end clk1Mhz;

architecture Behavioral of clk1Mhz is
    signal counter : integer range 0 to 50 := 0;
    signal out_internal : STD_LOGIC := '0';
begin
    process(clk_50M, reset)
    begin
        if reset = '1' then
            counter <= 0;
            out_internal <= '0';
        elsif rising_edge(clk_50M) then
            if counter = 50 then
                counter <= 0;
                out_internal <= not out_internal;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    output <= out_internal;
end Behavioral;