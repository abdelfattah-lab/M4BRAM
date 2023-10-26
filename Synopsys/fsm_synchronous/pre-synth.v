/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : T-2022.03-SP5
// Date      : Mon Jul  3 19:58:09 2023
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
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         i_sign, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, read_input_1,
         read_input_2, shift_input, N52, N53, N54, N55, N56, \input_1[3][7] ,
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
         \input_2[0][2] , \input_2[0][1] , \input_2[0][0] , N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88,
         N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N123,
         N124, N125, N126, N127, N128, N129, N130, N131, N132, N133, N134,
         N135, N136, N137, N138, N139, N140, N141, N142, N143, N144, N145,
         N146, N147, N148, N149, N150, N151, N152, N153, N154, N155, N156,
         N157, N158, N159, N160, N161, N162, N163, N164, N165, N166, N167,
         N168, N169, N170, N171, N172, N173, N174, N175, N176, N177, N178,
         N179, N180, N181, N182, N183, N184, N185, N186, N187, N188, N189,
         N190, N191, N192, N193, N194, N195, N196, N197, N198, N199, N200,
         N201, N202, N203, N204, N205, N206, N207, N208, N209, N210, N211,
         N212, N213, N214, N215, N216, N217, N218, N219, N220, N221, N222,
         N223, N224, N225, N226, N227, N228, N229, N230, N231, N232, N233,
         N234, N235, N236, N237, N238, N239, N240, N241, N242, N243, N244,
         N245, N246, N247, N248, N249, N250, N251, N252, N253, N254, N255,
         N256, N257, N258, N259, N260, N261, N262, N263, N264, N265, N266,
         N267, N268, N269, N270, N271, N272, N273, N274, N275, N276, N277,
         N278, N279, N280, N281, N282, N283, N284, N285, N286, N287, N288,
         N289, N290, N291, N292, N293, N294, N295, N296, N297, N298, N299,
         N300, N301, N302, N303, N304, N305, N306, N307;
  wire   [3:0] ctrl_flag;
  wire   [3:0] i_prec;
  wire   [3:0] state_now;
  wire   [3:0] counter_now;
  wire   [3:0] state_next;
  wire   [3:0] counter_next;

  \**SEQGEN**  \i_prec_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N39), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N34) );
  \**SEQGEN**  \i_prec_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N38), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N34) );
  \**SEQGEN**  \i_prec_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N37), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N34) );
  \**SEQGEN**  \i_prec_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N36), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_prec[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N34) );
  \**SEQGEN**  i_sign_reg ( .clear(1'b0), .preset(1'b0), .next_state(N35), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(i_sign), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N34) );
  \**SEQGEN**  \counter_now_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N51), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \counter_now_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N50), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \counter_now_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N49), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \counter_now_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N48), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        counter_now[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \state_now_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N47), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \state_now_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N46), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \state_now_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N45), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \state_now_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N44), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state_now[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        1'b1) );
  \**SEQGEN**  \input_1_reg[3][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N122), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[3][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N121), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[3][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N120), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[3][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N119), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[3][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N118), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[3][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N117), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[3][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N116), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[3][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N115), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N114), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N113), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N112), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N111), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N110), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N109), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N108), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[2][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N107), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N106), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N105), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N104), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N103), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N102), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[1][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N99), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N98), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N97), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N96), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N95), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N94), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N93), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N92), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_1_reg[0][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N91), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_1[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N90) );
  \**SEQGEN**  \input_2_reg[3][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N89), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[3][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N88), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[3][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N87), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[3][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N86), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[3][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N85), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[3][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N84), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[3][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N83), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[3][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N82), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N81), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N80), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N79), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N78), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N77), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N76), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N75), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[2][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N74), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N73), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N72), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N71), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N70), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N69), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N68), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N67), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[1][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N66), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N65), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N64), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N63), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N62), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N61), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N60), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N59), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  \**SEQGEN**  \input_2_reg[0][0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N58), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \input_2[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N57) );
  GTECH_AND2 C212 ( .A(N292), .B(N277), .Z(N131) );
  GTECH_AND2 C213 ( .A(N283), .B(N278), .Z(N132) );
  GTECH_AND2 C214 ( .A(N131), .B(N132), .Z(N133) );
  GTECH_OR2 C216 ( .A(state_now[3]), .B(state_now[2]), .Z(N134) );
  GTECH_OR2 C217 ( .A(state_now[1]), .B(N278), .Z(N135) );
  GTECH_OR2 C218 ( .A(N134), .B(N135), .Z(N136) );
  GTECH_OR2 C221 ( .A(state_now[3]), .B(state_now[2]), .Z(N138) );
  GTECH_OR2 C222 ( .A(N283), .B(state_now[0]), .Z(N139) );
  GTECH_OR2 C223 ( .A(N138), .B(N139), .Z(N140) );
  GTECH_OR2 C227 ( .A(state_now[3]), .B(state_now[2]), .Z(N142) );
  GTECH_OR2 C228 ( .A(N283), .B(N278), .Z(N143) );
  GTECH_OR2 C229 ( .A(N142), .B(N143), .Z(N144) );
  GTECH_OR2 C232 ( .A(state_now[3]), .B(N277), .Z(N146) );
  GTECH_OR2 C233 ( .A(state_now[1]), .B(state_now[0]), .Z(N147) );
  GTECH_OR2 C234 ( .A(N146), .B(N147), .Z(N148) );
  GTECH_OR2 C238 ( .A(state_now[3]), .B(N277), .Z(N150) );
  GTECH_OR2 C239 ( .A(state_now[1]), .B(N278), .Z(N151) );
  GTECH_OR2 C240 ( .A(N150), .B(N151), .Z(N152) );
  GTECH_OR2 C244 ( .A(state_now[3]), .B(N277), .Z(N154) );
  GTECH_OR2 C245 ( .A(N283), .B(state_now[0]), .Z(N155) );
  GTECH_OR2 C246 ( .A(N154), .B(N155), .Z(N156) );
  GTECH_OR2 C251 ( .A(state_now[3]), .B(N277), .Z(N158) );
  GTECH_OR2 C252 ( .A(N283), .B(N278), .Z(N159) );
  GTECH_OR2 C253 ( .A(N158), .B(N159), .Z(N160) );
  GTECH_OR2 C256 ( .A(N292), .B(state_now[2]), .Z(N162) );
  GTECH_OR2 C257 ( .A(state_now[1]), .B(state_now[0]), .Z(N163) );
  GTECH_OR2 C258 ( .A(N162), .B(N163), .Z(N164) );
  GTECH_OR2 C262 ( .A(N292), .B(state_now[2]), .Z(N166) );
  GTECH_OR2 C263 ( .A(state_now[1]), .B(N278), .Z(N167) );
  GTECH_OR2 C264 ( .A(N166), .B(N167), .Z(N168) );
  GTECH_AND2 C266 ( .A(state_now[3]), .B(state_now[1]), .Z(N170) );
  GTECH_AND2 C267 ( .A(state_now[3]), .B(state_now[2]), .Z(N171) );
  LT_UNS_OP lt_202 ( .A(counter_now), .B(i_prec), .Z(N192) );
  LT_UNS_OP lt_212 ( .A(counter_now), .B(i_prec), .Z(N207) );
  GTECH_AND2 C358 ( .A(N225), .B(N226), .Z(N229) );
  GTECH_AND2 C359 ( .A(N227), .B(N228), .Z(N230) );
  GTECH_AND2 C360 ( .A(N229), .B(N230), .Z(N231) );
  GTECH_OR2 C362 ( .A(state_now[3]), .B(state_now[2]), .Z(N232) );
  GTECH_OR2 C363 ( .A(state_now[1]), .B(N228), .Z(N233) );
  GTECH_OR2 C364 ( .A(N232), .B(N233), .Z(N234) );
  GTECH_OR2 C367 ( .A(state_now[3]), .B(state_now[2]), .Z(N236) );
  GTECH_OR2 C368 ( .A(N227), .B(state_now[0]), .Z(N237) );
  GTECH_OR2 C369 ( .A(N236), .B(N237), .Z(N238) );
  GTECH_OR2 C373 ( .A(state_now[3]), .B(state_now[2]), .Z(N240) );
  GTECH_OR2 C374 ( .A(N227), .B(N228), .Z(N241) );
  GTECH_OR2 C375 ( .A(N240), .B(N241), .Z(N242) );
  GTECH_OR2 C378 ( .A(state_now[3]), .B(N226), .Z(N244) );
  GTECH_OR2 C379 ( .A(state_now[1]), .B(state_now[0]), .Z(N245) );
  GTECH_OR2 C380 ( .A(N244), .B(N245), .Z(N246) );
  GTECH_OR2 C384 ( .A(state_now[3]), .B(N226), .Z(N248) );
  GTECH_OR2 C385 ( .A(state_now[1]), .B(N228), .Z(N249) );
  GTECH_OR2 C386 ( .A(N248), .B(N249), .Z(N250) );
  GTECH_OR2 C390 ( .A(state_now[3]), .B(N226), .Z(N252) );
  GTECH_OR2 C391 ( .A(N227), .B(state_now[0]), .Z(N253) );
  GTECH_OR2 C392 ( .A(N252), .B(N253), .Z(N254) );
  GTECH_OR2 C397 ( .A(state_now[3]), .B(N226), .Z(N256) );
  GTECH_OR2 C398 ( .A(N227), .B(N228), .Z(N257) );
  GTECH_OR2 C399 ( .A(N256), .B(N257), .Z(N258) );
  GTECH_OR2 C402 ( .A(N225), .B(state_now[2]), .Z(N260) );
  GTECH_OR2 C403 ( .A(state_now[1]), .B(state_now[0]), .Z(N261) );
  GTECH_OR2 C404 ( .A(N260), .B(N261), .Z(N262) );
  GTECH_OR2 C408 ( .A(N225), .B(state_now[2]), .Z(N264) );
  GTECH_OR2 C409 ( .A(state_now[1]), .B(N228), .Z(N265) );
  GTECH_OR2 C410 ( .A(N264), .B(N265), .Z(N266) );
  GTECH_AND2 C412 ( .A(state_now[3]), .B(state_now[1]), .Z(N268) );
  GTECH_AND2 C413 ( .A(state_now[3]), .B(state_now[2]), .Z(N269) );
  GTECH_NOT I_0 ( .A(state_now[2]), .Z(N277) );
  GTECH_NOT I_1 ( .A(state_now[0]), .Z(N278) );
  GTECH_OR2 C514 ( .A(N277), .B(state_now[3]), .Z(N279) );
  GTECH_OR2 C515 ( .A(state_now[1]), .B(N279), .Z(N280) );
  GTECH_OR2 C516 ( .A(N278), .B(N280), .Z(N281) );
  GTECH_NOT I_2 ( .A(N281), .Z(N282) );
  GTECH_NOT I_3 ( .A(state_now[1]), .Z(N283) );
  GTECH_OR2 C520 ( .A(N277), .B(state_now[3]), .Z(N284) );
  GTECH_OR2 C521 ( .A(N283), .B(N284), .Z(N285) );
  GTECH_OR2 C522 ( .A(state_now[0]), .B(N285), .Z(N286) );
  GTECH_NOT I_4 ( .A(N286), .Z(N287) );
  GTECH_OR2 C525 ( .A(state_now[2]), .B(state_now[3]), .Z(N288) );
  GTECH_OR2 C526 ( .A(N283), .B(N288), .Z(N289) );
  GTECH_OR2 C527 ( .A(state_now[0]), .B(N289), .Z(N290) );
  GTECH_NOT I_5 ( .A(N290), .Z(N291) );
  GTECH_NOT I_6 ( .A(state_now[3]), .Z(N292) );
  GTECH_OR2 C530 ( .A(state_now[2]), .B(N292), .Z(N293) );
  GTECH_OR2 C531 ( .A(state_now[1]), .B(N293), .Z(N294) );
  GTECH_OR2 C532 ( .A(state_now[0]), .B(N294), .Z(N295) );
  GTECH_NOT I_7 ( .A(N295), .Z(N296) );
  GTECH_OR2 C535 ( .A(state_now[2]), .B(state_now[3]), .Z(N297) );
  GTECH_OR2 C536 ( .A(state_now[1]), .B(N297), .Z(N298) );
  GTECH_OR2 C537 ( .A(N278), .B(N298), .Z(N299) );
  GTECH_NOT I_8 ( .A(N299), .Z(N300) );
  GTECH_OR2 C542 ( .A(N277), .B(state_now[3]), .Z(N301) );
  GTECH_OR2 C543 ( .A(N283), .B(N301), .Z(N302) );
  GTECH_OR2 C544 ( .A(N278), .B(N302), .Z(N303) );
  GTECH_NOT I_9 ( .A(N303), .Z(N304) );
  ADD_UNS_OP add_76 ( .A(1'b1), .B(byte_en[2:0]), .Z({N33, N32, N31, N30}) );
  ADD_UNS_OP add_198 ( .A(counter_now), .B(1'b1), .Z({N190, N189, N188, N187})
         );
  ADD_UNS_OP add_222 ( .A(counter_now), .B(1'b1), .Z({N216, N215, N214, N213})
         );
  ADD_UNS_OP add_217 ( .A(counter_now), .B(1'b1), .Z({N212, N211, N210, N209})
         );
  ADD_UNS_OP add_189 ( .A(counter_now), .B(1'b1), .Z({N178, N177, N176, N175})
         );
  ADD_UNS_OP add_192 ( .A(counter_now), .B({1'b1, 1'b0}), .Z({N182, N181, N180, 
        N179}) );
  ADD_UNS_OP add_204 ( .A(counter_now), .B(1'b1), .Z({N197, N196, N195, N194})
         );
  ADD_UNS_OP add_207 ( .A(counter_now), .B(1'b1), .Z({N201, N200, N199, N198})
         );
  SELECT_OP C570 ( .DATA1(byte_en), .DATA2({1'b0, 1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N0), .CONTROL2(N25), .Z(ctrl_flag) );
  GTECH_BUF B_0 ( .A(N24), .Z(N0) );
  SELECT_OP C571 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N1), 
        .CONTROL2(N41), .CONTROL3(N28), .Z(N34) );
  GTECH_BUF B_1 ( .A(reset), .Z(N1) );
  SELECT_OP C572 ( .DATA1(1'b0), .DATA2(byte_en[3]), .CONTROL1(N1), .CONTROL2(
        N41), .Z(N35) );
  SELECT_OP C573 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N33, N32, N31, 
        N30}), .CONTROL1(N1), .CONTROL2(N41), .Z({N39, N38, N37, N36}) );
  SELECT_OP C574 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(state_next), 
        .CONTROL1(N2), .CONTROL2(N43), .Z({N47, N46, N45, N44}) );
  GTECH_BUF B_2 ( .A(N42), .Z(N2) );
  SELECT_OP C575 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(counter_next), 
        .CONTROL1(N2), .CONTROL2(N43), .Z({N51, N50, N49, N48}) );
  SELECT_OP C576 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b0), .CONTROL1(N3), .CONTROL2(N124), .CONTROL3(N127), 
        .CONTROL4(N130), .CONTROL5(N56), .Z(N57) );
  GTECH_BUF B_3 ( .A(N52), .Z(N3) );
  SELECT_OP C577 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(data), .DATA3({\input_2[3][6] , \input_2[3][5] , \input_2[3][4] , 
        \input_2[3][3] , \input_2[3][2] , \input_2[3][1] , \input_2[3][0] , 
        1'b0, \input_2[2][6] , \input_2[2][5] , \input_2[2][4] , 
        \input_2[2][3] , \input_2[2][2] , \input_2[2][1] , \input_2[2][0] , 
        1'b0, \input_2[1][6] , \input_2[1][5] , \input_2[1][4] , 
        \input_2[1][3] , \input_2[1][2] , \input_2[1][1] , \input_2[1][0] , 
        1'b0, \input_2[0][6] , \input_2[0][5] , \input_2[0][4] , 
        \input_2[0][3] , \input_2[0][2] , \input_2[0][1] , \input_2[0][0] , 
        1'b0}), .CONTROL1(N3), .CONTROL2(N127), .CONTROL3(N130), .Z({N89, N88, 
        N87, N86, N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, 
        N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, 
        N59, N58}) );
  SELECT_OP C578 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .DATA4(1'b1), 
        .DATA5(1'b0), .CONTROL1(N3), .CONTROL2(N124), .CONTROL3(N127), 
        .CONTROL4(N130), .CONTROL5(N56), .Z(N90) );
  SELECT_OP C579 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(data), .DATA3({\input_1[3][6] , \input_1[3][5] , \input_1[3][4] , 
        \input_1[3][3] , \input_1[3][2] , \input_1[3][1] , \input_1[3][0] , 
        1'b0, \input_1[2][6] , \input_1[2][5] , \input_1[2][4] , 
        \input_1[2][3] , \input_1[2][2] , \input_1[2][1] , \input_1[2][0] , 
        1'b0, \input_1[1][6] , \input_1[1][5] , \input_1[1][4] , 
        \input_1[1][3] , \input_1[1][2] , \input_1[1][1] , \input_1[1][0] , 
        1'b0, \input_1[0][6] , \input_1[0][5] , \input_1[0][4] , 
        \input_1[0][3] , \input_1[0][2] , \input_1[0][1] , \input_1[0][0] , 
        1'b0}), .CONTROL1(N3), .CONTROL2(N124), .CONTROL3(N130), .Z({N122, 
        N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, 
        N109, N108, N107, N106, N105, N104, N103, N102, N101, N100, N99, N98, 
        N97, N96, N95, N94, N93, N92, N91}) );
  SELECT_OP C580 ( .DATA1({N178, N177, N176, N175}), .DATA2({N182, N181, N180, 
        N179}), .CONTROL1(N4), .CONTROL2(N5), .Z({N186, N185, N184, N183}) );
  GTECH_BUF B_4 ( .A(i_sign), .Z(N4) );
  GTECH_BUF B_5 ( .A(N174), .Z(N5) );
  GTECH_NOT I_10 ( .A(N192), .Z(N202) );
  SELECT_OP C582 ( .DATA1({N197, N196, N195, N194}), .DATA2({N201, N200, N199, 
        N198}), .CONTROL1(N6), .CONTROL2(N193), .Z({N206, N205, N204, N203})
         );
  GTECH_BUF B_6 ( .A(N192), .Z(N6) );
  GTECH_NOT I_11 ( .A(N207), .Z(N208) );
  SELECT_OP C584 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({1'b0, 1'b1, 1'b1}), 
        .DATA3({1'b1, 1'b0, 1'b1}), .CONTROL1(N7), .CONTROL2(N224), .CONTROL3(
        N219), .Z({N222, N221, N220}) );
  GTECH_BUF B_7 ( .A(ctrl_flag[3]), .Z(N7) );
  SELECT_OP C585 ( .DATA1({1'b0, 1'b0, 1'b0, ctrl_flag[2]}), .DATA2({1'b0, 
        1'b0, 1'b1, 1'b0}), .DATA3({1'b0, 1'b0, 1'b1, 1'b1}), .DATA4({1'b0, 
        1'b1, N174, 1'b0}), .DATA5({1'b0, 1'b1, 1'b0, 1'b1}), .DATA6({1'b0, 
        1'b1, 1'b1, N202}), .DATA7({1'b0, 1'b1, 1'b1, N208}), .DATA8({1'b1, 
        1'b0, 1'b0, 1'b0}), .DATA9({ctrl_flag[0], 1'b0, N217, 1'b1}), .DATA10(
        {N222, 1'b0, N221, N220}), .DATA11({1'b0, 1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N8), .CONTROL2(N9), .CONTROL3(N10), .CONTROL4(N11), 
        .CONTROL5(N12), .CONTROL6(N13), .CONTROL7(N14), .CONTROL8(N15), 
        .CONTROL9(N16), .CONTROL10(N17), .CONTROL11(N18), .Z(state_next) );
  GTECH_BUF B_8 ( .A(N133), .Z(N8) );
  GTECH_BUF B_9 ( .A(N137), .Z(N9) );
  GTECH_BUF B_10 ( .A(N141), .Z(N10) );
  GTECH_BUF B_11 ( .A(N145), .Z(N11) );
  GTECH_BUF B_12 ( .A(N149), .Z(N12) );
  GTECH_BUF B_13 ( .A(N153), .Z(N13) );
  GTECH_BUF B_14 ( .A(N157), .Z(N14) );
  GTECH_BUF B_15 ( .A(N161), .Z(N15) );
  GTECH_BUF B_16 ( .A(N165), .Z(N16) );
  GTECH_BUF B_17 ( .A(N169), .Z(N17) );
  GTECH_BUF B_18 ( .A(N172), .Z(N18) );
  SELECT_OP C586 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({1'b0, 1'b0, 1'b0, 
        1'b0}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0}), .DATA4({N186, N185, N184, 
        N183}), .DATA5({N190, N189, N188, N187}), .DATA6({N206, N205, N204, 
        N203}), .DATA7({N212, N211, N210, N209}), .DATA8({N216, N215, N214, 
        N213}), .DATA9({1'b0, 1'b0, 1'b0, 1'b0}), .DATA10({1'b0, 1'b0, 1'b0, 
        1'b0}), .DATA11({1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N8), .CONTROL2(N9), .CONTROL3(N10), .CONTROL4(N11), .CONTROL5(N12), .CONTROL6(N13), .CONTROL7(
        N14), .CONTROL8(N15), .CONTROL9(N16), .CONTROL10(N17), .CONTROL11(N18), 
        .Z(counter_next) );
  SELECT_OP C587 ( .DATA1(1'b1), .DATA2(1'b0), .CONTROL1(N19), .CONTROL2(N20), 
        .Z(N272) );
  GTECH_BUF B_19 ( .A(ctrl_flag[2]), .Z(N19) );
  GTECH_BUF B_20 ( .A(N271), .Z(N20) );
  SELECT_OP C588 ( .DATA1(1'b1), .DATA2(1'b0), .CONTROL1(N21), .CONTROL2(N22), 
        .Z(N274) );
  GTECH_BUF B_21 ( .A(ctrl_flag[1]), .Z(N21) );
  GTECH_BUF B_22 ( .A(N273), .Z(N22) );
  SELECT_OP C589 ( .DATA1(1'b1), .DATA2(1'b0), .CONTROL1(N21), .CONTROL2(N22), 
        .Z(N275) );
  SELECT_OP C590 ( .DATA1(1'b1), .DATA2(1'b0), .CONTROL1(N19), .CONTROL2(N20), 
        .Z(N276) );
  SELECT_OP C591 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b0), .DATA8(1'b0), .DATA9(1'b0), 
        .DATA10(1'b0), .DATA11(1'b0), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N251), 
        .CONTROL7(N255), .CONTROL8(N259), .CONTROL9(N263), .CONTROL10(N267), 
        .CONTROL11(N270), .Z(carry_in) );
  GTECH_BUF B_23 ( .A(N231), .Z(N23) );
  SELECT_OP C592 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .DATA8(1'b0), .DATA9(1'b0), 
        .DATA10(1'b1), .DATA11(1'b0), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N251), 
        .CONTROL7(N255), .CONTROL8(N259), .CONTROL9(N263), .CONTROL10(N267), 
        .CONTROL11(N270), .Z(readout_dummy) );
  SELECT_OP C593 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b1, 1'b0}), .DATA3({1'b1, 
        1'b0}), .DATA4({1'b0, 1'b0}), .DATA5({1'b0, 1'b1}), .DATA6({1'b1, 1'b0}), .DATA7({1'b1, 1'b0}), .DATA8({1'b0, 1'b0}), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N259), 
        .CONTROL7(N263), .CONTROL8(N267), .Z(wsel_2_dummy) );
  SELECT_OP C594 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b0), .CONTROL1(N243), .CONTROL2(N251), .CONTROL3(N255), 
        .CONTROL4(N259), .CONTROL5(N263), .Z(wsel_1_dummy) );
  SELECT_OP C595 ( .DATA1({1'b1, 1'b1, 1'b0}), .DATA2({1'b0, 1'b0, 1'b1}), 
        .DATA3({1'b0, 1'b1, 1'b0}), .DATA4({1'b1, 1'b0, 1'b1}), .DATA5({1'b1, 
        1'b0, 1'b0}), .DATA6({1'b0, 1'b0, 1'b1}), .DATA7({1'b0, 1'b1, 1'b0}), 
        .DATA8({1'b1, 1'b1, 1'b0}), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N259), 
        .CONTROL7(N263), .CONTROL8(N267), .Z(waddr_2_dummy) );
  SELECT_OP C596 ( .DATA1({1'b0, 1'b1, 1'b1}), .DATA2({1'b1, 1'b0, 1'b1}), 
        .DATA3({1'b1, 1'b0, 1'b1}), .DATA4({1'b1, 1'b0, 1'b1}), .DATA5({1'b1, 
        1'b1, 1'b0}), .CONTROL1(N243), .CONTROL2(N251), .CONTROL3(N255), 
        .CONTROL4(N259), .CONTROL5(N263), .Z(waddr_1_dummy) );
  SELECT_OP C597 ( .DATA1({1'b0, 1'b1, 1'b0}), .DATA2({1'b1, 1'b0, 1'b1}), 
        .DATA3({1'b1, 1'b0, 1'b1}), .DATA4({1'b1, 1'b0, 1'b1}), .DATA5({1'b1, 
        1'b1, 1'b0}), .DATA6({1'b1, 1'b1, 1'b0}), .CONTROL1(N243), .CONTROL2(
        N251), .CONTROL3(N255), .CONTROL4(N259), .CONTROL5(N263), .CONTROL6(
        N267), .Z(raddr_2_dummy) );
  SELECT_OP C598 ( .DATA1({1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 
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
        1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1}), .CONTROL1(N243), .CONTROL2(N247), .CONTROL3(N251), .CONTROL4(N255), 
        .CONTROL5(N259), .CONTROL6(N263), .Z({\raddr_1_dummy[3][2] , 
        \raddr_1_dummy[3][1] , \raddr_1_dummy[3][0] , \raddr_1_dummy[2][2] , 
        \raddr_1_dummy[2][1] , \raddr_1_dummy[2][0] , \raddr_1_dummy[1][2] , 
        \raddr_1_dummy[1][1] , \raddr_1_dummy[1][0] , \raddr_1_dummy[0][2] , 
        \raddr_1_dummy[0][1] , \raddr_1_dummy[0][0] }) );
  SELECT_OP C599 ( .DATA1(N272), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b0), .DATA7(1'b0), .DATA8(N274), .DATA9(N275), 
        .DATA10(N276), .DATA11(1'b0), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N251), 
        .CONTROL7(N255), .CONTROL8(N259), .CONTROL9(N263), .CONTROL10(N267), 
        .CONTROL11(N270), .Z(wen_2_dummy) );
  SELECT_OP C600 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b1), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b0), .DATA11(1'b0), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N251), 
        .CONTROL7(N255), .CONTROL8(N259), .CONTROL9(N263), .CONTROL10(N267), 
        .CONTROL11(N270), .Z(wen_1_dummy) );
  SELECT_OP C601 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b1), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b1), .DATA11(1'b0), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N251), 
        .CONTROL7(N255), .CONTROL8(N259), .CONTROL9(N263), .CONTROL10(N267), 
        .CONTROL11(N270), .Z(ren_2_dummy) );
  SELECT_OP C602 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b1), .DATA9(1'b1), 
        .DATA10(1'b0), .DATA11(1'b0), .CONTROL1(N23), .CONTROL2(N235), 
        .CONTROL3(N239), .CONTROL4(N243), .CONTROL5(N247), .CONTROL6(N251), 
        .CONTROL7(N255), .CONTROL8(N259), .CONTROL9(N263), .CONTROL10(N267), 
        .CONTROL11(N270), .Z(ren_1_dummy) );
  GTECH_AND2 C605 ( .A(cim_en), .B(N305), .Z(N24) );
  GTECH_NOT I_12 ( .A(in_clear), .Z(N305) );
  GTECH_NOT I_13 ( .A(N24), .Z(N25) );
  GTECH_AND2 C609 ( .A(cim_en), .B(in_clear), .Z(N26) );
  GTECH_OR2 C612 ( .A(N26), .B(reset), .Z(N27) );
  GTECH_NOT I_14 ( .A(N27), .Z(N28) );
  GTECH_BUF B_24 ( .A(N41), .Z(N29) );
  GTECH_NOT I_15 ( .A(reset), .Z(N40) );
  GTECH_AND2 C616 ( .A(N26), .B(N40), .Z(N41) );
  GTECH_AND2 C617 ( .A(N29), .B(N40) );
  GTECH_OR2 C618 ( .A(ctrl_flag[3]), .B(reset), .Z(N42) );
  GTECH_NOT I_16 ( .A(N42), .Z(N43) );
  GTECH_AND2 C621 ( .A(N306), .B(ctrl_flag[1]), .Z(read_input_1) );
  GTECH_OR2 C622 ( .A(N300), .B(N304), .Z(N306) );
  GTECH_AND2 C623 ( .A(N307), .B(ctrl_flag[1]), .Z(read_input_2) );
  GTECH_OR2 C624 ( .A(N291), .B(N296), .Z(N307) );
  GTECH_OR2 C625 ( .A(N282), .B(N287), .Z(shift_input) );
  GTECH_OR2 C626 ( .A(ctrl_flag[3]), .B(reset), .Z(N52) );
  GTECH_OR2 C631 ( .A(read_input_1), .B(N52), .Z(N53) );
  GTECH_OR2 C632 ( .A(read_input_2), .B(N53), .Z(N54) );
  GTECH_OR2 C633 ( .A(shift_input), .B(N54), .Z(N55) );
  GTECH_NOT I_17 ( .A(N55), .Z(N56) );
  GTECH_NOT I_18 ( .A(N52), .Z(N123) );
  GTECH_AND2 C636 ( .A(read_input_1), .B(N123), .Z(N124) );
  GTECH_NOT I_19 ( .A(read_input_1), .Z(N125) );
  GTECH_AND2 C638 ( .A(N123), .B(N125), .Z(N126) );
  GTECH_AND2 C639 ( .A(read_input_2), .B(N126), .Z(N127) );
  GTECH_NOT I_20 ( .A(read_input_2), .Z(N128) );
  GTECH_AND2 C641 ( .A(N126), .B(N128), .Z(N129) );
  GTECH_AND2 C642 ( .A(shift_input), .B(N129), .Z(N130) );
  GTECH_NOT I_21 ( .A(N136), .Z(N137) );
  GTECH_NOT I_22 ( .A(N140), .Z(N141) );
  GTECH_NOT I_23 ( .A(N144), .Z(N145) );
  GTECH_NOT I_24 ( .A(N148), .Z(N149) );
  GTECH_NOT I_25 ( .A(N152), .Z(N153) );
  GTECH_NOT I_26 ( .A(N156), .Z(N157) );
  GTECH_NOT I_27 ( .A(N160), .Z(N161) );
  GTECH_NOT I_28 ( .A(N164), .Z(N165) );
  GTECH_NOT I_29 ( .A(N168), .Z(N169) );
  GTECH_OR2 C671 ( .A(N170), .B(N171), .Z(N172) );
  GTECH_BUF B_25 ( .A(N145), .Z(N173) );
  GTECH_NOT I_30 ( .A(i_sign), .Z(N174) );
  GTECH_AND2 C688 ( .A(N173), .B(i_sign) );
  GTECH_AND2 C689 ( .A(N173), .B(N174) );
  GTECH_BUF B_26 ( .A(N149) );
  GTECH_BUF B_27 ( .A(N153), .Z(N191) );
  GTECH_NOT I_31 ( .A(N192), .Z(N193) );
  GTECH_AND2 C694 ( .A(N191), .B(N192) );
  GTECH_AND2 C695 ( .A(N191), .B(N193) );
  GTECH_BUF B_28 ( .A(N157) );
  GTECH_BUF B_29 ( .A(N161) );
  GTECH_NOT I_32 ( .A(ctrl_flag[0]), .Z(N217) );
  GTECH_OR2 C704 ( .A(ctrl_flag[2]), .B(ctrl_flag[3]), .Z(N218) );
  GTECH_NOT I_33 ( .A(N218), .Z(N219) );
  GTECH_NOT I_34 ( .A(ctrl_flag[3]), .Z(N223) );
  GTECH_AND2 C707 ( .A(ctrl_flag[2]), .B(N223), .Z(N224) );
  GTECH_NOT I_35 ( .A(state_now[3]), .Z(N225) );
  GTECH_NOT I_36 ( .A(state_now[2]), .Z(N226) );
  GTECH_NOT I_37 ( .A(state_now[1]), .Z(N227) );
  GTECH_NOT I_38 ( .A(state_now[0]), .Z(N228) );
  GTECH_NOT I_39 ( .A(N234), .Z(N235) );
  GTECH_NOT I_40 ( .A(N238), .Z(N239) );
  GTECH_NOT I_41 ( .A(N242), .Z(N243) );
  GTECH_NOT I_42 ( .A(N246), .Z(N247) );
  GTECH_NOT I_43 ( .A(N250), .Z(N251) );
  GTECH_NOT I_44 ( .A(N254), .Z(N255) );
  GTECH_NOT I_45 ( .A(N258), .Z(N259) );
  GTECH_NOT I_46 ( .A(N262), .Z(N263) );
  GTECH_NOT I_47 ( .A(N266), .Z(N267) );
  GTECH_OR2 C736 ( .A(N268), .B(N269), .Z(N270) );
  GTECH_NOT I_48 ( .A(ctrl_flag[2]), .Z(N271) );
  GTECH_NOT I_49 ( .A(ctrl_flag[1]), .Z(N273) );
endmodule

