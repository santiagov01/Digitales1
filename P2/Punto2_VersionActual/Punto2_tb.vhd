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

Entity punto2_tb Is
end punto2_tb;

Architecture behavior of punto2_tb Is
	Component punto2
    port (
		entradas : in STD_LOGIC_VECTOR(3 downto 0);
		sal_total : out STD_LOGIC_VECTOR(2 downto 0)
	);
	End Component;
	
	Signal entradas_temp : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	Signal salidas_temp : STD_LOGIC_VECTOR(2 downto 0) := "000";
	Signal count_a : STD_LOGIC_VECTOR(3 downto 0) := "0000";


	procedure expected_out (
		entradas_in : in std_logic_vector(3 downto 0);
		salida : out std_logic_vector(2 downto 0)
	) is
	
	Variable led_expected_int : std_logic_vector(2 downto 0) := "000";
		   
	begin		    
		led_expected_int(0) := (not entradas_in(0) and not entradas_in(1)) or (not entradas_in(2) and not entradas_in(3));
		led_expected_int(1) := (not entradas_in(0) and not entradas_in(1)) or (not entradas_in(2) and not entradas_in(3));
		led_expected_int(2) := (not entradas_in(0) and not entradas_in(1)) or (not entradas_in(2) and not entradas_in(3));
	    salida := led_expected_int;
	end expected_out;
	
begin
	uut:  punto2 PORT MAP (
			entradas => entradas_temp,
			sal_total => salidas_temp
		 );
		 
	process
		variable s : line;
		variable i : integer := 0;
		variable count : integer := 0;
	    variable proc_out : STD_LOGIC_VECTOR(2 downto 0); --Variable para ingresar al procedure

	begin
        for i in 0 to 15 loop   
	      count := count + 1;
	               	  
		  wait for 50 ns;
		  entradas_temp <= count_a; --Para variar las entradas
		  
		  wait for 10 ns;
		  expected_out (entradas_temp, proc_out);
		  --led_exp_out <= proc_out;

		  -- Comparar salida del circuito con el procedimiento
          if (salidas_temp = proc_out) then 
                write (s, string'("Salida CORRECTA ")); write (s, count ); write (s, string'(". Salida Circuito: ")); write (s, salidas_temp); write (s, string'(" Procedimiento: ")); write (s, proc_out); 
                writeline (output, s);
          else
              write (s, string'("salida INCORRECTA D: ")); write (s, count); write (s, string'(". Salida Circuito: ")); write (s, salidas_temp); write (s, string'(" Actual: ")); write (s, proc_out); 
              writeline (output, s);
          end if;
		  		  
		  -- Increment the switch value counters.
		  count_a <= count_a + 1;
        end loop;		 
       
	end process;
end behavior;
