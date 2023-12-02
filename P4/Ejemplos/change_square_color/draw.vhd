--VGA CONTROLLER DESIGNED FOR THE vga-simulator
--https://ericeastwood.com/blog/8/vga-simulator-getting-started
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity draw is
    generic(SG_WD : integer range 0 to 31 := 5; --Segment width
               DL : integer range 0 to 511 := 100;  --DYSPLAY_LENGTH
               posx: integer range 0 to 640 := 0;
               posy: integer range 0 to 480 := 0
        );  
    Port ( pix_x : in STD_LOGIC_VECTOR (10 downto 0);
           pix_y : in STD_LOGIC_VECTOR (10 downto 0);
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           video_on: in std_logic;
           rgb_out : out STD_LOGIC_VECTOR (11 downto 0);
           clk : in std_logic --50MHz
           );
end draw;

architecture Behavioral of draw is

signal count: integer range 0 to 25000000;
signal COLOR: STD_LOGIC_VECTOR (11 downto 0);
signal clk_1Hz: std_logic;
signal pos_x: integer := posx;
signal pos_y: integer := posy;
constant L: INTEGER := DL;
constant W: INTEGER := SG_WD;
constant SXI : INTEGER := posx;--segmeno x izquierda

begin
    process(clk)
    begin
        if(clk'event and clk='1')then
            count <= count +1;
            if(count = 125000) then
                count<= 0;
                clk_1Hz <= not clk_1Hz;
            end if;
         end if;
     end process;
     
     process(clk_1Hz)
     begin
        if(clk_1Hz'event and clk_1Hz = '1')then --Probar implimentando un botón
        pos_y <= pos_y + 10;
            if(pos_y > 480)then
                pos_y <= 0;
            end if;
        end if;
     end process;
        

--RRRR GGGG BBB
COLOR <=x"000" when sw<="00"  else
        x"F00" when sw<="01"  else
        x"0F0" when sw<="10"  else
        x"00F";
 		
rgb_out <= COLOR when ((pix_x>=posx) AND (pix_x<=posx+SG_WD) AND (pix_y>=pos_y) AND (pix_y<=pos_y+DL)) else  not COLOR;
--rgb_out <= COLOR when ((pix_y>=150) AND (pix_y<=200) AND (pix_x>=pos_x) AND (pix_x<=pos_x+50)) else  not COLOR;

end Behavioral;
