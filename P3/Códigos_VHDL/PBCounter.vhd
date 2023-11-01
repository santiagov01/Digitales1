----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JEA
-- 
-- Create Date:    05:33:54 22/07/2022 
-- Design Name: 
-- Module Name:    PBCounter - Behavioral 
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

entity PBCounter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           —ena : in  STD_LOGIC;
           Display: out STD_LOGIC_VECTOR(6 DOWNTO 0); 
           EN0 : out STD_LOGIC;
           EN1 : out STD_LOGIC;
           EN2 : out STD_LOGIC;
           EN3 : out STD_LOGIC
           );
			  
	-- Las siguientes declaraciones realizan la asignacion de pines (version aantigua) 
--	attribute loc: string;
--	attribute loc of CLK : signal is "B8"; -- Pin de reloj
--	attribute loc of RST : signal is "B18"; -- Pulsador BTN0
--	attribute loc of PBTON : signal is "D18"; -- Pulsador BTN1

	
end PBCounter;

architecture Behavioral of PBCounter is
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
	signal conteo2 : std_logic_vector(1 downto 0);
	signal CLK_1Hz : STD_LOGIC:='0';
	signal CLK_16MSE : STD_LOGIC:='0';
	signal count_clk : INTEGER:=0;
	signal count_clk2 : INTEGER:=0;
	signal clk_interno : STD_LOGIC := '0';
	
	constant P16MSE : INTEGER := 320000;
	constant P100MSE : INTEGER := 5000000;
	signal centenas : std_logic_vector(3 downto 0);
    signal decenas : std_logic_vector(3 downto 0);
    signal unidades : std_logic_vector(3 downto 0);
    signal data_out : std_logic_vector(3 downto 0);
    signal Segmentos : std_logic_vector(6 downto 0);
begin
--componente No.1
	CLK_DIV: process(clk_interno)
	begin
		if(clk_interno'event and clk_interno='1') then
			if (count_clk = P100MSE) then
				count_clk <= 0;
				CLK_1Hz <= not CLK_1Hz;
			else
				count_clk <= count_clk +1;
			end if;
		end if;
	end process;
	
--Componente No.2 
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
	
--Componente No.3
	BIN2BCD: BIN2BCD_0a999 PORT MAP(
		BIN => conteo,
		BCD2 => centenas,
		BCD1 => decenas,
		BCD0 => unidades
	);
	
-- Componente No. 4
    process (CLK)
        begin  
            if (CLK'event and CLK = '1') then
                clk_interno <= NOT clk_interno;
            end if;
        end process;
	
-- Componente No.5 	
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
	
-- componente No. 6
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
	
--Componente No. 7	

selector: process(conteo2,centenas,decenas,unidades)
	begin
		case conteo2 is
			when "00" =>
				data_out <= centenas;
				EN0 <='0';
                EN1 <='1';
                EN2 <='1';
                EN3 <='1';
			when "01" =>
				data_out <= decenas;
				EN0 <='1';
                EN1 <='0';
                EN2 <='1';
                EN3 <='1';
			when "10" =>
				data_out <= unidades;
				EN0 <='1';
                EN1 <='1';
                EN2 <='0';
                EN3 <='1';
			when others =>
				data_out <= "0000";
				EN0 <='0';
                EN1 <='1';
                EN2 <='1';
                EN3 <='0';
		end case;
	end process;
-- Componente No. 8

   segmentos <= "0000001" when (data_out="0000") else
                "1001111" when (data_out="0001") else
                "0010010" when (data_out="0010") else
                "0000110" when (data_out="0011") else
                "1001100" when (data_out="0100") else
                "0100100" when (data_out="0101") else
                "0100000" when (data_out="0110") else
                "0001110" when (data_out="0111") else
                "0000000" when (data_out="0110") else
                "0000100" when (data_out="0111") else
					 "1111110";
		Display <= segmentos;
		
end Behavioral;

