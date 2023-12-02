--VGA CONTROLLER DESIGNED FOR THE vga-simulator
--https://ericeastwood.com/blog/8/vga-simulator-getting-started
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity Simple_Test_VGA is
    Port(  clk, reset: in std_logic;
		   sw: in std_logic_vector(1 downto 0);
		   hsync, vsync: out std_logic;
		   rgb_out: out std_logic_vector(11 downto 0)
        );
end Simple_Test_VGA;

architecture Behavioral of Simple_Test_VGA is


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

component draw 
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
           clk: in std_logic);
end component;

signal sig_pixel_x, sig_pixel_y:  std_logic_vector (10 downto 0);
    signal rgb_aux1 : STD_LOGIC_VECTOR (11 downto 0); --Asigar?
	signal rgb_aux3 : STD_LOGIC_VECTOR (11 downto 0);  --Me ayuda a concantenar 1 y 2
	signal rgb_aux2 : STD_LOGIC_VECTOR (11 downto 0); --Cuadrado 1 (izquierda) p1
	signal rgb_aux0 : STD_LOGIC_VECTOR (11 downto 0); --Cuadrado 2 (derecha) p2
	

signal sig_video_on: std_logic;
	signal clk_interno : STD_LOGIC;

begin

draw1 : draw
	GENERIC MAP (
		SG_WD => 10,
		DL => 50,
		posx => 80,
		posy => 0)
port map (
    pix_x =>sig_pixel_x,
    pix_y =>sig_pixel_y,
    sw =>sw,
    video_on=>sig_video_on,
    rgb_out =>rgb_aux2,
    clk => clk_interno
);
---------CAMBIAR, está malooooo--------------------------------
--draw2 : draw
--	GENERIC MAP (
--		SG_WD => 10,
--		DL => 50,
--		posx => 500,
--		posy => 0)
--port map (
--    pix_x =>sig_pixel_x,
--    pix_y =>sig_pixel_y,
--    sw =>sw,
--    video_on=>sig_video_on,
--    rgb_out =>rgb_aux0,
--    clk => clk_interno
--);
        --Lo siguiente también está maloxddd
--	rgb_aux1 <= "110" when rgb_aux0='1' else
--	           "001" when rgb_aux2='1' else
--				  "000";
--	rgb_aux3 <= rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(0)&rgb_aux1(0)&rgb_aux1(0)&rgb_aux1(0);
	-- generador de reloj de 50 MHZ

	Inst_vga_ctrl_640x480_60Hz: vga_ctrl_640x480_60Hz PORT MAP(
		rst => reset,
		clk => clk_interno,
		rgb_in => rgb_aux2,
		HS => hsync,
		VS => vsync,
		hcount => sig_pixel_x,
		vcount => sig_pixel_y,
		rgb_out => rgb_out,
		blank => open
	);
	
    process (CLK)
        begin  
            if (CLK'event and CLK = '1') then
                clk_interno <= NOT clk_interno;
            end if;
        end process;
end Behavioral;
