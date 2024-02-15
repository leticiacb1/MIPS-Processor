library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftLeft is
    generic
    (
        larguraDados : natural  :=    32
    );
    port
    (
        -- Input ports
        entrada : in  std_logic_vector(larguraDados-1 downto 0);
		  tamanho: in std_logic_vector(4 downto 0);
		  
        -- Output ports
        saida: out std_logic_vector(larguraDados-1 downto 0)
    );
end entity;

architecture comportamento of shiftLeft is
begin

	 saida <= std_logic_vector(shift_left(unsigned(entrada), to_integer(unsigned(tamanho))));

end architecture;