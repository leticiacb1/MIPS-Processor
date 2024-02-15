library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULA31bit is
    port (
		A         : in std_logic;
		B         : in std_logic;
		inverteA  : in std_logic;
		inverteB  : in std_logic;
		selecao   : in std_logic_vector(1 downto 0);
      vem1      : in std_logic;
		SLT       : in std_logic;
      vai1      : out std_logic;
		resultado : out std_logic;
		overflow  : out std_logic
	 );
end entity;

architecture comportamento of ULA31bit is
	 
	 signal saida_muxA : std_logic;
	 signal saida_muxB : std_logic;
	 	 
	 signal soma      : std_logic;
	 signal entrada0  : std_logic;
	 signal entrada1  : std_logic;
	 signal entrada2  : std_logic;
	 signal entrada3  : std_logic;
	 
	 signal vai_1     : std_logic;

    begin
	 
	 ------ MUX A inverte A ------
	 MUX_A:  entity work.muxGenerico2x1_1bit
        port map( entrada0   => A,
                 entrada1    => not(A),
                 seletor_MUX => inverteA,
                 saida_MUX   => saida_muxA);
	 
	 ------ MUX B inverte B------
	 MUX_B :  entity work.muxGenerico2x1_1bit
        port map( entrada0   => B,
                 entrada1    => not(B),
                 seletor_MUX => inverteB,
                 saida_MUX   => saida_muxB);
	
	
	------------ AND ------------
	entrada0 <= (saida_muxA and saida_muxB);
	
	------------  OR ------------
	entrada1 <= (saida_muxA or saida_muxB);
	
	------ SOMADOR COMPLETO -----
	SOMADOR_1BIT : entity work.SomadorCompleto1bit
					port map(
						A    => saida_muxA,
						B    => saida_muxB,
						vem1 => vem1,
						vai1 => vai_1,
						soma => soma
					);
	
	entrada2 <= soma;
	
	------------ SLT -----------
	entrada3 <= SLT;
	
	
	------ MUX DE SELEÇAO ------
	MUX_SELECAO :  entity work.muxGenerico4x_1bit
        port map( entrada0 => entrada0, entrada1 => entrada1,
						entrada2 => entrada2, entrada3 => entrada3,
                 seletor_MUX => selecao,
                 saida_MUX   => resultado);
				
	-------- OVERFLOW --------	
	vai1 <= vai_1;
	overflow <= (vem1 xor vai_1) xor soma;
	
end architecture;