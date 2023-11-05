----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2023 04:27:38 PM
-- Design Name: 
-- Module Name: clock - Behavioral
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

--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock is
    PORT(
        CLK: in std_logic;
        reset: in std_logic;
        clk1: out std_logic
    );
end clock;

architecture Behavioral of clock is
signal clk_interno : std_logic :='0';
signal count_clk : integer:=0;
signal CLK_temp: std_logic:='0';

constant PERIOD : integer := 4;
begin
    process(CLK,reset,CLK_temp)
	begin
	    clk1 <= CLK_temp;
        if(reset ='1') then
            count_clk <=0;
		elsif(CLK'event and CLK='1') then	    
			if (count_clk = PERIOD) then
				count_clk <= 0;
				CLK_temp <= not CLK_temp;
				clk1 <= CLK_temp;			
			else
				count_clk <= count_clk + 1;
				end if;
			end if;
	end process;

end Behavioral;
