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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGACounter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           HS : out  STD_LOGIC;
           VS : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0));
			  
	-- Las siguientes declaraciones realizan la asignacion de pines (version aantigua) 
--	attribute loc: string;
--	attribute loc of CLK : signal is "B8"; -- Pin de reloj
--	attribute loc of RST : signal is "B18"; -- Pulsador BTN0
--	attribute loc of PBTON : signal is "D18"; -- Pulsador BTN1
--	attribute loc of HS : signal is "T4"; -- Driver VGA
--	attribute loc of VS	: signal is "U3"; -- Driver VGA
--	attribute loc of RGB : signal is "R9,T8,R8,N8,P8,P6,U5,U4"; -- Driver VGA
	
end VGACounter;

architecture Behavioral of VGACounter is
	
	
	COMPONENT vga_ctrl_640x480_60Hz
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		rgb_in : IN std_logic_vector(11 downto 0);          
		HS : OUT std_logic;
		VS : OUT std_logic;
		hcount : OUT std_logic_vector(10 downto 0);
		vcount : OUT std_logic_vector(10 downto 0);
		rgb_out : OUT std_logic_vector(11 downto 0);
		blank : OUT std_logic
		);
	END COMPONENT;
	

	COMPONENT display34segm
       generic(SG_WD : integer range 0 to 31 := 5; 
               DL : integer range 0 to 511 := 100 
        );  
        port(posx : in integer range 0 to 639; 
             posy : in integer range 0 to 480;
             segments : in STD_LOGIC_VECTOR (33 downto 0);
             hcount : in  STD_LOGIC_VECTOR (10 downto 0);
             vcount : in  STD_LOGIC_VECTOR (10 downto 0);
             paint : out  STD_LOGIC
        );
	end COMPONENT;
	
	-- Declaramos seales
	signal hcount : STD_LOGIC_VECTOR (10 downto 0);
	signal vcount : STD_LOGIC_VECTOR (10 downto 0);
   signal paint2 : STD_LOGIC;
   signal paint1 : STD_LOGIC;
   signal paint0 : STD_LOGIC;
	signal rgb_aux1 : STD_LOGIC_VECTOR (2 downto 0);
	signal rgb_aux2 : STD_LOGIC_VECTOR (11 downto 0);
	signal rgb_aux3 : STD_LOGIC_VECTOR (11 downto 0);
	signal conteo : std_logic_vector(9 downto 0);
	signal unidades : std_logic_vector(3 downto 0);
	signal decenas : std_logic_vector(3 downto 0);
	signal centenas : std_logic_vector(3 downto 0);
	signal CLK_1Hz : STD_LOGIC:='0';
	signal count_clk : INTEGER:=0;
	signal clk_interno : STD_LOGIC;
	signal num : std_logic_vector(33 downto 0) := "0000000000000000000000000000000001";

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
				    num <= num+num;
					conteo <= conteo + 1;
					
					
				end if;
			else
				conteo <= conteo;
				num <= num;
			end if;
		end if;
	end process;
	

	Display0: display34segm 
	GENERIC MAP (
		SG_WD => 3,
		DL => 40)
	PORT MAP(
	    posx=> 200,
	    posy=> 80,
	    segments =>(x"16B0AE0A")&'0'&'1',
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => paint2
	);
	Display3: display34segm 
	
	GENERIC MAP (
		SG_WD => 5,
		DL => 100)
	PORT MAP(
	    posx=> 100,
	    posy=> 180,
	    segments => num,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => paint1
	);


	rgb_aux1 <= "110" when paint2='1' else
	           "001" when paint1='1' else
				  "100" when paint0='1' else
				  "000";
	rgb_aux3 <= rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(0)&rgb_aux1(0)&rgb_aux1(0)&rgb_aux1(0);

	Inst_vga_ctrl_640x480_60Hz: vga_ctrl_640x480_60Hz PORT MAP(
		rst => RST,
		clk => clk_interno,
		rgb_in => rgb_aux3,
		HS => HS,
		VS => VS,
		hcount => hcount,
		vcount => vcount,
		rgb_out => rgb_aux2,
		blank => open
	);
	
	
	RGB <= rgb_aux2;
	-- generador de reloj de 50 MHZ
    process (CLK)
        begin  
            if (CLK'event and CLK = '1') then
                clk_interno <= NOT clk_interno;
            end if;
        end process;
	
end Behavioral;

