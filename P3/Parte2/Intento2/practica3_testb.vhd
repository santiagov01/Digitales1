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
              carry_led : out std_logic);
    end component;

    signal B0_sgn        : std_logic_vector (3 downto 0);
    signal B1_sgn       : std_logic_vector (3 downto 0);
    signal addres_sgn    : std_logic_vector (2 downto 0);
    signal clk_sgn       : std_logic :='0';
    signal SEL_sgn       : std_logic_vector (1 downto 0);
    signal en0_sgn       : std_logic;
    signal en1_sgn       : std_logic;
    signal C_sgn         : std_logic;
    signal breset_sgn    : std_logic;
    signal S7_sgn     : std_logic_vector (6 downto 0);
    signal carry_sgn : std_logic;

    constant TbPeriod : time := 5 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

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
              carry_led => carry_sgn);
    --Generar el reloj
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- clk_sgn es el que entra a mi componente.
    clk_sgn <= TbClock;

    stimuli : process
    variable entradas : std_logic_vector (15 downto 0);
    variable i,j,k : integer;
    begin
    B0_sgn <= entradas(3 downto 0);
    for i in 0 to 100 loop
    wait for 500ns;
    
    wait for 500ns;
    entradas:= (entradas)+1;
    wait for 500ns;
    
    wait for 500ns;
    entradas:= (entradas) +2;
    end loop;
    end process;

end tb;
