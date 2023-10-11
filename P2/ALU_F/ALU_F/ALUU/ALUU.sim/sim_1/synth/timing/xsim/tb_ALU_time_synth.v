// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Oct 11 08:45:17 2023
// Host        : DESKTOP-JK32J40 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/Estudio/OneDrive - Universidad de
//               Antioquia/Estudio/Materias/S5/Digitales
//               I/Laboratorio/P2/ALU_F/ALU_F/ALUU/ALUU.sim/sim_1/synth/timing/xsim/tb_ALU_time_synth.v}
// Design      : ALU
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module ALU
   (entradaControl,
    Entrada1,
    Entrada2,
    SalidaAlu,
    Salida7seg);
  input [1:0]entradaControl;
  input [3:0]Entrada1;
  input [3:0]Entrada2;
  output [3:0]SalidaAlu;
  output [6:0]Salida7seg;

  wire [3:0]Entrada1;
  wire [3:0]Entrada1_IBUF;
  wire [3:0]Entrada2;
  wire [3:0]Entrada2_IBUF;
  wire [6:0]Salida7seg;
  wire [6:0]Salida7seg_OBUF;
  wire [3:0]SalidaAlu;
  wire [3:0]SalidaAlu_OBUF;
  wire \SalidaAlu_OBUF[1]_inst_i_2_n_0 ;
  wire \SalidaAlu_OBUF[2]_inst_i_2_n_0 ;
  wire \SalidaAlu_OBUF[3]_inst_i_2_n_0 ;
  wire [1:0]entradaControl;
  wire [1:0]entradaControl_IBUF;
  wire [2:2]plusOp;

initial begin
 $sdf_annotate("tb_ALU_time_synth.sdf",,,,"tool_control");
end
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada1_IBUF[0]_inst 
       (.I(Entrada1[0]),
        .O(Entrada1_IBUF[0]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada1_IBUF[1]_inst 
       (.I(Entrada1[1]),
        .O(Entrada1_IBUF[1]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada1_IBUF[2]_inst 
       (.I(Entrada1[2]),
        .O(Entrada1_IBUF[2]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada1_IBUF[3]_inst 
       (.I(Entrada1[3]),
        .O(Entrada1_IBUF[3]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada2_IBUF[0]_inst 
       (.I(Entrada2[0]),
        .O(Entrada2_IBUF[0]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada2_IBUF[1]_inst 
       (.I(Entrada2[1]),
        .O(Entrada2_IBUF[1]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada2_IBUF[2]_inst 
       (.I(Entrada2[2]),
        .O(Entrada2_IBUF[2]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \Entrada2_IBUF[3]_inst 
       (.I(Entrada2[3]),
        .O(Entrada2_IBUF[3]));
  OBUF \Salida7seg_OBUF[0]_inst 
       (.I(Salida7seg_OBUF[0]),
        .O(Salida7seg[0]));
  LUT3 #(
    .INIT(8'h89)) 
    \Salida7seg_OBUF[0]_inst_i_1 
       (.I0(SalidaAlu_OBUF[3]),
        .I1(SalidaAlu_OBUF[2]),
        .I2(SalidaAlu_OBUF[1]),
        .O(Salida7seg_OBUF[0]));
  OBUF \Salida7seg_OBUF[1]_inst 
       (.I(Salida7seg_OBUF[1]),
        .O(Salida7seg[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hD1B0)) 
    \Salida7seg_OBUF[1]_inst_i_1 
       (.I0(SalidaAlu_OBUF[3]),
        .I1(SalidaAlu_OBUF[2]),
        .I2(SalidaAlu_OBUF[1]),
        .I3(SalidaAlu_OBUF[0]),
        .O(Salida7seg_OBUF[1]));
  OBUF \Salida7seg_OBUF[2]_inst 
       (.I(Salida7seg_OBUF[2]),
        .O(Salida7seg[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h5738)) 
    \Salida7seg_OBUF[2]_inst_i_1 
       (.I0(SalidaAlu_OBUF[3]),
        .I1(SalidaAlu_OBUF[1]),
        .I2(SalidaAlu_OBUF[2]),
        .I3(SalidaAlu_OBUF[0]),
        .O(Salida7seg_OBUF[2]));
  OBUF \Salida7seg_OBUF[3]_inst 
       (.I(Salida7seg_OBUF[3]),
        .O(Salida7seg[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hC29C)) 
    \Salida7seg_OBUF[3]_inst_i_1 
       (.I0(SalidaAlu_OBUF[3]),
        .I1(SalidaAlu_OBUF[2]),
        .I2(SalidaAlu_OBUF[0]),
        .I3(SalidaAlu_OBUF[1]),
        .O(Salida7seg_OBUF[3]));
  OBUF \Salida7seg_OBUF[4]_inst 
       (.I(Salida7seg_OBUF[4]),
        .O(Salida7seg[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hA8B0)) 
    \Salida7seg_OBUF[4]_inst_i_1 
       (.I0(SalidaAlu_OBUF[3]),
        .I1(SalidaAlu_OBUF[0]),
        .I2(SalidaAlu_OBUF[1]),
        .I3(SalidaAlu_OBUF[2]),
        .O(Salida7seg_OBUF[4]));
  OBUF \Salida7seg_OBUF[5]_inst 
       (.I(Salida7seg_OBUF[5]),
        .O(Salida7seg[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2EC8)) 
    \Salida7seg_OBUF[5]_inst_i_1 
       (.I0(SalidaAlu_OBUF[3]),
        .I1(SalidaAlu_OBUF[2]),
        .I2(SalidaAlu_OBUF[0]),
        .I3(SalidaAlu_OBUF[1]),
        .O(Salida7seg_OBUF[5]));
  OBUF \Salida7seg_OBUF[6]_inst 
       (.I(Salida7seg_OBUF[6]),
        .O(Salida7seg[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h869C)) 
    \Salida7seg_OBUF[6]_inst_i_1 
       (.I0(SalidaAlu_OBUF[3]),
        .I1(SalidaAlu_OBUF[2]),
        .I2(SalidaAlu_OBUF[0]),
        .I3(SalidaAlu_OBUF[1]),
        .O(Salida7seg_OBUF[6]));
  OBUF \SalidaAlu_OBUF[0]_inst 
       (.I(SalidaAlu_OBUF[0]),
        .O(SalidaAlu[0]));
  LUT5 #(
    .INIT(32'h404F4F40)) 
    \SalidaAlu_OBUF[0]_inst_i_1 
       (.I0(entradaControl_IBUF[0]),
        .I1(Entrada1_IBUF[1]),
        .I2(entradaControl_IBUF[1]),
        .I3(Entrada1_IBUF[0]),
        .I4(Entrada2_IBUF[0]),
        .O(SalidaAlu_OBUF[0]));
  OBUF \SalidaAlu_OBUF[1]_inst 
       (.I(SalidaAlu_OBUF[1]),
        .O(SalidaAlu[1]));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \SalidaAlu_OBUF[1]_inst_i_1 
       (.I0(Entrada1_IBUF[0]),
        .I1(entradaControl_IBUF[1]),
        .I2(Entrada2_IBUF[1]),
        .I3(Entrada1_IBUF[1]),
        .I4(entradaControl_IBUF[0]),
        .I5(\SalidaAlu_OBUF[1]_inst_i_2_n_0 ),
        .O(SalidaAlu_OBUF[1]));
  LUT6 #(
    .INIT(64'hB8888BBB8BBBB888)) 
    \SalidaAlu_OBUF[1]_inst_i_2 
       (.I0(Entrada1_IBUF[2]),
        .I1(entradaControl_IBUF[1]),
        .I2(Entrada1_IBUF[0]),
        .I3(Entrada2_IBUF[0]),
        .I4(Entrada2_IBUF[1]),
        .I5(Entrada1_IBUF[1]),
        .O(\SalidaAlu_OBUF[1]_inst_i_2_n_0 ));
  OBUF \SalidaAlu_OBUF[2]_inst 
       (.I(SalidaAlu_OBUF[2]),
        .O(SalidaAlu[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \SalidaAlu_OBUF[2]_inst_i_1 
       (.I0(\SalidaAlu_OBUF[2]_inst_i_2_n_0 ),
        .I1(entradaControl_IBUF[0]),
        .I2(Entrada1_IBUF[3]),
        .I3(entradaControl_IBUF[1]),
        .I4(plusOp),
        .O(SalidaAlu_OBUF[2]));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \SalidaAlu_OBUF[2]_inst_i_2 
       (.I0(Entrada1_IBUF[1]),
        .I1(entradaControl_IBUF[1]),
        .I2(Entrada2_IBUF[2]),
        .I3(Entrada1_IBUF[2]),
        .O(\SalidaAlu_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \SalidaAlu_OBUF[2]_inst_i_3 
       (.I0(Entrada2_IBUF[0]),
        .I1(Entrada1_IBUF[0]),
        .I2(Entrada1_IBUF[1]),
        .I3(Entrada2_IBUF[1]),
        .I4(Entrada2_IBUF[2]),
        .I5(Entrada1_IBUF[2]),
        .O(plusOp));
  OBUF \SalidaAlu_OBUF[3]_inst 
       (.I(SalidaAlu_OBUF[3]),
        .O(SalidaAlu[3]));
  LUT6 #(
    .INIT(64'h888888883CC30FF0)) 
    \SalidaAlu_OBUF[3]_inst_i_1 
       (.I0(Entrada1_IBUF[2]),
        .I1(entradaControl_IBUF[0]),
        .I2(Entrada1_IBUF[3]),
        .I3(Entrada2_IBUF[3]),
        .I4(\SalidaAlu_OBUF[3]_inst_i_2_n_0 ),
        .I5(entradaControl_IBUF[1]),
        .O(SalidaAlu_OBUF[3]));
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    \SalidaAlu_OBUF[3]_inst_i_2 
       (.I0(Entrada2_IBUF[2]),
        .I1(Entrada1_IBUF[2]),
        .I2(Entrada2_IBUF[0]),
        .I3(Entrada1_IBUF[0]),
        .I4(Entrada1_IBUF[1]),
        .I5(Entrada2_IBUF[1]),
        .O(\SalidaAlu_OBUF[3]_inst_i_2_n_0 ));
  (* CCIO_EN = "TRUE" *) 
  IBUF \entradaControl_IBUF[0]_inst 
       (.I(entradaControl[0]),
        .O(entradaControl_IBUF[0]));
  (* CCIO_EN = "TRUE" *) 
  IBUF \entradaControl_IBUF[1]_inst 
       (.I(entradaControl[1]),
        .O(entradaControl_IBUF[1]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
