----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Refactor by Jonathan Duque Gallego
-- 
-- Create Date: 
-- Design Name: 
-- Module Name:    PBCounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: This entity counts from 0 to 999 if a PBTON (pushbutton) is pressed. 
--              If RST is pressed the total count is reset to 0.
--		The total count is showed in three segment display
-- Dependencies: 
-- Additional Comments: This code is for education use
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;


entity PBCounter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           display: out STD_LOGIC_VECTOR(6 DOWNTO 0); 
           enable_display : out STD_LOGIC_VECTOR(3 DOWNTO 0)
           );
end PBCounter;

architecture Behavioral of PBCounter is
	-- components to use
	COMPONENT BIN2BCD_0a999
	PORT(
		BIN : IN std_logic_vector(9 downto 0);          
		BCD2 : OUT std_logic_vector(3 downto 0);
		BCD1 : OUT std_logic_vector(3 downto 0);
		BCD0 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
    
    COMPONENT deco_display
	PORT(
		binary_number : in STD_LOGIC_VECTOR(3 downto 0);
        display : out STD_LOGIC_VECTOR(6 downto 0)
		);
	END COMPONENT;

	-- some constants to manage time
        constant P16MSE : INTEGER := 320000;
	constant P100MSE : INTEGER := 5000000;
	
	-- signals to connect things, components or results
	signal conteo : std_logic_vector(9 downto 0);
	signal conteo2 : std_logic_vector(1 downto 0); -- to control what display is enable
	signal CLK_1Hz : STD_LOGIC:='0'; -- what is its frequency and period?
	signal CLK_16MSE : STD_LOGIC:='0'; -- what is its frequency and period?
	signal count_clk : INTEGER:=0;
	signal count_clk2 : INTEGER:=0;
	signal clk_interno : STD_LOGIC:='0'; -- what is its frequency and period?
	
	
	signal centenas : std_logic_vector(3 downto 0);
    signal decenas : std_logic_vector(3 downto 0);
    signal unidades : std_logic_vector(3 downto 0);
    signal current_number : std_logic_vector(3 downto 0);
    
begin
--component No.1
	CLK_DIV: process(clk_interno)
	begin
		if(clk_interno'event and clk_interno='1') then
			if (count_clk = P100MSE) then
				count_clk <= 0;
				CLK_1Hz <= not CLK_1Hz;
			else
				count_clk <= count_clk + 1;
			end if;
		end if;
	end process;
	
--Component No.2 
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
	
--Component No.3
	BIN2BCD: BIN2BCD_0a999 PORT MAP(
		BIN => conteo,
		BCD2 => centenas,
		BCD1 => decenas,
		BCD0 => unidades
	);
	
-- Component No. 4
    process (CLK)
        begin  
            if (CLK'event and CLK = '1') then
                clk_interno <= NOT clk_interno;
            end if;
        end process;
	
-- Component No.5 	
		CLK_DIV2: process(clk_interno)
	begin
		if(clk_interno'event and clk_interno='1') then
			if (count_clk2 = P16MSE) then
				count_clk2 <= 0;
				CLK_16MSE <= not CLK_16MSE;
			else
				count_clk2 <= count_clk2 +1;
			end if;
		end if;
	end process;
	
-- component No. 6
	CONT2: process(CLK_16MSE,RST)
	begin
		if (RST='1') then
			conteo2 <= (others=>'0');
		elsif (CLK_16MSE'event and CLK_16MSE='1') then
				if (conteo2=3) then
					conteo2 <= (others=>'0');
				else
					conteo2 <= conteo2 + 1;
			end if;
		end if;
	end process;
	
--Component No. 7	

selector: process(conteo2,centenas,decenas,unidades)
	begin
		case conteo2 is
			when "00" =>
				current_number <= centenas;
                enable_display <= "1110";
			when "01" =>
				current_number <= decenas;
                enable_display <= "1101";
			when "10" =>
				current_number <= unidades;
                enable_display <= "1011";
			when others =>
				current_number <= "0000";
                enable_display <= "0111";
	
		end case;
	end process;

-- Component No. 8
	dd: deco_display port map(
	   binary_number => current_number,
	   display => display
	);

		
end Behavioral;

