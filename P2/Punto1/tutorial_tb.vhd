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

Entity tutorial_tb Is
end tutorial_tb;

Architecture behavior of tutorial_tb Is
	Component rca_estructural 
port(
		a  	 : in STD_LOGIC_VECTOR (4 downto 0);
		b  	 : in STD_LOGIC_VECTOR (4 downto 0);
		cin  : in STD_LOGIC;
		s 	 : out STD_LOGIC_VECTOR (4 downto 0);
		cout : out STD_LOGIC
	);
	End Component;
	
	signal atemp : STD_LOGIC_VECTOR (4 downto 0):="00000";
		signal btemp : STD_LOGIC_VECTOR (4 downto 0):="00000";
		signal cintemp : STD_LOGIC:='0';
		signal stemp:STD_LOGIC_VECTOR (4 downto 0):="00000";
		signal cout_temp : STD_LOGIC:='0';
	
	Signal counta: STD_LOGIC_VECTOR(4 downto 0) := "00000";
	Signal countb: STD_LOGIC_VECTOR(4 downto 0) := "00000";

	procedure expected_sum(
		atemp : in std_logic_vector(4 downto 0);
		btemp : in std_logic_vector(4 downto 0);
		cin_temp : in std_logic;
		stemp : out std_logic_vector(4 downto 0);
		cotemp : out std_logic
		
	) is
	
	Variable atemp2 : std_logic_vector(5 downto 0) := "000000";
	Variable btemp2 : std_logic_vector(5 downto 0) := "000000";
	Variable stemp2 : std_logic_vector(5 downto 0) := "000000";
		    
	begin		    
		atemp2 := '0'& atemp;
		btemp2 := '0'& btemp;
		stemp2 := atemp2+btemp2;
		stemp := stemp2(4 downto 0);
		cotemp := stemp2(5);
	end expected_sum;
	
begin
	uut:  rca_estructural PORT MAP (
			a  => atemp,
		b => btemp, 	 
		cin => cintemp,  
		s => stemp,
		cout => cout_temp
		 );
		 
	process
		variable s : line;
		variable i : integer := 0;
		variable count : integer := 0;
	    variable proc_out : STD_LOGIC_VECTOR(7 downto 0);
	    variable salida : std_logic_vector(4 downto 0);
	    variable carrysalida : std_logic;
	    



	begin
        for i in 0 to 31 loop   
	      --count := count + 1;
	               	  
		  wait for 50 ns;
		  atemp <= counta;
		  
		 for j in 0 to 31 loop   
		  wait for 50 ns;
		  btemp <= countb;
		  expected_sum (atemp, btemp, cintemp, salida, carrysalida);
		  
		  

		  -- If the outputs match, then announce it to the simulator console.
          if (salida = stemp) then
                write (s, string'("Salida correcta ")); write (s, count ); write (s, string'(". Salida Circuito: ")); write (s, stemp); write (s, string'(" Salida Procedimiento: ")); write (s, salida); 
                writeline (output, s);
          else
              write (s, string'("Salida incorrecta")); write (s, count); write (s, string'(". Salida Circuito")); write (s, stemp); write (s, string'(" Salida Procedimiento:")); write (s, salida); 
              writeline (output, s);
          end if;
          countb <= countb + 1;
		  	end loop;	  
		  -- Increment the switch value counters.
		  counta <= counta+1;
        end loop;		 
       
	end process;
end behavior;
