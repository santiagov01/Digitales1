----------------------------------------------------------------------------------
-- COmponent: Inversor
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity inversor is
    Port ( entrada : in STD_LOGIC;
           salida_invertida : out STD_LOGIC);
end inversor;

architecture Behavioral of inversor is

begin
    salida_invertida <= not entrada;

end Behavioral;
