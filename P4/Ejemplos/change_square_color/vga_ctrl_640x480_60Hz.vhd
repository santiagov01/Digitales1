------------------------------------------------------------------------
-- vga_controller_640_60.vhd
------------------------------------------------------------------------
-- Author : Ulrich Zoltn
--          Copyright 2006 Digilent, Inc.
------------------------------------------------------------------------
-- Software version : Xilinx ISE 7.1.04i
--                    WebPack
-- Device	        : 3s200ft256-4
------------------------------------------------------------------------
-- This file contains the logic to generate the synchronization signals,
-- horizontal and vertical pixel counter and video disable signal
-- for the 640x480@60Hz resolution.
------------------------------------------------------------------------
--  Behavioral description
------------------------------------------------------------------------
-- Please read the following article on the web regarding the
-- vga video timings:
-- http://www.epanorama.net/documents/pc/vga_timing.html

-- This module generates the video synch pulses for the monitor to
-- enter 640x480@60Hz resolution state. It also provides horizontal
-- and vertical counters for the currently displayed pixel and a blank
-- signal that is active when the pixel is not inside the visible screen
-- and the color outputs should be reset to 0.

-- timing diagram for the horizontal synch signal (HS)
-- 0                         648    744           800 (pixels)
-- -------------------------|______|-----------------
-- timing diagram for the vertical synch signal (VS)
-- 0                                  482    484  525 (lines)
-- -----------------------------------|______|-------

-- The blank signal is delayed one pixel clock period (40ns) from where
-- the pixel leaves the visible screen, according to the counters, to
-- account for the pixel pipeline delay. This delay happens because
-- it takes time from when the counters indicate current pixel should
-- be displayed to when the color data actually arrives at the monitor
-- pins (memory read delays, synchronization delays).
------------------------------------------------------------------------
--  Port definitions
------------------------------------------------------------------------
-- rst               - global reset signal
-- clk         		- input clock of 50MHz
-- rgb_in				- input 12 bits with the pixel color in RGB (RRRRGGGGBBBB) format
-- HS                - output pin, to monitor horizontal synch pulse
-- VS                - output pin, to monitor vertical synch pulse
-- hcount            - output pin, 11 bits, to clients horizontal count of the currently displayed pixel (even if not in visible area)
-- vcount            - output pin, 11 bits, to clients vertical count of the currently active video line (even if not in visible area)
-- blank             - output pin, to clients active when pixel is not in visible area.
-- rgb_out				- output pins, 8 registered bits with the pixel color in RGB (RRRRGGGGBBBB) format

------------------------------------------------------------------------
-- Revision History:
-- 09/18/2006(UlrichZ): created
-- 05/14/2014(RAVV): clock divisor included in module, 
--                   added rgb_in and rgb_out to avoid screen glitches
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- simulation library
library UNISIM;
use UNISIM.VComponents.all;

-- the vga_controller_640_60 entity declaration
-- read above for behavioral description and port definitions.
entity vga_ctrl_640x480_60Hz is
port(
   rst         : in std_logic;
   clk   : in std_logic;
   rgb_in     : in std_logic_vector(11 downto 0);

   HS          : out std_logic;
   VS          : out std_logic;
   hcount      : out std_logic_vector(10 downto 0);
   vcount      : out std_logic_vector(10 downto 0);
   rgb_out     : out std_logic_vector(11 downto 0);--R3R2R1R0GR3GR3GR3GR3B3B2B1B0
   blank       : out std_logic
);
end vga_ctrl_640x480_60Hz;

architecture Behavioral of vga_ctrl_640x480_60Hz is

------------------------------------------------------------------------
-- CONSTANTS
------------------------------------------------------------------------

-- maximum value for the horizontal pixel counter
constant HMAX  : std_logic_vector(10 downto 0) := "01100100000"; -- 800
-- maximum value for the vertical pixel counter
constant VMAX  : std_logic_vector(10 downto 0) := "01000001101"; -- 525
-- total number of visible columns
constant HLINES: std_logic_vector(10 downto 0) := "01010000000"; -- 640
-- value for the horizontal counter where front porch ends
constant HFP   : std_logic_vector(10 downto 0) := "01010001000"; --655  01010001111   -- 648 01010001000
-- value for the horizontal counter where the synch pulse ends
constant HSP   : std_logic_vector(10 downto 0) := "01011101000"; -- 751   01011101111    -- 744 01011101000
-- total number of visible lines
constant VLINES: std_logic_vector(10 downto 0) := "00111100000"; -- 480
-- value for the vertical counter where the front porch ends
constant VFP   : std_logic_vector(10 downto 0) := "00111100010"; --489   00111101001  -- 482  00111100010
-- value for the vertical counter where the synch pulse ends
constant VSP   : std_logic_vector(10 downto 0) := "00111100100"; --491  00111101011    -- 484 00111100100
-- polarity of the horizontal and vertical synch pulse
-- only one polarity used, because for this resolution they coincide.
constant SPP   : std_logic := '0';

------------------------------------------------------------------------
-- SIGNALS
------------------------------------------------------------------------

-- horizontal and vertical counters
signal hcounter : std_logic_vector(10 downto 0) := (others => '0');
signal vcounter : std_logic_vector(10 downto 0) := (others => '0');

-- active when inside visible screen area.
signal video_enable: std_logic;
signal clk_25MHz: std_logic := '0';

begin

   -- output horizontal and vertical counters
   hcount <= hcounter;
   vcount <= vcounter;

   -- blank is active when outside screen visible area
   -- color output should be blacked (put on 0) when blank in active
   -- blank is delayed one pixel clock period from the video_enable
   -- signal to account for the pixel pipeline delay.
   blank <= not video_enable when rising_edge(clk_25MHz);

   -- increment horizontal counter at clk_25MHz rate
   -- until HMAX is reached, then reset and keep counting
   h_count: process(clk_25MHz)
   begin
      if(rising_edge(clk_25MHz)) then
         if(rst = '1') then
            hcounter <= (others => '0');
         elsif(hcounter = HMAX) then
            hcounter <= (others => '0');
         else
            hcounter <= hcounter + 1;
         end if;
      end if;
   end process h_count;

   -- increment vertical counter when one line is finished
   -- (horizontal counter reached HMAX)
   -- until VMAX is reached, then reset and keep counting
   v_count: process(clk_25MHz)
   begin
      if(rising_edge(clk_25MHz)) then
         if(rst = '1') then
            vcounter <= (others => '0');
         elsif(hcounter = HMAX) then
            if(vcounter = VMAX) then
               vcounter <= (others => '0');
            else
               vcounter <= vcounter + 1;
            end if;
         end if;
      end if;
   end process v_count;

   -- generate horizontal synch pulse
   -- when horizontal counter is between where the
   -- front porch ends and the synch pulse ends.
   -- The HS is active (with polarity SPP) for a total of 96 pixels.
   do_hs: process(clk_25MHz)
   begin
      if(rising_edge(clk_25MHz)) then
         if(hcounter >= HFP and hcounter < HSP) then
            HS <= SPP;
         else
            HS <= not SPP;
         end if;
      end if;
   end process do_hs;

   -- generate vertical synch pulse
   -- when vertical counter is between where the
   -- front porch ends and the synch pulse ends.
   -- The VS is active (with polarity SPP) for a total of 2 video lines
   -- = 2*HMAX = 1600 pixels.
   do_vs: process(clk_25MHz)
   begin
      if(rising_edge(clk_25MHz)) then
         if(vcounter >= VFP and vcounter < VSP) then
            VS <= SPP;
         else
            VS <= not SPP;
         end if;
      end if;
   end process do_vs;
   
   -- enable video output when pixel is in visible area
   video_enable <= '1' when (hcounter < HLINES and vcounter < VLINES) else '0';
	
		process (clk)
	begin  
		if (clk'event and clk = '1') then
			clk_25MHz <= NOT clk_25MHz;
		end if;
	end process;
	
	process (clk_25MHz)
	begin
		if (rising_edge(clk_25MHz)) then
			if video_enable = '0' then
				rgb_out <= "000000000000";
			else
				rgb_out <= rgb_in;
			end if;
		end if;
	end process;

end Behavioral;
