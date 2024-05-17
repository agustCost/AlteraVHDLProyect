library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity signalSelector is
	Port ( data_inZero : in STD_LOGIC_VECTOR(15 downto 0);
		data_inOne : in STD_LOGIC_VECTOR(15 downto 0);
		data_inTwo : in STD_LOGIC_VECTOR(15 downto 0);
		data_inTres : in STD_LOGIC_VECTOR(15 downto 0);
		data_inFour : in STD_LOGIC_VECTOR(15 downto 0);
		data_inFive : in STD_LOGIC_VECTOR(15 downto 0);
		data_inSix : in STD_LOGIC_VECTOR(15 downto 0);
		data_inSeven : in STD_LOGIC_VECTOR(15 downto 0);
		data_inOcho : in STD_LOGIC_VECTOR(15 downto 0);
		data_inNine : in STD_LOGIC_VECTOR(15 downto 0);
		data_inTen : in STD_LOGIC_VECTOR(15 downto 0);
		data_inEleven : in STD_LOGIC_VECTOR(15 downto 0);
		control_bus : in STD_LOGIC_VECTOR(3 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0)
	);
end signalSelector;

architecture Behavioral of signalSelector is
begin
	process(control_bus)
		begin
			case control_bus is
				when "0000" => output <= data_inZero;
				when "0001" => output <= data_inOne;
				when "0010" => output <= data_inTwo;
				when "0011" => output <= data_inTres;
				when "0100" => output <= data_inFour;
				when "0101" => output <= data_inFive;
				when "0110" => output <= data_inSix;
				when "0111" => output <= data_inSeven;
				when "1000" => output <= data_inOcho;
				when "1001" => output <= data_inNine;
				when "1010" => output <= data_inTen;
				when "1011" => output <= data_inEleven;
				when others => output <= "0000000000000000";
			end case;
	end process;
end Behavioral;