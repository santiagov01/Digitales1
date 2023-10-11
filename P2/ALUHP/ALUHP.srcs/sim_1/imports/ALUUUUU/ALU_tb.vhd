--------------------------------------------
-- Module Name: tutorial
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity ALU_tb Is
end ALU_tb;

Architecture behavior of ALU_tb Is
	Component ALU 
    Port ( 
           BUS_A : in STD_LOGIC_VECTOR (3 downto 0);
           BUS_B : in STD_LOGIC_VECTOR (3 downto 0);
           control: in STD_LOGIC_VECTOR (1 downto 0);
           salidas : inout STD_LOGIC_VECTOR (3 downto 0);--Salida de la ALU
           carry : out STD_LOGIC;
	       config_display : out std_logic_vector(3 downto 0);
           display: out std_logic_vector (6 downto 0)--Decodifica el display
           );
	End Component;
	--Definicion de senales (cables)
	signal BUS_A_temp : STD_LOGIC_VECTOR (3 downto 0);
	signal BUS_B_temp : STD_LOGIC_VECTOR (3 downto 0);
	signal control_temp : STD_LOGIC_VECTOR (1 downto 0);
	signal salidas_temp: STD_LOGIC_VECTOR (3 downto 0);
	signal alu_proc : STD_LOGIC_VECTOR (3 downto 0):="0000";
	
	
	signal carry_temp: STD_LOGIC:='0';	
	signal display_temp : STD_LOGIC_VECTOR (6 downto 0);
	
	Signal counta: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	Signal countb: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	Signal countc: STD_LOGIC_VECTOR(1 downto 0) := "00";--Control

	--Funcion para testeo
	procedure expected_ALU(
    BUS_A_temp : in STD_LOGIC_VECTOR (3 downto 0);
	BUS_B_temp : in STD_LOGIC_VECTOR (3 downto 0);
	control_temp : in STD_LOGIC_VECTOR (1 downto 0);
	salidas_temp: inout STD_LOGIC_VECTOR (3 downto 0);--Salida de la ALU
	display_temp: out STD_LOGIC_VECTOR (6 downto 0)--Salida display
	--carry_temp: out STD_LOGIC
		
	) is
	
	
    variable suma: std_logic_vector(3 downto 0);
    variable sal_xor,div :std_logic_vector(3 downto 0);
    variable multiplic: std_logic_vector (3 downto 0);
	    
	begin		    
        case(control_temp) is
            when "11" => 
             multiplic := (BUS_A_temp) + (BUS_A_temp);
            salidas_temp := multiplic(3 downto 0);
            --carry_temp := multiplic(4);
            when "10" =>
            	div := '0' & BUS_B_temp(3 downto 1);
            	salidas_temp := div;
            	--carry_temp := '0';
            when "01" =>
            	salidas_temp := (BUS_A_temp xor BUS_B_temp);
            	--salidas_temp := sal_xor;
            	--carry_temp := '0';
            when "00" =>
            	suma := (BUS_A_temp) + (BUS_B_temp);
            	salidas_temp:= suma (3 downto 0);
            	--carry_temp:= suma(4);
            when others =>
            	salidas_temp:= "0000";
            	--carry_temp:= '0';
            end case;
            case(salidas_temp(3 downto 0)) is
            when x"0" =>
             display_temp := "0000001";
             when x"1" =>
             display_temp := "1001111";
             when x"2" =>
             display_temp := "0000001";
             when x"3" =>
             display_temp := "0000001";
             when x"4" =>
             display_temp := "0010010";
             when x"5" =>
             display_temp := "0000110";
             when x"6" =>
             display_temp := "1001100";
             when x"7" =>
             display_temp := "0001111";
             when x"8" =>
             display_temp := "0000000";
             when x"9" =>
             display_temp := "0000100";
             when x"A" =>
             display_temp := "0001000";
             when x"b" =>
             display_temp := "1100000";
             when x"C" =>
             display_temp :="0110001";
             when x"d" =>
             display_temp := "0100100";
             when x"e" =>
             display_temp := "0010000" ;
             when x"F" =>
             display_temp := "0111000";
             when others =>
             display_temp :="0000000" ;
       end case; 
	end expected_ALU;
	
begin
	uut:  ALU PORT MAP (
		 BUS_A => BUS_A_temp,
         BUS_B => BUS_b_temp,
         control => control_temp,
         salidas => salidas_temp, 
         carry => carry_temp,
	    display => display_temp
		 );
		 
	process
		variable s : line;
		variable i,j,k : integer := 0;
		variable count : integer := 0;
	    variable proc_out : STD_LOGIC_VECTOR(6 downto 0);
	    variable salida_ALU : std_logic_vector(3 downto 0):="0000";
	    variable carrysalida : std_logic;

	begin
--    BUS_A_temp <= counta;
--    BUS_B_temp <= countb;
--    control_temp <= countc;
    
	for i in 0 to 15 loop
	BUS_B_temp <= countb;	
		
		for j in 0 to 40 loop
		BUS_A_temp <= counta;		
			
			--wait for 40ns;
	
			--countc <= "00";
			for k in 0 to 3 loop
			     wait for 50ns;
			     control_temp <= countc;
				expected_ALU(BUS_A_temp, BUS_B_temp, control_temp, salida_ALU, proc_out);
				wait for 10ns;
				--alu_proc <=salida_ALU;
--				write (s, string'("Salida ")); write (s, count); write (s, string'(". Salida ALU")); write (s, salidas_temp); write (s, string'(" Salida Procedimiento ALU: ")); write (s, salida_ALU); 
--             		writeline (output, s);
				if (salida_ALU = salidas_temp) then
				write (s, string'("Salida correcta ")); write (s, string'("--CONTROL--"));write (s, control_temp);write (s, string'("--BUS_A--"));write (s, BUS_A_temp);write (s, string'("--BUS_B--"));write (s, BUS_B_temp); write (s, string'(". Salida ALU REAL: ")); write (s, salidas_temp); write (s, string'(" Salida ALU Procedimiento:")); write (s, salida_ALU); 
             		writeline (output, s);
				else
				write (s, string'("Salida incorrecta "));write (s, string'("--CONTROL--"));write (s, control_temp);write (s, string'("--BUS_A--"));write (s, BUS_A_temp);write (s, string'("--BUS_B--"));write (s, BUS_B_temp); write (s, string'(". Salida ALU REAL:")); write (s, salidas_temp); write (s, string'(" Salida ALU Procedimiento:")); write (s, salida_ALU); 
             		writeline (output, s);
				end if;
				countc <= countc + 1;
				--control_temp <= countc;
				end loop;
			counta <= counta + 1;
			--BUS_B_temp <= countb;
			end loop;
		countb <= countb + 1;
		--BUS_A_temp <= counta;
		end loop;
	end process;
end behavior;
