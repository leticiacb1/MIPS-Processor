
library ieee;
use ieee.std_logic_1164.all;

entity muxGenerico2x1 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
    entrada0, entrada1 : in std_logic_vector((larguraDados-1) downto 0);
    seletor_MUX : in std_logic;
    saida_MUX : out std_logic_vector((larguraDados-1) downto 0)
  );
end entity;

architecture comportamento of muxGenerico2x1 is
  begin
    saida_MUX <= entrada1 when (seletor_MUX = '1') else entrada0;
end architecture;