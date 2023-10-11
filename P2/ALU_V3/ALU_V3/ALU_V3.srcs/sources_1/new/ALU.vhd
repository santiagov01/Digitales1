----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 18:16:12
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           control : in std_logic_vector (1 downto 0);
           alu : inout STD_LOGIC_VECTOR (3 downto 0);
           display : out STD_LOGIC_VECTOR (6 downto 0);
           carry : in STD_LOGIC;
           config : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
config(0) <= '0';
config(1) <= '1';
config(2) <= '1';
config(3) <= '1';
process(control, alu, A,B)
    variable suma, multiplic,a2, b2 : std_logic_vector (4 downto 0);
    variable div, sxor, salida : std_logic_vector (3 downto 0);
    variable b3 : std_logic_vector (2 downto 0);
    begin
    a2 := '0'&A;
    b2 := '0'&B;
    b3 := B(3 downto 1);
        case(control) is
            when "11" => 
                multiplic := a2 +  b2;
                salida := multiplic(3 downto 0);
            when "10" =>
            	div:='0' & b3;
            	salida := div;             	
            when "01" =>
            	salida := A xor B;
            	
            when "00" =>
            	suma:= a2+b2;
            	salida:= suma(3 downto 0);
            	
            when others =>
            	salida := "0000"; 
        end case;
        alu <= salida;
       case(alu) is
        when x"0" =>
         display <= "0000001";
         when x"1" =>
         display <= "1001111";
         when x"2" =>
         display <= "0000001";
         when x"3" =>
         display <= "0000001";
         when x"4" =>
         display <= "0010010";
         when x"5" =>
         display <= "0000110";
         when x"6" =>
         display <= "1001100";
         when x"7" =>
         display <= "0001111";
         when x"8" =>
         display <= "0000000";
         when x"9" =>
         display <= "0000100";
         when x"A" =>
         display <= "0001000";
         when x"b" =>
         display <= "1100000";
         when x"C" =>
         display <="0110001";
         when x"d" =>
         display <= "0100100";
         when x"e" =>
         display <= "0010000" ;
         when x"F" =>
         display <= "0111000";
         when others =>
         display <="0000000" ;
       end case; 
end process; 
end Behavioral;
