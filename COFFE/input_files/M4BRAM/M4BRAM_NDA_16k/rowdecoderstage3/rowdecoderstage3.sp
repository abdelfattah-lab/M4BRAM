.TITLE thirdstage

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

* inv_nandrowdecoderstage3 delay
.MEASURE TRAN meaz1_inv_nand3_rowdecoderstage3_1_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xloadnand8.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz1_inv_nand3_rowdecoderstage3_1_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xloadnand8.n_1_1) VAL='supply_v_lp/2' RISE=1

* invrowdecoderstage3_2 delay
.MEASURE TRAN meaz1_inv_rowdecoderstage3_2_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xloadnand8.n_out) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz1_inv_rowdecoderstage3_2_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xloadnand8.n_out) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meaz1_total_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xloadnand8.n_out) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz1_total_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xloadnand8.n_out) VAL='supply_v_lp/2' RISE=1

* inv_nandrowdecoderstage3 delay
.MEASURE TRAN meaz2_inv_nand3_rowdecoderstage3_1_tfall TRIG V(n_2_8) VAL='supply_v_lp/2' RISE=1
+    TARG V(X2loadnand8.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz2_inv_nand3_rowdecoderstage3_1_trise TRIG V(n_2_8) VAL='supply_v_lp/2' FALL=1
+    TARG V(X2loadnand8.n_1_1) VAL='supply_v_lp/2' RISE=1

* invrowdecoderstage3_2 delay
.MEASURE TRAN meaz2_inv_rowdecoderstage3_2_tfall TRIG V(n_2_8) VAL='supply_v_lp/2' FALL=1
+    TARG V(X2loadnand8.n_out) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz2_inv_rowdecoderstage3_2_trise TRIG V(n_2_8) VAL='supply_v_lp/2' RISE=1
+    TARG V(X2loadnand8.n_out) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meaz2_total_tfall TRIG V(n_2_8) VAL='supply_v_lp/2' FALL=1
+    TARG V(X2loadnand8.n_out) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meaz2_total_trise TRIG V(n_2_8) VAL='supply_v_lp/2' RISE=1
+    TARG V(X2loadnand8.n_out) VAL='supply_v_lp/2' RISE=1

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

Xnandu n_in n_1_1 vdd_lp gnd rowdecoderstage12
Xloadnand1 n_1_1 n_hang_2 vdd_lp gnd rowdecoderstage3
Xwire1 n_1_1 n_1_2 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand2 n_1_2 n_hang_3 vdd_lp gnd rowdecoderstage3
Xwire2 n_1_2 n_1_3 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand3 n_1_3 n_hang_4 vdd_lp gnd rowdecoderstage3
Xwire3 n_1_3 n_1_4 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand4 n_1_4 n_hang_5 vdd_lp gnd rowdecoderstage3
Xwire4 n_1_4 n_1_5 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand5 n_1_5 n_hang_6 vdd_lp gnd rowdecoderstage3
Xwire5 n_1_5 n_1_6 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand6 n_1_6 n_hang_7 vdd_lp gnd rowdecoderstage3
Xwire6 n_1_6 n_1_7 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand7 n_1_7 n_hang_8 vdd_lp gnd rowdecoderstage3
Xwire7 n_1_7 n_1_8 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand8 n_1_8 n_1_9 vdd_third1 gnd rowdecoderstage3
Xwordline n_1_9 n_1_10 vdd_lp gnd wordline_driver
Xnandv n_in n_2_1 vdd_lp gnd rowdecoderstage13
X2loadnand1 n_2_1 n_hang2_2 vdd_lp gnd rowdecoderstage3
X2wire1 n_2_1 n_2_2 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
X2loadnand2 n_2_2 n_hang2_3 vdd_lp gnd rowdecoderstage3
X2wire2 n_2_2 n_2_3 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
X2loadnand3 n_2_3 n_hang2_4 vdd_lp gnd rowdecoderstage3
X2wire3 n_2_3 n_2_4 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
X2loadnand4 n_2_4 n_hang2_5 vdd_lp gnd rowdecoderstage3
X2wire4 n_2_4 n_2_5 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
X2loadnand5 n_2_5 n_hang2_6 vdd_lp gnd rowdecoderstage3
X2wire5 n_2_5 n_2_6 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
X2loadnand6 n_2_6 n_hang2_7 vdd_lp gnd rowdecoderstage3
X2wire6 n_2_6 n_2_7 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
X2loadnand7 n_2_7 n_hang2_8 vdd_lp gnd rowdecoderstage3
X2wire7 n_2_7 n_2_8 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
X2loadnand8 n_2_8 n_2_9 vdd_third2 gnd rowdecoderstage3
X2wordline n_2_9 n_2_10 vdd_lp gnd wordline_driver
.END