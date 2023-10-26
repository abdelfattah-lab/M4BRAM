.TITLE stage one of the small row decoder

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

* inv_nand2rowdecoderstage13 delay
.MEASURE TRAN meas_inv_nand3_rowdecoderstage13_1_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xsec.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_nand3_rowdecoderstage13_1_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xsec.n_1_1) VAL='supply_v_lp/2' RISE=1

* inv_rowdecoderstage13 delay
.MEASURE TRAN meas_inv_rowdecoderstage13_2_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_9) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_rowdecoderstage13_2_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_9) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_9) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_9) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_sec) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

Xrowstage0 n_in n_1_1 vdd_lp gnd rowdecoderstage0
Xsec n_1_1 n_1_2 vdd_sec gnd rowdecoderstage13
Xwire2 n_1_2 n_1_3 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand2 n_1_2 n_hang_3 vdd_lp gnd rowdecoderstage3
Xwire3 n_1_3 n_1_4 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand3 n_1_3 n_hang_4 vdd_lp gnd rowdecoderstage3
Xwire4 n_1_4 n_1_5 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand4 n_1_4 n_hang_5 vdd_lp gnd rowdecoderstage3
Xwire5 n_1_5 n_1_6 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand5 n_1_5 n_hang_6 vdd_lp gnd rowdecoderstage3
Xwire6 n_1_6 n_1_7 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand6 n_1_6 n_hang_7 vdd_lp gnd rowdecoderstage3
Xwire7 n_1_7 n_1_8 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand7 n_1_7 n_hang_8 vdd_lp gnd rowdecoderstage3
Xwire8 n_1_8 n_1_9 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand8 n_1_8 n_hang_9 vdd_lp gnd rowdecoderstage3
Xwire9 n_1_9 n_1_10 wire Rw=wire_rowdecoderstage0_res/8 Cw=wire_rowdecoderstage0_cap/8
Xloadnand9 n_1_9 n_hang_10 vdd_lp gnd rowdecoderstage3
.END