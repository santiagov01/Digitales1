----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2023 05:28:15
-- Design Name: 
-- Module Name: P2_test_bench - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P2_test_bench is
--  Port ( );
end P2_test_bench;

architecture Behavioral of P2_test_bench is
    COMPONENT main
        Port (
        B0, B1, BB : in std_logic_vector ( 3 downto 0);
        addres: in std_logic_vector(2 downto 0);
        clk: in std_logic ;
        SEL: in std_logic_vector (1 downto 0);
        en0, en1: in std_logic;
        C, breset: in std_logic;
        s_7seg: out std_logic    --C de control
     );
     END COMPONENT;
     --CAMBIAR NOMBRES PARA DIFERENCIAR QUE SON LOS REAAALEEES
signal B0_temp,B1_temp,BB_temp : std_logic_vector(3 downto 0);
signal addres_temp: std_logic_vector (2 downto 0);
signal clk1_temp: std_logic ;
signal SEL_temp: std_logic_vector (1 downto 0);
signal C_temp, breset_temp: std_logic; --¿dejar reset sin conexion?
signal en0_temp, en1_temp: std_logic;


begin
    DUT: main
    PORT MAP(
        B0 => B0_temp,--Valores que meto como reales
        B1 => B1_temp,
        BB => BB_temp,
        addres => addres_temp,
        SEL => SEL_temp,
        clk => clk1_temp,
        breset => '0',
        en0 => en0_temp,
        en1 => en1_temp,        
        C => C_temp
    );
    
    stimuli: process
    --FALTA PONER EL RELOJ POR ACÁ
    --clk1_temp
    variable linea:line;
    variable i,j,k: integer;
    
    variable s7seg: std_logic_vector(6 downto 0);
    variable X,Y: std_logic_vector (6 downto 0);
    for i in 0 to 7:
        addres_temp <= conv_std_logic_vector(i,8); --Revisar conversion
        --Existen otras formas de hacerlo
        for j in 0 to 15:
            en0_temp <= '1';
            en1_temp <= '0';
            wait for 30ms
            
            wait for 30ms
    
end Behavioral;

