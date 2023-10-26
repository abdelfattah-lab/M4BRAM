.TITLE A nand2 path

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
VIN n_in gnd PULSE (0 supply_v 0 0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_nand2 vdd_nand2 gnd supply_v

********************************************************************************
** Measurement
********************************************************************************

* inv_pgateoutputcrossbar delay
.MEASURE TRAN meas_inv_pgateoutputcrossbar_1_tfall TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(xoutputcrossbar.n_1_1) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_pgateoutputcrossbar_1_trise TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(xoutputcrossbar.n_1_1) VAL='supply_v/2' RISE=1

* inv_pgateoutputcrossbar delay
.MEASURE TRAN meas_inv_pgateoutputcrossbar_2_tfall TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(xoutputcrossbar.n_1_2) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_pgateoutputcrossbar_2_trise TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(xoutputcrossbar.n_1_2) VAL='supply_v/2' RISE=1

* inv_pgateoutputcrossbar delay
.MEASURE TRAN meas_inv_pgateoutputcrossbar_3_tfall TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(xoutputcrossbar.n_1_3) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_pgateoutputcrossbar_3_trise TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(xoutputcrossbar.n_1_3) VAL='supply_v/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(n_1_2) VAL='supply_v/2' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(n_1_2) VAL='supply_v/2' FALL=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_nand2) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/8n)*supply_v'

********************************************************************************
** Circuit
********************************************************************************

X_inv_samp n_in n_1_1 vdd gnd inv Wn=min_tran_width Wp=min_tran_width
xoutputcrossbar n_1_1 n_1_2 vdd_nand2 vsram gnd pgateoutputcrossbar
Xff n_1_2 n_hang2 vdd gnd vdd nnd gnd vdd gnd vdd vdd gnd ff
.END