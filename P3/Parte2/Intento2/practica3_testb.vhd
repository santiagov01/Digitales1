----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2023 19:26:13
-- Design Name: 
-- Module Name: practica3_testb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;
entity practica3_testb is
end practica3_testb;

architecture tb of practica3_testb is

    component main
        port (B0        : in std_logic_vector (3 downto 0);
              B1        : in std_logic_vector (3 downto 0);
              addres    : in std_logic_vector (2 downto 0);
              clk       : in std_logic;
              SEL       : in std_logic_vector (1 downto 0);
              en0       : in std_logic;
              en1       : in std_logic;
              C         : in std_logic;
              breset    : in std_logic;
              S7_sg     : out std_logic_vector (6 downto 0);
              carry_led : out std_logic;
              enable_display : out STD_LOGIC_VECTOR(3 DOWNTO 0);
              clk_2: out std_logic );
    end component;

    signal B0_sgn        : std_logic_vector (3 downto 0);
    signal B1_sgn       : std_logic_vector (3 downto 0);
    signal addres_sgn    : std_logic_vector (2 downto 0);
    signal clk_sgn       : std_logic :='0';
    signal SEL_sgn       : std_logic_vector (1 downto 0);
    signal en0_sgn       : std_logic:='0';
    signal en1_sgn       : std_logic:='0';
    signal C_sgn         : std_logic;
    signal breset_sgn    : std_logic;
    signal S7_sgn     : std_logic_vector (6 downto 0):="0000000";
    signal carry_sgn : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';
    
    signal reloj2 : std_logic;

begin

    dut : main
    port map (B0        => B0_sgn,
              B1        => B1_sgn,
              addres    => addres_sgn,
              clk       => clk_sgn,
              SEL       => SEL_sgn,
              en0       => en0_sgn,
              en1       => en1_sgn,
              C         => C_sgn,
              breset    => breset_sgn,
              S7_sg     => S7_sgn,
              carry_led => carry_sgn,
              enable_display => open,
              clk_2 => reloj2);
    --Generar el reloj
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- clk_sgn es el que entra a mi componente.
    clk_sgn <= TbClock;
    
--    generarreloj:
--    process begin
--        clk_sgn <= '1', '0' after TbPeriod:
--        wait for    
    stimuli : process
    variable entradas : std_logic_vector (13 downto 0);
    variable i,j,k,h : integer:=0;
    variable linea:line;
    variable entrada1: std_logic_vector (3 downto 0) :="0000";
    variable direccion_var : std_logic_vector (2 downto 0) :="000";
    variable selector_var : std_logic_vector (1 downto 0) :="00";
    variable C_var : std_logic :='0';
    variable suma: std_logic_vector (4 downto 0);
    variable Multiplicacion: std_logic_vector(7 downto 0);
    variable Multiplicacion2: std_logic_vector(3 downto 0);
    variable salidaPrueba,salidaAux,prueba2,prueba3: std_logic_vector(3 downto 0):="0000";
    variable s7seg_var: std_logic_vector(6 downto 0);
    variable carryt: std_logic;
    begin
--    B0_sgn <= entradas(3 downto 0);
--    B1_sgn <= entradas(7 downto 4);
--    SEL_sgn <= entradas(9 downto  8);
--    addres_sgn <= entradas(12 downto 10);    
--    C_sgn <= entradas(13);
    
    for k in 0 to 1 loop--Variar C (solo dos valores
        C_sgn <= C_var;
        C_var:= '1';
        for j in 0 to 2 loop --Variar selector de operación
            SEL_sgn <= selector_var;
            selector_var := (selector_var +1);
            for h in 0 to 7 loop --Variar address
                addres_sgn <= direccion_var;
                direccion_var := (direccion_var) + 1;
                for i in 0 to 15 loop --Variar las combinaciones de entrada
                    B0_sgn <= entrada1;
                    B1_sgn <= entrada1;
                    entrada1 := (entrada1) + 1;
                    en0_sgn <= '1';
                    en1_sgn <= '0';
                    wait for 50ns;

                    wait for 50ns;
                    case SEL_sgn is
                        when "00" =>
                            suma := ('0'&B0_sgn) + ('0'&B1_sgn);
                            salidaAux:=suma(3 downto 0);
                            carryt:=suma(4);
                        when "01" =>
                            multiplicacion2:= B0_sgn xor B1_sgn;
           					salidaAux:=multiplicacion2(3 downto 0);
           					carryt:='0';
                        when "10" =>
                            salidaAux:= '0'&B0_sgn(3)&B0_sgn(2)&B0_sgn(1);
                            carryt:='0';
                        when others=>--"11"
                            multiplicacion:= (B0_sgn) * "0010";
            				salidaAux:=multiplicacion(3 downto 0); 
            				carryt:=multiplicacion(4);
                    end case;
                    en0_sgn <='0';
                    en1_sgn <= '1';
                    wait for 50ns;
                    case salidaAux is
                        when "0000"=>
                            s7seg_var:="0000001";
                        when "0001"=>
                            s7seg_var:="1001111";
                        when "0010"=>
                            s7seg_var:="0010010";
                        when "0011"=>
                            s7seg_var:="0000110";
                        when "0100"=>
                            s7seg_var:="1001100";
                        when "0101"=>
                            s7seg_var:="0100100";
                        when "0110"=>
                            s7seg_var:="1100000";
                        when "0111"=>
                            s7seg_var:="0001110";
                        when "1000"=>
                            s7seg_var:="0000000";
                        when "1001"=>
                            s7seg_var:="0000100";
                        when "1010"=>
                            s7seg_var:="0001000";
                        when "1011"=>
                            s7seg_var:="1100000";        
                        when "1100"=>
                            s7seg_var:="0110001";
                        when "1101"=>
                            s7seg_var:="1000010";   
                        when "1110"=>
                            s7seg_var:="0010000";
                        when others=>--"1111"
                            s7seg_var:="0111000";
                    end case; 
                    if s7seg_var = S7_sgn then
                        write(linea,string'("Salida del 7 segmentos CORRECTA")); writeline(output,linea);    
                    else
                        write(linea,string'("Salida del 7 segmentos INCORRECTA")); writeline(output,linea);  
                    end if;
                    write(linea,string'(" Salida de prueba: "));write(linea,s7seg_var);
                    write(linea,string'(" Salida del 7 segmentos "));write(linea,S7_sgn);writeline(output,linea);
                    wait for 50ns;
                    
                end loop;
            end loop;
        end loop;
    end loop;
--    for i in 0 to 100 loop
--    wait for 5ns;
--    en0_sgn <= '1';
--    en1_sgn <= '0';
--    wait for 5ns;
--    entradas:= (entradas)+1;
--    wait for 5ns;
    
--    wait for 5ns;
--    entradas:= (entradas) +2;
--    end loop;
    end process;

end tb;
