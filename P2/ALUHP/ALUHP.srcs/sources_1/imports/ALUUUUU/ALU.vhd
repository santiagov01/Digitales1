----------------------------------------------------------------------------------
--Module Name: ALU Grupo 4
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity ALU is
    Port ( 
           BUS_A : in STD_LOGIC_VECTOR (3 downto 0);
           BUS_B : in STD_LOGIC_VECTOR (3 downto 0);
           control: in STD_LOGIC_VECTOR (1 downto 0);
           salidas : inout STD_LOGIC_VECTOR (3 downto 0);--Salida de la ALU
           carry : out STD_LOGIC;
	       config_display : out std_logic_vector(3 downto 0);
           display: out std_logic_vector (6 downto 0)--Decodifica el display
           );
end ALU;

architecture Behavioral of ALU is

signal suma: std_logic_vector(3 downto 0);
signal sal_xor:std_logic_vector(3 downto 0);
signal div:std_logic_vector(3 downto 0);

signal entradas_dec: std_logic_vector (3 downto 0);
signal salida_7: std_logic_vector (6 downto 0);

begin
config_display(0) <= '0';
config_display(1) <= '1';
config_display(2) <= '1';
config_display(3) <= '1';

--salidas <= "0000";
--carry <= '0';
--salidas(4)<='0';
process(control,salidas,BUS_A,BUS_B)
variable multiplic: std_logic_vector (3 downto 0);
    begin 
        case(control) is
            when "11" => 
            multiplic := (BUS_A) + (BUS_A);
            	salidas <= multiplic(3 downto 0);
            	--carry <= multiplic(4);
            when "10" =>
            	div <= '0' & BUS_B(3 downto 1);
            	salidas <= div;
            	--carry <= '0';
            when "01" =>
            	sal_xor <= BUS_A xor BUS_B;
            	salidas <= sal_xor;
            	--carry <= '0';
            when "00" =>
            	suma <= (BUS_A) + (BUS_B);
            	salidas <= suma (3 downto 0);
            	--carry <= suma(4);
            when others =>
            	salidas <= "0000";
            	--carry <= '0';                      		 	         
         end case;

         case(salidas) is
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
