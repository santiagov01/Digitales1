-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 31.10.2020 01:01:21 UTC

library ieee;
use ieee.std_logic_1164.all;

-- Agregar librerias necesarias
use ieee.std_logic_textio.all;
library STD;
use STD.textio.all;

entity tb_Simple_Test_VGA is
end tb_Simple_Test_VGA;

architecture tb of tb_Simple_Test_VGA is

    component Simple_Test_VGA
        port (clk     : in std_logic;
              reset   : in std_logic;
              sw      : in std_logic_vector (1 downto 0);
              hsync   : out std_logic;
              vsync   : out std_logic;
              rgb_out : out std_logic_vector (11 downto 0));
    end component;

    signal clk     : std_logic;
    signal reset   : std_logic;
    signal sw      : std_logic_vector (1 downto 0);
    signal hsync   : std_logic;
    signal vsync   : std_logic;
    signal rgb_out : std_logic_vector (11 downto 0);

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Simple_Test_VGA
    port map (clk     => clk,
              reset   => reset,
              sw      => sw,
              hsync   => hsync,
              vsync   => vsync,
              rgb_out => rgb_out);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        sw <= "00";
        wait until vsync'event and vsync='0'; 
        reset <= '0';
        sw <= "01";
        wait until vsync'event and vsync='0'; 
        sw <= "10";
        wait until vsync'event and vsync='0'; 
        sw <= "11";
        wait until vsync'event and vsync='0'; 
    end process;
    
    process (clk)
	
	file file_pointer: text open WRITE_MODE is "vga_sync_test_tb.txt";
	variable line_el: line;
		
	begin

		if rising_edge(clk) then

			-- Write the time
			write(line_el, now); -- write the line.
			write(line_el, string'(":")); -- write the line.

			-- Write the hsync
			write(line_el, string'(" "));
			write(line_el, hsync); -- write the line.

			-- Write the vsync
			write(line_el, string'(" "));
			write(line_el, vsync); -- write the line.

			-- Write the red
			write(line_el, string'(" "));
			write(line_el, rgb_out(11 downto 8)); -- write the line (Red color).
			--write(line_el, red); -- write the line (Red color).

			-- Write the green
			write(line_el, string'(" "));
			write(line_el, rgb_out(7 downto 4)); -- write the line (Green color).
			--write(line_el, green); -- write the line (Green color).


        	-- Write the blue
        	write(line_el, string'(" "));
			write(line_el, rgb_out(3 downto 0)); -- write the line (Blue color).
			--write(line_el, blue); -- write the line (Blue color).

    	    writeline(file_pointer, line_el); -- write the contents into the file.

    	end if;
	end process;	

end tb;

