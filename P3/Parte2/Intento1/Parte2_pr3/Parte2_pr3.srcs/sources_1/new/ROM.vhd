library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity ROM is
    --generic();
    PORT(
         addrs : in std_logic_vector (2 downto 0);
         data : out  STD_LOGIC_VECTOR (3 downto 0)
    );

end ROM;

architecture Behavioral of ROM is
    type rom_type is array (0 to 15) of std_logic_vector (2 downto 0);
    constant Memoria_ROM : rom_type :=( x"3", x"5", x"7", x"b", x"a", x"9", x"f", x"e");
         
    begin
    data <= Memoria_ROM(conv_integer(addrs));
end Behavioral;