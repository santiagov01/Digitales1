----------------------------------------------------------------------------------
-- Module Name: comportamental
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

entity comportamental is
    Port ( comport_ints : in STD_LOGIC_VECTOR (3 downto 0);
           sal_c : out STD_LOGIC);
end comportamental;

architecture Behavioral of comportamental is

begin
    process (comport_ints)
        begin
            case comport_ints is
                when "0000"  =>
                    sal_c <= '1';
                 when "0001" =>
                    sal_c <= '1';
                 when "0010"=>
                    sal_c <= '1';
                 when "0011" =>
                    sal_c <= '1';
                 when "0100" =>
                    sal_c <= '1';
                 when "1000" =>
                    sal_c <= '1';
                 when "1100" =>
                    sal_c <= '1';
                                  
                 when others =>
                    sal_c <= '0';
              end case;
     end process;
end Behavioral;
