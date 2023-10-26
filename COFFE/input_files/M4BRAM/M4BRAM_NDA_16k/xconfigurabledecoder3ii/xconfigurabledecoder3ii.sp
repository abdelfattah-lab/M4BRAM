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

* inv_nand2xconfigurabledecoder3ii delay
.MEASURE TRAN meas_inv_nand3_xconfigurabledecoder3ii_1_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xsec.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_nand3_xconfigurabledecoder3ii_1_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xsec.n_1_1) VAL='supply_v_lp/2' RISE=1

* inv_xconfigurabledecoder3ii delay
.MEASURE TRAN meas_inv_xconfigurabledecoder3ii_2_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_65) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_xconfigurabledecoder3ii_2_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_65) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_65) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_65) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_sec) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xconfigurabledecoderi n_in n_1_1 vdd_lp gnd xconfigurabledecoderi
Xsec n_1_1 n_1_2 vdd_sec gnd xconfigurabledecoder3ii
Xwire2 n_1_2 n_1_3 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand2 n_1_2 n_hang_3 vdd_lp gnd xconfigurabledecoderiii
Xwire3 n_1_3 n_1_4 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand3 n_1_3 n_hang_4 vdd_lp gnd xconfigurabledecoderiii
Xwire4 n_1_4 n_1_5 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand4 n_1_4 n_hang_5 vdd_lp gnd xconfigurabledecoderiii
Xwire5 n_1_5 n_1_6 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand5 n_1_5 n_hang_6 vdd_lp gnd xconfigurabledecoderiii
Xwire6 n_1_6 n_1_7 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand6 n_1_6 n_hang_7 vdd_lp gnd xconfigurabledecoderiii
Xwire7 n_1_7 n_1_8 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand7 n_1_7 n_hang_8 vdd_lp gnd xconfigurabledecoderiii
Xwire8 n_1_8 n_1_9 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand8 n_1_8 n_hang_9 vdd_lp gnd xconfigurabledecoderiii
Xwire9 n_1_9 n_1_10 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand9 n_1_9 n_hang_10 vdd_lp gnd xconfigurabledecoderiii
Xwire10 n_1_10 n_1_11 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand10 n_1_10 n_hang_11 vdd_lp gnd xconfigurabledecoderiii
Xwire11 n_1_11 n_1_12 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand11 n_1_11 n_hang_12 vdd_lp gnd xconfigurabledecoderiii
Xwire12 n_1_12 n_1_13 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand12 n_1_12 n_hang_13 vdd_lp gnd xconfigurabledecoderiii
Xwire13 n_1_13 n_1_14 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand13 n_1_13 n_hang_14 vdd_lp gnd xconfigurabledecoderiii
Xwire14 n_1_14 n_1_15 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand14 n_1_14 n_hang_15 vdd_lp gnd xconfigurabledecoderiii
Xwire15 n_1_15 n_1_16 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand15 n_1_15 n_hang_16 vdd_lp gnd xconfigurabledecoderiii
Xwire16 n_1_16 n_1_17 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand16 n_1_16 n_hang_17 vdd_lp gnd xconfigurabledecoderiii
Xwire17 n_1_17 n_1_18 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand17 n_1_17 n_hang_18 vdd_lp gnd xconfigurabledecoderiii
Xwire18 n_1_18 n_1_19 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand18 n_1_18 n_hang_19 vdd_lp gnd xconfigurabledecoderiii
Xwire19 n_1_19 n_1_20 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand19 n_1_19 n_hang_20 vdd_lp gnd xconfigurabledecoderiii
Xwire20 n_1_20 n_1_21 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand20 n_1_20 n_hang_21 vdd_lp gnd xconfigurabledecoderiii
Xwire21 n_1_21 n_1_22 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand21 n_1_21 n_hang_22 vdd_lp gnd xconfigurabledecoderiii
Xwire22 n_1_22 n_1_23 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand22 n_1_22 n_hang_23 vdd_lp gnd xconfigurabledecoderiii
Xwire23 n_1_23 n_1_24 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand23 n_1_23 n_hang_24 vdd_lp gnd xconfigurabledecoderiii
Xwire24 n_1_24 n_1_25 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand24 n_1_24 n_hang_25 vdd_lp gnd xconfigurabledecoderiii
Xwire25 n_1_25 n_1_26 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand25 n_1_25 n_hang_26 vdd_lp gnd xconfigurabledecoderiii
Xwire26 n_1_26 n_1_27 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand26 n_1_26 n_hang_27 vdd_lp gnd xconfigurabledecoderiii
Xwire27 n_1_27 n_1_28 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand27 n_1_27 n_hang_28 vdd_lp gnd xconfigurabledecoderiii
Xwire28 n_1_28 n_1_29 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand28 n_1_28 n_hang_29 vdd_lp gnd xconfigurabledecoderiii
Xwire29 n_1_29 n_1_30 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand29 n_1_29 n_hang_30 vdd_lp gnd xconfigurabledecoderiii
Xwire30 n_1_30 n_1_31 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand30 n_1_30 n_hang_31 vdd_lp gnd xconfigurabledecoderiii
Xwire31 n_1_31 n_1_32 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand31 n_1_31 n_hang_32 vdd_lp gnd xconfigurabledecoderiii
Xwire32 n_1_32 n_1_33 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand32 n_1_32 n_hang_33 vdd_lp gnd xconfigurabledecoderiii
Xwire33 n_1_33 n_1_34 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand33 n_1_33 n_hang_34 vdd_lp gnd xconfigurabledecoderiii
Xwire34 n_1_34 n_1_35 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand34 n_1_34 n_hang_35 vdd_lp gnd xconfigurabledecoderiii
Xwire35 n_1_35 n_1_36 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand35 n_1_35 n_hang_36 vdd_lp gnd xconfigurabledecoderiii
Xwire36 n_1_36 n_1_37 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand36 n_1_36 n_hang_37 vdd_lp gnd xconfigurabledecoderiii
Xwire37 n_1_37 n_1_38 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand37 n_1_37 n_hang_38 vdd_lp gnd xconfigurabledecoderiii
Xwire38 n_1_38 n_1_39 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand38 n_1_38 n_hang_39 vdd_lp gnd xconfigurabledecoderiii
Xwire39 n_1_39 n_1_40 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand39 n_1_39 n_hang_40 vdd_lp gnd xconfigurabledecoderiii
Xwire40 n_1_40 n_1_41 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand40 n_1_40 n_hang_41 vdd_lp gnd xconfigurabledecoderiii
Xwire41 n_1_41 n_1_42 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand41 n_1_41 n_hang_42 vdd_lp gnd xconfigurabledecoderiii
Xwire42 n_1_42 n_1_43 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand42 n_1_42 n_hang_43 vdd_lp gnd xconfigurabledecoderiii
Xwire43 n_1_43 n_1_44 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand43 n_1_43 n_hang_44 vdd_lp gnd xconfigurabledecoderiii
Xwire44 n_1_44 n_1_45 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand44 n_1_44 n_hang_45 vdd_lp gnd xconfigurabledecoderiii
Xwire45 n_1_45 n_1_46 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand45 n_1_45 n_hang_46 vdd_lp gnd xconfigurabledecoderiii
Xwire46 n_1_46 n_1_47 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand46 n_1_46 n_hang_47 vdd_lp gnd xconfigurabledecoderiii
Xwire47 n_1_47 n_1_48 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand47 n_1_47 n_hang_48 vdd_lp gnd xconfigurabledecoderiii
Xwire48 n_1_48 n_1_49 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand48 n_1_48 n_hang_49 vdd_lp gnd xconfigurabledecoderiii
Xwire49 n_1_49 n_1_50 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand49 n_1_49 n_hang_50 vdd_lp gnd xconfigurabledecoderiii
Xwire50 n_1_50 n_1_51 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand50 n_1_50 n_hang_51 vdd_lp gnd xconfigurabledecoderiii
Xwire51 n_1_51 n_1_52 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand51 n_1_51 n_hang_52 vdd_lp gnd xconfigurabledecoderiii
Xwire52 n_1_52 n_1_53 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand52 n_1_52 n_hang_53 vdd_lp gnd xconfigurabledecoderiii
Xwire53 n_1_53 n_1_54 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand53 n_1_53 n_hang_54 vdd_lp gnd xconfigurabledecoderiii
Xwire54 n_1_54 n_1_55 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand54 n_1_54 n_hang_55 vdd_lp gnd xconfigurabledecoderiii
Xwire55 n_1_55 n_1_56 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand55 n_1_55 n_hang_56 vdd_lp gnd xconfigurabledecoderiii
Xwire56 n_1_56 n_1_57 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand56 n_1_56 n_hang_57 vdd_lp gnd xconfigurabledecoderiii
Xwire57 n_1_57 n_1_58 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand57 n_1_57 n_hang_58 vdd_lp gnd xconfigurabledecoderiii
Xwire58 n_1_58 n_1_59 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand58 n_1_58 n_hang_59 vdd_lp gnd xconfigurabledecoderiii
Xwire59 n_1_59 n_1_60 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand59 n_1_59 n_hang_60 vdd_lp gnd xconfigurabledecoderiii
Xwire60 n_1_60 n_1_61 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand60 n_1_60 n_hang_61 vdd_lp gnd xconfigurabledecoderiii
Xwire61 n_1_61 n_1_62 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand61 n_1_61 n_hang_62 vdd_lp gnd xconfigurabledecoderiii
Xwire62 n_1_62 n_1_63 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand62 n_1_62 n_hang_63 vdd_lp gnd xconfigurabledecoderiii
Xwire63 n_1_63 n_1_64 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand63 n_1_63 n_hang_64 vdd_lp gnd xconfigurabledecoderiii
Xwire64 n_1_64 n_1_65 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand64 n_1_64 n_hang_65 vdd_lp gnd xconfigurabledecoderiii
Xwire65 n_1_65 n_1_66 wire Rw=wire_xconfigurabledecoderi_res/64 Cw=wire_xconfigurabledecoderi_cap/64
Xloadnand65 n_1_65 n_hang_66 vdd_lp gnd xconfigurabledecoderiii
.END