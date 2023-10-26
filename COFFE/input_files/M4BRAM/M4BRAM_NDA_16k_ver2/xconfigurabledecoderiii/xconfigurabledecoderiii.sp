.TITLE last stage of configurable decoder

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
V_third1 vdd_third1 gnd supply_v_lp

V_third2 vdd_third2 gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_nand2xconfigurabledecoderiii delay
.MEASURE TRAN meaz1_inv_nand2_xconfigurabledecoderiii_1_tfall TRIG V(n_1_4) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xloadnand4.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz1_inv_nand2_xconfigurabledecoderiii_1_trise TRIG V(n_1_4) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xloadnand4.n_1_1) VAL='supply_v_lp/2' RISE=1

* invxconfigurabledecoderiii_2 delay
.MEASURE TRAN meaz1_inv_xconfigurabledecoderiii_2_tfall TRIG V(n_1_4) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xloadnand4.n_out) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz1_inv_xconfigurabledecoderiii_2_trise TRIG V(n_1_4) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xloadnand4.n_out) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meaz1_total_tfall TRIG V(n_1_4) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_38) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz1_total_trise TRIG V(n_1_4) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_38) VAL='supply_v_lp/2' RISE=1

* inv_nandxconfigurabledecoderiii delay
.MEASURE TRAN meaz2_inv_nand2_xconfigurabledecoderiii_1_tfall TRIG V(n_2_8) VAL='supply_v_lp/2' RISE=1
+    TARG V(X2loadnand8.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz2_inv_nand2_xconfigurabledecoderiii_1_trise TRIG V(n_2_8) VAL='supply_v_lp/2' FALL=1
+    TARG V(X2loadnand8.n_1_1) VAL='supply_v_lp/2' RISE=1

* invxconfigurabledecoderiii_2 delay
.MEASURE TRAN meaz2_inv_xconfigurabledecoderiii_2_tfall TRIG V(n_2_8) VAL='supply_v_lp/2' FALL=1
+    TARG V(X2loadnand8.n_out) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz2_inv_xconfigurabledecoderiii_2_trise TRIG V(n_2_8) VAL='supply_v_lp/2' RISE=1
+    TARG V(X2loadnand8.n_out) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meaz2_total_tfall TRIG V(n_2_8) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_2_42) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz2_total_trise TRIG V(n_2_8) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_2_42) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meaz1_current INTEGRAL I(V_third1) FROM=0ns TO=4ns
.MEASURE TRAN meaz1_avg_power PARAM = '-(meaz1_current/4n)*supply_v_lp'

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meaz2_current INTEGRAL I(V_third2) FROM=0ns TO=4ns
.MEASURE TRAN meaz2_avg_power PARAM = '-(meaz2_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

Xnandu n_in n_1_0 vdd_lp gnd xconfigurabledecoder3ii
Xwire0 n_1_0 n_1_1 wire Rw=wire_xconfigurabledecoderi_res/4 Cw=wire_xconfigurabledecoderi_cap/4
Xloadnand1 n_1_1 n_hang_2 vdd_lp gnd xconfigurabledecoderiii
Xwire1 n_1_1 n_1_2 wire Rw=wire_xconfigurabledecoderi_res/4 Cw=wire_xconfigurabledecoderi_cap/4
Xloadnand2 n_1_2 n_hang_3 vdd_lp gnd xconfigurabledecoderiii
Xwire2 n_1_2 n_1_3 wire Rw=wire_xconfigurabledecoderi_res/4 Cw=wire_xconfigurabledecoderi_cap/4
Xloadnand3 n_1_3 n_hang_4 vdd_lp gnd xconfigurabledecoderiii
Xwire3 n_1_3 n_1_4 wire Rw=wire_xconfigurabledecoderi_res/4 Cw=wire_xconfigurabledecoderi_cap/4
Xloadnand4 n_1_4 n_1_5 vdd_third1 gnd xconfigurabledecoderiii
Xwireadded n_1_5 n_1_6 wire Rw=wire_xconfigurabledecoderiii_res Cw=wire_xconfigurabledecoderiii_cap 
Xwirel6 n_1_6 n_1_7 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel7 n_1_7 n_1_8 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel8 n_1_8 n_1_9 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel9 n_1_9 n_1_10 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel10 n_1_10 n_1_11 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel11 n_1_11 n_1_12 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel12 n_1_12 n_1_13 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel13 n_1_13 n_1_14 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel14 n_1_14 n_1_15 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel15 n_1_15 n_1_16 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel16 n_1_16 n_1_17 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel17 n_1_17 n_1_18 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel18 n_1_18 n_1_19 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel19 n_1_19 n_1_20 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel20 n_1_20 n_1_21 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel21 n_1_21 n_1_22 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel22 n_1_22 n_1_23 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel23 n_1_23 n_1_24 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel24 n_1_24 n_1_25 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel25 n_1_25 n_1_26 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel26 n_1_26 n_1_27 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel27 n_1_27 n_1_28 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel28 n_1_28 n_1_29 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel29 n_1_29 n_1_30 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel30 n_1_30 n_1_31 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel31 n_1_31 n_1_32 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel32 n_1_32 n_1_33 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel33 n_1_33 n_1_34 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel34 n_1_34 n_1_35 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel35 n_1_35 n_1_36 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel36 n_1_36 n_1_37 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwirel37 n_1_37 n_1_38 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xtgate36 gnd gnd n_1_38 vdd_lp vdd_lp gnd RAM_tgate
Xnandv n_in n_2_0 vdd_lp gnd xconfigurabledecoder2ii
X2wire0 n_2_0 n_2_1 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand1 n_2_1 n_hang2_2 vdd_lp gnd xconfigurabledecoderiii
X2wire1 n_2_1 n_2_2 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand2 n_2_2 n_hang2_3 vdd_lp gnd xconfigurabledecoderiii
X2wire2 n_2_2 n_2_3 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand3 n_2_3 n_hang2_4 vdd_lp gnd xconfigurabledecoderiii
X2wire3 n_2_3 n_2_4 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand4 n_2_4 n_hang2_5 vdd_lp gnd xconfigurabledecoderiii
X2wire4 n_2_4 n_2_5 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand5 n_2_5 n_hang2_6 vdd_lp gnd xconfigurabledecoderiii
X2wire5 n_2_5 n_2_6 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand6 n_2_6 n_hang2_7 vdd_lp gnd xconfigurabledecoderiii
X2wire6 n_2_6 n_2_7 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand7 n_2_7 n_hang2_8 vdd_lp gnd xconfigurabledecoderiii
X2wire7 n_2_7 n_2_8 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
X2loadnand8 n_2_8 n_2_9 vdd_third2 gnd xconfigurabledecoderiii
Xwireadded2 n_2_9 n_2_10 wire Rw=wire_xconfigurabledecoderiii_res Cw=wire_xconfigurabledecoderiii_cap 
X2wirel10 n_2_10 n_2_11 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel11 n_2_11 n_2_12 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel12 n_2_12 n_2_13 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel13 n_2_13 n_2_14 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel14 n_2_14 n_2_15 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel15 n_2_15 n_2_16 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel16 n_2_16 n_2_17 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel17 n_2_17 n_2_18 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel18 n_2_18 n_2_19 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel19 n_2_19 n_2_20 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel20 n_2_20 n_2_21 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel21 n_2_21 n_2_22 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel22 n_2_22 n_2_23 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel23 n_2_23 n_2_24 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel24 n_2_24 n_2_25 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel25 n_2_25 n_2_26 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel26 n_2_26 n_2_27 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel27 n_2_27 n_2_28 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel28 n_2_28 n_2_29 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel29 n_2_29 n_2_30 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel30 n_2_30 n_2_31 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel31 n_2_31 n_2_32 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel32 n_2_32 n_2_33 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel33 n_2_33 n_2_34 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel34 n_2_34 n_2_35 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel35 n_2_35 n_2_36 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel36 n_2_36 n_2_37 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel37 n_2_37 n_2_38 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel38 n_2_38 n_2_39 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel39 n_2_39 n_2_40 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel40 n_2_40 n_2_41 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2wirel41 n_2_41 n_2_42 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
X2tgate40 gnd gnd n_2_42 vdd_lp vdd_lp gnd RAM_tgate
.END