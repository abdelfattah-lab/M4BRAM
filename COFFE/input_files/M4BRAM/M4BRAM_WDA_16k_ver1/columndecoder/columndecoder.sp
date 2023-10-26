.TITLE RAM column decoder

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.TRAN 1p 5n SWEEP DATA=sweep_data
.OPTIONS BRIEF=1

* Input signal
VIN n_in gnd PULSE (0 supply_v_lp 0 0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_col vdd_col gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_columndecoder_1 delay
.MEASURE TRAN meas_inv_columndecoder_1_tfall TRIG V(Xdecorder.n_in) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xdecorder.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_columndecoder_1_trise TRIG V(Xdecorder.n_in) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xdecorder.n_1_1) VAL='supply_v_lp/2' RISE=1

* inv_columndecoder_2 delay
.MEASURE TRAN meas_inv_columndecoder_2_tfall TRIG V(Xdecorder.n_in) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xdecorder.n_1_2) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_columndecoder_2_trise TRIG V(Xdecorder.n_in) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xdecorder.n_1_2) VAL='supply_v_lp/2' RISE=1

* inv_columndecoder_3 delay
.MEASURE TRAN meas_inv_columndecoder_3_tfall TRIG V(Xdecorder.n_in) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_133) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_columndecoder_3_trise TRIG V(Xdecorder.n_in) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_133) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_3) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_133) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_3) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_133) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_col) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

Xrouting_wire_load_1 n_in n_1_1 n_1_2 vsram vsram_n vdd gnd vdd vdd routing_wire_load
Xlocal_routing_wire_load_1 n_1_2 n_1_3 vsram vsram_n vdd gnd vdd RAM_local_routing_wire_load
Xinv_ff_output_driver n_1_3 n_1_4 vdd_lp gnd inv_lp Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xdecorder n_1_4 n_1_5 vdd_col gnd columndecoder
Xwire5 n_1_5 n_1_6 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate5 gnd n_2_5 gnd n_1_6 vdd_lp gnd RAM_tgate
Xwire6 n_1_6 n_1_7 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate6 gnd n_2_6 n_1_7 gnd vdd_lp gnd RAM_tgate
Xwire7 n_1_7 n_1_8 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate7 gnd n_2_7 gnd n_1_8 vdd_lp gnd RAM_tgate
Xwire8 n_1_8 n_1_9 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate8 gnd n_2_8 n_1_9 gnd vdd_lp gnd RAM_tgate
Xwire9 n_1_9 n_1_10 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate9 gnd n_2_9 gnd n_1_10 vdd_lp gnd RAM_tgate
Xwire10 n_1_10 n_1_11 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate10 gnd n_2_10 n_1_11 gnd vdd_lp gnd RAM_tgate
Xwire11 n_1_11 n_1_12 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate11 gnd n_2_11 gnd n_1_12 vdd_lp gnd RAM_tgate
Xwire12 n_1_12 n_1_13 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate12 gnd n_2_12 n_1_13 gnd vdd_lp gnd RAM_tgate
Xwire13 n_1_13 n_1_14 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate13 gnd n_2_13 gnd n_1_14 vdd_lp gnd RAM_tgate
Xwire14 n_1_14 n_1_15 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate14 gnd n_2_14 n_1_15 gnd vdd_lp gnd RAM_tgate
Xwire15 n_1_15 n_1_16 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate15 gnd n_2_15 gnd n_1_16 vdd_lp gnd RAM_tgate
Xwire16 n_1_16 n_1_17 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate16 gnd n_2_16 n_1_17 gnd vdd_lp gnd RAM_tgate
Xwire17 n_1_17 n_1_18 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate17 gnd n_2_17 gnd n_1_18 vdd_lp gnd RAM_tgate
Xwire18 n_1_18 n_1_19 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate18 gnd n_2_18 n_1_19 gnd vdd_lp gnd RAM_tgate
Xwire19 n_1_19 n_1_20 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate19 gnd n_2_19 gnd n_1_20 vdd_lp gnd RAM_tgate
Xwire20 n_1_20 n_1_21 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate20 gnd n_2_20 n_1_21 gnd vdd_lp gnd RAM_tgate
Xwire21 n_1_21 n_1_22 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate21 gnd n_2_21 gnd n_1_22 vdd_lp gnd RAM_tgate
Xwire22 n_1_22 n_1_23 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate22 gnd n_2_22 n_1_23 gnd vdd_lp gnd RAM_tgate
Xwire23 n_1_23 n_1_24 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate23 gnd n_2_23 gnd n_1_24 vdd_lp gnd RAM_tgate
Xwire24 n_1_24 n_1_25 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate24 gnd n_2_24 n_1_25 gnd vdd_lp gnd RAM_tgate
Xwire25 n_1_25 n_1_26 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate25 gnd n_2_25 gnd n_1_26 vdd_lp gnd RAM_tgate
Xwire26 n_1_26 n_1_27 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate26 gnd n_2_26 n_1_27 gnd vdd_lp gnd RAM_tgate
Xwire27 n_1_27 n_1_28 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate27 gnd n_2_27 gnd n_1_28 vdd_lp gnd RAM_tgate
Xwire28 n_1_28 n_1_29 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate28 gnd n_2_28 n_1_29 gnd vdd_lp gnd RAM_tgate
Xwire29 n_1_29 n_1_30 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate29 gnd n_2_29 gnd n_1_30 vdd_lp gnd RAM_tgate
Xwire30 n_1_30 n_1_31 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate30 gnd n_2_30 n_1_31 gnd vdd_lp gnd RAM_tgate
Xwire31 n_1_31 n_1_32 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate31 gnd n_2_31 gnd n_1_32 vdd_lp gnd RAM_tgate
Xwire32 n_1_32 n_1_33 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate32 gnd n_2_32 n_1_33 gnd vdd_lp gnd RAM_tgate
Xwire33 n_1_33 n_1_34 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate33 gnd n_2_33 gnd n_1_34 vdd_lp gnd RAM_tgate
Xwire34 n_1_34 n_1_35 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate34 gnd n_2_34 n_1_35 gnd vdd_lp gnd RAM_tgate
Xwire35 n_1_35 n_1_36 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate35 gnd n_2_35 gnd n_1_36 vdd_lp gnd RAM_tgate
Xwire36 n_1_36 n_1_37 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate36 gnd n_2_36 n_1_37 gnd vdd_lp gnd RAM_tgate
Xwire37 n_1_37 n_1_38 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate37 gnd n_2_37 gnd n_1_38 vdd_lp gnd RAM_tgate
Xwire38 n_1_38 n_1_39 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate38 gnd n_2_38 n_1_39 gnd vdd_lp gnd RAM_tgate
Xwire39 n_1_39 n_1_40 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate39 gnd n_2_39 gnd n_1_40 vdd_lp gnd RAM_tgate
Xwire40 n_1_40 n_1_41 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate40 gnd n_2_40 n_1_41 gnd vdd_lp gnd RAM_tgate
Xwire41 n_1_41 n_1_42 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate41 gnd n_2_41 gnd n_1_42 vdd_lp gnd RAM_tgate
Xwire42 n_1_42 n_1_43 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate42 gnd n_2_42 n_1_43 gnd vdd_lp gnd RAM_tgate
Xwire43 n_1_43 n_1_44 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate43 gnd n_2_43 gnd n_1_44 vdd_lp gnd RAM_tgate
Xwire44 n_1_44 n_1_45 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate44 gnd n_2_44 n_1_45 gnd vdd_lp gnd RAM_tgate
Xwire45 n_1_45 n_1_46 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate45 gnd n_2_45 gnd n_1_46 vdd_lp gnd RAM_tgate
Xwire46 n_1_46 n_1_47 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate46 gnd n_2_46 n_1_47 gnd vdd_lp gnd RAM_tgate
Xwire47 n_1_47 n_1_48 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate47 gnd n_2_47 gnd n_1_48 vdd_lp gnd RAM_tgate
Xwire48 n_1_48 n_1_49 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate48 gnd n_2_48 n_1_49 gnd vdd_lp gnd RAM_tgate
Xwire49 n_1_49 n_1_50 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate49 gnd n_2_49 gnd n_1_50 vdd_lp gnd RAM_tgate
Xwire50 n_1_50 n_1_51 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate50 gnd n_2_50 n_1_51 gnd vdd_lp gnd RAM_tgate
Xwire51 n_1_51 n_1_52 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate51 gnd n_2_51 gnd n_1_52 vdd_lp gnd RAM_tgate
Xwire52 n_1_52 n_1_53 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate52 gnd n_2_52 n_1_53 gnd vdd_lp gnd RAM_tgate
Xwire53 n_1_53 n_1_54 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate53 gnd n_2_53 gnd n_1_54 vdd_lp gnd RAM_tgate
Xwire54 n_1_54 n_1_55 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate54 gnd n_2_54 n_1_55 gnd vdd_lp gnd RAM_tgate
Xwire55 n_1_55 n_1_56 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate55 gnd n_2_55 gnd n_1_56 vdd_lp gnd RAM_tgate
Xwire56 n_1_56 n_1_57 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate56 gnd n_2_56 n_1_57 gnd vdd_lp gnd RAM_tgate
Xwire57 n_1_57 n_1_58 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate57 gnd n_2_57 gnd n_1_58 vdd_lp gnd RAM_tgate
Xwire58 n_1_58 n_1_59 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate58 gnd n_2_58 n_1_59 gnd vdd_lp gnd RAM_tgate
Xwire59 n_1_59 n_1_60 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate59 gnd n_2_59 gnd n_1_60 vdd_lp gnd RAM_tgate
Xwire60 n_1_60 n_1_61 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate60 gnd n_2_60 n_1_61 gnd vdd_lp gnd RAM_tgate
Xwire61 n_1_61 n_1_62 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate61 gnd n_2_61 gnd n_1_62 vdd_lp gnd RAM_tgate
Xwire62 n_1_62 n_1_63 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate62 gnd n_2_62 n_1_63 gnd vdd_lp gnd RAM_tgate
Xwire63 n_1_63 n_1_64 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate63 gnd n_2_63 gnd n_1_64 vdd_lp gnd RAM_tgate
Xwire64 n_1_64 n_1_65 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate64 gnd n_2_64 n_1_65 gnd vdd_lp gnd RAM_tgate
Xwire65 n_1_65 n_1_66 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate65 gnd n_2_65 gnd n_1_66 vdd_lp gnd RAM_tgate
Xwire66 n_1_66 n_1_67 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate66 gnd n_2_66 n_1_67 gnd vdd_lp gnd RAM_tgate
Xwire67 n_1_67 n_1_68 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate67 gnd n_2_67 gnd n_1_68 vdd_lp gnd RAM_tgate
Xwire68 n_1_68 n_1_69 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate68 gnd n_2_68 n_1_69 gnd vdd_lp gnd RAM_tgate
Xwire69 n_1_69 n_1_70 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate69 gnd n_2_69 gnd n_1_70 vdd_lp gnd RAM_tgate
Xwire70 n_1_70 n_1_71 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate70 gnd n_2_70 n_1_71 gnd vdd_lp gnd RAM_tgate
Xwire71 n_1_71 n_1_72 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate71 gnd n_2_71 gnd n_1_72 vdd_lp gnd RAM_tgate
Xwire72 n_1_72 n_1_73 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate72 gnd n_2_72 n_1_73 gnd vdd_lp gnd RAM_tgate
Xwire73 n_1_73 n_1_74 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate73 gnd n_2_73 gnd n_1_74 vdd_lp gnd RAM_tgate
Xwire74 n_1_74 n_1_75 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate74 gnd n_2_74 n_1_75 gnd vdd_lp gnd RAM_tgate
Xwire75 n_1_75 n_1_76 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate75 gnd n_2_75 gnd n_1_76 vdd_lp gnd RAM_tgate
Xwire76 n_1_76 n_1_77 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate76 gnd n_2_76 n_1_77 gnd vdd_lp gnd RAM_tgate
Xwire77 n_1_77 n_1_78 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate77 gnd n_2_77 gnd n_1_78 vdd_lp gnd RAM_tgate
Xwire78 n_1_78 n_1_79 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate78 gnd n_2_78 n_1_79 gnd vdd_lp gnd RAM_tgate
Xwire79 n_1_79 n_1_80 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate79 gnd n_2_79 gnd n_1_80 vdd_lp gnd RAM_tgate
Xwire80 n_1_80 n_1_81 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate80 gnd n_2_80 n_1_81 gnd vdd_lp gnd RAM_tgate
Xwire81 n_1_81 n_1_82 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate81 gnd n_2_81 gnd n_1_82 vdd_lp gnd RAM_tgate
Xwire82 n_1_82 n_1_83 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate82 gnd n_2_82 n_1_83 gnd vdd_lp gnd RAM_tgate
Xwire83 n_1_83 n_1_84 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate83 gnd n_2_83 gnd n_1_84 vdd_lp gnd RAM_tgate
Xwire84 n_1_84 n_1_85 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate84 gnd n_2_84 n_1_85 gnd vdd_lp gnd RAM_tgate
Xwire85 n_1_85 n_1_86 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate85 gnd n_2_85 gnd n_1_86 vdd_lp gnd RAM_tgate
Xwire86 n_1_86 n_1_87 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate86 gnd n_2_86 n_1_87 gnd vdd_lp gnd RAM_tgate
Xwire87 n_1_87 n_1_88 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate87 gnd n_2_87 gnd n_1_88 vdd_lp gnd RAM_tgate
Xwire88 n_1_88 n_1_89 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate88 gnd n_2_88 n_1_89 gnd vdd_lp gnd RAM_tgate
Xwire89 n_1_89 n_1_90 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate89 gnd n_2_89 gnd n_1_90 vdd_lp gnd RAM_tgate
Xwire90 n_1_90 n_1_91 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate90 gnd n_2_90 n_1_91 gnd vdd_lp gnd RAM_tgate
Xwire91 n_1_91 n_1_92 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate91 gnd n_2_91 gnd n_1_92 vdd_lp gnd RAM_tgate
Xwire92 n_1_92 n_1_93 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate92 gnd n_2_92 n_1_93 gnd vdd_lp gnd RAM_tgate
Xwire93 n_1_93 n_1_94 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate93 gnd n_2_93 gnd n_1_94 vdd_lp gnd RAM_tgate
Xwire94 n_1_94 n_1_95 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate94 gnd n_2_94 n_1_95 gnd vdd_lp gnd RAM_tgate
Xwire95 n_1_95 n_1_96 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate95 gnd n_2_95 gnd n_1_96 vdd_lp gnd RAM_tgate
Xwire96 n_1_96 n_1_97 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate96 gnd n_2_96 n_1_97 gnd vdd_lp gnd RAM_tgate
Xwire97 n_1_97 n_1_98 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate97 gnd n_2_97 gnd n_1_98 vdd_lp gnd RAM_tgate
Xwire98 n_1_98 n_1_99 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate98 gnd n_2_98 n_1_99 gnd vdd_lp gnd RAM_tgate
Xwire99 n_1_99 n_1_100 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate99 gnd n_2_99 gnd n_1_100 vdd_lp gnd RAM_tgate
Xwire100 n_1_100 n_1_101 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate100 gnd n_2_100 n_1_101 gnd vdd_lp gnd RAM_tgate
Xwire101 n_1_101 n_1_102 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate101 gnd n_2_101 gnd n_1_102 vdd_lp gnd RAM_tgate
Xwire102 n_1_102 n_1_103 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate102 gnd n_2_102 n_1_103 gnd vdd_lp gnd RAM_tgate
Xwire103 n_1_103 n_1_104 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate103 gnd n_2_103 gnd n_1_104 vdd_lp gnd RAM_tgate
Xwire104 n_1_104 n_1_105 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate104 gnd n_2_104 n_1_105 gnd vdd_lp gnd RAM_tgate
Xwire105 n_1_105 n_1_106 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate105 gnd n_2_105 gnd n_1_106 vdd_lp gnd RAM_tgate
Xwire106 n_1_106 n_1_107 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate106 gnd n_2_106 n_1_107 gnd vdd_lp gnd RAM_tgate
Xwire107 n_1_107 n_1_108 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate107 gnd n_2_107 gnd n_1_108 vdd_lp gnd RAM_tgate
Xwire108 n_1_108 n_1_109 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate108 gnd n_2_108 n_1_109 gnd vdd_lp gnd RAM_tgate
Xwire109 n_1_109 n_1_110 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate109 gnd n_2_109 gnd n_1_110 vdd_lp gnd RAM_tgate
Xwire110 n_1_110 n_1_111 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate110 gnd n_2_110 n_1_111 gnd vdd_lp gnd RAM_tgate
Xwire111 n_1_111 n_1_112 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate111 gnd n_2_111 gnd n_1_112 vdd_lp gnd RAM_tgate
Xwire112 n_1_112 n_1_113 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate112 gnd n_2_112 n_1_113 gnd vdd_lp gnd RAM_tgate
Xwire113 n_1_113 n_1_114 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate113 gnd n_2_113 gnd n_1_114 vdd_lp gnd RAM_tgate
Xwire114 n_1_114 n_1_115 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate114 gnd n_2_114 n_1_115 gnd vdd_lp gnd RAM_tgate
Xwire115 n_1_115 n_1_116 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate115 gnd n_2_115 gnd n_1_116 vdd_lp gnd RAM_tgate
Xwire116 n_1_116 n_1_117 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate116 gnd n_2_116 n_1_117 gnd vdd_lp gnd RAM_tgate
Xwire117 n_1_117 n_1_118 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate117 gnd n_2_117 gnd n_1_118 vdd_lp gnd RAM_tgate
Xwire118 n_1_118 n_1_119 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate118 gnd n_2_118 n_1_119 gnd vdd_lp gnd RAM_tgate
Xwire119 n_1_119 n_1_120 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate119 gnd n_2_119 gnd n_1_120 vdd_lp gnd RAM_tgate
Xwire120 n_1_120 n_1_121 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate120 gnd n_2_120 n_1_121 gnd vdd_lp gnd RAM_tgate
Xwire121 n_1_121 n_1_122 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate121 gnd n_2_121 gnd n_1_122 vdd_lp gnd RAM_tgate
Xwire122 n_1_122 n_1_123 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate122 gnd n_2_122 n_1_123 gnd vdd_lp gnd RAM_tgate
Xwire123 n_1_123 n_1_124 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate123 gnd n_2_123 gnd n_1_124 vdd_lp gnd RAM_tgate
Xwire124 n_1_124 n_1_125 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate124 gnd n_2_124 n_1_125 gnd vdd_lp gnd RAM_tgate
Xwire125 n_1_125 n_1_126 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate125 gnd n_2_125 gnd n_1_126 vdd_lp gnd RAM_tgate
Xwire126 n_1_126 n_1_127 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate126 gnd n_2_126 n_1_127 gnd vdd_lp gnd RAM_tgate
Xwire127 n_1_127 n_1_128 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate127 gnd n_2_127 gnd n_1_128 vdd_lp gnd RAM_tgate
Xwire128 n_1_128 n_1_129 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate128 gnd n_2_128 n_1_129 gnd vdd_lp gnd RAM_tgate
Xwire129 n_1_129 n_1_130 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate129 gnd n_2_129 gnd n_1_130 vdd_lp gnd RAM_tgate
Xwire130 n_1_130 n_1_131 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate130 gnd n_2_130 n_1_131 gnd vdd_lp gnd RAM_tgate
Xwire131 n_1_131 n_1_132 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate131 gnd n_2_131 gnd n_1_132 vdd_lp gnd RAM_tgate
Xwire132 n_1_132 n_1_133 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xtgate132 gnd n_2_132 n_1_133 gnd vdd_lp gnd RAM_tgate
.END