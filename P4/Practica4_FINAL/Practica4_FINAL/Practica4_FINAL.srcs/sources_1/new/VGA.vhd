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

entity VGA is
    GENERIC(
        clk_const: INTEGER := 50_000_000;
        ps2_debounce_counter_size : INTEGER := 8
    );
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           HS : out  STD_LOGIC;
           VS : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0);
           ps2_clk: in  STD_LOGIC;--clock signal from PS2 keyboard
           sw: in std_logic_vector(1 DOWNTO 0);--Selector de velocidades
           ps2_data   : in  STD_LOGIC
           );
			  
	-- Las siguientes declaraciones realizan la asignacion de pines (version aantigua) 
--	attribute loc: string;
--	attribute loc of CLK : signal is "B8"; -- Pin de reloj
--	attribute loc of RST : signal is "B18"; -- Pulsador BTN0
--	attribute loc of PBTON : signal is "D18"; -- Pulsador BTN1
--	attribute loc of HS : signal is "T4"; -- Driver VGA
--	attribute loc of VS	: signal is "U3"; -- Driver VGA
--	attribute loc of RGB : signal is "R9,T8,R8,N8,P8,P6,U5,U4"; -- Driver VGA
	
end VGA;

architecture Behavioral of VGA is
	-- Declaramos componentes
	COMPONENT BIN2BCD_0a999
	PORT(
		BIN : IN std_logic_vector(9 downto 0);          
		BCD2 : OUT std_logic_vector(3 downto 0);
		BCD1 : OUT std_logic_vector(3 downto 0);
		BCD0 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	-------------teclado----------------------------------------
    COMPONENT ps2_keyboard_to_ascii is
        GENERIC(
              clk_freq: INTEGER := 50_000_000; --system clock frequency in Hz
              ps2_debounce_counter_size : INTEGER := 8);         --set such that 2^size/clk_freq = 5us (size = 8 for 50MHz)
          PORT(
              clk1       : IN  STD_LOGIC;                     --system clock input
              ps2_clk    : IN  STD_LOGIC;                     --clock signal from PS2 keyboard
              ps2_data   : IN  STD_LOGIC;                     --data signal from PS2 keyboard
              ascii_new  : OUT STD_LOGIC;                     --output flag indicating new ASCII value
              ascii_code : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
      END COMPONENT;
	------------------------------------------------------
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
	-----------------------------------------------------
	COMPONENT SCORE_NUMBS 
	GENERIC ( LW: INTEGER:=10;
				 DW: INTEGER:=50;
				 DL: INTEGER:=100;
				 POSX: INTEGER:= 0;
				 POSY: INTEGER:= 0
         	); 
   PORT (  HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VALUE : in  STD_LOGIC_VECTOR (3 downto 0);
           PAINT : out  STD_LOGIC);
	end COMPONENT;
	-------------------------------------------------------------
	COMPONENT AlphaNumerico
	GENERIC ( LW: INTEGER:=10;
				 DW: INTEGER:=50;
				 DL: INTEGER:=100;
				 POSX: INTEGER:= 0;
				 POSY: INTEGER:= 0
         	); 
	PORT(
		ALPHANUM : IN std_logic_vector(6 downto 0);
		HCOUNT : IN std_logic_vector(10 downto 0);
		VCOUNT : IN std_logic_vector(10 downto 0);          
		PAINT : OUT std_logic
		);
	END COMPONENT;
	--------------------------------------------------------------------
    COMPONENT draw
        generic(SG_WD : integer range 0 to 31 := 5; --Segment width
                   DL : integer range 0 to 511 := 100;  --DYSPLAY_LENGTH
                   posx: integer range 0 to 640 := 0;
                   posy: integer range 0 to 480 := 0;
                   TUP: STD_LOGIC_VECTOR(6 DOWNTO 0) := x"65";--TECLAS
                   TDOWN: STD_LOGIC_VECTOR(6 DOWNTO 0):= x"65";
                   TSHOOT: STD_LOGIC_VECTOR(6 DOWNTO 0):= x"65"
            );  
    Port ( HCOUNT : in STD_LOGIC_VECTOR (10 downto 0);
           YCOUNT : in STD_LOGIC_VECTOR (10 downto 0);
           paint: out std_logic;
           posy_actual : out integer;
           posy_instante : out integer;
           tecla: in STD_LOGIC_VECTOR(6 DOWNTO 0); --ASCCI CODE
           player: in std_logic;
           presionando: in STD_LOGIC;
           enable_shoot: out STD_LOGIC; --Habilita disparo si no ha completado los 3 intentos
           clk : in std_logic --50MHz           
           );
    end component;
    -------------------------------------------------------
    COMPONENT shoot_izq
    generic(SG_WD : integer range 0 to 31 := 5; --Segment width
               DL : integer range 0 to 511 := 100; --DYSPLAY_LENGTH               
               posx: integer range 0 to 805 := 50;
               TSHOOT: STD_LOGIC_VECTOR(6 DOWNTO 0):= x"65"       
        );  
    Port ( HCOUNT : in STD_LOGIC_VECTOR (10 downto 0);
           YCOUNT : in STD_LOGIC_VECTOR (10 downto 0);
           paint: out std_logic;
           pos_act : OUT integer;
           POSX_ACTUAL : out integer;
           posy : in integer;
           velocidad: in STD_LOGIC_VECTOR(1 downto 0); --Distintas velocidades xd
           clk : in std_logic; --50MHz
           shoot_on : in std_logic ;
           shoot_count: out integer;
           presionando: in STD_LOGIC;
            ENABLE_TURNO: in STD_LOGIC;
           tecla: in STD_LOGIC_VECTOR(6 DOWNTO 0); --ASCCI CODE
           cont_disp: out INTEGER;
           counter_shoots: out INTEGER
           );
    end COMPONENT;
    ----------------------------------------------
    COMPONENT shoot_der
    generic(SG_WD : integer range 0 to 31 := 5; --Segment width
               DL : integer range 0 to 511 := 100; --DYSPLAY_LENGTH               
               posx: integer range 0 to 805 := 50;
               TSHOOT: STD_LOGIC_VECTOR(6 DOWNTO 0):= x"65" 
        ); 
    Port ( HCOUNT : in STD_LOGIC_VECTOR (10 downto 0);
           YCOUNT : in STD_LOGIC_VECTOR (10 downto 0);
           paint: out std_logic;
           pos_act : OUT integer;
           posy : in integer;
           velocidad: in STD_LOGIC_VECTOR(1 downto 0); --Distintas velocidades xd
           clk : in std_logic; --50MHz
           shoot_on : in std_logic ;
           shoot_count: out integer;
           POSX_ACTUAL : out integer;
           presionando: in STD_LOGIC;
           ENABLE_TURNO: in STD_LOGIC;
           tecla: in STD_LOGIC_VECTOR(6 DOWNTO 0); --ASCCI CODE
           cont_disp: out INTEGER;
           counter_shoots: out INTEGER
           );
    end COMPONENT;
	
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
      
	-- Declaramos senales
	signal hcount : STD_LOGIC_VECTOR (10 downto 0);
	signal vcount : STD_LOGIC_VECTOR (10 downto 0);
   signal paint2 : STD_LOGIC;
   signal paint1 : STD_LOGIC;
   signal paint0 : STD_LOGIC;
   -------------JUGADORES--------------------------------------------
   signal paint_sq : STD_LOGIC;--Paint para cuadrado 1.
   signal paint_sq2 : STD_LOGIC;--Paint para cuadrado 2.
   ---------------BALAS---------------------------------------------
   signal paint_shoot1: STD_LOGIC;--Paint para bala 1.
   signal paint_shoot2 : STD_LOGIC;--Paint para bala 2.
   signal disparos1, disparos2 : INTEGER;
   SIGNAL POS_BALA1, POS_BALA2 : INTEGER;
   SIGNAL posx_bala1, posx_bala2 : INTEGER;
   
   signal cont_balas1, cont_balas2, signal_counter_shoots, signal_counter_shoots2: INTEGER:=0;
   -----------------POSICIONES JUGADOR----------------------------------------
   signal player2_py : INTEGER;--Posición actual jugador 2
   signal player1_py : INTEGER;--Posición actual jugador 1
   
   SIGNAL py1_instante,py2_instante : INTEGER;
   signal enable_shoot1, enable_shoot2 : STD_LOGIC;
   SIGNAL turno_p1: STD_LOGIC := '1';
   SIGNAL turno_p2: STD_LOGIC := '0';
   --------------COLORES-------------------------------------------------
	signal rgb_aux1 : STD_LOGIC_VECTOR (2 downto 0);
	signal rgb_aux2 : STD_LOGIC_VECTOR (11 downto 0);
	signal rgb_aux3 : STD_LOGIC_VECTOR (11 downto 0);
	signal rgb_names : STD_LOGIC_VECTOR (2 downto 0):= "000";
    signal rgb_shot : STD_LOGIC_VECTOR (2 downto 0):= "100";
	--------------CONTADORES--------------------------------------------
	signal conteo_1, conteo_2 : std_logic_vector(9 downto 0);
	signal unidades_1, unidades_2 : std_logic_vector(3 downto 0);
	signal decenas_1, decenas_2 : std_logic_vector(3 downto 0);
	signal centenas_1, centenas_2 : std_logic_vector(3 downto 0);
	----------------RELOJ-------------------------------------------------
	signal CLK_1Hz, CLK_2,CLK_3 : STD_LOGIC:='0';
	signal count_clk,count_clk2,count_clk3 : INTEGER:=0;
	signal clk_interno : STD_LOGIC;
	---------------------------------
	signal sig_pixel_x, sig_pixel_y:  std_logic_vector (10 downto 0);
	signal rgb_aux0 : STD_LOGIC_VECTOR (11 downto 0); --Cuadrado 2 (derecha) p2
    signal sig_video_on: std_logic;
    ----------TECLADO---------------------------
    SIGNAL presionando      : STD_LOGIC;       
    SIGNAL tecla            : STD_LOGIC_VECTOR(6 DOWNTO 0);
    -------------NOMBRES-----------------------------------------
    SIGNAL P1,P2,P3,P4,P5,P6,P7,P8,P9 :std_logic ;
    signal W1: std_logic_vector(33 downto 0) := "0100000000000000000010011010000001";--S
    signal W2: std_logic_vector(33 downto 0) := "0011000111000001110100000010000000";--A
    signal W3: std_logic_vector(33 downto 0) := "0000001111011011111000000100000000"; --N
    signal W4: std_logic_vector(33 downto 0) := "1100000000111100000000000000000000";--T
    signal W5: std_logic_vector(33 downto 0) := "1100110000111100000000000000000000";--I
    
    signal W6: std_logic_vector(33 downto 0) := "0000001111000011111000000001000000";--M
    signal W7: std_logic_vector(33 downto 0) := "0011000111000001110100000010000000";--A
    signal W8: std_logic_vector(33 downto 0) := "0000001111011011111000000100000000";--N
    signal W9: std_logic_vector(33 downto 0) := "0000001110000011100000001000000001";--U
    
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
	
	CLK_DIV2: process(clk_interno)
	begin
		if(clk_interno'event and clk_interno='1') then
			if (count_clk2 = 125000) then
				count_clk2 <= 0;
				CLK_2 <= not CLK_2;
			else
				count_clk2 <= count_clk2 +1;
			end if;
		end if;
	end process;
	
	CLK_COLORS: process(clk_interno)
	begin
		if(clk_interno'event and clk_interno='1') then
			if (count_clk3 = 12500000) then
				count_clk3 <= 0;
				--count_clk3
				CLK_3 <= not CLK_3;
				rgb_names <= rgb_names + 1;
			else
				count_clk3 <= count_clk3 +1;
			end if;
		end if;
	end process;

	--TECLADO-------------
    ps2_keyboard:  ps2_keyboard_to_ascii
    GENERIC MAP
    (clk_freq => clk_const,
    ps2_debounce_counter_size => ps2_debounce_counter_size)
    PORT MAP(
        clk1 => clk,
        ps2_clk => ps2_clk,
        ps2_data => ps2_data,
        ascii_new => presionando,
        ascii_code => tecla
    );

	BIN2BCD_1: BIN2BCD_0a999 PORT MAP(
		BIN => conteo_1,
		BCD2 => centenas_1,
		BCD1 => decenas_1,
		BCD0 => unidades_1
	);
	
    BIN2BCD_2: BIN2BCD_0a999 PORT MAP(
        BIN => conteo_2,
        BCD2 => centenas_2,
        BCD1 => decenas_2,
        BCD0 => unidades_2
    );
	
	Display1: SCORE_NUMBS  
	GENERIC MAP (
		LW => 8,
		DW => 20,
		DL => 40,
		POSX => 10,
		POSY => 10)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => unidades_1,
		PAINT => paint2
	);

	Display2: SCORE_NUMBS 
	GENERIC MAP (
		LW => 8,
		DW => 20,
		DL => 40,
		POSX => 580,
		POSY => 10)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => unidades_2,
		PAINT => paint0
	);
    
    draw1 : draw
	GENERIC MAP (
		SG_WD => 10,
		DL => 50,
		posx => 0,
		posy => 100,
		--TURNO => '1',
		TUP => "1110111",--w
        TDOWN => "1110010",--r
        TSHOOT => "1100101"--e
        )
    port map (
		HCOUNT => hcount,
		yCOUNT => vcount,
		paint => paint_sq,        
        tecla=> tecla,
        presionando => presionando,
        player => '0',
        posy_instante => py1_instante,
        posy_actual => player1_py,
        enable_shoot => enable_shoot1,
        clk => clk_interno
    );
    
    draw2 : draw
	GENERIC MAP (
		SG_WD => 10,
		DL => 50,
		posx => 630,
		posy => 100,
		TUP => "1101001",--i
        TDOWN => "1110000",--p 
        TSHOOT => "1101111" --o
        )
    port map (
		HCOUNT => hcount,
		yCOUNT => vcount,
		paint => paint_sq2,
        clk => clk_interno,
        tecla=> tecla,
        presionando => presionando,
        player => '1',
        posy_actual => player2_py,
        enable_shoot => enable_shoot2,
        posy_instante => py2_instante
        
    );
    
    bala1: shoot_izq
	GENERIC MAP (
		SG_WD => 31,
		DL => 20,
		posx => 800,
		TSHOOT => "1100101"--e
		)
		
    port map (
		HCOUNT => hcount,
		yCOUNT => vcount,
		paint => paint_shoot1,
		pos_act => POS_BALA1,
		posy => py1_instante,
		POSX_ACTUAL => posx_bala1,
		velocidad => sw,
		shoot_on => enable_shoot1,
        clk => clk_interno,
        tecla=> tecla,
        presionando => presionando,
        ENABLE_TURNO => turno_p1,
        cont_disp => disparos1,
        counter_shoots => signal_counter_shoots
    );
    
    bala2: shoot_der
	GENERIC MAP (
		SG_WD => 31,
		DL => 20,
		posx => 800,
		TSHOOT => "1101111"--o
		)
		
    port map (
		HCOUNT => hcount,
		yCOUNT => vcount,
		paint => paint_shoot2,
		pos_act => POS_BALA2,
		POSX_ACTUAL => posx_bala2,
		posy => py2_instante,
		velocidad => sw,
		shoot_on => enable_shoot2,
        clk => clk_interno,
        tecla=> tecla,
        presionando => presionando,
        ENABLE_TURNO => turno_p2,
        cont_disp => disparos2,
        counter_shoots => signal_counter_shoots2
    );
    
    
    logica: process(posx_bala1, player2_py, posx_bala2,player1_py,CLK_2)
    BEGIN
        if (CLK_2'event and CLK_2='1') then
            IF(posx_bala2 < 10 and posx_bala2 > 0 and POS_BALA2+20 > player1_py and POS_BALA2 <  player1_py +80) then
                conteo_1 <= conteo_1 + 1;
                
                            
             end if;
            IF(posx_bala1 < 640 and posx_bala1 > 630 and POS_BALA1 +20 > player2_py and POS_BALA1<  player2_py +80) then
                conteo_2 <= conteo_2 + 1;
            end if;
       END IF;
    END PROCESS;
    

    logica_turnos: process(posx_bala1, player2_py, posx_bala2,player1_py,CLK_2,cont_balas1,cont_balas2)
    variable colide1,colide2 : std_logic := '0';
    variable ha_empezado1, ha_empezado2 : std_logic := '0';
    BEGIN
        
        IF (CLK_2'event and CLK_2='1') then
           if(presionando = '1' and tecla = "1101111" and ha_empezado2 = '0') then  --jugador 2
                ha_empezado2 := '1';
           end if;
           if(presionando = '1' and tecla = "1100101" and ha_empezado1 = '0') then  --jugador 1
                ha_empezado1 := '1';
           end if;
                IF(posx_bala2  >-80 and posx_bala2 <10 and ha_empezado2= '1') then                 
                    cont_balas2 <= cont_balas2 + 1;
                    ha_empezado2 := '0';
                    if(cont_balas2 = 3) then
                        cont_balas2 <= 0;
                        turno_p2 <= '0'; --Turno esta activo si es = 1
                        turno_p1 <= '1';
                       end if;
            end if;
            IF(posx_bala1 >630 and posx_bala1 < 700 and ha_empezado1 = '1' ) then 
                ha_empezado1 := '0';
                cont_balas1 <= cont_balas1 + 1;
                if(cont_balas1 = 3) then
                    cont_balas1 <= 0;
                    turno_p1 <= '0'; --Turno esta activo si es = 1
                    turno_p2 <= '1';
                   end if;
            end if;            
       END IF;
    END PROCESS;
 
    
    	L_S: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 35)
	PORT MAP(
	    posx=> 40,
	    posy=> 5,
	    segments => W1,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P1
	);
	
	L_A: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 35)
	PORT MAP(
	    posx=> 70,
	    posy=> 5,
	    segments => W2,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P2
	);
	    	L_N: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 35)
	PORT MAP(
	    posx=> 100,
	    posy=> 5,
	    segments => W3,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P3
	);
	    	L_T: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 35)
	PORT MAP(
	    posx=> 130,
	    posy=> 5,
	    segments => W4,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P4
	);
	    	L_I: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 35)
	PORT MAP(
	    posx=> 160,
	    posy=> 5,
	    segments => W5,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P5
	);
	L_M: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 35)
	PORT MAP(
	    posx=> 420,
	    posy=> 5,
	    segments => W6,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P6
	);
		L_A2: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 35)
	PORT MAP(
	    posx=> 450,
	    posy=> 5,
	    segments => W7,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P7
	);
		L_N2: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 37)
	PORT MAP(
	    posx=> 480,
	    posy=> 5,
	    segments => W8,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P8
	);
		L_U: display34segm 
	
	GENERIC MAP (
		SG_WD => 3,
		DL => 37)
	PORT MAP(
	    posx=> 510,
	    posy=> 5,
	    segments => W9,
		HCOUNT => hcount,
		VCOUNT => vcount,
		PAINT => P9
	);
	rgb_aux1 <= "010" when paint2='1' else --display 1
				"001" when paint0='1' else --display 2
				"010" when paint_sq='1' else --player1
				"001" when paint_sq2='1' else --player2
				"011" when paint_shoot1='1' else --bala 1
				"011" when paint_shoot2='1' else --bala 2
				rgb_names when P1='1' else rgb_names when P2='1' else rgb_names when P3='1' else rgb_names when P4='1' else --LETRAS NOMBRE 1 
				rgb_names when P5='1' else rgb_names when P6='1' else rgb_names when P7='1' else rgb_names when P8='1' else --LETRAS NOMBRE 2
--				"010" when P1='1' else "010" when P2='1' else "010" when P3='1' else "010" when P4='1' else 
--				"010" when P5='1' else "010" when P6='1' else "010" when P7='1' else "010" when P8='1' else 
				--"100" when alto_senal > 0 and alto_senal > 70; 
				rgb_names when P9='1' else 
				
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

