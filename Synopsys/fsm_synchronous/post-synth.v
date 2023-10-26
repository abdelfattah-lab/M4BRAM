/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Mon Jul  3 19:58:14 2023
/////////////////////////////////////////////////////////////


module fsm_synchronous ( clk, reset, cim_en, in_clear, data, byte_en, carry_in, 
        ren_1_dummy, ren_2_dummy, wen_1_dummy, wen_2_dummy, .raddr_1_dummy({
        \raddr_1_dummy[3][2] , \raddr_1_dummy[3][1] , \raddr_1_dummy[3][0] , 
        \raddr_1_dummy[2][2] , \raddr_1_dummy[2][1] , \raddr_1_dummy[2][0] , 
        \raddr_1_dummy[1][2] , \raddr_1_dummy[1][1] , \raddr_1_dummy[1][0] , 
        \raddr_1_dummy[0][2] , \raddr_1_dummy[0][1] , \raddr_1_dummy[0][0] }), 
        raddr_2_dummy, waddr_1_dummy, waddr_2_dummy, wsel_1_dummy, 
        wsel_2_dummy, readout_dummy );
  input [31:0] data;
  input [3:0] byte_en;
  output [2:0] raddr_2_dummy;
  output [2:0] waddr_1_dummy;
  output [2:0] waddr_2_dummy;
  output [1:0] wsel_2_dummy;
  input clk, reset, cim_en, in_clear;
  output carry_in, ren_1_dummy, ren_2_dummy, wen_1_dummy, wen_2_dummy,
         \raddr_1_dummy[3][2] , \raddr_1_dummy[3][1] , \raddr_1_dummy[3][0] ,
         \raddr_1_dummy[2][2] , \raddr_1_dummy[2][1] , \raddr_1_dummy[2][0] ,
         \raddr_1_dummy[1][2] , \raddr_1_dummy[1][1] , \raddr_1_dummy[1][0] ,
         \raddr_1_dummy[0][2] , \raddr_1_dummy[0][1] , \raddr_1_dummy[0][0] ,
         wsel_1_dummy, readout_dummy;
  wire   \raddr_1_dummy[3][2] , i_sign, N44, N45, N46, N47, N48, N50, N51,
         \input_1[3][6] , \input_1[3][5] , \input_1[3][4] , \input_1[3][3] ,
         \input_1[3][2] , \input_1[3][1] , \input_1[3][0] , \input_1[2][6] ,
         \input_1[2][5] , \input_1[2][4] , \input_1[2][3] , \input_1[2][2] ,
         \input_1[2][1] , \input_1[2][0] , \input_1[1][6] , \input_1[1][5] ,
         \input_1[1][4] , \input_1[1][3] , \input_1[1][2] , \input_1[1][1] ,
         \input_1[1][0] , \input_1[0][6] , \input_1[0][5] , \input_1[0][4] ,
         \input_1[0][3] , \input_1[0][2] , \input_1[0][1] , \input_1[0][0] ,
         \input_2[3][6] , \input_2[3][5] , \input_2[3][4] , \input_2[3][3] ,
         \input_2[3][2] , \input_2[3][1] , \input_2[3][0] , \input_2[2][6] ,
         \input_2[2][5] , \input_2[2][4] , \input_2[2][3] , \input_2[2][2] ,
         \input_2[2][1] , \input_2[2][0] , \input_2[1][6] , \input_2[1][5] ,
         \input_2[1][4] , \input_2[1][3] , \input_2[1][2] , \input_2[1][1] ,
         \input_2[1][0] , \input_2[0][6] , \input_2[0][5] , \input_2[0][4] ,
         \input_2[0][3] , \input_2[0][2] , \input_2[0][1] , \input_2[0][0] ,
         N179, n8, n9, n10, n11, n13, n14, n16, n19, n20, n22, n23, n25, n26,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289;
  wire   [3:0] i_prec;
  wire   [3:0] state_now;
  wire   [3:0] counter_now;
  assign \raddr_1_dummy[2][2]  = \raddr_1_dummy[3][2] ;
  assign \raddr_1_dummy[0][2]  = \raddr_1_dummy[3][2] ;
  assign \raddr_1_dummy[1][2]  = \raddr_1_dummy[3][2] ;

  DFFQA_X1M_A9PP140TS_C30 \i_prec_reg[3]  ( .D(n247), .CK(clk), .Q(i_prec[3])
         );
  DFFQA_X1M_A9PP140TS_C30 \i_prec_reg[0]  ( .D(n244), .CK(clk), .Q(i_prec[0])
         );
  DFFQA_X1M_A9PP140TS_C30 i_sign_reg ( .D(n243), .CK(clk), .Q(i_sign) );
  DFFQA_X1M_A9PP140TS_C30 \state_now_reg[2]  ( .D(N46), .CK(clk), .Q(
        state_now[2]) );
  DFFQA_X1M_A9PP140TS_C30 \counter_now_reg[0]  ( .D(N48), .CK(clk), .Q(N179)
         );
  DFFQA_X1M_A9PP140TS_C30 \counter_now_reg[1]  ( .D(n11), .CK(clk), .Q(
        counter_now[1]) );
  DFFQA_X1M_A9PP140TS_C30 \counter_now_reg[2]  ( .D(N50), .CK(clk), .Q(
        counter_now[2]) );
  DFFQA_X1M_A9PP140TS_C30 \counter_now_reg[3]  ( .D(N51), .CK(clk), .Q(
        counter_now[3]) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[3][0]  ( .D(n218), .CK(clk), .Q(
        \input_1[3][0] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[3][1]  ( .D(n217), .CK(clk), .Q(
        \input_1[3][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[3][2]  ( .D(n216), .CK(clk), .Q(
        \input_1[3][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[3][3]  ( .D(n215), .CK(clk), .Q(
        \input_1[3][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[3][4]  ( .D(n214), .CK(clk), .Q(
        \input_1[3][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[3][5]  ( .D(n213), .CK(clk), .Q(
        \input_1[3][5] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[3][6]  ( .D(n212), .CK(clk), .Q(
        \input_1[3][6] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[2][0]  ( .D(n226), .CK(clk), .Q(
        \input_1[2][0] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[2][1]  ( .D(n225), .CK(clk), .Q(
        \input_1[2][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[2][2]  ( .D(n224), .CK(clk), .Q(
        \input_1[2][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[2][3]  ( .D(n223), .CK(clk), .Q(
        \input_1[2][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[2][4]  ( .D(n222), .CK(clk), .Q(
        \input_1[2][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[2][6]  ( .D(n220), .CK(clk), .Q(
        \input_1[2][6] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[1][0]  ( .D(n234), .CK(clk), .Q(
        \input_1[1][0] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[1][1]  ( .D(n233), .CK(clk), .Q(
        \input_1[1][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[1][2]  ( .D(n232), .CK(clk), .Q(
        \input_1[1][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[1][3]  ( .D(n231), .CK(clk), .Q(
        \input_1[1][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[1][4]  ( .D(n230), .CK(clk), .Q(
        \input_1[1][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[1][5]  ( .D(n229), .CK(clk), .Q(
        \input_1[1][5] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[1][6]  ( .D(n228), .CK(clk), .Q(
        \input_1[1][6] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[0][2]  ( .D(n240), .CK(clk), .Q(
        \input_1[0][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[0][3]  ( .D(n239), .CK(clk), .Q(
        \input_1[0][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[0][4]  ( .D(n238), .CK(clk), .Q(
        \input_1[0][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[0][6]  ( .D(n236), .CK(clk), .Q(
        \input_1[0][6] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[3][0]  ( .D(n186), .CK(clk), .Q(
        \input_2[3][0] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[3][1]  ( .D(n185), .CK(clk), .Q(
        \input_2[3][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[3][2]  ( .D(n184), .CK(clk), .Q(
        \input_2[3][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[3][3]  ( .D(n183), .CK(clk), .Q(
        \input_2[3][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[3][4]  ( .D(n182), .CK(clk), .Q(
        \input_2[3][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[3][5]  ( .D(n181), .CK(clk), .Q(
        \input_2[3][5] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[3][6]  ( .D(n180), .CK(clk), .Q(
        \input_2[3][6] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[2][0]  ( .D(n194), .CK(clk), .Q(
        \input_2[2][0] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[2][1]  ( .D(n193), .CK(clk), .Q(
        \input_2[2][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[2][2]  ( .D(n192), .CK(clk), .Q(
        \input_2[2][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[2][3]  ( .D(n191), .CK(clk), .Q(
        \input_2[2][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[2][4]  ( .D(n190), .CK(clk), .Q(
        \input_2[2][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[2][5]  ( .D(n189), .CK(clk), .Q(
        \input_2[2][5] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[2][6]  ( .D(n188), .CK(clk), .Q(
        \input_2[2][6] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[1][1]  ( .D(n201), .CK(clk), .Q(
        \input_2[1][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[1][2]  ( .D(n200), .CK(clk), .Q(
        \input_2[1][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[1][3]  ( .D(n199), .CK(clk), .Q(
        \input_2[1][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[1][4]  ( .D(n198), .CK(clk), .Q(
        \input_2[1][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[1][5]  ( .D(n197), .CK(clk), .Q(
        \input_2[1][5] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[1][6]  ( .D(n196), .CK(clk), .Q(
        \input_2[1][6] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[0][1]  ( .D(n209), .CK(clk), .Q(
        \input_2[0][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[0][2]  ( .D(n208), .CK(clk), .Q(
        \input_2[0][2] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[0][3]  ( .D(n207), .CK(clk), .Q(
        \input_2[0][3] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[0][4]  ( .D(n206), .CK(clk), .Q(
        \input_2[0][4] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[0][5]  ( .D(n205), .CK(clk), .Q(
        \input_2[0][5] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[0][6]  ( .D(n204), .CK(clk), .Q(
        \input_2[0][6] ) );
  DFFQNA_X1M_A9PP140TS_C30 \input_2_reg[3][7]  ( .D(n179), .CK(clk), .QN(n40)
         );
  DFFQNA_X1M_A9PP140TS_C30 \input_2_reg[2][7]  ( .D(n187), .CK(clk), .QN(n42)
         );
  DFFQNA_X1M_A9PP140TS_C30 \input_2_reg[1][7]  ( .D(n195), .CK(clk), .QN(n44)
         );
  DFFQNA_X1M_A9PP140TS_C30 \input_2_reg[0][7]  ( .D(n203), .CK(clk), .QN(n46)
         );
  DFFQNA_X1M_A9PP140TS_C30 \input_1_reg[3][7]  ( .D(n211), .CK(clk), .QN(n32)
         );
  DFFQNA_X1M_A9PP140TS_C30 \input_1_reg[2][7]  ( .D(n219), .CK(clk), .QN(n34)
         );
  DFFQNA_X1M_A9PP140TS_C30 \input_1_reg[1][7]  ( .D(n227), .CK(clk), .QN(n36)
         );
  DFFQNA_X1M_A9PP140TS_C30 \input_1_reg[0][7]  ( .D(n235), .CK(clk), .QN(n38)
         );
  DFFQNA_X1M_A9PP140TS_C30 \i_prec_reg[2]  ( .D(n246), .CK(clk), .QN(n8) );
  DFFQNA_X1M_A9PP140TS_C30 \i_prec_reg[1]  ( .D(n245), .CK(clk), .QN(n9) );
  DFFQ_X4M_A9PP140TS_C30 \state_now_reg[3]  ( .D(N47), .CK(clk), .Q(
        state_now[3]) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[0][0]  ( .D(n242), .CK(clk), .Q(
        \input_1[0][0] ) );
  DFFQ_X2M_A9PP140TS_C30 \state_now_reg[0]  ( .D(N44), .CK(clk), .Q(
        state_now[0]) );
  DFFQ_X3M_A9PP140TS_C30 \state_now_reg[1]  ( .D(N45), .CK(clk), .Q(
        state_now[1]) );
  DFFQL_X1M_A9PP140TS_C30 \input_2_reg[0][0]  ( .D(n210), .CK(clk), .Q(
        \input_2[0][0] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_2_reg[1][0]  ( .D(n202), .CK(clk), .Q(
        \input_2[1][0] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[0][1]  ( .D(n241), .CK(clk), .Q(
        \input_1[0][1] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[0][5]  ( .D(n237), .CK(clk), .Q(
        \input_1[0][5] ) );
  DFFQA_X1M_A9PP140TS_C30 \input_1_reg[2][5]  ( .D(n221), .CK(clk), .Q(
        \input_1[2][5] ) );
  AOI22_X0P5M_A9PP140TS_C30 U265 ( .A0(\input_1[1][6] ), .A1(n287), .B0(n274), 
        .B1(data[15]), .Y(n124) );
  AOI22_X0P5M_A9PP140TS_C30 U266 ( .A0(\input_1[0][6] ), .A1(n287), .B0(n274), 
        .B1(data[7]), .Y(n131) );
  AOI22_X0P5M_A9PP140TS_C30 U267 ( .A0(\input_1[1][1] ), .A1(n287), .B0(n274), 
        .B1(data[10]), .Y(n129) );
  AOI22_X0P5M_A9PP140TS_C30 U268 ( .A0(\input_1[1][2] ), .A1(n287), .B0(n274), 
        .B1(data[11]), .Y(n128) );
  AOI22_X0P5M_A9PP140TS_C30 U269 ( .A0(\input_1[1][3] ), .A1(n287), .B0(n274), 
        .B1(data[12]), .Y(n127) );
  AOI22_X0P5M_A9PP140TS_C30 U270 ( .A0(\input_1[1][4] ), .A1(n287), .B0(n274), 
        .B1(data[13]), .Y(n126) );
  AOI22_X0P5M_A9PP140TS_C30 U271 ( .A0(\input_1[1][5] ), .A1(n287), .B0(n274), 
        .B1(data[14]), .Y(n125) );
  AOI22_X0P5M_A9PP140TS_C30 U272 ( .A0(\input_1[0][2] ), .A1(n287), .B0(n274), 
        .B1(data[3]), .Y(n135) );
  AOI22_X0P5M_A9PP140TS_C30 U273 ( .A0(\input_1[0][3] ), .A1(n287), .B0(n274), 
        .B1(data[4]), .Y(n134) );
  AOI22_X0P5M_A9PP140TS_C30 U274 ( .A0(\input_1[0][4] ), .A1(n287), .B0(n274), 
        .B1(data[5]), .Y(n133) );
  AOI22_X0P5M_A9PP140TS_C30 U275 ( .A0(\input_1[1][0] ), .A1(n287), .B0(n274), 
        .B1(data[9]), .Y(n130) );
  AOI22_X0P5M_A9PP140TS_C30 U276 ( .A0(\input_1[0][0] ), .A1(n287), .B0(n274), 
        .B1(data[1]), .Y(n137) );
  NAND2_X1M_A9PP140TS_C30 U277 ( .A(\input_1[0][1] ), .B(n287), .Y(n259) );
  BUFH_X2M_A9PP140TS_C30 U278 ( .A(n280), .Y(n266) );
  NOR2_X6A_A9PP140TS_C30 U279 ( .A(n60), .B(n251), .Y(n280) );
  INV_X7P5M_A9PP140TS_C30 U280 ( .A(n280), .Y(n282) );
  INV_X6M_A9PP140TS_C30 U281 ( .A(n272), .Y(n25) );
  NAND2_X0P7M_A9PP140TS_C30 U282 ( .A(n272), .B(n31), .Y(n67) );
  NAND3_X3M_A9PP140TS_C30 U283 ( .A(n26), .B(n20), .C(n272), .Y(n139) );
  BUF_X3P5M_A9PP140TS_C30 U284 ( .A(state_now[2]), .Y(n272) );
  NAND3_X6A_A9PP140TS_C30 U285 ( .A(n282), .B(n105), .C(n106), .Y(n248) );
  BUF_X1P2M_A9PP140TS_C30 U286 ( .A(n289), .Y(n285) );
  BUFH_X3M_A9PP140TS_C30 U287 ( .A(n253), .Y(n289) );
  NAND3_X3A_A9PP140TS_C30 U288 ( .A(n282), .B(n105), .C(n106), .Y(n75) );
  BUF_X11M_A9PP140TS_C30 U289 ( .A(n75), .Y(n283) );
  AOI211_X3M_A9PP140TS_C30 U290 ( .A0(n138), .A1(n139), .B0(n60), .C0(n50), 
        .Y(n110) );
  OA211_X3M_A9PP140TS_C30 U291 ( .A0(n13), .A1(n161), .B0(n139), .C0(n162), 
        .Y(n147) );
  NAND2_X8A_A9PP140TS_C30 U292 ( .A(n106), .B(n249), .Y(n279) );
  AND2_X6M_A9PP140TS_C30 U293 ( .A(n277), .B(n105), .Y(n249) );
  OA21A1OI2_X4M_A9PP140TS_C30 U294 ( .A0(n256), .A1(n14), .B0(n156), .C0(
        counter_now[1]), .Y(n160) );
  OR2_X6M_A9PP140TS_C30 U295 ( .A(n50), .B(n147), .Y(n256) );
  AOI31_X0P5M_A9PP140TS_C30 U296 ( .A0(n168), .A1(n169), .A2(n170), .B0(n50), 
        .Y(N45) );
  INV_X2B_A9PP140TS_C30 U297 ( .A(n169), .Y(n16) );
  INV_X6M_A9PP140TS_C30 U298 ( .A(n282), .Y(n281) );
  AOI31_X1P4M_A9PP140TS_C30 U299 ( .A0(wsel_2_dummy[0]), .A1(n20), .A2(
        state_now[1]), .B0(carry_in), .Y(n169) );
  AND2_X3M_A9PP140TS_C30 U300 ( .A(n72), .B(n29), .Y(carry_in) );
  INV_X7P5B_A9PP140TS_C30 U301 ( .A(state_now[0]), .Y(n31) );
  INV_X1M_A9PP140TS_C30 U302 ( .A(n164), .Y(n22) );
  NOR2_X1A_A9PP140TS_C30 U303 ( .A(n69), .B(n252), .Y(n171) );
  NAND2_X0P5M_A9PP140TS_C30 U304 ( .A(state_now[1]), .B(n31), .Y(n69) );
  NOR2_X4A_A9PP140TS_C30 U305 ( .A(n22), .B(n171), .Y(n107) );
  NAND2_X1A_A9PP140TS_C30 U306 ( .A(state_now[0]), .B(n30), .Y(n56) );
  INV_X1M_A9PP140TS_C30 U307 ( .A(waddr_1_dummy[0]), .Y(n28) );
  AND2_X1M_A9PP140TS_C30 U308 ( .A(n25), .B(n250), .Y(n267) );
  INV_X2M_A9PP140TS_C30 U309 ( .A(state_now[1]), .Y(n30) );
  NOR2_X1A_A9PP140TS_C30 U310 ( .A(n248), .B(n45), .Y(n261) );
  OR2_X1M_A9PP140TS_C30 U311 ( .A(n263), .B(n264), .Y(n210) );
  OR2_X1M_A9PP140TS_C30 U312 ( .A(n269), .B(n270), .Y(n242) );
  NOR2_X1A_A9PP140TS_C30 U313 ( .A(n279), .B(n39), .Y(n269) );
  NOR3_X1A_A9PP140TS_C30 U314 ( .A(n60), .B(n107), .C(n50), .Y(n77) );
  AND2_X1M_A9PP140TS_C30 U315 ( .A(n259), .B(n260), .Y(n136) );
  AND2_X1M_A9PP140TS_C30 U316 ( .A(n254), .B(n255), .Y(n118) );
  NAND2_X1A_A9PP140TS_C30 U317 ( .A(state_now[3]), .B(n25), .Y(n70) );
  AND2_X1M_A9PP140TS_C30 U318 ( .A(n271), .B(state_now[0]), .Y(n250) );
  OR2_X1M_A9PP140TS_C30 U319 ( .A(n50), .B(n107), .Y(n251) );
  BUFH_X2M_A9PP140TS_C30 U320 ( .A(n110), .Y(n273) );
  OR2_X1M_A9PP140TS_C30 U321 ( .A(state_now[3]), .B(n272), .Y(n252) );
  INV_X1M_A9PP140TS_C30 U322 ( .A(n70), .Y(n23) );
  NOR2XB_X6M_A9PP140TS_C30 U323 ( .BN(n106), .A(n169), .Y(n253) );
  INV_X11M_A9PP140TS_C30 U324 ( .A(n253), .Y(n105) );
  NAND2_X1A_A9PP140TS_C30 U325 ( .A(\input_1[2][5] ), .B(n286), .Y(n254) );
  NAND2_X1A_A9PP140TS_C30 U326 ( .A(n275), .B(data[22]), .Y(n255) );
  BUFH_X2M_A9PP140TS_C30 U327 ( .A(n288), .Y(n286) );
  INV_X2M_A9PP140TS_C30 U328 ( .A(n278), .Y(n275) );
  NOR2_X1A_A9PP140TS_C30 U329 ( .A(n16), .B(n167), .Y(n162) );
  INV_X1M_A9PP140TS_C30 U330 ( .A(n106), .Y(n50) );
  NAND2_X1A_A9PP140TS_C30 U331 ( .A(\input_1[0][5] ), .B(n287), .Y(n257) );
  NAND2_X1A_A9PP140TS_C30 U332 ( .A(n274), .B(data[6]), .Y(n258) );
  AND2_X1M_A9PP140TS_C30 U333 ( .A(n257), .B(n258), .Y(n132) );
  NAND2_X1A_A9PP140TS_C30 U334 ( .A(n274), .B(data[2]), .Y(n260) );
  BUF_X1P4M_A9PP140TS_C30 U335 ( .A(n288), .Y(n287) );
  INV_X2M_A9PP140TS_C30 U336 ( .A(n276), .Y(n274) );
  NOR2_X0P5A_A9PP140TS_C30 U337 ( .A(n282), .B(n54), .Y(n262) );
  OR2_X1M_A9PP140TS_C30 U338 ( .A(n261), .B(n262), .Y(n202) );
  BUF_X1M_A9PP140TS_C30 U339 ( .A(n289), .Y(n284) );
  AOI22_X0P5M_A9PP140TS_C30 U340 ( .A0(\input_2[0][1] ), .A1(n286), .B0(
        data[2]), .B1(n77), .Y(n103) );
  NOR2_X0P7B_A9PP140TS_C30 U341 ( .A(n248), .B(n47), .Y(n263) );
  NOR2_X0P5A_A9PP140TS_C30 U342 ( .A(n282), .B(n55), .Y(n264) );
  NAND2_X0P5M_A9PP140TS_C30 U343 ( .A(state_now[1]), .B(n31), .Y(n265) );
  AOI22_X0P7M_A9PP140TS_C30 U344 ( .A0(\input_2[3][6] ), .A1(n284), .B0(
        data[31]), .B1(n266), .Y(n76) );
  INV_X0P6M_A9PP140TS_C30 U345 ( .A(state_now[3]), .Y(n20) );
  NOR2_X0P7B_A9PP140TS_C30 U346 ( .A(n25), .B(state_now[3]), .Y(n72) );
  INV_X2M_A9PP140TS_C30 U347 ( .A(n273), .Y(n277) );
  OAI2XB1_X1M_A9PP140TS_C30 U348 ( .A1N(\input_1[2][6] ), .A0(n279), .B0(n118), 
        .Y(n220) );
  OAI2XB1_X1M_A9PP140TS_C30 U349 ( .A1N(\input_1[2][5] ), .A0(n279), .B0(n119), 
        .Y(n221) );
  OAI2XB1_X1M_A9PP140TS_C30 U350 ( .A1N(\input_1[2][4] ), .A0(n279), .B0(n120), 
        .Y(n222) );
  OAI2XB1_X1M_A9PP140TS_C30 U351 ( .A1N(\input_1[2][3] ), .A0(n279), .B0(n121), 
        .Y(n223) );
  OAI2XB1_X1M_A9PP140TS_C30 U352 ( .A1N(\input_1[2][2] ), .A0(n279), .B0(n122), 
        .Y(n224) );
  OAI2XB1_X1M_A9PP140TS_C30 U353 ( .A1N(\input_1[2][1] ), .A0(n279), .B0(n123), 
        .Y(n225) );
  NAND2_X0P5A_A9PP140TS_C30 U354 ( .A(n25), .B(n250), .Y(raddr_2_dummy[2]) );
  NAND2_X0P5A_A9PP140TS_C30 U355 ( .A(n25), .B(n265), .Y(raddr_2_dummy[0]) );
  AND2_X0P5B_A9PP140TS_C30 U356 ( .A(state_now[1]), .B(n31), .Y(wsel_1_dummy)
         );
  INV_X0P5B_A9PP140TS_C30 U357 ( .A(state_now[3]), .Y(n271) );
  NOR2_X0P5A_A9PP140TS_C30 U358 ( .A(n55), .B(n277), .Y(n270) );
  AOI21_X1M_A9PP140TS_C30 U359 ( .A0(n140), .A1(byte_en[3]), .B0(reset), .Y(
        n106) );
  NAND2_X0P5M_A9PP140TS_C30 U360 ( .A(state_now[1]), .B(n267), .Y(n161) );
  AOI21_X0P5M_A9PP140TS_C30 U361 ( .A0(n162), .A1(n161), .B0(n50), .Y(N46) );
  OAI22_X0P5M_A9PP140TS_C30 U362 ( .A0(n279), .A1(n33), .B0(n52), .B1(n278), 
        .Y(n218) );
  OA21A1OI2_X0P5M_A9PP140TS_C30 U363 ( .A0(n147), .A1(n148), .B0(n149), .C0(
        n50), .Y(N51) );
  NOR2_X0P5M_A9PP140TS_C30 U364 ( .A(n161), .B(i_sign), .Y(n150) );
  AOI211_X0P5M_A9PP140TS_C30 U365 ( .A0(readout_dummy), .A1(n51), .B0(n171), 
        .C0(n150), .Y(n170) );
  NOR2_X1A_A9PP140TS_C30 U366 ( .A(n50), .B(n147), .Y(n159) );
  NAND2_X2B_A9PP140TS_C30 U367 ( .A(n30), .B(n267), .Y(n138) );
  AOI31_X1M_A9PP140TS_C30 U368 ( .A0(n159), .A1(n14), .A2(counter_now[1]), 
        .B0(n160), .Y(n158) );
  OAI2XB1_X1M_A9PP140TS_C30 U369 ( .A1N(\input_1[0][2] ), .A0(n279), .B0(n136), 
        .Y(n240) );
  OAI2XB1_X1M_A9PP140TS_C30 U370 ( .A1N(\input_1[1][4] ), .A0(n279), .B0(n127), 
        .Y(n230) );
  OAI2XB1_X1M_A9PP140TS_C30 U371 ( .A1N(\input_1[3][5] ), .A0(n279), .B0(n112), 
        .Y(n213) );
  OAI2XB1_X1M_A9PP140TS_C30 U372 ( .A1N(\input_1[3][4] ), .A0(n279), .B0(n113), 
        .Y(n214) );
  OAI2XB1_X1M_A9PP140TS_C30 U373 ( .A1N(\input_1[3][3] ), .A0(n279), .B0(n114), 
        .Y(n215) );
  OAI2XB1_X1M_A9PP140TS_C30 U374 ( .A1N(\input_1[3][2] ), .A0(n279), .B0(n115), 
        .Y(n216) );
  OAI2XB1_X1M_A9PP140TS_C30 U375 ( .A1N(\input_1[3][1] ), .A0(n279), .B0(n116), 
        .Y(n217) );
  NAND2_X0P5M_A9PP140TS_C30 U376 ( .A(state_now[1]), .B(state_now[0]), .Y(n66)
         );
  NAND2_X0P5A_A9PP140TS_C30 U377 ( .A(n20), .B(n56), .Y(\raddr_1_dummy[3][2] )
         );
  NAND2_X0P5M_A9PP140TS_C30 U378 ( .A(n26), .B(n20), .Y(n71) );
  OAI21_X0P5M_A9PP140TS_C30 U379 ( .A0(n272), .A1(n31), .B0(n20), .Y(
        waddr_1_dummy[1]) );
  BUFH_X2M_A9PP140TS_C30 U380 ( .A(n253), .Y(n288) );
  AOI22_X0P5M_A9PP140TS_C30 U381 ( .A0(n22), .A1(n163), .B0(n267), .B1(n30), 
        .Y(n168) );
  NOR2_X0P5M_A9PP140TS_C30 U382 ( .A(n70), .B(n56), .Y(readout_dummy) );
  OA21A1OI2_X0P5M_A9PP140TS_C30 U383 ( .A0(n163), .A1(n164), .B0(n165), .C0(
        n50), .Y(N47) );
  NAND2_X0P5A_A9PP140TS_C30 U384 ( .A(n72), .B(waddr_1_dummy[0]), .Y(n65) );
  OAI21_X0P5M_A9PP140TS_C30 U385 ( .A0(n23), .A1(n31), .B0(n66), .Y(
        waddr_2_dummy[0]) );
  AOI22_X0P5M_A9PP140TS_C30 U386 ( .A0(n62), .A1(n29), .B0(n63), .B1(n20), .Y(
        n61) );
  OAI22_X0P5M_A9PP140TS_C30 U387 ( .A0(n279), .A1(n37), .B0(n54), .B1(n277), 
        .Y(n234) );
  OAI22_X0P5M_A9PP140TS_C30 U388 ( .A0(n154), .A1(n256), .B0(n155), .B1(n156), 
        .Y(N50) );
  OAI22_X0P5M_A9PP140TS_C30 U389 ( .A0(N179), .A1(n256), .B0(n14), .B1(n156), 
        .Y(N48) );
  NOR3_X0P5A_A9PP140TS_C30 U390 ( .A(state_now[1]), .B(state_now[3]), .C(n67), 
        .Y(n167) );
  NAND2_X0P5M_A9PP140TS_C30 U391 ( .A(n150), .B(n151), .Y(n149) );
  AOI31_X0P5M_A9PP140TS_C30 U392 ( .A0(n107), .A1(n172), .A2(n173), .B0(n50), 
        .Y(N44) );
  AOI211_X0P5M_A9PP140TS_C30 U393 ( .A0(n174), .A1(n62), .B0(readout_dummy), 
        .C0(n167), .Y(n173) );
  OAI211_X0P5M_A9PP140TS_C30 U394 ( .A0(counter_now[3]), .A1(n175), .B0(n176), 
        .C0(n16), .Y(n172) );
  NOR2_X0P5A_A9PP140TS_C30 U395 ( .A(state_now[3]), .B(state_now[0]), .Y(n174)
         );
  AOI21_X0P5M_A9PP140TS_C30 U396 ( .A0(state_now[0]), .A1(n272), .B0(
        wsel_1_dummy), .Y(n58) );
  OAI211_X0P5M_A9PP140TS_C30 U397 ( .A0(n272), .A1(state_now[0]), .B0(n265), 
        .C0(n20), .Y(waddr_2_dummy[1]) );
  OAI211_X0P5M_A9PP140TS_C30 U398 ( .A0(n272), .A1(n66), .B0(n67), .C0(n68), 
        .Y(waddr_2_dummy[2]) );
  AOI22_X0P5M_A9PP140TS_C30 U399 ( .A0(n28), .A1(n20), .B0(state_now[3]), .B1(
        state_now[0]), .Y(n68) );
  OAI21_X0P5M_A9PP140TS_C30 U400 ( .A0(n272), .A1(n30), .B0(n73), .Y(
        raddr_2_dummy[1]) );
  AOI21_X0P5M_A9PP140TS_C30 U401 ( .A0(state_now[3]), .A1(state_now[0]), .B0(
        n28), .Y(n73) );
  OAI211_X0P5M_A9PP140TS_C30 U402 ( .A0(state_now[3]), .A1(n56), .B0(n57), 
        .C0(n58), .Y(wsel_2_dummy[1]) );
  NAND2_X0P5A_A9PP140TS_C30 U403 ( .A(state_now[3]), .B(n31), .Y(n57) );
  OAI211_X0P5M_A9PP140TS_C30 U404 ( .A0(state_now[1]), .A1(n70), .B0(n71), 
        .C0(n65), .Y(ren_2_dummy) );
  NOR2_X0P5A_A9PP140TS_C30 U405 ( .A(n166), .B(n272), .Y(n62) );
  NAND2_X1A_A9PP140TS_C30 U406 ( .A(n23), .B(n28), .Y(n164) );
  INV_X1M_A9PP140TS_C30 U407 ( .A(n67), .Y(wsel_2_dummy[0]) );
  INV_X1M_A9PP140TS_C30 U408 ( .A(n273), .Y(n276) );
  INV_X1M_A9PP140TS_C30 U409 ( .A(n273), .Y(n278) );
  INV_X1M_A9PP140TS_C30 U410 ( .A(waddr_1_dummy[1]), .Y(n19) );
  NOR2XB_X1M_A9PP140TS_C30 U411 ( .BN(n71), .A(n22), .Y(n59) );
  NAND2_X1A_A9PP140TS_C30 U412 ( .A(n59), .B(n65), .Y(wen_1_dummy) );
  INV_X1M_A9PP140TS_C30 U413 ( .A(n56), .Y(n29) );
  NAND2_X1A_A9PP140TS_C30 U414 ( .A(n30), .B(n31), .Y(waddr_1_dummy[0]) );
  INV_X1M_A9PP140TS_C30 U415 ( .A(n66), .Y(n26) );
  NAND2_X1A_A9PP140TS_C30 U416 ( .A(n150), .B(n106), .Y(n156) );
  INV_X1M_A9PP140TS_C30 U417 ( .A(n166), .Y(n51) );
  AOI21B_X1M_A9PP140TS_C30 U418 ( .A0(readout_dummy), .A1(n166), .B0N(n139), 
        .Y(n165) );
  AOI211_X0P7M_A9PP140TS_C30 U419 ( .A0(n272), .A1(n26), .B0(wsel_2_dummy[0]), 
        .C0(wsel_1_dummy), .Y(n74) );
  NAND2_X1A_A9PP140TS_C30 U420 ( .A(n49), .B(n142), .Y(n141) );
  INV_X1M_A9PP140TS_C30 U421 ( .A(n142), .Y(n48) );
  OAI21_X1M_A9PP140TS_C30 U422 ( .A0(n59), .A1(n60), .B0(n61), .Y(wen_2_dummy)
         );
  NAND2XB_X1M_A9PP140TS_C30 U423 ( .BN(n62), .A(n64), .Y(n63) );
  XOR2_X0P5M_A9PP140TS_C30 U424 ( .A(n272), .B(n28), .Y(n64) );
  NAND2XB_X1M_A9PP140TS_C30 U425 ( .BN(\raddr_1_dummy[3][2] ), .A(n58), .Y(
        waddr_1_dummy[2]) );
  NAND2XB_X1M_A9PP140TS_C30 U426 ( .BN(n72), .A(n59), .Y(ren_1_dummy) );
  INV_X1M_A9PP140TS_C30 U427 ( .A(n158), .Y(n11) );
  OAI22_X1M_A9PP140TS_C30 U428 ( .A0(n248), .A1(n43), .B0(n282), .B1(n53), .Y(
        n194) );
  INV_X1M_A9PP140TS_C30 U429 ( .A(\input_2[2][0] ), .Y(n43) );
  OAI22_X1M_A9PP140TS_C30 U430 ( .A0(n248), .A1(n41), .B0(n282), .B1(n52), .Y(
        n186) );
  INV_X1M_A9PP140TS_C30 U431 ( .A(\input_2[3][0] ), .Y(n41) );
  OAI2XB1_X1M_A9PP140TS_C30 U432 ( .A1N(\input_2[2][1] ), .A0(n283), .B0(n90), 
        .Y(n193) );
  AOI22_X1M_A9PP140TS_C30 U433 ( .A0(\input_2[2][0] ), .A1(n284), .B0(data[17]), .B1(n266), .Y(n90) );
  OAI2XB1_X1M_A9PP140TS_C30 U434 ( .A1N(\input_2[3][1] ), .A0(n283), .B0(n83), 
        .Y(n185) );
  AOI22_X1M_A9PP140TS_C30 U435 ( .A0(\input_2[3][0] ), .A1(n284), .B0(data[25]), .B1(n266), .Y(n83) );
  OAI2XB1_X1M_A9PP140TS_C30 U436 ( .A1N(\input_2[0][2] ), .A0(n283), .B0(n103), 
        .Y(n208) );
  OAI2XB1_X1M_A9PP140TS_C30 U437 ( .A1N(\input_2[1][4] ), .A0(n248), .B0(n94), 
        .Y(n198) );
  AOI22_X1M_A9PP140TS_C30 U438 ( .A0(\input_2[1][3] ), .A1(n285), .B0(data[12]), .B1(n281), .Y(n94) );
  OAI2XB1_X1M_A9PP140TS_C30 U439 ( .A1N(\input_2[2][6] ), .A0(n283), .B0(n85), 
        .Y(n188) );
  AOI22_X1M_A9PP140TS_C30 U440 ( .A0(\input_2[2][5] ), .A1(n284), .B0(data[22]), .B1(n266), .Y(n85) );
  OAI2XB1_X1M_A9PP140TS_C30 U441 ( .A1N(\input_2[2][5] ), .A0(n283), .B0(n86), 
        .Y(n189) );
  AOI22_X1M_A9PP140TS_C30 U442 ( .A0(\input_2[2][4] ), .A1(n284), .B0(data[21]), .B1(n266), .Y(n86) );
  OAI2XB1_X1M_A9PP140TS_C30 U443 ( .A1N(\input_2[2][4] ), .A0(n283), .B0(n87), 
        .Y(n190) );
  AOI22_X1M_A9PP140TS_C30 U444 ( .A0(\input_2[2][3] ), .A1(n284), .B0(data[20]), .B1(n266), .Y(n87) );
  OAI2XB1_X1M_A9PP140TS_C30 U445 ( .A1N(\input_2[2][3] ), .A0(n283), .B0(n88), 
        .Y(n191) );
  AOI22_X1M_A9PP140TS_C30 U446 ( .A0(\input_2[2][2] ), .A1(n284), .B0(data[19]), .B1(n281), .Y(n88) );
  OAI2XB1_X1M_A9PP140TS_C30 U447 ( .A1N(\input_2[2][2] ), .A0(n283), .B0(n89), 
        .Y(n192) );
  AOI22_X1M_A9PP140TS_C30 U448 ( .A0(\input_2[2][1] ), .A1(n284), .B0(data[18]), .B1(n266), .Y(n89) );
  OAI2XB1_X1M_A9PP140TS_C30 U449 ( .A1N(\input_2[3][5] ), .A0(n283), .B0(n79), 
        .Y(n181) );
  AOI22_X1M_A9PP140TS_C30 U450 ( .A0(\input_2[3][4] ), .A1(n284), .B0(data[29]), .B1(n280), .Y(n79) );
  OAI2XB1_X1M_A9PP140TS_C30 U451 ( .A1N(\input_2[3][4] ), .A0(n283), .B0(n80), 
        .Y(n182) );
  AOI22_X1M_A9PP140TS_C30 U452 ( .A0(\input_2[3][3] ), .A1(n284), .B0(data[28]), .B1(n280), .Y(n80) );
  OAI2XB1_X1M_A9PP140TS_C30 U453 ( .A1N(\input_2[3][3] ), .A0(n283), .B0(n81), 
        .Y(n183) );
  AOI22_X1M_A9PP140TS_C30 U454 ( .A0(\input_2[3][2] ), .A1(n284), .B0(data[27]), .B1(n280), .Y(n81) );
  OAI2XB1_X1M_A9PP140TS_C30 U455 ( .A1N(\input_2[3][2] ), .A0(n283), .B0(n82), 
        .Y(n184) );
  AOI22_X1M_A9PP140TS_C30 U456 ( .A0(\input_2[3][1] ), .A1(n286), .B0(data[26]), .B1(n266), .Y(n82) );
  OAI2XB1_X1M_A9PP140TS_C30 U457 ( .A1N(\input_2[0][1] ), .A0(n283), .B0(n104), 
        .Y(n209) );
  AOI22_X1M_A9PP140TS_C30 U458 ( .A0(\input_2[0][0] ), .A1(n285), .B0(data[1]), 
        .B1(n281), .Y(n104) );
  OAI2XB1_X1M_A9PP140TS_C30 U459 ( .A1N(\input_2[1][1] ), .A0(n283), .B0(n97), 
        .Y(n201) );
  AOI22_X1M_A9PP140TS_C30 U460 ( .A0(\input_2[1][0] ), .A1(n285), .B0(data[9]), 
        .B1(n281), .Y(n97) );
  OAI2XB1_X1M_A9PP140TS_C30 U461 ( .A1N(\input_2[0][6] ), .A0(n283), .B0(n99), 
        .Y(n204) );
  AOI22_X1M_A9PP140TS_C30 U462 ( .A0(\input_2[0][5] ), .A1(n285), .B0(data[6]), 
        .B1(n281), .Y(n99) );
  OAI2XB1_X1M_A9PP140TS_C30 U463 ( .A1N(\input_2[0][5] ), .A0(n283), .B0(n100), 
        .Y(n205) );
  AOI22_X1M_A9PP140TS_C30 U464 ( .A0(\input_2[0][4] ), .A1(n285), .B0(data[5]), 
        .B1(n281), .Y(n100) );
  OAI2XB1_X1M_A9PP140TS_C30 U465 ( .A1N(\input_2[0][4] ), .A0(n283), .B0(n101), 
        .Y(n206) );
  AOI22_X1M_A9PP140TS_C30 U466 ( .A0(\input_2[0][3] ), .A1(n285), .B0(data[4]), 
        .B1(n281), .Y(n101) );
  OAI2XB1_X1M_A9PP140TS_C30 U467 ( .A1N(\input_2[0][3] ), .A0(n283), .B0(n102), 
        .Y(n207) );
  AOI22_X1M_A9PP140TS_C30 U468 ( .A0(\input_2[0][2] ), .A1(n285), .B0(data[3]), 
        .B1(n281), .Y(n102) );
  OAI2XB1_X1M_A9PP140TS_C30 U469 ( .A1N(\input_2[1][6] ), .A0(n283), .B0(n92), 
        .Y(n196) );
  AOI22_X1M_A9PP140TS_C30 U470 ( .A0(\input_2[1][5] ), .A1(n285), .B0(data[14]), .B1(n281), .Y(n92) );
  OAI2XB1_X1M_A9PP140TS_C30 U471 ( .A1N(\input_2[1][5] ), .A0(n283), .B0(n93), 
        .Y(n197) );
  AOI22_X1M_A9PP140TS_C30 U472 ( .A0(\input_2[1][4] ), .A1(n285), .B0(data[13]), .B1(n281), .Y(n93) );
  OAI2XB1_X1M_A9PP140TS_C30 U473 ( .A1N(\input_2[1][3] ), .A0(n248), .B0(n95), 
        .Y(n199) );
  AOI22_X1M_A9PP140TS_C30 U474 ( .A0(\input_2[1][2] ), .A1(n285), .B0(data[11]), .B1(n281), .Y(n95) );
  OAI2XB1_X1M_A9PP140TS_C30 U475 ( .A1N(\input_2[1][2] ), .A0(n283), .B0(n96), 
        .Y(n200) );
  AOI22_X1M_A9PP140TS_C30 U476 ( .A0(\input_2[1][1] ), .A1(n285), .B0(data[10]), .B1(n281), .Y(n96) );
  OAI2XB1_X1M_A9PP140TS_C30 U477 ( .A1N(\input_2[3][6] ), .A0(n283), .B0(n78), 
        .Y(n180) );
  AOI22_X1M_A9PP140TS_C30 U478 ( .A0(\input_2[3][5] ), .A1(n286), .B0(data[30]), .B1(n266), .Y(n78) );
  OAI2XB1_X1M_A9PP140TS_C30 U479 ( .A1N(\input_1[0][1] ), .A0(n279), .B0(n137), 
        .Y(n241) );
  OAI2XB1_X1M_A9PP140TS_C30 U480 ( .A1N(\input_1[1][1] ), .A0(n279), .B0(n130), 
        .Y(n233) );
  AOI22_X1M_A9PP140TS_C30 U481 ( .A0(\input_1[2][0] ), .A1(n286), .B0(n275), 
        .B1(data[17]), .Y(n123) );
  AOI22_X1M_A9PP140TS_C30 U482 ( .A0(\input_1[3][0] ), .A1(n286), .B0(n275), 
        .B1(data[25]), .Y(n116) );
  OAI2XB1_X1M_A9PP140TS_C30 U483 ( .A1N(\input_1[0][6] ), .A0(n279), .B0(n132), 
        .Y(n236) );
  OAI2XB1_X1M_A9PP140TS_C30 U484 ( .A1N(\input_1[0][5] ), .A0(n279), .B0(n133), 
        .Y(n237) );
  OAI2XB1_X1M_A9PP140TS_C30 U485 ( .A1N(\input_1[0][4] ), .A0(n279), .B0(n134), 
        .Y(n238) );
  OAI2XB1_X1M_A9PP140TS_C30 U486 ( .A1N(\input_1[0][3] ), .A0(n279), .B0(n135), 
        .Y(n239) );
  OAI2XB1_X1M_A9PP140TS_C30 U487 ( .A1N(\input_1[1][6] ), .A0(n279), .B0(n125), 
        .Y(n228) );
  OAI2XB1_X1M_A9PP140TS_C30 U488 ( .A1N(\input_1[1][5] ), .A0(n279), .B0(n126), 
        .Y(n229) );
  OAI2XB1_X1M_A9PP140TS_C30 U489 ( .A1N(\input_1[1][3] ), .A0(n279), .B0(n128), 
        .Y(n231) );
  OAI2XB1_X1M_A9PP140TS_C30 U490 ( .A1N(\input_1[1][2] ), .A0(n279), .B0(n129), 
        .Y(n232) );
  AOI22_X1M_A9PP140TS_C30 U491 ( .A0(\input_1[2][4] ), .A1(n286), .B0(n275), 
        .B1(data[21]), .Y(n119) );
  AOI22_X1M_A9PP140TS_C30 U492 ( .A0(\input_1[2][3] ), .A1(n286), .B0(n275), 
        .B1(data[20]), .Y(n120) );
  AOI22_X1M_A9PP140TS_C30 U493 ( .A0(\input_1[2][2] ), .A1(n286), .B0(n275), 
        .B1(data[19]), .Y(n121) );
  AOI22_X1M_A9PP140TS_C30 U494 ( .A0(\input_1[2][1] ), .A1(n286), .B0(n275), 
        .B1(data[18]), .Y(n122) );
  OAI2XB1_X1M_A9PP140TS_C30 U495 ( .A1N(\input_1[3][6] ), .A0(n279), .B0(n111), 
        .Y(n212) );
  AOI22_X1M_A9PP140TS_C30 U496 ( .A0(\input_1[3][5] ), .A1(n286), .B0(n275), 
        .B1(data[30]), .Y(n111) );
  AOI22_X1M_A9PP140TS_C30 U497 ( .A0(\input_1[3][4] ), .A1(n286), .B0(n275), 
        .B1(data[29]), .Y(n112) );
  AOI22_X1M_A9PP140TS_C30 U498 ( .A0(\input_1[3][3] ), .A1(n286), .B0(n275), 
        .B1(data[28]), .Y(n113) );
  AOI22_X1M_A9PP140TS_C30 U499 ( .A0(\input_1[3][2] ), .A1(n286), .B0(n275), 
        .B1(data[27]), .Y(n114) );
  AOI22_X1M_A9PP140TS_C30 U500 ( .A0(\input_1[3][1] ), .A1(n286), .B0(n275), 
        .B1(data[26]), .Y(n115) );
  INV_X1M_A9PP140TS_C30 U501 ( .A(\input_2[0][0] ), .Y(n47) );
  INV_X1M_A9PP140TS_C30 U502 ( .A(\input_2[1][0] ), .Y(n45) );
  XNOR2_X0P5M_A9PP140TS_C30 U503 ( .A(counter_now[2]), .B(counter_now[1]), .Y(
        n155) );
  XOR2_X0P5M_A9PP140TS_C30 U504 ( .A(n157), .B(counter_now[2]), .Y(n154) );
  NAND2_X1A_A9PP140TS_C30 U505 ( .A(N179), .B(counter_now[1]), .Y(n157) );
  OAI22_X1M_A9PP140TS_C30 U506 ( .A0(n279), .A1(n35), .B0(n53), .B1(n278), .Y(
        n226) );
  INV_X1M_A9PP140TS_C30 U507 ( .A(\input_1[2][0] ), .Y(n35) );
  INV_X1M_A9PP140TS_C30 U508 ( .A(\input_1[3][0] ), .Y(n33) );
  OAI21_X1M_A9PP140TS_C30 U509 ( .A0(n46), .A1(n283), .B0(n98), .Y(n203) );
  AOI22_X1M_A9PP140TS_C30 U510 ( .A0(\input_2[0][6] ), .A1(n285), .B0(data[7]), 
        .B1(n281), .Y(n98) );
  OAI21_X1M_A9PP140TS_C30 U511 ( .A0(n44), .A1(n248), .B0(n91), .Y(n195) );
  AOI22_X1M_A9PP140TS_C30 U512 ( .A0(\input_2[1][6] ), .A1(n285), .B0(data[15]), .B1(n281), .Y(n91) );
  OAI21_X1M_A9PP140TS_C30 U513 ( .A0(n42), .A1(n283), .B0(n84), .Y(n187) );
  AOI22_X1M_A9PP140TS_C30 U514 ( .A0(\input_2[2][6] ), .A1(n286), .B0(data[23]), .B1(n266), .Y(n84) );
  OAI21_X1M_A9PP140TS_C30 U515 ( .A0(n40), .A1(n283), .B0(n76), .Y(n179) );
  OAI21_X1M_A9PP140TS_C30 U516 ( .A0(n38), .A1(n279), .B0(n131), .Y(n235) );
  OAI21_X1M_A9PP140TS_C30 U517 ( .A0(n36), .A1(n279), .B0(n124), .Y(n227) );
  OAI21_X1M_A9PP140TS_C30 U518 ( .A0(n34), .A1(n279), .B0(n117), .Y(n219) );
  AOI22_X1M_A9PP140TS_C30 U519 ( .A0(\input_1[2][6] ), .A1(n286), .B0(n275), 
        .B1(data[23]), .Y(n117) );
  OAI21_X1M_A9PP140TS_C30 U520 ( .A0(n32), .A1(n279), .B0(n109), .Y(n211) );
  AOI22_X1M_A9PP140TS_C30 U521 ( .A0(\input_1[3][6] ), .A1(n286), .B0(n275), 
        .B1(data[31]), .Y(n109) );
  INV_X1M_A9PP140TS_C30 U522 ( .A(\input_1[0][0] ), .Y(n39) );
  INV_X1M_A9PP140TS_C30 U523 ( .A(\input_1[1][0] ), .Y(n37) );
  XNOR2_X0P5M_A9PP140TS_C30 U524 ( .A(counter_now[3]), .B(n153), .Y(n148) );
  NOR2_X1A_A9PP140TS_C30 U525 ( .A(n152), .B(n14), .Y(n153) );
  CGEN_X1M_A9PP140TS_C30 U526 ( .A(counter_now[2]), .B(n8), .CI(n177), .CO(
        n175) );
  AOI22BB_X1M_A9PP140TS_C30 U527 ( .A0(n178), .A1(i_prec[0]), .B0N(n9), .B1N(
        counter_now[1]), .Y(n177) );
  AOI21_X1M_A9PP140TS_C30 U528 ( .A0(counter_now[1]), .A1(n9), .B0(N179), .Y(
        n178) );
  AO1B2_X1M_A9PP140TS_C30 U529 ( .B0(n175), .B1(counter_now[3]), .A0N(
        i_prec[3]), .Y(n176) );
  NAND2_X1A_A9PP140TS_C30 U530 ( .A(counter_now[2]), .B(counter_now[1]), .Y(
        n152) );
  XNOR2_X0P5M_A9PP140TS_C30 U531 ( .A(counter_now[3]), .B(n152), .Y(n151) );
  INV_X1M_A9PP140TS_C30 U532 ( .A(i_sign), .Y(n13) );
  INV_X1M_A9PP140TS_C30 U533 ( .A(N179), .Y(n14) );
  OAI22_X1M_A9PP140TS_C30 U534 ( .A0(n141), .A1(n10), .B0(byte_en[0]), .B1(
        n142), .Y(n244) );
  INV_X1M_A9PP140TS_C30 U535 ( .A(i_prec[0]), .Y(n10) );
  OAI22BB_X1M_A9PP140TS_C30 U536 ( .A0(n141), .A1(n13), .B0N(byte_en[3]), 
        .B1N(n48), .Y(n243) );
  OAI2XB1_X1M_A9PP140TS_C30 U537 ( .A1N(i_prec[3]), .A0(n141), .B0(n146), .Y(
        n247) );
  NAND4_X1M_A9PP140TS_C30 U538 ( .A(byte_en[0]), .B(n48), .C(byte_en[1]), .D(
        byte_en[2]), .Y(n146) );
  OAI22_X1M_A9PP140TS_C30 U539 ( .A0(n141), .A1(n9), .B0(n143), .B1(n142), .Y(
        n245) );
  XNOR2_X0P5M_A9PP140TS_C30 U540 ( .A(byte_en[0]), .B(byte_en[1]), .Y(n143) );
  OAI22_X1M_A9PP140TS_C30 U541 ( .A0(n141), .A1(n8), .B0(n144), .B1(n142), .Y(
        n246) );
  XOR2_X0P5M_A9PP140TS_C30 U542 ( .A(n145), .B(byte_en[2]), .Y(n144) );
  NAND2_X1A_A9PP140TS_C30 U543 ( .A(byte_en[0]), .B(byte_en[1]), .Y(n145) );
  NAND3_X1M_A9PP140TS_C30 U544 ( .A(cim_en), .B(n49), .C(in_clear), .Y(n142)
         );
  NOR2_X1A_A9PP140TS_C30 U545 ( .A(n74), .B(n46), .Y(\raddr_1_dummy[0][1] ) );
  NOR2_X1A_A9PP140TS_C30 U546 ( .A(n74), .B(n44), .Y(\raddr_1_dummy[1][1] ) );
  NOR2_X1A_A9PP140TS_C30 U547 ( .A(n74), .B(n42), .Y(\raddr_1_dummy[2][1] ) );
  NOR2_X1A_A9PP140TS_C30 U548 ( .A(n74), .B(n40), .Y(\raddr_1_dummy[3][1] ) );
  NOR2XB_X1M_A9PP140TS_C30 U549 ( .BN(cim_en), .A(in_clear), .Y(n140) );
  NAND2_X1A_A9PP140TS_C30 U550 ( .A(byte_en[2]), .B(n140), .Y(n166) );
  OAI21_X1M_A9PP140TS_C30 U551 ( .A0(n74), .A1(n38), .B0(n19), .Y(
        \raddr_1_dummy[0][0] ) );
  OAI21_X1M_A9PP140TS_C30 U552 ( .A0(n74), .A1(n36), .B0(n19), .Y(
        \raddr_1_dummy[1][0] ) );
  OAI21_X1M_A9PP140TS_C30 U553 ( .A0(n74), .A1(n34), .B0(n19), .Y(
        \raddr_1_dummy[2][0] ) );
  OAI21_X1M_A9PP140TS_C30 U554 ( .A0(n74), .A1(n32), .B0(n19), .Y(
        \raddr_1_dummy[3][0] ) );
  NAND2_X1A_A9PP140TS_C30 U555 ( .A(byte_en[1]), .B(n140), .Y(n60) );
  NAND2_X1A_A9PP140TS_C30 U556 ( .A(byte_en[0]), .B(n140), .Y(n163) );
  INV_X1M_A9PP140TS_C30 U557 ( .A(reset), .Y(n49) );
  INV_X1M_A9PP140TS_C30 U558 ( .A(data[0]), .Y(n55) );
  INV_X1M_A9PP140TS_C30 U559 ( .A(data[8]), .Y(n54) );
  INV_X1M_A9PP140TS_C30 U560 ( .A(data[16]), .Y(n53) );
  INV_X1M_A9PP140TS_C30 U561 ( .A(data[24]), .Y(n52) );
endmodule

