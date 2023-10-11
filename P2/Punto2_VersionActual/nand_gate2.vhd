----------------------------------------------------------------------------------
-- Compuerta nand
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

entity nand_gate2 is
    Port ( entradas : in STD_LOGIC_VECTOR (1 downto 0);
           sal : out STD_LOGIC);
end nand_gate2;

architecture Behavioral of nand_gate2 is

begin
    sal <= entradas(0) nand entradas(1);

end Behavioral;
