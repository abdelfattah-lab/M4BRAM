.TITLE second stage in configurable decoder

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
V_sec vdd_sec gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_nand2xconfigurabledecoder2ii delay
.MEASURE TRAN meas_inv_nand2_xconfigurabledecoder2ii_1_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xsec.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_nand2_xconfigurabledecoder2ii_1_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xsec.n_1_1) VAL='supply_v_lp/2' RISE=1

* inv_xconfigurabledecoder2ii delay
.MEASURE TRAN meas_inv_xconfigurabledecoder2ii_2_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_129) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_xconfigurabledecoder2ii_2_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_129) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_129) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_129) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_sec) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xconfigurabledecoderi n_in n_1_1 vdd_lp gnd xconfigurabledecoderi
Xsec n_1_1 n_1_2 vdd_sec gnd xconfigurabledecoder2ii
Xwire2 n_1_2 n_1_3 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand2 n_1_2 n_hang_3 vdd_lp gnd xconfigurabledecoderiii
Xwire3 n_1_3 n_1_4 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand3 n_1_3 n_hang_4 vdd_lp gnd xconfigurabledecoderiii
Xwire4 n_1_4 n_1_5 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand4 n_1_4 n_hang_5 vdd_lp gnd xconfigurabledecoderiii
Xwire5 n_1_5 n_1_6 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand5 n_1_5 n_hang_6 vdd_lp gnd xconfigurabledecoderiii
Xwire6 n_1_6 n_1_7 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand6 n_1_6 n_hang_7 vdd_lp gnd xconfigurabledecoderiii
Xwire7 n_1_7 n_1_8 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand7 n_1_7 n_hang_8 vdd_lp gnd xconfigurabledecoderiii
Xwire8 n_1_8 n_1_9 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand8 n_1_8 n_hang_9 vdd_lp gnd xconfigurabledecoderiii
Xwire9 n_1_9 n_1_10 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand9 n_1_9 n_hang_10 vdd_lp gnd xconfigurabledecoderiii
Xwire10 n_1_10 n_1_11 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand10 n_1_10 n_hang_11 vdd_lp gnd xconfigurabledecoderiii
Xwire11 n_1_11 n_1_12 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand11 n_1_11 n_hang_12 vdd_lp gnd xconfigurabledecoderiii
Xwire12 n_1_12 n_1_13 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand12 n_1_12 n_hang_13 vdd_lp gnd xconfigurabledecoderiii
Xwire13 n_1_13 n_1_14 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand13 n_1_13 n_hang_14 vdd_lp gnd xconfigurabledecoderiii
Xwire14 n_1_14 n_1_15 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand14 n_1_14 n_hang_15 vdd_lp gnd xconfigurabledecoderiii
Xwire15 n_1_15 n_1_16 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand15 n_1_15 n_hang_16 vdd_lp gnd xconfigurabledecoderiii
Xwire16 n_1_16 n_1_17 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand16 n_1_16 n_hang_17 vdd_lp gnd xconfigurabledecoderiii
Xwire17 n_1_17 n_1_18 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand17 n_1_17 n_hang_18 vdd_lp gnd xconfigurabledecoderiii
Xwire18 n_1_18 n_1_19 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand18 n_1_18 n_hang_19 vdd_lp gnd xconfigurabledecoderiii
Xwire19 n_1_19 n_1_20 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand19 n_1_19 n_hang_20 vdd_lp gnd xconfigurabledecoderiii
Xwire20 n_1_20 n_1_21 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand20 n_1_20 n_hang_21 vdd_lp gnd xconfigurabledecoderiii
Xwire21 n_1_21 n_1_22 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand21 n_1_21 n_hang_22 vdd_lp gnd xconfigurabledecoderiii
Xwire22 n_1_22 n_1_23 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand22 n_1_22 n_hang_23 vdd_lp gnd xconfigurabledecoderiii
Xwire23 n_1_23 n_1_24 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand23 n_1_23 n_hang_24 vdd_lp gnd xconfigurabledecoderiii
Xwire24 n_1_24 n_1_25 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand24 n_1_24 n_hang_25 vdd_lp gnd xconfigurabledecoderiii
Xwire25 n_1_25 n_1_26 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand25 n_1_25 n_hang_26 vdd_lp gnd xconfigurabledecoderiii
Xwire26 n_1_26 n_1_27 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand26 n_1_26 n_hang_27 vdd_lp gnd xconfigurabledecoderiii
Xwire27 n_1_27 n_1_28 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand27 n_1_27 n_hang_28 vdd_lp gnd xconfigurabledecoderiii
Xwire28 n_1_28 n_1_29 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand28 n_1_28 n_hang_29 vdd_lp gnd xconfigurabledecoderiii
Xwire29 n_1_29 n_1_30 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand29 n_1_29 n_hang_30 vdd_lp gnd xconfigurabledecoderiii
Xwire30 n_1_30 n_1_31 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand30 n_1_30 n_hang_31 vdd_lp gnd xconfigurabledecoderiii
Xwire31 n_1_31 n_1_32 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand31 n_1_31 n_hang_32 vdd_lp gnd xconfigurabledecoderiii
Xwire32 n_1_32 n_1_33 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand32 n_1_32 n_hang_33 vdd_lp gnd xconfigurabledecoderiii
Xwire33 n_1_33 n_1_34 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand33 n_1_33 n_hang_34 vdd_lp gnd xconfigurabledecoderiii
Xwire34 n_1_34 n_1_35 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand34 n_1_34 n_hang_35 vdd_lp gnd xconfigurabledecoderiii
Xwire35 n_1_35 n_1_36 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand35 n_1_35 n_hang_36 vdd_lp gnd xconfigurabledecoderiii
Xwire36 n_1_36 n_1_37 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand36 n_1_36 n_hang_37 vdd_lp gnd xconfigurabledecoderiii
Xwire37 n_1_37 n_1_38 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand37 n_1_37 n_hang_38 vdd_lp gnd xconfigurabledecoderiii
Xwire38 n_1_38 n_1_39 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand38 n_1_38 n_hang_39 vdd_lp gnd xconfigurabledecoderiii
Xwire39 n_1_39 n_1_40 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand39 n_1_39 n_hang_40 vdd_lp gnd xconfigurabledecoderiii
Xwire40 n_1_40 n_1_41 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand40 n_1_40 n_hang_41 vdd_lp gnd xconfigurabledecoderiii
Xwire41 n_1_41 n_1_42 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand41 n_1_41 n_hang_42 vdd_lp gnd xconfigurabledecoderiii
Xwire42 n_1_42 n_1_43 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand42 n_1_42 n_hang_43 vdd_lp gnd xconfigurabledecoderiii
Xwire43 n_1_43 n_1_44 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand43 n_1_43 n_hang_44 vdd_lp gnd xconfigurabledecoderiii
Xwire44 n_1_44 n_1_45 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand44 n_1_44 n_hang_45 vdd_lp gnd xconfigurabledecoderiii
Xwire45 n_1_45 n_1_46 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand45 n_1_45 n_hang_46 vdd_lp gnd xconfigurabledecoderiii
Xwire46 n_1_46 n_1_47 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand46 n_1_46 n_hang_47 vdd_lp gnd xconfigurabledecoderiii
Xwire47 n_1_47 n_1_48 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand47 n_1_47 n_hang_48 vdd_lp gnd xconfigurabledecoderiii
Xwire48 n_1_48 n_1_49 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand48 n_1_48 n_hang_49 vdd_lp gnd xconfigurabledecoderiii
Xwire49 n_1_49 n_1_50 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand49 n_1_49 n_hang_50 vdd_lp gnd xconfigurabledecoderiii
Xwire50 n_1_50 n_1_51 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand50 n_1_50 n_hang_51 vdd_lp gnd xconfigurabledecoderiii
Xwire51 n_1_51 n_1_52 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand51 n_1_51 n_hang_52 vdd_lp gnd xconfigurabledecoderiii
Xwire52 n_1_52 n_1_53 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand52 n_1_52 n_hang_53 vdd_lp gnd xconfigurabledecoderiii
Xwire53 n_1_53 n_1_54 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand53 n_1_53 n_hang_54 vdd_lp gnd xconfigurabledecoderiii
Xwire54 n_1_54 n_1_55 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand54 n_1_54 n_hang_55 vdd_lp gnd xconfigurabledecoderiii
Xwire55 n_1_55 n_1_56 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand55 n_1_55 n_hang_56 vdd_lp gnd xconfigurabledecoderiii
Xwire56 n_1_56 n_1_57 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand56 n_1_56 n_hang_57 vdd_lp gnd xconfigurabledecoderiii
Xwire57 n_1_57 n_1_58 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand57 n_1_57 n_hang_58 vdd_lp gnd xconfigurabledecoderiii
Xwire58 n_1_58 n_1_59 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand58 n_1_58 n_hang_59 vdd_lp gnd xconfigurabledecoderiii
Xwire59 n_1_59 n_1_60 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand59 n_1_59 n_hang_60 vdd_lp gnd xconfigurabledecoderiii
Xwire60 n_1_60 n_1_61 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand60 n_1_60 n_hang_61 vdd_lp gnd xconfigurabledecoderiii
Xwire61 n_1_61 n_1_62 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand61 n_1_61 n_hang_62 vdd_lp gnd xconfigurabledecoderiii
Xwire62 n_1_62 n_1_63 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand62 n_1_62 n_hang_63 vdd_lp gnd xconfigurabledecoderiii
Xwire63 n_1_63 n_1_64 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand63 n_1_63 n_hang_64 vdd_lp gnd xconfigurabledecoderiii
Xwire64 n_1_64 n_1_65 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand64 n_1_64 n_hang_65 vdd_lp gnd xconfigurabledecoderiii
Xwire65 n_1_65 n_1_66 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand65 n_1_65 n_hang_66 vdd_lp gnd xconfigurabledecoderiii
Xwire66 n_1_66 n_1_67 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand66 n_1_66 n_hang_67 vdd_lp gnd xconfigurabledecoderiii
Xwire67 n_1_67 n_1_68 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand67 n_1_67 n_hang_68 vdd_lp gnd xconfigurabledecoderiii
Xwire68 n_1_68 n_1_69 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand68 n_1_68 n_hang_69 vdd_lp gnd xconfigurabledecoderiii
Xwire69 n_1_69 n_1_70 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand69 n_1_69 n_hang_70 vdd_lp gnd xconfigurabledecoderiii
Xwire70 n_1_70 n_1_71 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand70 n_1_70 n_hang_71 vdd_lp gnd xconfigurabledecoderiii
Xwire71 n_1_71 n_1_72 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand71 n_1_71 n_hang_72 vdd_lp gnd xconfigurabledecoderiii
Xwire72 n_1_72 n_1_73 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand72 n_1_72 n_hang_73 vdd_lp gnd xconfigurabledecoderiii
Xwire73 n_1_73 n_1_74 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand73 n_1_73 n_hang_74 vdd_lp gnd xconfigurabledecoderiii
Xwire74 n_1_74 n_1_75 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand74 n_1_74 n_hang_75 vdd_lp gnd xconfigurabledecoderiii
Xwire75 n_1_75 n_1_76 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand75 n_1_75 n_hang_76 vdd_lp gnd xconfigurabledecoderiii
Xwire76 n_1_76 n_1_77 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand76 n_1_76 n_hang_77 vdd_lp gnd xconfigurabledecoderiii
Xwire77 n_1_77 n_1_78 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand77 n_1_77 n_hang_78 vdd_lp gnd xconfigurabledecoderiii
Xwire78 n_1_78 n_1_79 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand78 n_1_78 n_hang_79 vdd_lp gnd xconfigurabledecoderiii
Xwire79 n_1_79 n_1_80 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand79 n_1_79 n_hang_80 vdd_lp gnd xconfigurabledecoderiii
Xwire80 n_1_80 n_1_81 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand80 n_1_80 n_hang_81 vdd_lp gnd xconfigurabledecoderiii
Xwire81 n_1_81 n_1_82 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand81 n_1_81 n_hang_82 vdd_lp gnd xconfigurabledecoderiii
Xwire82 n_1_82 n_1_83 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand82 n_1_82 n_hang_83 vdd_lp gnd xconfigurabledecoderiii
Xwire83 n_1_83 n_1_84 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand83 n_1_83 n_hang_84 vdd_lp gnd xconfigurabledecoderiii
Xwire84 n_1_84 n_1_85 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand84 n_1_84 n_hang_85 vdd_lp gnd xconfigurabledecoderiii
Xwire85 n_1_85 n_1_86 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand85 n_1_85 n_hang_86 vdd_lp gnd xconfigurabledecoderiii
Xwire86 n_1_86 n_1_87 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand86 n_1_86 n_hang_87 vdd_lp gnd xconfigurabledecoderiii
Xwire87 n_1_87 n_1_88 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand87 n_1_87 n_hang_88 vdd_lp gnd xconfigurabledecoderiii
Xwire88 n_1_88 n_1_89 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand88 n_1_88 n_hang_89 vdd_lp gnd xconfigurabledecoderiii
Xwire89 n_1_89 n_1_90 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand89 n_1_89 n_hang_90 vdd_lp gnd xconfigurabledecoderiii
Xwire90 n_1_90 n_1_91 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand90 n_1_90 n_hang_91 vdd_lp gnd xconfigurabledecoderiii
Xwire91 n_1_91 n_1_92 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand91 n_1_91 n_hang_92 vdd_lp gnd xconfigurabledecoderiii
Xwire92 n_1_92 n_1_93 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand92 n_1_92 n_hang_93 vdd_lp gnd xconfigurabledecoderiii
Xwire93 n_1_93 n_1_94 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand93 n_1_93 n_hang_94 vdd_lp gnd xconfigurabledecoderiii
Xwire94 n_1_94 n_1_95 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand94 n_1_94 n_hang_95 vdd_lp gnd xconfigurabledecoderiii
Xwire95 n_1_95 n_1_96 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand95 n_1_95 n_hang_96 vdd_lp gnd xconfigurabledecoderiii
Xwire96 n_1_96 n_1_97 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand96 n_1_96 n_hang_97 vdd_lp gnd xconfigurabledecoderiii
Xwire97 n_1_97 n_1_98 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand97 n_1_97 n_hang_98 vdd_lp gnd xconfigurabledecoderiii
Xwire98 n_1_98 n_1_99 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand98 n_1_98 n_hang_99 vdd_lp gnd xconfigurabledecoderiii
Xwire99 n_1_99 n_1_100 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand99 n_1_99 n_hang_100 vdd_lp gnd xconfigurabledecoderiii
Xwire100 n_1_100 n_1_101 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand100 n_1_100 n_hang_101 vdd_lp gnd xconfigurabledecoderiii
Xwire101 n_1_101 n_1_102 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand101 n_1_101 n_hang_102 vdd_lp gnd xconfigurabledecoderiii
Xwire102 n_1_102 n_1_103 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand102 n_1_102 n_hang_103 vdd_lp gnd xconfigurabledecoderiii
Xwire103 n_1_103 n_1_104 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand103 n_1_103 n_hang_104 vdd_lp gnd xconfigurabledecoderiii
Xwire104 n_1_104 n_1_105 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand104 n_1_104 n_hang_105 vdd_lp gnd xconfigurabledecoderiii
Xwire105 n_1_105 n_1_106 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand105 n_1_105 n_hang_106 vdd_lp gnd xconfigurabledecoderiii
Xwire106 n_1_106 n_1_107 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand106 n_1_106 n_hang_107 vdd_lp gnd xconfigurabledecoderiii
Xwire107 n_1_107 n_1_108 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand107 n_1_107 n_hang_108 vdd_lp gnd xconfigurabledecoderiii
Xwire108 n_1_108 n_1_109 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand108 n_1_108 n_hang_109 vdd_lp gnd xconfigurabledecoderiii
Xwire109 n_1_109 n_1_110 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand109 n_1_109 n_hang_110 vdd_lp gnd xconfigurabledecoderiii
Xwire110 n_1_110 n_1_111 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand110 n_1_110 n_hang_111 vdd_lp gnd xconfigurabledecoderiii
Xwire111 n_1_111 n_1_112 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand111 n_1_111 n_hang_112 vdd_lp gnd xconfigurabledecoderiii
Xwire112 n_1_112 n_1_113 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand112 n_1_112 n_hang_113 vdd_lp gnd xconfigurabledecoderiii
Xwire113 n_1_113 n_1_114 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand113 n_1_113 n_hang_114 vdd_lp gnd xconfigurabledecoderiii
Xwire114 n_1_114 n_1_115 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand114 n_1_114 n_hang_115 vdd_lp gnd xconfigurabledecoderiii
Xwire115 n_1_115 n_1_116 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand115 n_1_115 n_hang_116 vdd_lp gnd xconfigurabledecoderiii
Xwire116 n_1_116 n_1_117 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand116 n_1_116 n_hang_117 vdd_lp gnd xconfigurabledecoderiii
Xwire117 n_1_117 n_1_118 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand117 n_1_117 n_hang_118 vdd_lp gnd xconfigurabledecoderiii
Xwire118 n_1_118 n_1_119 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand118 n_1_118 n_hang_119 vdd_lp gnd xconfigurabledecoderiii
Xwire119 n_1_119 n_1_120 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand119 n_1_119 n_hang_120 vdd_lp gnd xconfigurabledecoderiii
Xwire120 n_1_120 n_1_121 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand120 n_1_120 n_hang_121 vdd_lp gnd xconfigurabledecoderiii
Xwire121 n_1_121 n_1_122 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand121 n_1_121 n_hang_122 vdd_lp gnd xconfigurabledecoderiii
Xwire122 n_1_122 n_1_123 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand122 n_1_122 n_hang_123 vdd_lp gnd xconfigurabledecoderiii
Xwire123 n_1_123 n_1_124 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand123 n_1_123 n_hang_124 vdd_lp gnd xconfigurabledecoderiii
Xwire124 n_1_124 n_1_125 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand124 n_1_124 n_hang_125 vdd_lp gnd xconfigurabledecoderiii
Xwire125 n_1_125 n_1_126 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand125 n_1_125 n_hang_126 vdd_lp gnd xconfigurabledecoderiii
Xwire126 n_1_126 n_1_127 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand126 n_1_126 n_hang_127 vdd_lp gnd xconfigurabledecoderiii
Xwire127 n_1_127 n_1_128 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand127 n_1_127 n_hang_128 vdd_lp gnd xconfigurabledecoderiii
Xwire128 n_1_128 n_1_129 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand128 n_1_128 n_hang_129 vdd_lp gnd xconfigurabledecoderiii
Xwire129 n_1_129 n_1_130 wire Rw=wire_xconfigurabledecoderi_res/128 Cw=wire_xconfigurabledecoderi_cap/128
Xloadnand129 n_1_129 n_hang_130 vdd_lp gnd xconfigurabledecoderiii
.END