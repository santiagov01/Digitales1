----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:47:39
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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


use STD.textio.all;
use IEEE.std_logic_textio.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity alu_tb is
end alu_tb;

architecture Behavioral of alu_tb is
    Component ALU
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           control : in std_logic_vector (1 downto 0);
           alu : inout STD_LOGIC_VECTOR (3 downto 0);
           display : out STD_LOGIC_VECTOR (6 downto 0);
           carry : in STD_LOGIC;
           config : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal A_temp,B_temp : STD_LOGIC_VECTOR (3 downto 0);
    signal control_temp : std_logic_vector (1 downto 0);
    signal alu_temp :  STD_LOGIC_VECTOR (3 downto 0);
    signal alu_proc: STD_LOGIC_VECTOR (3 downto 0);
    signal display_temp : STD_LOGIC_VECTOR (6 downto 0);
    signal carry_temp : STD_LOGIC;
    
    signal counta, countb:STD_LOGIC_VECTOR (3 downto 0):="0000";
    signal countc: STD_LOGIC_VECTOR (1 downto 0):="00";
    
    procedure expected_alu(
             A_temp,B_temp : in STD_LOGIC_VECTOR (3 downto 0);
            control_temp : in std_logic_vector (1 downto 0);
            alu_temp :  inout STD_LOGIC_VECTOR (3 downto 0);
            display_temp : out STD_LOGIC_VECTOR (6 downto 0);
            carry_temp : out STD_LOGIC
    ) is
    
        variable suma2, multiplic2, a2, b2: std_logic_vector (4 downto 0);
        variable div2, sxor2, salida2 : std_logic_vector (3 downto 0);
        variable b3 : std_logic_vector ( 2 downto 0);
    begin
        a2 := '0'&A_temp;
    b2 := '0'&B_temp;
    b3 := B_temp(3 downto 1);
        case(control_temp) is
            when "11" => 
                multiplic2:=a2 + a2;
                salida2:=multiplic2(3 downto 0);
            when "10" =>
            	div2:='0'& b3;
            	salida2 := div2;             	
            when "01" =>
            	salida2 := A_temp xor B_temp;
            	
            when "00" =>
            	suma2:= a2 + b2;
            	salida2:= suma2(3 downto 0);
            	
            when others =>
            	salida2 := "0000"; 
        end case;
        alu_temp := salida2;
       case(alu_temp) is
        when x"0" =>
         display_temp := "0000001";
         when x"1" =>
         display_temp := "1001111";
         when x"2" =>
         display_temp := "0000001";
         when x"3" =>
         display_temp := "0000001";
         when x"4" =>
         display_temp := "0010010";
         when x"5" =>
         display_temp := "0000110";
         when x"6" =>
         display_temp := "1001100";
         when x"7" =>
         display_temp := "0001111";
         when x"8" =>
         display_temp := "0000000";
         when x"9" =>
         display_temp := "0000100";
         when x"A" =>
         display_temp := "0001000";
         when x"b" =>
         display_temp := "1100000";
         when x"C" =>
         display_temp :="0110001";
         when x"d" =>
         display_temp := "0100100";
         when x"e" =>
         display_temp := "0010000" ;
         when x"F" =>
         display_temp := "0111000";
         when others =>
         display_temp :="0000000" ;
       end case; 
    end expected_alu;
begin
    UUT: alu PORT MAP(
        A => A_temp,
        B => B_temp,
        control => control_temp,
        alu => alu_temp,
        carry => carry_temp,
        display => display_temp,
        config => open              
    );
    process
        variable s : line;
        variable i,j,k : integer := 0;
        variable count : integer := 0;
        variable proc_out : STD_LOGIC_VECTOR(3 downto 0);
        variable proc_display : std_logic_vector(6 downto 0);
        variable carrysalida : std_logic;
    begin 
        for i in 0 to 15 loop
           A_temp <= counta;
           for j in 0 to 15 loop
                B_temp<=countb;
                for k in 0 to 3 loop
                control_temp <= countc;
                wait for 10ns;
                
                expected_alu(A_temp, B_temp, control_temp, proc_out, proc_display, carrysalida);
                alu_proc <= proc_out;
                wait for 10ns;
               
                
                if(proc_out = alu_temp) then
                write (s, string'("Salida correcta "));
                writeline (output, s);
                else
                write (s, string'("Salida INcorrecta "));
                writeline (output, s);
                end if;
                
                countc <= countc +1;
                
                
                end loop;  
                countb <= countb+1;         
           end loop;
           counta <= counta +1;
        end loop;
        wait;
    end process;


end Behavioral;
