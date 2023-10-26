.TITLE wordline driver

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.TRAN 1p 4n SWEEP DATA=sweep_data
.OPTIONS BRIEF=1

* Input signal
VIN n_in gnd PULSE (0 supply_v_lp 0 0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_wordline vdd_wordline gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_nand3_wordline_driver_1_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xwordline.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_nand3_wordline_driver_1_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xwordline.n_1_1) VAL='supply_v_lp/2' RISE=1

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_wordline_driver_2_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xwordline.n_1_2) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_2_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xwordline.n_1_2) VAL='supply_v_lp/2' RISE=1

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_wordline_driver_3_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xwordline.n_1_3) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_3_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xwordline.n_1_3) VAL='supply_v_lp/2' RISE=1

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_wordline_driver_4_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_129) VAL='supply_v_lp * 0.1' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_4_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_129) VAL='supply_v_lp * 0.9' RISE=1

* Total delays
.MEASURE TRAN meaz1_total_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_129) VAL='supply_v_lp * 0.1' FALL=1
.MEASURE TRAN meaz1_total_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_129) VAL='supply_v_lp * 0.9' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_wordline) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

Xnandu n_in n_1_1 vdd_lp gnd rowdecoderstage3
Xwordline n_1_1 n_1_2 vdd_wordline gnd wordline_driver
Xmemcell2 n_1_2 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel2 n_1_2 n_1_3 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell3 n_1_3 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel3 n_1_3 n_1_4 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell4 n_1_4 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel4 n_1_4 n_1_5 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell5 n_1_5 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel5 n_1_5 n_1_6 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell6 n_1_6 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel6 n_1_6 n_1_7 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell7 n_1_7 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel7 n_1_7 n_1_8 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell8 n_1_8 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel8 n_1_8 n_1_9 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell9 n_1_9 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel9 n_1_9 n_1_10 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell10 n_1_10 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel10 n_1_10 n_1_11 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell11 n_1_11 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel11 n_1_11 n_1_12 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell12 n_1_12 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel12 n_1_12 n_1_13 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell13 n_1_13 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel13 n_1_13 n_1_14 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell14 n_1_14 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel14 n_1_14 n_1_15 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell15 n_1_15 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel15 n_1_15 n_1_16 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell16 n_1_16 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel16 n_1_16 n_1_17 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell17 n_1_17 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel17 n_1_17 n_1_18 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell18 n_1_18 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel18 n_1_18 n_1_19 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell19 n_1_19 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel19 n_1_19 n_1_20 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell20 n_1_20 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel20 n_1_20 n_1_21 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell21 n_1_21 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel21 n_1_21 n_1_22 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell22 n_1_22 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel22 n_1_22 n_1_23 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell23 n_1_23 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel23 n_1_23 n_1_24 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell24 n_1_24 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel24 n_1_24 n_1_25 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell25 n_1_25 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel25 n_1_25 n_1_26 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell26 n_1_26 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel26 n_1_26 n_1_27 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell27 n_1_27 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel27 n_1_27 n_1_28 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell28 n_1_28 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel28 n_1_28 n_1_29 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell29 n_1_29 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel29 n_1_29 n_1_30 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell30 n_1_30 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel30 n_1_30 n_1_31 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell31 n_1_31 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel31 n_1_31 n_1_32 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell32 n_1_32 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel32 n_1_32 n_1_33 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell33 n_1_33 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel33 n_1_33 n_1_34 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell34 n_1_34 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel34 n_1_34 n_1_35 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell35 n_1_35 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel35 n_1_35 n_1_36 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell36 n_1_36 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel36 n_1_36 n_1_37 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell37 n_1_37 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel37 n_1_37 n_1_38 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell38 n_1_38 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel38 n_1_38 n_1_39 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell39 n_1_39 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel39 n_1_39 n_1_40 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell40 n_1_40 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel40 n_1_40 n_1_41 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell41 n_1_41 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel41 n_1_41 n_1_42 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell42 n_1_42 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel42 n_1_42 n_1_43 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell43 n_1_43 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel43 n_1_43 n_1_44 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell44 n_1_44 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel44 n_1_44 n_1_45 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell45 n_1_45 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel45 n_1_45 n_1_46 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell46 n_1_46 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel46 n_1_46 n_1_47 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell47 n_1_47 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel47 n_1_47 n_1_48 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell48 n_1_48 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel48 n_1_48 n_1_49 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell49 n_1_49 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel49 n_1_49 n_1_50 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell50 n_1_50 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel50 n_1_50 n_1_51 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell51 n_1_51 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel51 n_1_51 n_1_52 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell52 n_1_52 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel52 n_1_52 n_1_53 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell53 n_1_53 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel53 n_1_53 n_1_54 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell54 n_1_54 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel54 n_1_54 n_1_55 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell55 n_1_55 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel55 n_1_55 n_1_56 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell56 n_1_56 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel56 n_1_56 n_1_57 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell57 n_1_57 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel57 n_1_57 n_1_58 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell58 n_1_58 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel58 n_1_58 n_1_59 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell59 n_1_59 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel59 n_1_59 n_1_60 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell60 n_1_60 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel60 n_1_60 n_1_61 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell61 n_1_61 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel61 n_1_61 n_1_62 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell62 n_1_62 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel62 n_1_62 n_1_63 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell63 n_1_63 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel63 n_1_63 n_1_64 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell64 n_1_64 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel64 n_1_64 n_1_65 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell65 n_1_65 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel65 n_1_65 n_1_66 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell66 n_1_66 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel66 n_1_66 n_1_67 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell67 n_1_67 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel67 n_1_67 n_1_68 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell68 n_1_68 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel68 n_1_68 n_1_69 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell69 n_1_69 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel69 n_1_69 n_1_70 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell70 n_1_70 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel70 n_1_70 n_1_71 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell71 n_1_71 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel71 n_1_71 n_1_72 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell72 n_1_72 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel72 n_1_72 n_1_73 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell73 n_1_73 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel73 n_1_73 n_1_74 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell74 n_1_74 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel74 n_1_74 n_1_75 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell75 n_1_75 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel75 n_1_75 n_1_76 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell76 n_1_76 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel76 n_1_76 n_1_77 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell77 n_1_77 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel77 n_1_77 n_1_78 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell78 n_1_78 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel78 n_1_78 n_1_79 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell79 n_1_79 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel79 n_1_79 n_1_80 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell80 n_1_80 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel80 n_1_80 n_1_81 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell81 n_1_81 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel81 n_1_81 n_1_82 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell82 n_1_82 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel82 n_1_82 n_1_83 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell83 n_1_83 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel83 n_1_83 n_1_84 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell84 n_1_84 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel84 n_1_84 n_1_85 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell85 n_1_85 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel85 n_1_85 n_1_86 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell86 n_1_86 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel86 n_1_86 n_1_87 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell87 n_1_87 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel87 n_1_87 n_1_88 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell88 n_1_88 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel88 n_1_88 n_1_89 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell89 n_1_89 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel89 n_1_89 n_1_90 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell90 n_1_90 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel90 n_1_90 n_1_91 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell91 n_1_91 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel91 n_1_91 n_1_92 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell92 n_1_92 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel92 n_1_92 n_1_93 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell93 n_1_93 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel93 n_1_93 n_1_94 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell94 n_1_94 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel94 n_1_94 n_1_95 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell95 n_1_95 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel95 n_1_95 n_1_96 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell96 n_1_96 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel96 n_1_96 n_1_97 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell97 n_1_97 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel97 n_1_97 n_1_98 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell98 n_1_98 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel98 n_1_98 n_1_99 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell99 n_1_99 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel99 n_1_99 n_1_100 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell100 n_1_100 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel100 n_1_100 n_1_101 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell101 n_1_101 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel101 n_1_101 n_1_102 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell102 n_1_102 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel102 n_1_102 n_1_103 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell103 n_1_103 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel103 n_1_103 n_1_104 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell104 n_1_104 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel104 n_1_104 n_1_105 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell105 n_1_105 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel105 n_1_105 n_1_106 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell106 n_1_106 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel106 n_1_106 n_1_107 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell107 n_1_107 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel107 n_1_107 n_1_108 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell108 n_1_108 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel108 n_1_108 n_1_109 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell109 n_1_109 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel109 n_1_109 n_1_110 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell110 n_1_110 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel110 n_1_110 n_1_111 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell111 n_1_111 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel111 n_1_111 n_1_112 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell112 n_1_112 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel112 n_1_112 n_1_113 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell113 n_1_113 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel113 n_1_113 n_1_114 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell114 n_1_114 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel114 n_1_114 n_1_115 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell115 n_1_115 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel115 n_1_115 n_1_116 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell116 n_1_116 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel116 n_1_116 n_1_117 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell117 n_1_117 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel117 n_1_117 n_1_118 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell118 n_1_118 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel118 n_1_118 n_1_119 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell119 n_1_119 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel119 n_1_119 n_1_120 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell120 n_1_120 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel120 n_1_120 n_1_121 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell121 n_1_121 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel121 n_1_121 n_1_122 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell122 n_1_122 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel122 n_1_122 n_1_123 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell123 n_1_123 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel123 n_1_123 n_1_124 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell124 n_1_124 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel124 n_1_124 n_1_125 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell125 n_1_125 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel125 n_1_125 n_1_126 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell126 n_1_126 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel126 n_1_126 n_1_127 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell127 n_1_127 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel127 n_1_127 n_1_128 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell128 n_1_128 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel128 n_1_128 n_1_129 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
Xmemcell129 n_1_129 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel129 n_1_129 n_1_130 wire Rw=wire_wordline_driver_res/128 Cw=wire_wordline_driver_cap/128
.END