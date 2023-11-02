----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2023 05:35:33 PM
-- Design Name: 
-- Module Name: driver_triestado - Behavioral
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


entity driver_triestado is
Port (
        B0, B1: in std_logic_vector ( 3 downto 0);
        control : in std_logic;
        sal: out std_logic_vector ( 3 downto 0)
     );
end driver_triestado;

architecture Behavioral of driver_triestado is
begin
process( control,B0,B1)
    begin
    if(control ='1') then
        sal <= B0;
    else
        sal<=B1;
    end if;
end process;  
end Behavioral;
