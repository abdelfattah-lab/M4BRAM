/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : T-2022.03-SP5
// Date      : Mon Jul  3 19:59:32 2023
/////////////////////////////////////////////////////////////


module fsm_doublepump ( clk, reset, cim_en, in_clear, data, byte_en, carry_in, 
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
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         i_sign, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, \input_act[3][7] , \input_act[3][6] , \input_act[3][5] ,
         \input_act[3][4] , \input_act[3][3] , \input_act[3][2] ,
         \input_act[3][1] , \input_act[3][0] , \input_act[2][7] ,
         \input_act[2][6] , \input_act[2][5] , \input_act[2][4] ,
         \input_act[2][3] , \input_act[2][2] , \input_act[2][1] ,
         \input_act[2][0] , \input_act[1][7] , \input_act[1][6] ,
         \input_act[1][5] , \input_act[1][4] , \input_act[1][3] ,
         \input_act[1][2] , \input_act[1][1] , \input_act[1][0] ,
         \input_act[0][7] , \input_act[0][6] , \input_act[0][5] ,
         \input_act[0][4] , \input_act[0][3] , \input_act[0][2] ,
         \input_act[0][1] , \input_act[0][0] , N44, N45, N46, N47, N48, N49,
         N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63,
         N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77,
         N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, read_input_1,
         shift_input, N89, N90, N91, N92, N93, \input_1[3][7] ,
         \input_1[3][6] , \input_1[3][5] , \input_1[3][4] , \input_1[3][3] ,
         \input_1[3][2] , \input_1[3][1] , \input_1[3][0] , \input_1[2][7] ,
         \input_1[2][6] , \input_1[2][5] , \input_1[2][4] , \input_1[2][3] ,
         \input_1[2][2] , \input_1[2][1] , \input_1[2][0] , \input_1[1][7] ,
         \input_1[1][6] , \input_1[1][5] , \input_1[1][4] , \input_1[1][3] ,
         \input_1[1][2] , \input_1[1][1] , \input_1[1][0] , \input_1[0][7] ,
         \input_1[0][6] , \input_1[0][5] , \input_1[0][4] , \input_1[0][3] ,
         \input_1[0][2] , \input_1[0][1] , \input_1[0][0] , \input_2[3][7] ,
         \input_2[3][6] , \input_2[3][5] , \input_2[3][4] , \input_2[3][3] ,
         \input_2[3][2] , \input_2[3][1] , \input_2[3][0] , \input_2[2][7] ,
         \input_2[2][6] , \input_2[2][5] , \input_2[2][4] , \input_2[2][3] ,
         \input_2[2][2] , \input_2[2][1] , \input_2[2][0] , \input_2[1][7] ,
         \input_2[1][6] , \input_2[1][5] , \input_2[1][4] , \input_2[1][3] ,
         \input_2[1][2] , \input_2[1][1] , \input_2[1][0] , \input_2[0][7] ,
         \input_2[0][6] , \input_2[0][5] , \input_2[0][4] , \input_2[0][3] ,
         \input_2[0][2] , \input_2[0][1] , \input_2[0][0] , N94, N95, N96, N97,
         N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109,
         N110, N111, N112, N113, N114, N115, N116, N117, N118, N119, N120,
         N121, N122, N123, N124, N125, N126, N127, N128, N129, N130, N131,
         N132, N133, N134, N135, N136, N137, N138, N139, N140, N141, N142,
         N143, N144, N145, N146, N147, N148, N149, N150, N151, N152, N153,
         N154, N155, N156, N157, N158, N159, N160, N161, N162, N163, N164,
         N165, N166, N167, N168, N169, N170, N171, N172, N173, N174, N175,
         N176, N177, N178, N179, N180, N181, N182, N183, N184, N185, N186,
         N187, N188, N189, N190, N191, N192, N193, N194, N195, N196, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N206, N207, N208,
         N209, N210, N211, N212, N213, N214, N215, N216, N217, N218, N219,
         N220, N221, N222, N223, N224, N225, N226, N227, N228, N229, N230,
         N231, N232, N233, N234, N235, N236, N237, N238, N239, N240, N241,
         N242, N243, N244, N245, N246, N247, N248, N249, N250, N251, N252,
         N253, N254, N255, N256, N257, N258, N259, N260, N261, N262, N263,
         N264, N265, N266, N267, N268, N269, N270, N271, N272, N273, N274,
         N275, N276, N277, N278, N279, N280, N281, N282, N283, N284, N285,
         N286, N287, N288, N289, N290, N291, N292, N293, N294, N295, N296,
         N297, N298, N299, N300, N301, N302, N303, N304, N305, N306, N307,
         N308, N309, N310, N311, N312, N313, N314, N315, N316, N317, N318,
         N319, N320, N321, N322, N323, N324, N325, N326, N327, N328, N329,
         N330, N331, N332, N333, N334, N335, N336, N337, N338, N339, N340,
         N341, N342, N343, N344, N345, N346, N0, N347, N348, N349;
  wire   [3:0] ctrl_flag;
  wire   [3:0] i_prec;
  wire   [3:0] state_now;
  wire   [3:0] counter_now;
  wire   [3:0] state_next;
  wire   [3:0] counter_next;
  assign wsel_2_dummy[1] = N0;

  \**SEQGEN**  \i_prec_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N40), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N35) );
  \**SEQGEN**  \i_prec_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N39), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N35) );
  \**SEQGEN**  \i_prec_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N38), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N35) );
  \**SEQGEN**  \i_prec_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N37), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N35) );
  \**SEQGEN**  i_sign_reg ( .clear(1'b0), .preset(1'b0), .next_state(N36), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_sign), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N35) );
  \**SEQGEN**  \input_act_reg[3][7]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N76), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[3][6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N75), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[3][5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N74), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[3][4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N73), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[3][3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N72), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[3][2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N71), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[3][1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N70), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[3][0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N69), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][7]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N68), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N67), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N66), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N65), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N64), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N63), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N62), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[2][0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N61), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][7]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N60), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N59), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N58), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N57), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N56), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N55), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N54), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[1][0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N53), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][7]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N52), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N51), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N50), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N49), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N48), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N47), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N46), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \input_act_reg[0][0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N45), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_act[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N44) );
  \**SEQGEN**  \counter_now_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N88), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \counter_now_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N87), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \counter_now_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N86), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \counter_now_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N85), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \state_now_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N84), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \state_now_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N83), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \state_now_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N82), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \state_now_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N81), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \input_1_reg[3][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N159), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[3][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N158), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[3][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N157), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[3][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N156), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[3][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N155), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[3][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N154), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[3][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N153), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[3][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N152), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N151), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N150), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N149), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N148), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N147), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N146), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N145), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[2][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N144), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N143), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N142), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N141), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N140), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N139), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N138), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N137), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[1][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N136), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N135), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N134), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N133), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N132), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N131), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N130), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N129), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_1_reg[0][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N128), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \input_2_reg[3][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N126), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[3][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N125), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[3][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N124), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[3][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N123), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[3][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N122), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[3][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N121), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[3][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N120), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[3][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N119), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N118), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N117), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N116), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N115), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N114), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N113), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N112), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[2][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N111), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N110), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N109), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N108), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N107), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N106), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N105), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N104), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[1][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N103), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N102), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N99), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N98), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N97), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N96), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  \**SEQGEN**  \input_2_reg[0][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N95), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N94) );
  GTECH_AND2 C287 ( .A(N326), .B(N319), .Z(N167) );
  GTECH_AND2 C288 ( .A(N320), .B(N321), .Z(N168) );
  GTECH_AND2 C289 ( .A(N167), .B(N168), .Z(N169) );
  GTECH_OR2 C291 ( .A(state_now[3]), .B(state_now[2]), .Z(N170) );
  GTECH_OR2 C292 ( .A(state_now[1]), .B(N321), .Z(N171) );
  GTECH_OR2 C293 ( .A(N170), .B(N171), .Z(N172) );
  GTECH_OR2 C296 ( .A(state_now[3]), .B(state_now[2]), .Z(N174) );
  GTECH_OR2 C297 ( .A(N320), .B(state_now[0]), .Z(N175) );
  GTECH_OR2 C298 ( .A(N174), .B(N175), .Z(N176) );
  GTECH_OR2 C302 ( .A(state_now[3]), .B(state_now[2]), .Z(N178) );
  GTECH_OR2 C303 ( .A(N320), .B(N321), .Z(N179) );
  GTECH_OR2 C304 ( .A(N178), .B(N179), .Z(N180) );
  GTECH_OR2 C307 ( .A(state_now[3]), .B(N319), .Z(N182) );
  GTECH_OR2 C308 ( .A(state_now[1]), .B(state_now[0]), .Z(N183) );
  GTECH_OR2 C309 ( .A(N182), .B(N183), .Z(N184) );
  GTECH_OR2 C313 ( .A(state_now[3]), .B(N319), .Z(N186) );
  GTECH_OR2 C314 ( .A(state_now[1]), .B(N321), .Z(N187) );
  GTECH_OR2 C315 ( .A(N186), .B(N187), .Z(N188) );
  GTECH_OR2 C319 ( .A(state_now[3]), .B(N319), .Z(N190) );
  GTECH_OR2 C320 ( .A(N320), .B(state_now[0]), .Z(N191) );
  GTECH_OR2 C321 ( .A(N190), .B(N191), .Z(N192) );
  GTECH_OR2 C326 ( .A(state_now[3]), .B(N319), .Z(N194) );
  GTECH_OR2 C327 ( .A(N320), .B(N321), .Z(N195) );
  GTECH_OR2 C328 ( .A(N194), .B(N195), .Z(N196) );
  GTECH_OR2 C331 ( .A(N326), .B(state_now[2]), .Z(N198) );
  GTECH_OR2 C332 ( .A(state_now[1]), .B(state_now[0]), .Z(N199) );
  GTECH_OR2 C333 ( .A(N198), .B(N199), .Z(N200) );
  GTECH_OR2 C337 ( .A(N326), .B(state_now[2]), .Z(N202) );
  GTECH_OR2 C338 ( .A(state_now[1]), .B(N321), .Z(N203) );
  GTECH_OR2 C339 ( .A(N202), .B(N203), .Z(N204) );
  GTECH_OR2 C343 ( .A(N326), .B(state_now[2]), .Z(N206) );
  GTECH_OR2 C344 ( .A(N320), .B(state_now[0]), .Z(N207) );
  GTECH_OR2 C345 ( .A(N206), .B(N207), .Z(N208) );
  GTECH_OR2 C350 ( .A(N326), .B(state_now[2]), .Z(N210) );
  GTECH_OR2 C351 ( .A(N320), .B(N321), .Z(N211) );
  GTECH_OR2 C352 ( .A(N210), .B(N211), .Z(N212) );
  GTECH_OR2 C356 ( .A(N326), .B(N319), .Z(N214) );
  GTECH_OR2 C357 ( .A(state_now[1]), .B(state_now[0]), .Z(N215) );
  GTECH_OR2 C358 ( .A(N214), .B(N215), .Z(N216) );
  GTECH_AND2 C360 ( .A(state_now[3]), .B(state_now[2]), .Z(N218) );
  GTECH_AND2 C361 ( .A(N218), .B(state_now[0]), .Z(N219) );
  GTECH_AND2 C362 ( .A(state_now[3]), .B(state_now[2]), .Z(N220) );
  GTECH_AND2 C363 ( .A(N220), .B(state_now[1]), .Z(N221) );
  LT_UNS_OP lt_225 ( .A(counter_now), .B(i_prec), .Z(N232) );
  LT_UNS_OP lt_234 ( .A(counter_now), .B(i_prec), .Z(N238) );
  GTECH_AND2 C455 ( .A(N255), .B(N256), .Z(N259) );
  GTECH_AND2 C456 ( .A(N257), .B(N258), .Z(N260) );
  GTECH_AND2 C457 ( .A(N259), .B(N260), .Z(N261) );
  GTECH_OR2 C459 ( .A(state_now[3]), .B(state_now[2]), .Z(N262) );
  GTECH_OR2 C460 ( .A(state_now[1]), .B(N258), .Z(N263) );
  GTECH_OR2 C461 ( .A(N262), .B(N263), .Z(N264) );
  GTECH_OR2 C464 ( .A(state_now[3]), .B(state_now[2]), .Z(N266) );
  GTECH_OR2 C465 ( .A(N257), .B(state_now[0]), .Z(N267) );
  GTECH_OR2 C466 ( .A(N266), .B(N267), .Z(N268) );
  GTECH_OR2 C470 ( .A(state_now[3]), .B(state_now[2]), .Z(N270) );
  GTECH_OR2 C471 ( .A(N257), .B(N258), .Z(N271) );
  GTECH_OR2 C472 ( .A(N270), .B(N271), .Z(N272) );
  GTECH_OR2 C475 ( .A(state_now[3]), .B(N256), .Z(N274) );
  GTECH_OR2 C476 ( .A(state_now[1]), .B(state_now[0]), .Z(N275) );
  GTECH_OR2 C477 ( .A(N274), .B(N275), .Z(N276) );
  GTECH_OR2 C481 ( .A(state_now[3]), .B(N256), .Z(N278) );
  GTECH_OR2 C482 ( .A(state_now[1]), .B(N258), .Z(N279) );
  GTECH_OR2 C483 ( .A(N278), .B(N279), .Z(N280) );
  GTECH_OR2 C487 ( .A(state_now[3]), .B(N256), .Z(N282) );
  GTECH_OR2 C488 ( .A(N257), .B(state_now[0]), .Z(N283) );
  GTECH_OR2 C489 ( .A(N282), .B(N283), .Z(N284) );
  GTECH_OR2 C494 ( .A(state_now[3]), .B(N256), .Z(N286) );
  GTECH_OR2 C495 ( .A(N257), .B(N258), .Z(N287) );
  GTECH_OR2 C496 ( .A(N286), .B(N287), .Z(N288) );
  GTECH_OR2 C499 ( .A(N255), .B(state_now[2]), .Z(N290) );
  GTECH_OR2 C500 ( .A(state_now[1]), .B(state_now[0]), .Z(N291) );
  GTECH_OR2 C501 ( .A(N290), .B(N291), .Z(N292) );
  GTECH_OR2 C505 ( .A(N255), .B(state_now[2]), .Z(N294) );
  GTECH_OR2 C506 ( .A(state_now[1]), .B(N258), .Z(N295) );
  GTECH_OR2 C507 ( .A(N294), .B(N295), .Z(N296) );
  GTECH_OR2 C511 ( .A(N255), .B(state_now[2]), .Z(N298) );
  GTECH_OR2 C512 ( .A(N257), .B(state_now[0]), .Z(N299) );
  GTECH_OR2 C513 ( .A(N298), .B(N299), .Z(N300) );
  GTECH_OR2 C518 ( .A(N255), .B(state_now[2]), .Z(N302) );
  GTECH_OR2 C519 ( .A(N257), .B(N258), .Z(N303) );
  GTECH_OR2 C520 ( .A(N302), .B(N303), .Z(N304) );
  GTECH_OR2 C524 ( .A(N255), .B(N256), .Z(N306) );
  GTECH_OR2 C525 ( .A(state_now[1]), .B(state_now[0]), .Z(N307) );
  GTECH_OR2 C526 ( .A(N306), .B(N307), .Z(N308) );
  GTECH_AND2 C528 ( .A(state_now[3]), .B(state_now[2]), .Z(N310) );
  GTECH_AND2 C529 ( .A(N310), .B(state_now[0]), .Z(N311) );
  GTECH_AND2 C530 ( .A(state_now[3]), .B(state_now[2]), .Z(N312) );
  GTECH_AND2 C531 ( .A(N312), .B(state_now[1]), .Z(N313) );
  GTECH_NOT I_0 ( .A(state_now[2]), .Z(N319) );
  GTECH_NOT I_1 ( .A(state_now[1]), .Z(N320) );
  GTECH_NOT I_2 ( .A(state_now[0]), .Z(N321) );
  GTECH_OR2 C617 ( .A(N319), .B(state_now[3]), .Z(N322) );
  GTECH_OR2 C618 ( .A(N320), .B(N322), .Z(N323) );
  GTECH_OR2 C619 ( .A(N321), .B(N323), .Z(N324) );
  GTECH_NOT I_3 ( .A(N324), .Z(N325) );
  GTECH_NOT I_4 ( .A(state_now[3]), .Z(N326) );
  GTECH_OR2 C622 ( .A(state_now[2]), .B(N326), .Z(N327) );
  GTECH_OR2 C623 ( .A(state_now[1]), .B(N327), .Z(N328) );
  GTECH_OR2 C624 ( .A(state_now[0]), .B(N328), .Z(N329) );
  GTECH_NOT I_5 ( .A(N329), .Z(N330) );
  GTECH_OR2 C627 ( .A(N319), .B(state_now[3]), .Z(N331) );
  GTECH_OR2 C628 ( .A(state_now[1]), .B(N331), .Z(N332) );
  GTECH_OR2 C629 ( .A(state_now[0]), .B(N332), .Z(N333) );
  GTECH_NOT I_6 ( .A(N333), .Z(N334) );
  GTECH_OR2 C632 ( .A(state_now[2]), .B(state_now[3]), .Z(N335) );
  GTECH_OR2 C633 ( .A(N320), .B(N335), .Z(N336) );
  GTECH_OR2 C634 ( .A(state_now[0]), .B(N336), .Z(N337) );
  GTECH_NOT I_7 ( .A(N337), .Z(N338) );
  GTECH_OR2 C638 ( .A(state_now[2]), .B(N326), .Z(N339) );
  GTECH_OR2 C639 ( .A(state_now[1]), .B(N339), .Z(N340) );
  GTECH_OR2 C640 ( .A(N321), .B(N340), .Z(N341) );
  GTECH_NOT I_8 ( .A(N341), .Z(N342) );
  GTECH_OR2 C645 ( .A(state_now[2]), .B(N326), .Z(N343) );
  GTECH_OR2 C646 ( .A(N320), .B(N343), .Z(N344) );
  GTECH_OR2 C647 ( .A(N321), .B(N344), .Z(N345) );
  GTECH_NOT I_9 ( .A(N345), .Z(N346) );
  ADD_UNS_OP add_77 ( .A(1'b1), .B(byte_en[2:0]), .Z({N34, N33, N32, N31}) );
  ADD_UNS_OP add_230 ( .A(counter_now), .B(1'b1), .Z({N237, N236, N235, N234})
         );
  ADD_UNS_OP add_239 ( .A(counter_now), .B(1'b1), .Z({N243, N242, N241, N240})
         );
  ADD_UNS_OP add_216 ( .A(counter_now), .B(1'b1), .Z({N227, N226, N225, N224})
         );
  ADD_UNS_OP add_244 ( .A(counter_now), .B(1'b1), .Z({N247, N246, N245, N244})
         );
  ADD_UNS_OP add_221 ( .A(counter_now), .B(1'b1), .Z({N231, N230, N229, N228})
         );
  GTECH_BUF B_0 ( .A(1'b0), .Z(N0) );
  SELECT_OP C673 ( .DATA1(byte_en), .DATA2({1'b0, 1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N1), .CONTROL2(N26), .Z(ctrl_flag) );
  GTECH_BUF B_1 ( .A(N25), .Z(N1) );
  SELECT_OP C674 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N2), 
        .CONTROL2(N41), .CONTROL3(N29), .Z(N35) );
  GTECH_BUF B_2 ( .A(reset), .Z(N2) );
  SELECT_OP C675 ( .DATA1(1'b0), .DATA2(byte_en[3]), .CONTROL1(N2), .CONTROL2(
        N41), .Z(N36) );
  SELECT_OP C676 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N34, N33, N32, 
        N31}), .CONTROL1(N2), .CONTROL2(N41), .Z({N40, N39, N38, N37}) );
  SELECT_OP C677 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N2), 
        .CONTROL2(N78), .CONTROL3(N43), .Z(N44) );
  SELECT_OP C678 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(data), .CONTROL1(N2), .CONTROL2(N78), .Z({N76, N75, N74, N73, N72, 
        N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, 
        N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45}) );
  SELECT_OP C679 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(state_next), 
        .CONTROL1(N3), .CONTROL2(N80), .Z({N84, N83, N82, N81}) );
  GTECH_BUF B_3 ( .A(N79), .Z(N3) );
  SELECT_OP C680 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(counter_next), 
        .CONTROL1(N3), .CONTROL2(N80), .Z({N88, N87, N86, N85}) );
  SELECT_OP C681 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b0), .CONTROL1(N4), .CONTROL2(N161), .CONTROL3(N164), 
        .CONTROL4(N166), .CONTROL5(N93), .Z(N94) );
  GTECH_BUF B_4 ( .A(N89), .Z(N4) );
  SELECT_OP C682 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({\input_act[3][7] , \input_act[3][6] , \input_act[3][5] , 
        \input_act[3][4] , \input_act[3][3] , \input_act[3][2] , 
        \input_act[3][1] , \input_act[3][0] , \input_act[2][7] , 
        \input_act[2][6] , \input_act[2][5] , \input_act[2][4] , 
        \input_act[2][3] , \input_act[2][2] , \input_act[2][1] , 
        \input_act[2][0] , \input_act[1][7] , \input_act[1][6] , 
        \input_act[1][5] , \input_act[1][4] , \input_act[1][3] , 
        \input_act[1][2] , \input_act[1][1] , \input_act[1][0] , 
        \input_act[0][7] , \input_act[0][6] , \input_act[0][5] , 
        \input_act[0][4] , \input_act[0][3] , \input_act[0][2] , 
        \input_act[0][1] , \input_act[0][0] }), .DATA3({\input_2[3][6] , 
        \input_2[3][5] , \input_2[3][4] , \input_2[3][3] , \input_2[3][2] , 
        \input_2[3][1] , \input_2[3][0] , 1'b0, \input_2[2][6] , 
        \input_2[2][5] , \input_2[2][4] , \input_2[2][3] , \input_2[2][2] , 
        \input_2[2][1] , \input_2[2][0] , 1'b0, \input_2[1][6] , 
        \input_2[1][5] , \input_2[1][4] , \input_2[1][3] , \input_2[1][2] , 
        \input_2[1][1] , \input_2[1][0] , 1'b0, \input_2[0][6] , 
        \input_2[0][5] , \input_2[0][4] , \input_2[0][3] , \input_2[0][2] , 
        \input_2[0][1] , \input_2[0][0] , 1'b0}), .CONTROL1(N4), .CONTROL2(
        N164), .CONTROL3(N166), .Z({N126, N125, N124, N123, N122, N121, N120, 
        N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109, N108, 
        N107, N106, N105, N104, N103, N102, N101, N100, N99, N98, N97, N96, 
        N95}) );
  SELECT_OP C683 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .DATA4(1'b1), 
        .DATA5(1'b0), .CONTROL1(N4), .CONTROL2(N161), .CONTROL3(N164), 
        .CONTROL4(N166), .CONTROL5(N93), .Z(N127) );
  SELECT_OP C684 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({\input_act[3][7] , \input_act[3][6] , \input_act[3][5] , 
        \input_act[3][4] , \input_act[3][3] , \input_act[3][2] , 
        \input_act[3][1] , \input_act[3][0] , \input_act[2][7] , 
        \input_act[2][6] , \input_act[2][5] , \input_act[2][4] , 
        \input_act[2][3] , \input_act[2][2] , \input_act[2][1] , 
        \input_act[2][0] , \input_act[1][7] , \input_act[1][6] , 
        \input_act[1][5] , \input_act[1][4] , \input_act[1][3] , 
        \input_act[1][2] , \input_act[1][1] , \input_act[1][0] , 
        \input_act[0][7] , \input_act[0][6] , \input_act[0][5] , 
        \input_act[0][4] , \input_act[0][3] , \input_act[0][2] , 
        \input_act[0][1] , \input_act[0][0] }), .DATA3({\input_1[3][6] , 
        \input_1[3][5] , \input_1[3][4] , \input_1[3][3] , \input_1[3][2] , 
        \input_1[3][1] , \input_1[3][0] , 1'b0, \input_1[2][6] , 
        \input_1[2][5] , \input_1[2][4] , \input_1[2][3] , \input_1[2][2] , 
        \input_1[2][1] , \input_1[2][0] , 1'b0, \input_1[1][6] , 
        \input_1[1][5] , \input_1[1][4] , \input_1[1][3] , \input_1[1][2] , 
        \input_1[1][1] , \input_1[1][0] , 1'b0, \input_1[0][6] , 
        \input_1[0][5] , \input_1[0][4] , \input_1[0][3] , \input_1[0][2] , 
        \input_1[0][1] , \input_1[0][0] , 1'b0}), .CONTROL1(N4), .CONTROL2(
        N161), .CONTROL3(N166), .Z({N159, N158, N157, N156, N155, N154, N153, 
        N152, N151, N150, N149, N148, N147, N146, N145, N144, N143, N142, N141, 
        N140, N139, N138, N137, N136, N135, N134, N133, N132, N131, N130, N129, 
        N128}) );
  GTECH_NOT I_10 ( .A(N232), .Z(N233) );
  GTECH_NOT I_11 ( .A(N238), .Z(N239) );
  SELECT_OP C687 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b0, 1'b1}), .DATA3({1'b1, 
        1'b1}), .CONTROL1(N5), .CONTROL2(N254), .CONTROL3(N250), .Z({N252, 
        N251}) );
  GTECH_BUF B_5 ( .A(ctrl_flag[3]), .Z(N5) );
  SELECT_OP C688 ( .DATA1({1'b0, 1'b0, 1'b0, ctrl_flag[2]}), .DATA2({1'b0, 
        1'b0, 1'b1, 1'b0}), .DATA3({1'b0, 1'b0, 1'b1, 1'b1}), .DATA4({1'b0, 
        1'b1, 1'b0, 1'b0}), .DATA5({1'b0, 1'b1, 1'b0, 1'b1}), .DATA6({N223, 
        i_sign, i_sign, 1'b0}), .DATA7({1'b0, 1'b1, 1'b1, 1'b1}), .DATA8({1'b1, 
        1'b0, 1'b0, N233}), .DATA9({1'b1, 1'b0, 1'b0, N239}), .DATA10({1'b1, 
        1'b0, 1'b1, 1'b0}), .DATA11({ctrl_flag[0], N248, ctrl_flag[0], 
        ctrl_flag[0]}), .DATA12({1'b1, 1'b1, 1'b0, 1'b0}), .DATA13({N252, N251, 
        1'b0, 1'b0}), .DATA14({1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N6), 
        .CONTROL2(N7), .CONTROL3(N8), .CONTROL4(N9), .CONTROL5(N10), 
        .CONTROL6(N11), .CONTROL7(N12), .CONTROL8(N13), .CONTROL9(N14), 
        .CONTROL10(N15), .CONTROL11(N16), .CONTROL12(N17), .CONTROL13(N18), 
        .CONTROL14(N19), .Z(state_next) );
  GTECH_BUF B_6 ( .A(N169), .Z(N6) );
  GTECH_BUF B_7 ( .A(N173), .Z(N7) );
  GTECH_BUF B_8 ( .A(N177), .Z(N8) );
  GTECH_BUF B_9 ( .A(N181), .Z(N9) );
  GTECH_BUF B_10 ( .A(N185), .Z(N10) );
  GTECH_BUF B_11 ( .A(N189), .Z(N11) );
  GTECH_BUF B_12 ( .A(N193), .Z(N12) );
  GTECH_BUF B_13 ( .A(N197), .Z(N13) );
  GTECH_BUF B_14 ( .A(N201), .Z(N14) );
  GTECH_BUF B_15 ( .A(N205), .Z(N15) );
  GTECH_BUF B_16 ( .A(N209), .Z(N16) );
  GTECH_BUF B_17 ( .A(N213), .Z(N17) );
  GTECH_BUF B_18 ( .A(N217), .Z(N18) );
  GTECH_BUF B_19 ( .A(N222), .Z(N19) );
  SELECT_OP C689 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({1'b0, 1'b0, 1'b0, 
        1'b0}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0}), .DATA4({1'b0, 1'b0, 1'b0, 
        1'b0}), .DATA5({1'b0, 1'b0, 1'b0, 1'b0}), .DATA6({N227, N226, N225, 
        N224}), .DATA7({N231, N230, N229, N228}), .DATA8({N237, N236, N235, 
        N234}), .DATA9({N243, N242, N241, N240}), .DATA10({N247, N246, N245, 
        N244}), .DATA11({1'b0, 1'b0, 1'b0, 1'b0}), .DATA12({1'b0, 1'b0, 1'b0, 
        1'b0}), .DATA13({1'b0, 1'b0, 1'b0, 1'b0}), .DATA14({1'b0, 1'b0, 1'b0, 
        1'b0}), .CONTROL1(N6), .CONTROL2(N7), .CONTROL3(N8), .CONTROL4(N9), 
        .CONTROL5(N10), .CONTROL6(N11), .CONTROL7(N12), .CONTROL8(N13), 
        .CONTROL9(N14), .CONTROL10(N15), .CONTROL11(N16), .CONTROL12(N17), 
        .CONTROL13(N18), .CONTROL14(N19), .Z(counter_next) );
  SELECT_OP C690 ( .DATA1(1'b1), .DATA2(1'b0), .CONTROL1(N20), .CONTROL2(N21), 
        .Z(N316) );
  GTECH_BUF B_20 ( .A(ctrl_flag[1]), .Z(N20) );
  GTECH_BUF B_21 ( .A(N315), .Z(N21) );
  SELECT_OP C691 ( .DATA1(1'b1), .DATA2(1'b0), .CONTROL1(N22), .CONTROL2(N23), 
        .Z(N318) );
  GTECH_BUF B_22 ( .A(ctrl_flag[2]), .Z(N22) );
  GTECH_BUF B_23 ( .A(N317), .Z(N23) );
  SELECT_OP C692 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .DATA8(1'b0), .DATA9(1'b0), 
        .DATA10(1'b0), .DATA11(1'b0), .DATA12(1'b0), .DATA13(1'b1), .DATA14(
        1'b0), .CONTROL1(N24), .CONTROL2(N265), .CONTROL3(N269), .CONTROL4(
        N273), .CONTROL5(N277), .CONTROL6(N281), .CONTROL7(N285), .CONTROL8(
        N289), .CONTROL9(N293), .CONTROL10(N297), .CONTROL11(N301), 
        .CONTROL12(N305), .CONTROL13(N309), .CONTROL14(N314), .Z(readout_dummy) );
  GTECH_BUF B_24 ( .A(N261), .Z(N24) );
  SELECT_OP C693 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b0), .CONTROL1(N265), .CONTROL2(
        N269), .CONTROL3(N277), .CONTROL4(N281), .CONTROL5(N285), .CONTROL6(
        N297), .CONTROL7(N309), .Z(wsel_2_dummy[0]) );
  SELECT_OP C694 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b0), .CONTROL1(N281), .CONTROL2(N289), .CONTROL3(N293), 
        .CONTROL4(N297), .CONTROL5(N301), .Z(wsel_1_dummy) );
  SELECT_OP C695 ( .DATA1({1'b1, 1'b1, 1'b0}), .DATA2({1'b0, 1'b0, 1'b1}), 
        .DATA3({1'b0, 1'b1, 1'b0}), .DATA4({1'b1, 1'b0, 1'b1}), .DATA5({1'b1, 
        1'b0, 1'b0}), .DATA6({1'b0, 1'b0, 1'b1}), .DATA7({1'b1, 1'b1, 1'b0}), 
        .CONTROL1(N265), .CONTROL2(N269), .CONTROL3(N277), .CONTROL4(N281), 
        .CONTROL5(N285), .CONTROL6(N297), .CONTROL7(N309), .Z(waddr_2_dummy)
         );
  SELECT_OP C696 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({1'b0, 1'b1, 1'b1}), 
        .DATA3({1'b1, 1'b0, 1'b1}), .DATA4({1'b1, 1'b0, 1'b1}), .DATA5({1'b1, 
        1'b0, 1'b1}), .DATA6({1'b1, 1'b1, 1'b0}), .CONTROL1(N277), .CONTROL2(
        N281), .CONTROL3(N289), .CONTROL4(N293), .CONTROL5(N297), .CONTROL6(
        N301), .Z(waddr_1_dummy) );
  SELECT_OP C697 ( .DATA1({1'b0, 1'b1, 1'b0}), .DATA2({1'b1, 1'b0, 1'b1}), 
        .DATA3({1'b1, 1'b0, 1'b1}), .DATA4({1'b1, 1'b0, 1'b1}), .DATA5({1'b1, 
        1'b1, 1'b0}), .DATA6({1'b1, 1'b1, 1'b0}), .CONTROL1(N281), .CONTROL2(
        N289), .CONTROL3(N293), .CONTROL4(N297), .CONTROL5(N301), .CONTROL6(
        N309), .Z(raddr_2_dummy) );
  SELECT_OP C698 ( .DATA1({1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b1}), .DATA2({1'b0, \input_2[3][7] , 
        \input_1[3][7] , 1'b0, \input_2[2][7] , \input_1[2][7] , 1'b0, 
        \input_2[1][7] , \input_1[1][7] , 1'b0, \input_2[0][7] , 
        \input_1[0][7] }), .DATA3({1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0}), .DATA4({1'b0, \input_2[3][7] , 
        \input_1[3][7] , 1'b0, \input_2[2][7] , \input_1[2][7] , 1'b0, 
        \input_2[1][7] , \input_1[1][7] , 1'b0, \input_2[0][7] , 
        \input_1[0][7] }), .DATA5({1'b0, \input_2[3][7] , \input_1[3][7] , 
        1'b0, \input_2[2][7] , \input_1[2][7] , 1'b0, \input_2[1][7] , 
        \input_1[1][7] , 1'b0, \input_2[0][7] , \input_1[0][7] }), .DATA6({
        1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1}), .CONTROL1(N281), .CONTROL2(N285), .CONTROL3(N289), .CONTROL4(N293), 
        .CONTROL5(N297), .CONTROL6(N301), .Z({\raddr_1_dummy[3][2] , 
        \raddr_1_dummy[3][1] , \raddr_1_dummy[3][0] , \raddr_1_dummy[2][2] , 
        \raddr_1_dummy[2][1] , \raddr_1_dummy[2][0] , \raddr_1_dummy[1][2] , 
        \raddr_1_dummy[1][1] , \raddr_1_dummy[1][0] , \raddr_1_dummy[0][2] , 
        \raddr_1_dummy[0][1] , \raddr_1_dummy[0][0] }) );
  SELECT_OP C699 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b0), .DATA9(1'b0), 
        .DATA10(N316), .DATA11(1'b0), .DATA12(1'b0), .DATA13(N318), .DATA14(
        1'b0), .CONTROL1(N24), .CONTROL2(N265), .CONTROL3(N269), .CONTROL4(
        N273), .CONTROL5(N277), .CONTROL6(N281), .CONTROL7(N285), .CONTROL8(
        N289), .CONTROL9(N293), .CONTROL10(N297), .CONTROL11(N301), 
        .CONTROL12(N305), .CONTROL13(N309), .CONTROL14(N314), .Z(wen_2_dummy)
         );
  SELECT_OP C700 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b0), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b1), .DATA11(1'b1), .DATA12(1'b0), .DATA13(1'b0), .DATA14(
        1'b0), .CONTROL1(N24), .CONTROL2(N265), .CONTROL3(N269), .CONTROL4(
        N273), .CONTROL5(N277), .CONTROL6(N281), .CONTROL7(N285), .CONTROL8(
        N289), .CONTROL9(N293), .CONTROL10(N297), .CONTROL11(N301), 
        .CONTROL12(N305), .CONTROL13(N309), .CONTROL14(N314), .Z(wen_1_dummy)
         );
  SELECT_OP C701 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b0), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b1), .DATA11(1'b1), .DATA12(1'b0), .DATA13(1'b1), .DATA14(
        1'b0), .CONTROL1(N24), .CONTROL2(N265), .CONTROL3(N269), .CONTROL4(
        N273), .CONTROL5(N277), .CONTROL6(N281), .CONTROL7(N285), .CONTROL8(
        N289), .CONTROL9(N293), .CONTROL10(N297), .CONTROL11(N301), 
        .CONTROL12(N305), .CONTROL13(N309), .CONTROL14(N314), .Z(ren_2_dummy)
         );
  SELECT_OP C702 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b1), .DATA11(1'b1), .DATA12(1'b0), .DATA13(1'b0), .DATA14(
        1'b0), .CONTROL1(N24), .CONTROL2(N265), .CONTROL3(N269), .CONTROL4(
        N273), .CONTROL5(N277), .CONTROL6(N281), .CONTROL7(N285), .CONTROL8(
        N289), .CONTROL9(N293), .CONTROL10(N297), .CONTROL11(N301), 
        .CONTROL12(N305), .CONTROL13(N309), .CONTROL14(N314), .Z(ren_1_dummy)
         );
  SELECT_OP C703 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .DATA8(1'b1), .DATA9(1'b0), 
        .DATA10(1'b0), .DATA11(1'b0), .DATA12(1'b0), .DATA13(1'b0), .DATA14(
        1'b0), .CONTROL1(N24), .CONTROL2(N265), .CONTROL3(N269), .CONTROL4(
        N273), .CONTROL5(N277), .CONTROL6(N281), .CONTROL7(N285), .CONTROL8(
        N289), .CONTROL9(N293), .CONTROL10(N297), .CONTROL11(N301), 
        .CONTROL12(N305), .CONTROL13(N309), .CONTROL14(N314), .Z(carry_in) );
  GTECH_AND2 C706 ( .A(cim_en), .B(N347), .Z(N25) );
  GTECH_NOT I_12 ( .A(in_clear), .Z(N347) );
  GTECH_NOT I_13 ( .A(N25), .Z(N26) );
  GTECH_AND2 C710 ( .A(cim_en), .B(in_clear), .Z(N27) );
  GTECH_OR2 C712 ( .A(N27), .B(reset), .Z(N28) );
  GTECH_NOT I_14 ( .A(N28), .Z(N29) );
  GTECH_BUF B_25 ( .A(N41), .Z(N30) );
  GTECH_AND2 C715 ( .A(N27), .B(N77), .Z(N41) );
  GTECH_AND2 C716 ( .A(N30), .B(N77) );
  GTECH_OR2 C719 ( .A(ctrl_flag[1]), .B(reset), .Z(N42) );
  GTECH_NOT I_15 ( .A(N42), .Z(N43) );
  GTECH_NOT I_16 ( .A(reset), .Z(N77) );
  GTECH_AND2 C722 ( .A(ctrl_flag[1]), .B(N77), .Z(N78) );
  GTECH_OR2 C723 ( .A(ctrl_flag[3]), .B(reset), .Z(N79) );
  GTECH_NOT I_17 ( .A(N79), .Z(N80) );
  GTECH_AND2 C726 ( .A(N349), .B(ctrl_flag[1]), .Z(read_input_1) );
  GTECH_OR2 C727 ( .A(N348), .B(N346), .Z(N349) );
  GTECH_OR2 C728 ( .A(N338), .B(N342), .Z(N348) );
  GTECH_OR2 C729 ( .A(N325), .B(N330), .Z(shift_input) );
  GTECH_OR2 C730 ( .A(ctrl_flag[3]), .B(reset), .Z(N89) );
  GTECH_OR2 C735 ( .A(read_input_1), .B(N89), .Z(N90) );
  GTECH_OR2 C736 ( .A(N334), .B(N90), .Z(N91) );
  GTECH_OR2 C737 ( .A(shift_input), .B(N91), .Z(N92) );
  GTECH_NOT I_18 ( .A(N92), .Z(N93) );
  GTECH_NOT I_19 ( .A(N89), .Z(N160) );
  GTECH_AND2 C740 ( .A(read_input_1), .B(N160), .Z(N161) );
  GTECH_NOT I_20 ( .A(read_input_1), .Z(N162) );
  GTECH_AND2 C742 ( .A(N160), .B(N162), .Z(N163) );
  GTECH_AND2 C743 ( .A(N334), .B(N163), .Z(N164) );
  GTECH_AND2 C745 ( .A(N163), .B(N333), .Z(N165) );
  GTECH_AND2 C746 ( .A(shift_input), .B(N165), .Z(N166) );
  GTECH_NOT I_21 ( .A(N172), .Z(N173) );
  GTECH_NOT I_22 ( .A(N176), .Z(N177) );
  GTECH_NOT I_23 ( .A(N180), .Z(N181) );
  GTECH_NOT I_24 ( .A(N184), .Z(N185) );
  GTECH_NOT I_25 ( .A(N188), .Z(N189) );
  GTECH_NOT I_26 ( .A(N192), .Z(N193) );
  GTECH_NOT I_27 ( .A(N196), .Z(N197) );
  GTECH_NOT I_28 ( .A(N200), .Z(N201) );
  GTECH_NOT I_29 ( .A(N204), .Z(N205) );
  GTECH_NOT I_30 ( .A(N208), .Z(N209) );
  GTECH_NOT I_31 ( .A(N212), .Z(N213) );
  GTECH_NOT I_32 ( .A(N216), .Z(N217) );
  GTECH_OR2 C785 ( .A(N219), .B(N221), .Z(N222) );
  GTECH_BUF B_26 ( .A(N189) );
  GTECH_NOT I_33 ( .A(i_sign), .Z(N223) );
  GTECH_BUF B_27 ( .A(N193) );
  GTECH_BUF B_28 ( .A(N197) );
  GTECH_BUF B_29 ( .A(N201) );
  GTECH_BUF B_30 ( .A(N205) );
  GTECH_NOT I_34 ( .A(ctrl_flag[0]), .Z(N248) );
  GTECH_OR2 C816 ( .A(ctrl_flag[2]), .B(ctrl_flag[3]), .Z(N249) );
  GTECH_NOT I_35 ( .A(N249), .Z(N250) );
  GTECH_NOT I_36 ( .A(ctrl_flag[3]), .Z(N253) );
  GTECH_AND2 C819 ( .A(ctrl_flag[2]), .B(N253), .Z(N254) );
  GTECH_NOT I_37 ( .A(state_now[3]), .Z(N255) );
  GTECH_NOT I_38 ( .A(state_now[2]), .Z(N256) );
  GTECH_NOT I_39 ( .A(state_now[1]), .Z(N257) );
  GTECH_NOT I_40 ( .A(state_now[0]), .Z(N258) );
  GTECH_NOT I_41 ( .A(N264), .Z(N265) );
  GTECH_NOT I_42 ( .A(N268), .Z(N269) );
  GTECH_NOT I_43 ( .A(N272), .Z(N273) );
  GTECH_NOT I_44 ( .A(N276), .Z(N277) );
  GTECH_NOT I_45 ( .A(N280), .Z(N281) );
  GTECH_NOT I_46 ( .A(N284), .Z(N285) );
  GTECH_NOT I_47 ( .A(N288), .Z(N289) );
  GTECH_NOT I_48 ( .A(N292), .Z(N293) );
  GTECH_NOT I_49 ( .A(N296), .Z(N297) );
  GTECH_NOT I_50 ( .A(N300), .Z(N301) );
  GTECH_NOT I_51 ( .A(N304), .Z(N305) );
  GTECH_NOT I_52 ( .A(N308), .Z(N309) );
  GTECH_OR2 C858 ( .A(N311), .B(N313), .Z(N314) );
  GTECH_NOT I_53 ( .A(ctrl_flag[1]), .Z(N315) );
  GTECH_NOT I_54 ( .A(ctrl_flag[2]), .Z(N317) );
endmodule

