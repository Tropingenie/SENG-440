library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RGBtoYCC is
port(
    RGB_Word    : in   std_logic_vector(31 downto 0);
    YCC_Word	  : out  std_logic_vector(31 downto 0)
    );
end RGBtoYCC;

architecture Behavioral of RGBtoYCC is

signal R, G, B   : signed(15 downto 0);
signal Y, Cb, Cr : std_logic_vector(15 downto 0);

begin

	-- Extract bytes from 32-bit register into 16-bit intermediate signals
	R <= signed(x"00" & RGB_Word(15 downto 8));
  G <= signed(x"00" & RGB_Word(23 downto 16));
  B <= signed(x"00" & RGB_Word(31 downto 24));
    
  -- Convert to YCC
  Y   <= std_logic_vector(16  + shift_right((shift_left(R, 6)+shift_left(R, 1)+shift_left(G, 7)+G+shift_left(B, 4)+shift_left(B, 3)+B),8));
  Cb  <= std_logic_vector(128 + shift_right((0 - (shift_left(R, 5)+shift_left(R, 2)+shift_left(R, 1)) - (shift_left(G, 6)+shift_left(G, 3)+shift_left(G, 1))+shift_left(B, 7)-shift_left(B, 4)), 8));
  Cr  <= std_logic_vector(128 + shift_right((shift_left(R, 7) - shift_left(R, 4) - (shift_left(G, 6)+shift_left(G, 5) - shift_left(G, 1)) - (shift_left(B, 4)+shift_left(B, 1))), 8));

	-- Truncate Y, Cb, Cr signals back to 8-bits and pack into 32-bit register
	YCC_Word <= (Cr(7 downto 0) & Cb(7 downto 0) & Y(7 downto 0) & x"00");

end Behavioral;
