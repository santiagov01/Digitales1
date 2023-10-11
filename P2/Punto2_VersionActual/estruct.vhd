--------------------------------------------
-- Module Name: Estructure
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity estructural Is
port (
		ents : in STD_LOGIC_VECTOR(3 downto 0);
		sal : out STD_LOGIC
	);
end estructural;

Architecture behavior of estructural Is

component inversor port(
     entrada : in STD_LOGIC;
     salida_invertida : out STD_LOGIC
    );
end component;

component nand_gate2 Port (
    entradas : in STD_LOGIC_VECTOR (1 downto 0);
    sal : out STD_LOGIC
    );
end component;

component or_gate2 Port ( 
    entradas : in STD_LOGIC_VECTOR (1 downto 0);
    sal_or : out STD_LOGIC);
end component;

signal ent_invert : std_logic_vector  (3 downto 0); --Entradas invertidas
signal ab_i : std_logic ; --Salida nand1
signal cd_i : std_logic ; --Salida nand2

begin
	inv1: inversor PORT MAP(
	   entrada => ents(0),
	   salida_invertida => ent_invert(0)
	);
	inv2: inversor PORT MAP(
	   entrada => ents(1),
	   salida_invertida => ent_invert(1)
	);
	inv3: inversor PORT MAP(
	   entrada => ents(2),
	   salida_invertida => ent_invert(2)
	);
	inv4: inversor PORT MAP(
	   entrada => ents(3),
	   salida_invertida => ent_invert(3)
	);
	
	nand1: nand_gate2 PORT MAP(
	   entradas(0)=> ent_invert(0),
	   entradas(1)=> ent_invert(1),
	   sal => ab_i
	   );
	nand2: nand_gate2 PORT MAP(
	   entradas(0)=> ent_invert(2),
	   entradas(1)=> ent_invert(3),
	   sal => cd_i
	   );
	 or_f: or_gate2 PORT MAP(
	   entradas(0) => ab_i,
	   entradas(1) => cd_i,
	   sal_or => sal
	 );
end behavior;