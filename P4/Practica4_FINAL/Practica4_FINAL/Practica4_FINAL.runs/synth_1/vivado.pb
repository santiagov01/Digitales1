
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:172default:default2
00:00:202default:default2
430.4962default:default2
160.5432default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/utils_1/imports/synth_1/VGA.dcp}2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/utils_1/imports/synth_1/VGA.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
p
Command: %s
53*	vivadotcl2?
+synth_design -top VGA -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
_
#Helper process launched with PID %s4824*oasys2
25922default:defaultZ8-7075h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1248.125 ; gain = 410.754
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2
VGA2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
612default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter clk_freq bound to: 50000000 - type: integer 
2default:defaulth p
x
� 
n
%s
*synth2V
B	Parameter ps2_debounce_counter_size bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
ps2_keyboard_to_ascii2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard_to_ascii.vhd2default:default2
262default:default2 
ps2_keyboard2default:default2)
ps2_keyboard_to_ascii2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3122default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2)
ps2_keyboard_to_ascii2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard_to_ascii.vhd2default:default2
382default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter clk_freq bound to: 50000000 - type: integer 
2default:defaulth p
x
� 
n
%s
*synth2V
B	Parameter ps2_debounce_counter_size bound to: 8 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter clk_freq bound to: 50000000 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter debounce_counter_size bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
ps2_keyboard2default:default2�
~D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard.vhd2default:default2
262default:default2"
ps2_keyboard_02default:default2 
ps2_keyboard2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard_to_ascii.vhd2default:default2
692default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2 
ps2_keyboard2default:default2�
~D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard.vhd2default:default2
382default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter clk_freq bound to: 50000000 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter debounce_counter_size bound to: 8 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter COUNT_MAX bound to: 255 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter COUNT_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

debouncing2default:default2�
zD:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/debounce.vhd2default:default2
132default:default2$
debounce_ps2_clk2default:default2

debouncing2default:default2�
~D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard.vhd2default:default2
682default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

debouncing2default:default2�
zD:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/debounce.vhd2default:default2
212default:default8@Z8-638h px� 
`
%s
*synth2H
4	Parameter COUNT_MAX bound to: 255 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter COUNT_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

debouncing2default:default2
02default:default2
12default:default2�
zD:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/debounce.vhd2default:default2
212default:default8@Z8-256h px� 
`
%s
*synth2H
4	Parameter COUNT_MAX bound to: 255 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter COUNT_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

debouncing2default:default2�
zD:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/debounce.vhd2default:default2
132default:default2%
debounce_ps2_data2default:default2

debouncing2default:default2�
~D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard.vhd2default:default2
742default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
ps2_keyboard2default:default2
02default:default2
12default:default2�
~D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard.vhd2default:default2
382default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2)
ps2_keyboard_to_ascii2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/ps2_keyboard_to_ascii.vhd2default:default2
382default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
BIN2BCD_0a9992default:default2�
D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/BIN2BCD_0a999.vhd2default:default2
252default:default2
	BIN2BCD_12default:default2!
BIN2BCD_0a9992default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3242default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2!
BIN2BCD_0a9992default:default2�
D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/BIN2BCD_0a999.vhd2default:default2
322default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
BIN2BCD_0a9992default:default2
02default:default2
12default:default2�
D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/BIN2BCD_0a999.vhd2default:default2
322default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
BIN2BCD_0a9992default:default2�
D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/BIN2BCD_0a999.vhd2default:default2
252default:default2
	BIN2BCD_22default:default2!
BIN2BCD_0a9992default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3312default:default8@Z8-3491h px� 
W
%s
*synth2?
+	Parameter LW bound to: 8 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DW bound to: 20 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 40 - type: integer 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter POSX bound to: 10 - type: integer 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter POSY bound to: 10 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SCORE_NUMBS2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
252default:default2
Display12default:default2
SCORE_NUMBS2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3382default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SCORE_NUMBS2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
382default:default8@Z8-638h px� 
W
%s
*synth2?
+	Parameter LW bound to: 8 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DW bound to: 20 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 40 - type: integer 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter POSX bound to: 10 - type: integer 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter POSY bound to: 10 - type: integer 
2default:defaulth p
x
� 
�
default block is never used226*oasys2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
782default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SCORE_NUMBS2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
382default:default8@Z8-256h px� 
W
%s
*synth2?
+	Parameter LW bound to: 8 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DW bound to: 20 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 40 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter POSX bound to: 580 - type: integer 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter POSY bound to: 10 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SCORE_NUMBS2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
252default:default2
Display22default:default2
SCORE_NUMBS2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3522default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2/
SCORE_NUMBS__parameterized12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
382default:default8@Z8-638h px� 
W
%s
*synth2?
+	Parameter LW bound to: 8 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DW bound to: 20 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 40 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter POSX bound to: 580 - type: integer 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter POSY bound to: 10 - type: integer 
2default:defaulth p
x
� 
�
default block is never used226*oasys2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
782default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2/
SCORE_NUMBS__parameterized12default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SCORE_NUMBS.vhd2default:default2
382default:default8@Z8-256h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 10 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 50 - type: integer 
2default:defaulth p
x
� 
Y
%s
*synth2A
-	Parameter posx bound to: 0 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posy bound to: 100 - type: integer 
2default:defaulth p
x
� 
Q
%s
*synth29
%	Parameter TUP bound to: 7'b1110111 
2default:defaulth p
x
� 
S
%s
*synth2;
'	Parameter TDOWN bound to: 7'b1110010 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1100101 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
draw2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
52default:default2
draw12default:default2
draw2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3662default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
draw2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
302default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 10 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 50 - type: integer 
2default:defaulth p
x
� 
Y
%s
*synth2A
-	Parameter posx bound to: 0 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posy bound to: 100 - type: integer 
2default:defaulth p
x
� 
Q
%s
*synth29
%	Parameter TUP bound to: 7'b1110111 
2default:defaulth p
x
� 
S
%s
*synth2;
'	Parameter TDOWN bound to: 7'b1110010 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1100101 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
draw2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
302default:default8@Z8-256h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 10 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 50 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posx bound to: 630 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posy bound to: 100 - type: integer 
2default:defaulth p
x
� 
Q
%s
*synth29
%	Parameter TUP bound to: 7'b1101001 
2default:defaulth p
x
� 
S
%s
*synth2;
'	Parameter TDOWN bound to: 7'b1110000 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1101111 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
draw2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
52default:default2
draw22default:default2
draw2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3902default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2(
draw__parameterized12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
302default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 10 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 50 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posx bound to: 630 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posy bound to: 100 - type: integer 
2default:defaulth p
x
� 
Q
%s
*synth29
%	Parameter TUP bound to: 7'b1101001 
2default:defaulth p
x
� 
S
%s
*synth2;
'	Parameter TDOWN bound to: 7'b1110000 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1101111 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2(
draw__parameterized12default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
302default:default8@Z8-256h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 31 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 20 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posx bound to: 800 - type: integer 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1100101 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	shoot_izq2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot.vhd2default:default2
52default:default2
bala12default:default2
	shoot_izq2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
4142default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	shoot_izq2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot.vhd2default:default2
302default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 31 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 20 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posx bound to: 800 - type: integer 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1100101 
2default:defaulth p
x
� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2 
ENABLE_TURNO2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot.vhd2default:default2
792default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	shoot_izq2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot.vhd2default:default2
302default:default8@Z8-256h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 31 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 20 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posx bound to: 800 - type: integer 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1101111 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	shoot_der2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot_der.vhd2default:default2
52default:default2
bala22default:default2
	shoot_der2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
4392default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	shoot_der2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot_der.vhd2default:default2
292default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter SG_WD bound to: 31 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 20 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter posx bound to: 800 - type: integer 
2default:defaulth p
x
� 
T
%s
*synth2<
(	Parameter TSHOOT bound to: 7'b1101111 
2default:defaulth p
x
� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2 
ENABLE_TURNO2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot_der.vhd2default:default2
762default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	shoot_der2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/shoot_der.vhd2default:default2
292default:default8@Z8-256h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_S2default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
5142default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
342default:default8@Z8-638h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
display34segm2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
342default:default8@Z8-256h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_A2default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
5282default:default8@Z8-3491h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_N2default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
5412default:default8@Z8-3491h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_T2default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
5542default:default8@Z8-3491h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_I2default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
5672default:default8@Z8-3491h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_M2default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
5802default:default8@Z8-3491h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 35 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_A22default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
5932default:default8@Z8-3491h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 37 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_N22default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
6062default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys21
display34segm__parameterized22default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
342default:default8@Z8-638h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 37 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys21
display34segm__parameterized22default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
342default:default8@Z8-256h px� 
Z
%s
*synth2B
.	Parameter SG_WD bound to: 3 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter DL bound to: 37 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/display34segm2.vhd2default:default2
212default:default2
L_U2default:default2!
display34segm2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
6192default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
vga_ctrl_640x480_60Hz2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/vga_ctrl_640x480_60Hz.vhd2default:default2
712default:default2.
Inst_vga_ctrl_640x480_60Hz2default:default2)
vga_ctrl_640x480_60Hz2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
6482default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2)
vga_ctrl_640x480_60Hz2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/vga_ctrl_640x480_60Hz.vhd2default:default2
862default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2)
vga_ctrl_640x480_60Hz2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/vga_ctrl_640x480_60Hz.vhd2default:default2
862default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
VGA2default:default2
02default:default2
12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
612default:default8@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2%
posy_instante_reg2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
662default:default8@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2 
enable_shoot2default:default2
draw2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
242default:default8@Z8-3848h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2%
posy_instante_reg2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
662default:default8@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2 
enable_shoot2default:default2(
draw__parameterized12default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/SQUARE.vhd2default:default2
242default:default8@Z8-3848h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2!
count_clk_reg2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
2762default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
CLK_1Hz_reg2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
2782default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
	CLK_3_reg2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.srcs/sources_1/new/VGA.vhd2default:default2
3032default:default8@Z8-6014h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
shoot_on2default:default2
	shoot_der2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
shoot_on2default:default2
	shoot_izq2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
enable_shoot2default:default2(
draw__parameterized12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
player2default:default2(
draw__parameterized12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
enable_shoot2default:default2
draw2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
player2default:default2
draw2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PBTON2default:default2
VGA2default:defaultZ8-7129h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1357.199 ; gain = 519.828
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1357.199 ; gain = 519.828
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1357.199 ; gain = 519.828
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.1362default:default2
1357.1992default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2�
D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Basys3_Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Basys3_Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Basys3_Master.xdc2default:default2)
.Xil/VGA_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1390.6802default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0312default:default2
1390.6802default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:40 ; elapsed = 00:00:42 . Memory (MB): peak = 1390.680 ; gain = 553.309
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:40 ; elapsed = 00:00:42 . Memory (MB): peak = 1390.680 ; gain = 553.309
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1390.680 ; gain = 553.309
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2)
ps2_keyboard_to_ascii2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                   ready |                               00 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                new_code |                               01 |                               01
2default:defaulth p
x
� 
�
%s
*synth2s
_               translate |                               10 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                  output |                               11 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2

sequential2default:default2)
ps2_keyboard_to_ascii2default:defaultZ8-3354h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:44 ; elapsed = 00:00:47 . Memory (MB): peak = 1390.680 ; gain = 553.309
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   33 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 13    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   25 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit       Adders := 6     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   11 Bit       Adders := 128   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   11 Bit       Adders := 144   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   9 Input      1 Bit         XORs := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 16    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               25 Bit    Registers := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               11 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                7 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 31    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   32 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   13 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   11 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 12    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  22 Input    8 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  35 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  27 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  34 Input    7 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    7 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  14 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  33 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 27    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 7     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PBTON2default:default2
VGA2default:defaultZ8-7129h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:01:17 ; elapsed = 00:01:20 . Memory (MB): peak = 1390.680 ; gain = 553.309
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:30 ; elapsed = 00:01:34 . Memory (MB): peak = 1390.680 ; gain = 553.309
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:01:31 ; elapsed = 00:01:35 . Memory (MB): peak = 1392.652 ; gain = 555.281
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:01:34 ; elapsed = 00:01:38 . Memory (MB): peak = 1397.625 ; gain = 560.254
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:01:47 ; elapsed = 00:01:52 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:47 ; elapsed = 00:01:52 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:48 ; elapsed = 00:01:53 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:48 ; elapsed = 00:01:53 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:48 ; elapsed = 00:01:53 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:48 ; elapsed = 00:01:53 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     9|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |   654|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |   503|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |  1464|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |   154|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |   422|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |   191|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |   382|
2default:defaulth px� 
D
%s*synth2,
|9     |MUXF7  |    15|
2default:defaulth px� 
D
%s*synth2,
|10    |MUXF8  |     2|
2default:defaulth px� 
D
%s*synth2,
|11    |FDCE   |    33|
2default:defaulth px� 
D
%s*synth2,
|12    |FDPE   |    31|
2default:defaulth px� 
D
%s*synth2,
|13    |FDRE   |   620|
2default:defaulth px� 
D
%s*synth2,
|14    |FDSE   |    12|
2default:defaulth px� 
D
%s*synth2,
|15    |IBUF   |     6|
2default:defaulth px� 
D
%s*synth2,
|16    |OBUF   |    14|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:48 ; elapsed = 00:01:53 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:22 ; elapsed = 00:01:47 . Memory (MB): peak = 1412.434 ; gain = 541.582
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:48 ; elapsed = 00:01:54 . Memory (MB): peak = 1412.434 ; gain = 575.062
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.1662default:default2
1424.5232default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
6712default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
12default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1428.1842default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
h
%Synth Design complete | Checksum: %s
562*	vivadotcl2
d9e653382default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
752default:default2
182default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:02:012default:default2
00:02:082default:default2
1428.1842default:default2
972.8482default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
�D:/Estudio/OneDrive - Universidad de Antioquia/Estudio/Materias/S5/Digitales I/Laboratorio/P4/Practica4_FINAL/Practica4_FINAL/Practica4_FINAL.runs/synth_1/VGA.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2p
\Executing : report_utilization -file VGA_utilization_synth.rpt -pb VGA_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat Dec  2 08:53:13 20232default:defaultZ17-206h px� 


End Record