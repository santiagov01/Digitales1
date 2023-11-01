----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2023 04:19:13 PM
-- Design Name: 
-- Module Name: FF - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FF is
    generic( N :integer:=3);
    Port (
        D: in std_logic_vector (N-1 downto  0);
        en: in std_logic;
        clk: in std_logic ;
        Q : out std_logic_vector(N-1 downto 0)
        
    );
end FF;

architecture Behavioral of FF is

begin
    process(clk)
    begin
        if(clk'event and clk='1') then
            if(en = '1') then
            Q<=D;
        end if;
      end if;      
    end process;

end Behavioral;
