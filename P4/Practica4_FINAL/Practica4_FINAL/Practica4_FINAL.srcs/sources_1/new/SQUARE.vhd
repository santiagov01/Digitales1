library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity draw is
    generic(SG_WD : integer range 0 to 31 := 5; --Segment width
               DL : integer range 0 to 511 := 100;  --DYSPLAY_LENGTH
               posx: integer range 0 to 640 := 0;
               posy: integer range 0 to 480 := 0;
               TUP: STD_LOGIC_VECTOR(6 DOWNTO 0) := x"65";--TECLAS
               TDOWN: STD_LOGIC_VECTOR(6 DOWNTO 0):= x"65";
               TSHOOT: STD_LOGIC_VECTOR(6 DOWNTO 0):= x"65";
               TURNO : std_logic := '1' --Indica cual jugador empieza a jugar
               
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
------------------------------------
constant BORDER_UP : integer := 60;
constant BORDER_DOWN : INTEGER := 480 - DL;
------------------------------------------
CONSTANT VEL : integer := 2;
begin
    --enable_shoot <= '0';
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
     
     PROCESS(tecla,presionando,clk_1Hz)
     variable pos_actual_const : INTEGER := 0;     
     --variable total_disparos : INTEGER :=0;
    begin
        if(clk_1Hz'event and clk_1Hz='1')then
        posy_actual <= pos_y;
        pos_actual_const := pos_y; --Asignar la posición actual del jugador
        posy_instante <= pos_actual_const;
        if presionando = '1' then
        ---Funciona para cualquier jugador. Las teclas respectivas se ponen en GENERIC            
               if tecla = TDOWN then--MOVER ABAJO
                 pos_y <= pos_y + VEL;
                 if(pos_y > BORDER_DOWN)then
                    pos_y <= BORDER_DOWN;
                 end if;
            elsif tecla = TUP then-- ARRIBA
                    pos_y <= pos_y - VEL;
                    if(pos_y < BORDER_UP)then
                        pos_y <= BORDER_UP;
                     end if;     
                end if;          
        end if;
      end if;
    end process;
    
    
    paint <= '1' WHEN(((HCOUNT>=posx) AND (HCOUNT<=posx+SG_WD) AND (YCOUNT>=pos_y) AND (YCOUNT<=pos_y+DL)))
         ELSE '0';

end Behavioral;