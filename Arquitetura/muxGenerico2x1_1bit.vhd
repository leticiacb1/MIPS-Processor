library ieee;
use ieee.std_logic_1164.all;

entity muxGenerico2x1_1bit is
  port (
    entrada0, entrada1 : in std_logic;
    seletor_MUX        : in std_logic;
    saida_MUX          : out std_logic
  );
end entity;

architecture comportamento of muxGenerico2x1_1bit is
  begin
    saida_MUX <= entrada1 when (seletor_MUX = '1') else entrada0;
end architecture;