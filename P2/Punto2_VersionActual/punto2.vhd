--------------------------------------------
-- Module Name: function-g4
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity punto2 Is
port (
		entradas : in STD_LOGIC_VECTOR(3 downto 0);
		sal_total : out STD_LOGIC_VECTOR(2 downto 0)
	);
end punto2;

Architecture behavior of punto2 Is

Component estructural
port (
    ents : in STD_LOGIC_VECTOR(3 downto 0);
    sal : out STD_LOGIC
);
End Component;

Component flujo_data
port (
    flujo_ints : in STD_LOGIC_VECTOR(3 downto 0);
    sal_fd : out STD_LOGIC
);
End Component;

Component comportamental
port (
    comport_ints : in STD_LOGIC_VECTOR(3 downto 0);
    sal_c : out STD_LOGIC
);
End Component;

begin
        Est: estructural PORT MAP(
            ents => entradas,
            sal => sal_total(2)
        );
        Data_flow: flujo_data PORT MAP(
            flujo_ints => entradas,
            sal_fd => sal_total(0)
        );
        Comport: comportamental PORT MAP(
            comport_ints => entradas,
            sal_c => sal_total(1)
        );
end behavior;
		

