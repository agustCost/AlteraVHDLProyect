library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Buzzer_Controller is
  Port ( clk : in STD_LOGIC;
			alarm : in STD_LOGIC;
         output : out STD_LOGIC);
end Buzzer_Controller;

architecture Behavioral of Buzzer_Controller is
  constant clockFreq : integer := 50_000_000;
  constant buzzerFreq : integer := 1500;

  signal counter : integer range 0 to clockFreq / buzzerFreq / 2 := 0;
  signal buzzerSignal : STD_LOGIC := '0';

begin
  process(clk)
  begin
    if rising_edge(clk) and alarm = '1' then
      if counter = 0 then
        buzzerSignal <= not buzzerSignal;
        counter <= clockFreq / buzzerFreq / 2 - 1;
      else
        counter <= counter - 1;
      end if;
    end if;
  end process;

  output <= buzzerSignal;

end Behavioral;