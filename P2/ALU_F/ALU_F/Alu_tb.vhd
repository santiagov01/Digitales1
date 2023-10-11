library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;

entity tb_ALU is
end tb_ALU;

architecture tb of tb_ALU is

    component ALU
        port (entradaControl : in std_logic_vector (1 downto 0);
              Entrada1       : in std_logic_vector (3 downto 0);
              Entrada2       : in std_logic_vector (3 downto 0);
              SalidaAlu      : out std_logic_vector (3 downto 0);
              Salida7seg     : out std_logic_vector (6 downto 0));
    end component;

    signal entradaControl : std_logic_vector (1 downto 0);
    signal Entrada1       : std_logic_vector (3 downto 0);
    signal Entrada2       : std_logic_vector (3 downto 0);
    signal SalidaAlu      : std_logic_vector (3 downto 0) :="0000";
    signal Salida7seg     : std_logic_vector (6 downto 0);

begin

    dut : ALU
    port map (entradaControl => entradaControl,
              Entrada1       => Entrada1,
              Entrada2       => Entrada2,
              SalidaAlu      => SalidaAlu,
              Salida7seg     => Salida7seg);

    stimuli : process
        variable i,j,k: integer;
        variable prueba1:std_logic_vector(1 downto 0):="00";
        variable salidaPrueba,salidaAux,prueba2,prueba3: std_logic_vector(3 downto 0):="0000";
        variable s7seg: std_logic_vector(6 downto 0);
        variable Multiplicacion: std_logic_vector(7 downto 0);
        variable Multiplicacion2: std_logic_vector(3 downto 0);
        variable linea:line;
        begin
        entrada1<=prueba2;
        entrada2<=prueba3; 
        for i in 0 to 3 loop
            entradaControl<=prueba1;
            --wait for 10 ns;
            prueba1:= (prueba1) + 1;
            for j in 0 to 15 loop
                entrada1<=prueba2; 
                prueba2:= (prueba2) + 1;
                for k in 0 to 15 loop
                    entrada2<=prueba3; 
                    wait for 10 ns;
                    prueba3:= (prueba3) + 1; 
                    case entradaControl is
                        when "00" =>
                            salidaAux:=entrada1+entrada2;
                        when "01" =>
                            multiplicacion2:= entrada1 xor entrada2;
           					salidaAux:=multiplicacion2(3 downto 0);
                        when "10" =>
                            salidaAux:= '0'&entrada1(3)&entrada1(2)&entrada1(1);
                        when others=>--"11"
                            multiplicacion:= (entrada1) * "0010";
            				salidaAux:=multiplicacion(3 downto 0); 
                    end case;
                    salidaPrueba:=salidaAux;
                    wait for 10 ns;
                    if salidaPrueba = salidaAlu then
                        write(linea,string'("Salida del Alu CORRECTA"));   writeline(output,linea);  
                    else
                        write(linea,string'("Salida del Alu INCORRECTA")); writeline(output,linea);  
                    end if;
                    --write(linea,string'(" Salida de prueba: "));write(linea,salidaPrueba);
                    --write(linea,string'(" Salida del Alu "));write(linea,salidaAlu);writeline(output,linea); 
                    
                    case salidaAux is
                        when "0000"=>
                            S7seg:="0000001";
                        when "0001"=>
                            S7seg:="1001111";
                        when "0010"=>
                            S7seg:="0010010";
                        when "0011"=>
                            S7seg:="0000110";
                        when "0100"=>
                            S7seg:="1001100";
                        when "0101"=>
                            S7seg:="0100100";
                        when "0110"=>
                            S7seg:="1100000";
                        when "0111"=>
                            S7seg:="0001110";
                        when "1000"=>
                            S7seg:="0000000";
                        when "1001"=>
                            S7seg:="0000100";
                        when "1010"=>
                            S7seg:="1111110";
                        when "1011"=>
                            S7seg:="0110000";        
                        when "1100"=>
                            S7seg:="1101101";
                        when "1101"=>
                            S7seg:="1111001";   
                        when "1110"=>
                            S7seg:="0110011";
                        when others=>--"1111"
                            S7seg:="1011011";
                    end case; 
                    if s7seg = salida7seg then
                        write(linea,string'("Salida del 7 segmentos CORRECTA")); writeline(output,linea);    
                    else
                        write(linea,string'("Salida del 7 segmentos INCORRECTA")); writeline(output,linea);  
                    end if;
                    --write(linea,string'(" Salida de prueba: "));write(linea,s7seg);
                    --write(linea,string'(" Salida del 7 segmentos "));write(linea,salida7seg);writeline(output,linea);        
                end loop;         
            end loop;
        end loop;
        wait;
    end process;
end tb;
