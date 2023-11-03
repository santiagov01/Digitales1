library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
generic( N :integer:=4);
    port(
        entradaControl: in std_logic_vector(N-3 downto 0); 
        BUSA,BUSB: in std_logic_vector(N-1 downto 0);
        SalidaAlu: out std_logic_vector(N-1 downto 0);
        carry: out std_logic
        --SalidaFF: out std_logic_vector(N+2 downto 0) 
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
            salidaAux:= '0'&BUSB(3)&BUSB(2)&BUSB(1);
            carry <= '0';
        when others=>--"11"
            multiplicacion:= (BUSA) * "0010";
            salidaAux:=multiplicacion(3 downto 0); 
            carry <= multiplicacion (4);
        end case;
        salidaAlu<=salidaAux;
        end process;
end Behavioral;
