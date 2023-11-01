----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:33:54 05/20/2014 
-- Design Name: 
-- Module Name:    VGACounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGACounter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           centenas : out std_logic_vector(3 downto 0);
           decenas : out std_logic_vector(3 downto 0);
           unidades : std_logic_vector(3 downto 0)

           );
			  
	-- Las siguientes declaraciones realizan la asignacion de pines (version aantigua) 
--	attribute loc: string;
--	attribute loc of CLK : signal is "B8"; -- Pin de reloj
--	attribute loc of RST : signal is "B18"; -- Pulsador BTN0
--	attribute loc of PBTON : signal is "D18"; -- Pulsador BTN1

	
end VGACounter;

architecture Behavioral of VGACounter is
	-- Declaramos componentes
	COMPONENT BIN2BCD_0a999
	PORT(
		BIN : IN std_logic_vector(9 downto 0);          
		BCD2 : OUT std_logic_vector(3 downto 0);
		BCD1 : OUT std_logic_vector(3 downto 0);
		BCD0 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	
		
	-- Declaramos senales
	
	
	signal conteo : std_logic_vector(9 downto 0);
	signal CLK_1Hz : STD_LOGIC:='0';
	signal count_clk : INTEGER:=0;
	signal clk_interno : STD_LOGIC;
begin

	CLK_DIV: process(clk_interno)
	begin
		if(clk_interno'event and clk_interno='1') then
			if (count_clk = 5000000) then
				count_clk <= 0;
				CLK_1Hz <= not CLK_1Hz;
			else
				count_clk <= count_clk +1;
			end if;
		end if;
	end process;
	

	CONT: process(CLK_1Hz,RST)
	begin
		if (RST='1') then
			conteo <= (others=>'0');
		elsif (CLK_1Hz'event and CLK_1Hz='1') then
			if(PBTON='1') then
				if (conteo=999) then
					conteo <= (others=>'0');
				else
					conteo <= conteo + 1;
				end if;
			else
				conteo <= conteo;
			end if;
		end if;
	end process;
	
	BIN2BCD: BIN2BCD_0a999 PORT MAP(
		BIN => conteo,
		BCD2 => centenas,
		BCD1 => decenas,
		BCD0 => unidades
	);
	
		-- generador de reloj de 50 MHZ
    process (CLK)
        begin  
            if (CLK'event and CLK = '1') then
                clk_interno <= NOT clk_interno;
            end if;
        end process;
	
end Behavioral;

