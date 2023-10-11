--------------------------------------------
-- Module Name: data_flow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity flujo_data Is
port (
		flujo_ints : in STD_LOGIC_VECTOR(3 downto 0);
		sal_fd : out STD_LOGIC
	);
end flujo_data;

Architecture behavior of flujo_data Is


begin
		sal_fd <= (not flujo_ints(0) and not flujo_ints(1)) or (not flujo_ints(2) and not flujo_ints(3));
end behavior;