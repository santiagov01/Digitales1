----------------------------------------------------------------------------------
-- Compuerta or 2 entradas
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity or_gate2 is
    Port ( entradas : in STD_LOGIC_VECTOR (1 downto 0);
           sal_or : out STD_LOGIC);
end or_gate2;

architecture Behavioral of or_gate2 is

begin
    sal_or <= entradas(0) or entradas (1);

end Behavioral;
