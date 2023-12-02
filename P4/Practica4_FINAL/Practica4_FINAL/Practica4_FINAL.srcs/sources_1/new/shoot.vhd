library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shoot_izq is
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
           ENABLE_TURNO : IN STD_LOGIC;
           tecla: in STD_LOGIC_VECTOR(6 DOWNTO 0); --ASCCI CODE
           cont_disp: out INTEGER;
           counter_shoots: out INTEGER
           );
end shoot_izq;

architecture Behavioral of shoot_izq is

signal count: integer range 0 to 25000000;
signal COLOR: STD_LOGIC_VECTOR (11 downto 0);
signal clk_1Hz: std_logic;
signal pos_x: integer := posx;
signal state_shoot: std_logic;
signal dx: integer;


constant L: INTEGER := DL;
constant W: INTEGER := SG_WD;
constant SXI : INTEGER := posx;--segmeno x izquierda
signal posy_ini: integer := posy;

signal posy_const : integer := 0;

--signal cantidad_disparos : integer = 0;

--signal turno_sg : STD_LOGIC := TURNO_INICIAL;
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
     
--     process(clk_1Hz)
--     begin
--        if(clk_1Hz'event and clk_1Hz = '1')then --Probar implimentando un botón
--         if( shoot_on = '1') then
--            pos_x <= pos_x + 1;
--                if(pos_x > 540)then
--                    pos_x <= 0;  
--                    state_shoot <= '0';
--                end if;
--          else
--            pos_x <= 0;
--           end if;
--        end if;
--     end process;
     
     PROCESS(presionando, tecla,clk_1Hz)
     variable pos_constante_player : INTEGER := 0;
     variable contador_disparos_var : integer:=0;
     begin
      if (ENABLE_TURNO = '1') then
        --if contador_disparos_var < 3 then
        if(clk_1Hz'event and clk_1Hz='1')then
        POSX_ACTUAL <= pos_x;
            if presionando = '1' then
                if tecla = TSHOOT  and state_shoot = '0' then--disparo                   
                    state_shoot<= '1';
                    pos_constante_player := posy;
                    posy_const <= pos_constante_player;
                    pos_x <= 0;
                    contador_disparos_var := contador_disparos_var+1;
--                    if contador_disparos_var = 3 then
--                      contador_disparos_var := 0;
--                      pos_x <= -80;
--                     end if;
               end if;
            end if;
            --
            if state_shoot = '1' then
                pos_x <= pos_x + dx;
                if(pos_x > 640)then
                    pos_x <= -80;  
                    state_shoot <= '0';
                    --contador_disparos_var := contador_disparos_var + 1;
                    cont_disp <= contador_disparos_var;
                 end if;
--              else
--              pos_x <= -80;
               end if;
             end if;
           --end if;
         else
--contador_disparos_var := 0;
            pos_x<= -200;
         END IF;
         counter_shoots<=contador_disparos_var;
         end process;
    pos_act <= posy_const;
     
     --Ajustar velocidad de acuerdo a switch
    dx <= 5 when velocidad <= "00" else
          6 when velocidad <= "01" else
          7 when velocidad <= "10" else
          8;
    

    paint <= '1' WHEN(((yCOUNT>=posy_const) AND (yCOUNT<=posy_const+DL) AND (HCOUNT>=pos_x) AND (HCOUNT<=pos_x+SG_WD)))
         ELSE '0';

--RRRR GGGG BBB
--COLOR <=x"F00";
 		
--rgb_out <= COLOR when ((pix_x>=posx) AND (pix_x<=posx+SG_WD) AND (pix_y>=pos_y) AND (pix_y<=pos_y+DL)) else  not COLOR;
--rgb_out <= COLOR when ((pix_y>=150) AND (pix_y<=200) AND (pix_x>=pos_x) AND (pix_x<=pos_x+50)) else  not COLOR;

end Behavioral;