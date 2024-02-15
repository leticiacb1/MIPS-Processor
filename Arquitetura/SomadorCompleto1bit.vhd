library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity SomadorCompleto1bit is
    port (
		A     : in std_logic;
		B     : in std_logic;
      vem1  : in std_logic;
      vai1  : out std_logic;
		soma  : out std_logic
	 );
end entity;

architecture comportamento of SomadorCompleto1bit is
    begin
		
		soma <= (A xor B) xor vem1;
		vai1 <= ((A xor B) and vem1) or (A and B);
		
end architecture;