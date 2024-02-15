library ieee;
use ieee.std_logic_1164.all;

entity UnidadeControle is
    generic
    (
        larguraDados : natural := 32
    );
    port
    (
        funct  : in std_logic_vector(5 downto 0);
		  opcode : in std_logic_vector(5 downto 0);
		  pontosControle : out std_logic_vector(15 downto 0)
    );
end entity;

architecture comportamento of UnidadeControle is
	 
	 -- ----- Tipo I -----
	 constant LW      : std_logic_vector(5 downto 0) :=  "100011"; -- x"23"
	 constant SW      : std_logic_vector(5 downto 0) :=  "101011"; -- x"2b"
	 constant ORI     : std_logic_vector(5 downto 0) :=  "001101"; -- x"0d"
	 constant ANDI    : std_logic_vector(5 downto 0) :=  "001100"; -- x"0c"
	 constant LUI     : std_logic_vector(5 downto 0) :=  "001111"; -- x"0f"
	 constant ADDI    : std_logic_vector(5 downto 0) :=  "001000"; -- x"08"
	 constant SLTI    : std_logic_vector(5 downto 0) :=  "001010"; -- x"0a"
	 constant LBU     : std_logic_vector(5 downto 0) :=  "100100"; -- x"24"
	 
	 -- Salto condicional
	 constant BEQ    : std_logic_vector(5 downto 0) :=  "000100"; -- x"04"
	 constant BNE    : std_logic_vector(5 downto 0) :=  "000101"; -- x"05"
	 
	 -- ----- Tipo J ----
	 -- Salto incondicional
	 constant JMP    : std_logic_vector(5 downto 0) :=  "000010"; -- x"02"
	 constant JAL    : std_logic_vector(5 downto 0) :=  "000011"; -- x"03"
	 
	 -- ----- Tipo R ----
	 constant TIPO_R    : std_logic_vector(5 downto 0) :=  "000000";
	 -- Functs:
	 constant JR        : std_logic_vector(5 downto 0) :=  "001000"; --x"08"
	 constant do_SLL    : std_logic_vector(5 downto 0) :=  "000000"; --x"00"
	
    begin
 --                  JR  | MuxPC |  MuxRt_Rd | ORI_ANDI | habEscReg | MuxRt_Imediato | do_sll | TipoR| MuxULA_MEM | BEQ | BNE | RMEM | WMEM | LBU  
 pontosControle  <= '0'  &  '0'  &   "00"    &    '0'    &    '1'    &      '1'       &  '0'  & '0'  &    "01"    & '0' & '0' & '1'  &  '0'  & '0'  when (opcode= LW )                      else
						  '0'  &  '0'  &   "00"    &    '0'    &    '0'    &      '1'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '1'  & '0'  when (opcode= SW )                      else 
						  '0'  &  '0'  &   "00"    &    '1'    &    '1'    &      '1'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= ORI)                      else
						  '0'  &  '0'  &   "00"    &    '1'    &    '1'    &      '1'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= ANDI)                     else
						  '0'  &  '0'  &   "00"    &    '0'    &    '1'    &      '0'       &  '0'  & '0'  &    "11"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= LUI)                      else
						  '0'  &  '0'  &   "00"    &    '0'    &    '1'    &      '1'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= ADDI)                     else
						  '0'  &  '1'  &   "00"    &    '0'    &    '0'    &      '0'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= JMP )                     else
						  '0'  &  '1'  &   "10"    &    '0'    &    '1'    &      '0'       &  '0'  & '0'  &    "10"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= JAL )                     else
						  '0'  &  '0'  &   "00"    &    '0'    &    '0'    &      '0'       &  '0'  & '0'  &    "00"    & '1' & '0' & '0'  &  '0'  & '0'  when (opcode= BEQ )                     else
						  '0'  &  '0'  &   "00"    &    '0'    &    '0'    &      '0'       &  '0'  & '0'  &    "00"    & '0' & '1' & '0'  &  '0'  & '0'  when (opcode= BNE )                     else
						  '0'  &  '0'  &   "00"    &    '0'    &    '1'    &      '1'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= SLTI)                     else
						  '0'  &  '0'  &   "00"    &    '0'    &    '1'    &      '1'       &  '0'  & '0'  &    "01"    & '0' & '0' & '1'  &  '0'  & '1'  when (opcode= LBU)                      else
						  '0'  &  '0'  &   "01"    &    '0'    &    '1'    &      '0'       &  '1'  & '1'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= TIPO_R and funct= do_SLL) else
						  '1'  &  '0'  &   "00"    &    '0'    &    '0'    &      '0'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= TIPO_R and funct= JR )    else
						  '0'  &  '0'  &   "01"    &    '0'    &    '1'    &      '0'       &  '0'  & '1'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'  when (opcode= TIPO_R)                   else
						  '0'  &  '0'  &   "00"    &    '0'    &    '0'    &      '0'       &  '0'  & '0'  &    "00"    & '0' & '0' & '0'  &  '0'  & '0'; -- Nao esperado
end architecture;