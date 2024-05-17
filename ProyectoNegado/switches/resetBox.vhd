library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity resetBox is
    Port ( clk : in STD_LOGIC;
           button : in STD_LOGIC;
           output : out STD_LOGIC);
end resetBox;

architecture Behavioral of resetBox is
    -- Define states for the state machine
    type State_Type is (IDLE, TIMING);
    signal state : State_Type := IDLE;
	 signal reset : STD_LOGIC := '0';
    -- Counter to count the number of clock cycles the button is pressed
    signal counter : integer := 0;

    -- Define constant for the time threshold
    constant LONG_PRESS_TIME : integer := 2000000; -- 2 seconds with 1 MHz clock

begin
    process(clk)
    begin
         if rising_edge(clk) then
        case state is
            when IDLE =>
                if button = '0' then
                    counter <= 0;
                    state <= TIMING;
                else
                    state <= IDLE;
                end if;

            when TIMING =>
                if button = '0' then
                    counter <= counter + 1;
                    if counter >= LONG_PRESS_TIME then
                        reset <= '1'; -- Trigger the output signal
                        state <= IDLE;
                    end if;
                else
                    counter <= 0; -- Reset counter only when button is released
						  reset <= '0';
                    state <= IDLE;
                end if;
        end case;
    end if;
    end process;
	 
	 output <= '1' when reset = '1' else '0';
end Behavioral;
