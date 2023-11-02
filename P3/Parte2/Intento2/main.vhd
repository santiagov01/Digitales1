----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2023 04:24:00 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port (
        B0, B1: in std_logic_vector ( 3 downto 0);
        addres: in std_logic_vector(2 downto 0);
        CLK: in std_logic ;
        SEL: in std_logic_vector (1 downto 0);
        en0, en1: in std_logic;
        C, breset: in std_logic;        --C de control
        S7_sg: out std_logic_vector (6 downto 0);
        carry_led: out std_logic
     );
end main;

architecture Behavioral of main is
constant x: integer := 4;

------------------SEÑALES------------------------------

signal BA_temp : std_logic_vector(3 downto 0);
signal BB_temp : std_logic_vector(3 downto 0);
signal clk1_temp: std_logic ;
--signal clk1_temp_2: std_logic;
signal Q1: std_logic_VECTOR(3 downto 0); --Salida Flip flop 1
signal Q2: std_logic_VECTOR(3 downto 0); --Salida Flip flop 2
signal Q3: std_logic_VECTOR(3 downto 0); --Salida Flip flop 3
signal Control: std_logic_vector(1 downto 0);
signal OutALU: std_logic_vector(3 downto 0);
signal displayout: std_logic_vector(6 downto 0);


COMPONENT FF
    generic( N :integer := 4);
    Port (
        D: in std_logic_vector (N-1 downto  0);
        en: in std_logic;
        clk: in std_logic ;
        Q : out std_logic_vector(N-1 downto 0)
);
END COMPONENT;

COMPONENT ALU
generic(N: integer := 4);
port(
        entradaControl: in std_logic_vector(N-3 downto 0); 
        BUSA,BUSB: in std_logic_vector(N-1 downto 0);
        SalidaAlu: out std_logic_vector(N-1 downto 0);
        carry: out std_logic
        --SalidaFF: out std_logic_vector(N-1 downto 0) 
    );
END COMPONENT;

COMPONENT clock
generic (PERIOD : integer:= 10000);
PORT(
            CLK: in std_logic;
        reset: in std_logic;
        clk1: out std_logic

);
END COMPONENT;

COMPONENT ROM
PORT(
           addrs : in std_logic_vector (2 downto 0);
         data : out  STD_LOGIC_VECTOR (3 downto 0)

);
END COMPONENT;

COMPONENT driver_triestado
PORT(
        B0, B1: in std_logic_vector ( 3 downto 0);
        control : in std_logic;
        sal: out std_logic_vector ( 3 downto 0)

);
END COMPONENT;

COMPONENT deco_display
port (
		binary_number : in STD_LOGIC_VECTOR(3 downto 0);
        display : out STD_LOGIC_VECTOR(6 downto 0)
   	
	);
END COMPONENT;

begin
    DRIV3: driver_triestado PORT MAP(
        B0 => B0,
        B1 => B1,
        control => C,
        sal => BA_temp
    );
    
    reloj: clock PORT MAP(
        CLK => clk,
        reset => breset,
        clk1 => clk1_temp    
    );
    FF1: FF PORT MAP(
        D =>BA_temp,
        en => en0,
        clk => clk1_temp,
        Q => Q1
    );
    MYROM: ROM PORT MAP(
        addrs => addres,
        data =>BB_temp    
    );
    FF2: FF PORT MAP(
        D=>BB_temp,
        en => en0,
        clk => clk1_temp,
        Q => Q2        
            
    );
    
    ALU2: ALU PORT MAP(
      entradaControl => SEL,
      BUSA => Q1,
      BUSB => Q2,
      SalidaAlu => OutAlu,
      carry => carry_led
    );
    
     FF3: FF PORT MAP(
        D=>OutAlu,
        en => en1,
        clk => clk1_temp,
        Q => Q3        
            
    );
    
    DECO: deco_display PORT MAP(
    binary_number=>Q3,
    display=>displayout
    );
    s7_sg <= displayout;
    

end Behavioral;
