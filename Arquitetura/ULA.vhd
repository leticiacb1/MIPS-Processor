library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULA is
    port (
		A         : in std_logic_vector(31 downto 0);
		B         : in std_logic_vector(31 downto 0);
      ULACtrl   : in std_logic_vector(3 downto 0);
		resultado : out std_logic_vector(31 downto 0);
		zeroFlag  : out std_logic
	 );
end entity;

architecture comportamento of ULA is
    
	 signal carryout_0 : std_logic;
	 signal carryout_1 : std_logic;
	 signal carryout_2 : std_logic;
	 signal carryout_3 : std_logic;
	 signal carryout_4 : std_logic;
	 signal carryout_5 : std_logic;
	 signal carryout_6 : std_logic;
	 signal carryout_7 : std_logic;
	 signal carryout_8 : std_logic;
	 signal carryout_9 : std_logic;
	 signal carryout_10 : std_logic;
	 signal carryout_11 : std_logic;
	 signal carryout_12 : std_logic;
	 signal carryout_13 : std_logic;
	 signal carryout_14 : std_logic;
	 signal carryout_15 : std_logic;
	 signal carryout_16 : std_logic;
	 signal carryout_17 : std_logic;
	 signal carryout_18 : std_logic;
	 signal carryout_19 : std_logic;
	 signal carryout_20 : std_logic;
	 signal carryout_21 : std_logic;
	 signal carryout_22 : std_logic;
	 signal carryout_23 : std_logic;
	 signal carryout_24 : std_logic;
	 signal carryout_25 : std_logic;
	 signal carryout_26 : std_logic;
	 signal carryout_27 : std_logic;
	 signal carryout_28 : std_logic;
	 signal carryout_29 : std_logic;
	 signal carryout_30 : std_logic;
	 signal carryout_31 : std_logic;
	 
	 signal soma        : std_logic;
	 
	 signal overflow    : std_logic;
	 
	 signal res         : std_logic_vector(31 downto 0);
	 
	 
	 alias inverteA     : std_logic is ULACtrl(3);
	 alias inverteB     : std_logic is ULACtrl(2);
	 alias selecao      : std_logic_vector is ULACtrl(1 downto 0);
	 	 
	 begin
	
	 ---------- BIT 0 ----------
	 
	 BIT0 :  entity work.ULA1bit
        port map( A         => A(0),
						B         => B(0),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => inverteB,
						SLT       => overflow,
						vai1      => carryout_0,
						resultado => res(0)
		 );
	
   ---------- BIT1 ----------
	 
	 BIT1 :  entity work.ULA1bit
        port map( A         => A(1),
						B         => B(1),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_0,
						SLT       => '0',
						vai1      => carryout_1,
						resultado => res(1)
		 );		
		
	---------- BIT2 ----------
	 
	 BIT2 :  entity work.ULA1bit
        port map( A         => A(2),
						B         => B(2),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_1,
						SLT       => '0',
						vai1      => carryout_2,
						resultado => res(2)
		 );
		 
	---------- BIT3 ----------
	 
	 BIT3 :  entity work.ULA1bit
        port map( A         => A(3),
						B         => B(3),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_2,
						SLT       => '0',
						vai1      => carryout_3,
						resultado => res(3)
		 );
		 
	---------- BIT4 ----------
	 
	 BIT4 :  entity work.ULA1bit
        port map( A         => A(4),
						B         => B(4),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_3,
						SLT       => '0',
						vai1      => carryout_4,
						resultado => res(4)
		 );
		 
		 
	---------- BIT5 ----------
	 
	 BIT5 :  entity work.ULA1bit
        port map( A         => A(5),
						B         => B(5),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_4,
						SLT       => '0',
						vai1      => carryout_5,
						resultado => res(5)
		 );
		 
	---------- BIT6 ----------
	 
	 BIT6 :  entity work.ULA1bit
        port map( A         => A(6),
						B         => B(6),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_5,
						SLT       => '0',
						vai1      => carryout_6,
						resultado => res(6)
		 );
		 
   ---------- BIT7 ----------
	 
	 BIT7 :  entity work.ULA1bit
        port map( A         => A(7),
						B         => B(7),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_6,
						SLT       => '0',
						vai1      => carryout_7,
						resultado => res(7)
		 );
		 
	---------- BIT8 ----------
	 
	 BIT8 :  entity work.ULA1bit
        port map( A         => A(8),
						B         => B(8),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_7,
						SLT       => '0',
						vai1      => carryout_8,
						resultado => res(8)
		 );
		 
   ---------- BIT9 ----------
	 
	 BIT9 :  entity work.ULA1bit
        port map( A         => A(9),
						B         => B(9),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_8,
						SLT       => '0',
						vai1      => carryout_9,
						resultado => res(9)
		 );
	---------- BIT10 ----------
	 
	 BIT10 :  entity work.ULA1bit
        port map( A         => A(10),
						B         => B(10),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_9,
						SLT       => '0',
						vai1      => carryout_10,
						resultado => res(10)
		 );
		 
	 ---------- BIT11 ----------
	 
	 BIT11 :  entity work.ULA1bit
        port map( A         => A(11),
						B         => B(11),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_10,
						SLT       => '0',
						vai1      => carryout_11,
						resultado => res(11)
		 );		
		
	---------- BIT12 ----------
	 
	 BIT12 :  entity work.ULA1bit
        port map( A         => A(12),
						B         => B(12),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_11,
						SLT       => '0',
						vai1      => carryout_12,
						resultado => res(12)
		 );
		 
	---------- BIT13 ----------
	 
	 BIT13 :  entity work.ULA1bit
        port map( A         => A(13),
						B         => B(13),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_12,
						SLT       => '0',
						vai1      => carryout_13,
						resultado => res(13)
		 );
		 
	---------- BIT14 ----------
	 
	 BIT14 :  entity work.ULA1bit
        port map( A         => A(14),
						B         => B(14),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_13,
						SLT       => '0',
						vai1      => carryout_14,
						resultado => res(14)
		 );
		 
		 
	---------- BIT15 ----------
	 
	 BIT15 :  entity work.ULA1bit
        port map( A         => A(15),
						B         => B(15),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_14,
						SLT       => '0',
						vai1      => carryout_15,
						resultado => res(15)
		 );
		 
	---------- BIT16 ----------
	 
	 BIT16 :  entity work.ULA1bit
        port map( A         => A(16),
						B         => B(16),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_15,
						SLT       => '0',
						vai1      => carryout_16,
						resultado => res(16)
		 );
		 
   ---------- BIT17 ----------
	 
	 BIT17 :  entity work.ULA1bit
        port map( A         => A(17),
						B         => B(17),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_16,
						SLT       => '0',
						vai1      => carryout_17,
						resultado => res(17)
		 );
		 
	---------- BIT18 ----------
	 
	 BIT18 :  entity work.ULA1bit
        port map( A         => A(18),
						B         => B(18),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_17,
						SLT       => '0',
						vai1      => carryout_18,
						resultado => res(18)
		 );
		 
   ---------- BIT19 ----------
	 
	 BIT19 :  entity work.ULA1bit
        port map( A         => A(19),
						B         => B(19),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_18,
						SLT       => '0',
						vai1      => carryout_19,
						resultado => res(19)
		 );
	---------- BIT20 ----------
	 
	 BIT20 :  entity work.ULA1bit
        port map( A         => A(20),
						B         => B(20),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_19,
						SLT       => '0',
						vai1      => carryout_20,
						resultado => res(20)
		 );
		 
	---------- BIT21 ----------
	 
	 BIT21 :  entity work.ULA1bit
        port map( A         => A(21),
						B         => B(21),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_20,
						SLT       => '0',
						vai1      => carryout_21,
						resultado => res(21)
		 );		
		
	---------- BIT22 ----------
	 
	 BIT22 :  entity work.ULA1bit
        port map( A         => A(22),
						B         => B(22),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_21,
						SLT       => '0',
						vai1      => carryout_22,
						resultado => res(22)
		 );
		 
	---------- BIT23 ----------
	 
	 BIT23 :  entity work.ULA1bit
        port map( A         => A(23),
						B         => B(23),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_22,
						SLT       => '0',
						vai1      => carryout_23,
						resultado => res(23)
		 );
		 
	---------- BIT24 ----------
	 
	 BIT24 :  entity work.ULA1bit
        port map( A         => A(24),
						B         => B(24),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_23,
						SLT       => '0',
						vai1      => carryout_24,
						resultado => res(24)
		 );
		 
		 
	---------- BIT25 ----------
	 
	 BIT25 :  entity work.ULA1bit
        port map( A         => A(25),
						B         => B(25),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_24,
						SLT       => '0',
						vai1      => carryout_25,
						resultado => res(25)
		 );
		 
	---------- BIT26 ----------
	 
	 BIT26 :  entity work.ULA1bit
        port map( A         => A(26),
						B         => B(26),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_25,
						SLT       => '0',
						vai1      => carryout_26,
						resultado => res(26)
		 );
		 
   ---------- BIT27 ----------
	 
	 BIT27 :  entity work.ULA1bit
        port map( A         => A(27),
						B         => B(27),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_26,
						SLT       => '0',
						vai1      => carryout_27,
						resultado => res(27)
		 );
		 
	---------- BIT28 ----------
	 
	 BIT28 :  entity work.ULA1bit
        port map( A         => A(28),
						B         => B(28),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_27,
						SLT       => '0',
						vai1      => carryout_28,
						resultado => res(28)
		 );
		 
   ---------- BIT29 ----------
	 
	 BIT29 :  entity work.ULA1bit
        port map( A         => A(29),
						B         => B(29),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_28,
						SLT       => '0',
						vai1      => carryout_29,
						resultado => res(29)
		 );
	---------- BIT30 ----------
	 
	 BIT30 :  entity work.ULA1bit
        port map( A         => A(30),
						B         => B(30),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_29,
						SLT       => '0',
						vai1      => carryout_30,
						resultado => res(30)
		 );
	
	---------- BIT31 ----------
	 
	 BIT31 :  entity work.ULA31bit
        port map( A         => A(31),
						B         => B(31),
						inverteA  => inverteA,
						inverteB  => inverteB,
						selecao   => selecao,
						vem1      => carryout_30,
						SLT       => '0',
						vai1      => carryout_31,
						resultado => res(31),
						overflow  => overflow
		 );
		  
   resultado <= res;
	
   ---------- ZERO ----------
	zeroFlag  <= not(res(31) or res(30) or res(29) or res(28) or res(27) or res(26) or res(25) or 
						  res(24) or res(23) or res(22) or res(21) or res(20) or res(19) or res(18) or
	                 res(17) or res(16) or res(15) or res(14) or res(13) or res(12) or res(11) or
						  res(10) or res(9) or res(8) or res(7) or res(6) or res(5) or res(4) or
						  res(3) or res(2) or res(1) or res(0));
	
	
end architecture;