library ieee;
use ieee.std_logic_1164.all;

entity UnidadeControleULA is
    generic
    (
        larguraDados : natural := 32
    );
    port
    (
		  TipoR     : in std_logic;
		  opcode    : in std_logic_vector(5 downto 0);
		  funct     : in std_logic_vector(5 downto 0);
		  ULActrl   : out std_logic_vector(3 downto 0)
    );
end entity;

architecture comportamento of UnidadeControleULA is
	 
	 ---- TABELA -----
	 -- 0000   : AND
	 -- 0001   : OR
	 -- 0010   : ADD
	 -- 0110   : SUB
	 -- 0111   : SLT
	 
	 -- Onde:
	 
	 -- bit3        : InverteA
	 -- bit2        : InverteB
	 -- bit1 & bit0 : Selecao do MUX
	 
	 -- ----- Opcodes -----
	 constant LW      : std_logic_vector(5 downto 0) :=  "100011"; -- x"23"
	 constant SW      : std_logic_vector(5 downto 0) :=  "101011"; -- x"2b"
	 constant ORI     : std_logic_vector(5 downto 0) :=  "001101"; -- x"0d"
	 constant ANDI    : std_logic_vector(5 downto 0) :=  "001100"; -- x"0c"
	 constant BEQ     : std_logic_vector(5 downto 0) :=  "000100"; -- x"04"
	 constant BNE     : std_logic_vector(5 downto 0) :=  "000101"; -- x"05"
	 constant JMP     : std_logic_vector(5 downto 0) :=  "000010"; -- x"02"
	 constant JAL     : std_logic_vector(5 downto 0) :=  "000011"; -- x"03"
	 constant ADDI    : std_logic_vector(5 downto 0) :=  "001000"; -- x"08"
	 constant SLTI    : std_logic_vector(5 downto 0) :=  "001010"; -- x"0a"
	 constant LBU     : std_logic_vector(5 downto 0) :=  "100100"; -- x"24"
	 
	 -- Funct Instruçoes Tipo R
	 constant ADD     : std_logic_vector(5 downto 0) :=  "100000"; -- x"20"
	 constant SUB     : std_logic_vector(5 downto 0) :=  "100010"; -- x"22"
	 constant op_AND  : std_logic_vector(5 downto 0) :=  "100100"; -- x"24"
	 constant op_OR   : std_logic_vector(5 downto 0) :=  "100101"; -- x"25"
	 constant op_NOR  : std_logic_vector(5 downto 0) :=  "100111"; -- x"27"
	 constant op_SLT  : std_logic_vector(5 downto 0) :=  "101010"; -- x"2a"
	 
	 begin
	    
					 --  inverteA  |  inverteB  | selMux
		ULActrl <=     '0'     &    '0'    &  "10" when (funct = ADD       AND TipoR = '1') else
							'0'     &    '1'    &  "10" when (funct = SUB       AND TipoR = '1') else
							'0'     &    '0'    &  "00" when (funct= op_AND     AND TipoR = '1') else
							'0'     &    '0'    &  "01" when (funct= op_OR      AND TipoR = '1') else
							'1'     &    '1'    &  "00" when (funct= op_NOR     AND TipoR = '1') else
							'0'     &    '1'    &  "11" when (funct = op_SLT    AND TipoR = '1') else 
							'0'     &    '1'    &  "11" when (opcode = SLTI     AND TipoR = '0') else 
							'0'     &    '0'    &  "10" when (opcode = LW       AND TipoR = '0') else
							'0'     &    '0'    &  "10" when (opcode = LBU      AND TipoR = '0') else
							'0'     &    '0'    &  "10" when (opcode = SW       AND TipoR = '0') else
							'0'     &    '0'    &  "01" when (opcode = ORI      AND TipoR = '0') else
							'0'     &    '0'    &  "00" when (opcode = ANDI     AND TipoR = '0') else
							'0'     &    '0'    &  "10" when (opcode = ADDI     AND TipoR = '0') else
							'0'     &    '1'    &  "10" when (opcode = BEQ      AND TipoR = '0') else
							'0'     &    '1'    &  "10" when (opcode = BNE      AND TipoR = '0') else
							'0'     &    '1'    &  "10"; -- (opcode = JMP or JR or JAL) 

end architecture;