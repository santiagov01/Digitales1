--------------------------------------------
-- Module Name: deco_display
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity deco_display Is
port (
		binary_number : in STD_LOGIC_VECTOR(3 downto 0);
        display : out STD_LOGIC_VECTOR(6 downto 0)
   	
	);
end deco_display;

Architecture behavior of deco_display Is

signal display_aux : std_logic_vector(6 downto 0) := "1111110";

-- a = display(6)
-- b = display(5)
-- c = display(4)
-- d = display(3)
-- e = display(2)
-- f = display(1)
-- g = display(0)

--        a
--       ---
--     f|   |b 
--      | g | 
-- 		 ---
-- 	   e|   |c 
--      | d | 
--       ---


begin

-- display common anode where 1 is off. 0 is on
-- display   = abcdefg

with binary_number select
   display_aux <= "0000001" when "0000", -- 0
              "1001111" when "0001", -- 1
              "0010010" when "0010", -- 2
              "0000110" when "0011", -- 3
              "1001100" when "0100", -- 4
              "0100100" when "0101", -- 5
              "0100000" when "0110", -- 6
              "0001111" when "0111", -- 7
              "0000000" when "1000", -- 8
              "0000100" when "1001", -- 9 
              "0001000" when "1010", -- A
              "1100000" when "1011", -- b 
              "0110001" when "1100", -- C 
              "1000010" when "1101", -- d 
              "0010000" when "1110", -- E
              "0111000" when "1111", -- F
              "1111110" when others;
              
              display <= display_aux;
         
end behavior;
		

