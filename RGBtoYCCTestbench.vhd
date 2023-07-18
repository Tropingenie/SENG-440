library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component RGBtoYCC is
port(
    RGB_Word    : in std_logic_vector(31 downto 0);
    YCC_Word	: out std_logic_vector(31 downto 0)
    );
end component;

signal    RGB_Word, YCC_Word     :  std_logic_vector(31 downto 0);

begin

  -- Connect DUT
  DUT: RGBtoYCC port map(RGB_Word => RGB_Word, YCC_Word => YCC_Word);  
  
  process
  begin

	assert false report "Begin" severity note;
    
    RGB_Word <= x"00000000"; -- Black
    wait for 16 ms; -- 16.6ms is 60 FPS so if the DUT can complete processing in this time then it passes
    -- Expected output: (16, 128, 128)
    -- In (little-endian) hex: 00808010
    
    RGB_Word <= x"C8640000"; -- 0, 100, 200 (or rather 200, 100, 0 when converted to little endian)
    wait for 16 ms; -- 16.6ms is 60 FPS so if the DUT can complete processing in this time then it passes
    
    -- Expect (86, 187, 77)
    -- In (little-endian) hex: 4DBB5600
    assert YCC_Word = x"4DBB5600" report "Incorrect YCC conversion. Expected: 4DBB5600. Got: " & to_hstring(YCC_Word) severity failure;

       
    assert false report "Tests done." severity note;
    wait;

  end process;
end tb;
