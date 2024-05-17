library IEEE;
use IEEE.std_logic_1164.all;

entity Cont4Bits is
	port (rst, clk:in std_logic; salida:out integer range 0 to 15);
end Cont4Bits;

architecture entera of Cont4Bits is
signal cuenta:integer range 0 to 15;
begin
	process(rst,clk) begin
		if rst ='1' then
			cuenta <=0;
		elsif clk'event and clk='1' then
			cuenta <= cuenta+1;
		end if;
	end process;
	salida <= cuenta;
end architecture;