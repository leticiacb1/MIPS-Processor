library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Baseado no apendice C (Register Files) do COD (Patterson & Hennessy).

entity bancoRegistradores is
    generic
    (
        larguraDados        : natural := 32;
        larguraEndBancoRegs : natural := 5   --Resulta em 2^6= 64 posicoes
    );
-- Leitura de 2 registradores e escrita em 1 registrador simultaneamente.
    port
    (
        clk        : in std_logic;
--
        registrador1         : in std_logic_vector((larguraEndBancoRegs-1) downto 0);
        registrador2          : in std_logic_vector((larguraEndBancoRegs-1) downto 0);
        registrador3          : in std_logic_vector((larguraEndBancoRegs-1) downto 0);
--
        dadoEscritoReg3       : in std_logic_vector((larguraDados-1) downto 0);
--
        habEscrita            : in std_logic := '0';
        dadoLidoReg1          : out std_logic_vector((larguraDados -1) downto 0);
        dadoLidoReg2          : out std_logic_vector((larguraDados -1) downto 0)
    );
	 
end entity;

architecture comportamento of bancoRegistradores is

    subtype palavra_t is std_logic_vector((larguraDados-1) downto 0);
    type memoria_t is array(2**larguraEndBancoRegs-1 downto 0) of palavra_t;

function initMemory
        return memoria_t is variable tmp : memoria_t := (others => (others => '0'));
  begin
        -- Inicializa os endereços:
        tmp(0)  := x"00000000";  -- Nao deve ter efeito.
        tmp(8)  := x"00000000";  -- $t0 = 0x00
        tmp(9)  := x"0000000A";  -- $t1 = 0x0A
        tmp(10) := x"0000000B";  -- $t2 = 0x0B
        tmp(11) := x"0000000C";  -- $t3 = 0x0C
        tmp(12) := x"0000000D";  -- $t4 = 0x0D
        tmp(13) := x"00000016";  -- $t5 = 0x16
        return tmp;
    end initMemory;

    -- Declaracao dos registradores:
    shared variable registrador : memoria_t := initMemory;
    constant zero : std_logic_vector(larguraDados-1 downto 0) := (others => '0');
begin
    process(clk) is
    begin
        if (rising_edge(clk)) then
        --if (falling_edge(clk)) then   -- para resolver problemas de leitura e escrita no mesmo clock
            if (habEscrita = '1') then
                registrador(to_integer(unsigned(registrador3))) := dadoEscritoReg3;
            end if;
        end if;
    end process;
    -- Se endereco = 0 : retorna ZERO
    dadoLidoReg2 <= zero when to_integer(unsigned(registrador2)) = to_integer(unsigned(zero)) else registrador(to_integer(unsigned(registrador2)));
    dadoLidoReg1 <= zero when to_integer(unsigned(registrador1)) = to_integer(unsigned(zero)) else registrador(to_integer(unsigned(registrador1)));
end architecture;