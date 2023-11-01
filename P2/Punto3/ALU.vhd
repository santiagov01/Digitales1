library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;

entity ALU is
    port(
        entradaControl: in std_logic_vector(1 downto 0); 
        BUSA,BUSB: in std_logic_vector(3 downto 0);
        SalidaAlu: out std_logic_vector(3 downto 0);
        carry: out std_logic ;
        Salida7seg: out std_logic_vector(6 downto 0) 
    );
end ALU;

architecture Behavioral of ALU is  
begin
    process(BUSA,BUSB,entradaControl)
    variable salidaAux: std_logic_vector(3 downto 0);
    variable suma: std_logic_vector (4 downto 0);
    variable Multiplicacion: std_logic_vector(7 downto 0); 
    variable Multiplicacion2: std_logic_vector(3 downto 0);
    begin
        case entradaControl is
        when "00" =>
            suma := ('0'&BUSA) + ('0'&BUSB);
            salidaAux:=suma(3 downto 0);
            carry <= suma(4);
        when "01" =>
            multiplicacion2:= BUSA xor BUSB;
            salidaAux:=multiplicacion2(3 downto 0);
            carry <='0';
        when "10" =>
            salidaAux:= '0'&BUSA(3)&BUSA(2)&BUSA(1);
            carry <= '0';
        when others=>--"11"
            multiplicacion:= (BUSB) * "0010";
            salidaAux:=multiplicacion(3 downto 0); 
            carry <= multiplicacion (4);
        end case;
        salidaAlu<=salidaAux;
        case salidaAux is
        when "0000"=>
            salida7seg<="0000001";
        when "0001"=>
            salida7seg<="1001111";
        when "0010"=>
            salida7seg<="0010010";
        when "0011"=>
            salida7seg<="0000110";
        when "0100"=>
            salida7seg<="1001100";
        when "0101"=>
            salida7seg<="0100100";
        when "0110"=>
            salida7seg<="1100000";
        when "0111"=>
            salida7seg<="0001110";
        when "1000"=>
            salida7seg<="0000000";
        when "1001"=>
            salida7seg<="0000100";
        when "1010"=>
            salida7seg<="1111110";
        when "1011"=>
            salida7seg<="0110000";        
        when "1100"=>
            salida7seg<="1101101";
        when "1101"=>
            salida7seg<="1111001";   
        when "1110"=>
            salida7seg<="0110011";
        when others=>--"1111"
            salida7seg<="1011011";
        end case;
    end process;
end Behavioral;
