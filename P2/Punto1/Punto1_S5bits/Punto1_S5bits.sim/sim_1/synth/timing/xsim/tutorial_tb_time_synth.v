// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Oct  1 11:52:08 2023
// Host        : DESKTOP-JK32J40 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/Estudio/OneDrive - Universidad de
//               Antioquia/Estudio/Materias/S5/Digitales
//               I/Laboratorio/P2/Punto1/Punto1_S5bits/Punto1_S5bits.sim/sim_1/synth/timing/xsim/tutorial_tb_time_synth.v}
// Design      : rca_estructural
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module rca_estructural
   (a,
    b,
    cin,
    s,
    cout);
  input [4:0]a;
  input [4:0]b;
  input cin;
  output [4:0]s;
  output cout;

  wire [4:0]a;
  wire [4:0]a_IBUF;
  wire [4:0]b;
  wire [4:0]b_IBUF;
  wire cin;
  wire cin_IBUF;
  wire cout;
  wire cout_OBUF;
  wire cout_i_1;
  wire cout_i_3;
  wire [4:0]s;
  wire [4:0]s_OBUF;

initial begin
 $sdf_annotate("tutorial_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \a_IBUF[2]_inst 
       (.I(a[2]),
        .O(a_IBUF[2]));
  IBUF \a_IBUF[3]_inst 
       (.I(a[3]),
        .O(a_IBUF[3]));
  IBUF \a_IBUF[4]_inst 
       (.I(a[4]),
        .O(a_IBUF[4]));
  IBUF \b_IBUF[0]_inst 
       (.I(b[0]),
        .O(b_IBUF[0]));
  IBUF \b_IBUF[1]_inst 
       (.I(b[1]),
        .O(b_IBUF[1]));
  IBUF \b_IBUF[2]_inst 
       (.I(b[2]),
        .O(b_IBUF[2]));
  IBUF \b_IBUF[3]_inst 
       (.I(b[3]),
        .O(b_IBUF[3]));
  IBUF \b_IBUF[4]_inst 
       (.I(b[4]),
        .O(b_IBUF[4]));
  IBUF cin_IBUF_inst
       (.I(cin),
        .O(cin_IBUF));
  OBUF cout_OBUF_inst
       (.I(cout_OBUF),
        .O(cout));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    cout_OBUF_inst_i_1
       (.I0(a_IBUF[4]),
        .I1(cout_i_3),
        .I2(b_IBUF[4]),
        .O(cout_OBUF));
  OBUF \s_OBUF[0]_inst 
       (.I(s_OBUF[0]),
        .O(s[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \s_OBUF[0]_inst_i_1 
       (.I0(b_IBUF[0]),
        .I1(a_IBUF[0]),
        .I2(cin_IBUF),
        .O(s_OBUF[0]));
  OBUF \s_OBUF[1]_inst 
       (.I(s_OBUF[1]),
        .O(s[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h99969666)) 
    \s_OBUF[1]_inst_i_1 
       (.I0(b_IBUF[1]),
        .I1(a_IBUF[1]),
        .I2(a_IBUF[0]),
        .I3(cin_IBUF),
        .I4(b_IBUF[0]),
        .O(s_OBUF[1]));
  OBUF \s_OBUF[2]_inst 
       (.I(s_OBUF[2]),
        .O(s[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \s_OBUF[2]_inst_i_1 
       (.I0(b_IBUF[2]),
        .I1(a_IBUF[2]),
        .I2(cout_i_1),
        .O(s_OBUF[2]));
  OBUF \s_OBUF[3]_inst 
       (.I(s_OBUF[3]),
        .O(s[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h99969666)) 
    \s_OBUF[3]_inst_i_1 
       (.I0(b_IBUF[3]),
        .I1(a_IBUF[3]),
        .I2(a_IBUF[2]),
        .I3(cout_i_1),
        .I4(b_IBUF[2]),
        .O(s_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFEEAA880)) 
    \s_OBUF[3]_inst_i_2 
       (.I0(a_IBUF[1]),
        .I1(b_IBUF[0]),
        .I2(cin_IBUF),
        .I3(a_IBUF[0]),
        .I4(b_IBUF[1]),
        .O(cout_i_1));
  OBUF \s_OBUF[4]_inst 
       (.I(s_OBUF[4]),
        .O(s[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \s_OBUF[4]_inst_i_1 
       (.I0(b_IBUF[4]),
        .I1(a_IBUF[4]),
        .I2(cout_i_3),
        .O(s_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFEEAA880)) 
    \s_OBUF[4]_inst_i_2 
       (.I0(a_IBUF[3]),
        .I1(b_IBUF[2]),
        .I2(cout_i_1),
        .I3(a_IBUF[2]),
        .I4(b_IBUF[3]),
        .O(cout_i_3));
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
