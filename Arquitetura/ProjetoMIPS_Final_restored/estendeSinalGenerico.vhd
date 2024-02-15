library ieee;
use ieee.std_logic_1164.all;

entity estendeSinalGenerico is
    generic
    (
        larguraDadoEntrada : natural  :=    16;
        larguraDadoSaida   : natural  :=    32
    );
    port
    (
		  -- Unidade de Controle - Mux
		  SelMux_ORIeANDI : in std_logic;
        -- Input ports
        estendeSinal_IN : in  std_logic_vector(larguraDadoEntrada-1 downto 0);
        -- Output ports
        estendeSinal_OUT: out std_logic_vector(larguraDadoSaida-1 downto 0)
    );
end entity;

architecture comportamento of estendeSinalGenerico is
	signal valor_extendido : std_logic;
begin

	 -- ------------ MUX para ORI e ANDI ------------ --
	 
	 MUX_ORI_ANDI : entity work.muxGenerico2x1_1bit
        port map( entrada0 => estendeSinal_IN(larguraDadoEntrada-1) , entrada1 => '0',
                 seletor_MUX => SelMux_ORIeANDI,
                 saida_MUX => valor_extendido);
	 

    estendeSinal_OUT <= (larguraDadoSaida-1 downto larguraDadoEntrada => valor_extendido) & estendeSinal_IN;

end architecture;