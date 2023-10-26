.TITLE dummy array carry lookahead adder

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
Vcin cin gnd PULSE (0 supply_v_lp  0.1n    0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_cla vdd_cla gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_lookahead4_dummy delay
.MEASURE TRAN meas_inv_lookahead4_dummy_1_tfall TRIG V(xlookahead4_1.cin) VAL='supply_v_lp/2' RISE=1
+    TARG V(xlookahead4_1.coutbar) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_lookahead4_dummy_1_trise TRIG V(xlookahead4_1.cin) VAL='supply_v_lp/2' FALL=1
+    TARG V(xlookahead4_1.coutbar) VAL='supply_v_lp/2' RISE=1

* inv_lookahead4_dummy delay
.MEASURE TRAN meas_inv_lookahead4_dummy_2_tfall TRIG V(xlookahead4_1.cin) VAL='supply_v_lp/2' RISE=1
+    TARG V(xlookahead4_1.coutbar) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_lookahead4_dummy_2_trise TRIG V(xlookahead4_1.cin) VAL='supply_v_lp/2' FALL=1
+    TARG V(xlookahead4_1.coutbar) VAL='supply_v_lp/2' RISE=1

* inv_lookahead4_dummy delay
.MEASURE TRAN meas_inv_lookahead4_dummy_3_tfall TRIG V(xlookahead4_1.coutbar) VAL='supply_v_lp/2' RISE=1
+    TARG V(xlookahead4_1.cout) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_lookahead4_dummy_3_trise TRIG V(xlookahead4_1.coutbar) VAL='supply_v_lp/2' FALL=1
+    TARG V(xlookahead4_1.cout) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_trise TRIG V(cin_buf) VAL='supply_v_lp/2' RISE=1
+    TARG V(sum8) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_tfall TRIG V(cin_buf) VAL='supply_v_lp/2' FALL=1
+    TARG V(sum8) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(gnd) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_cla) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

X_inv_lookahead4_dummy_1 cin   cinb vdd_lp gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_2 cinb   cin_buf vdd_lp gnd inv Wn=90n Wp=110n
xlookahead4_1  cin_buf  c_1  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum1 vdd_cla gnd lookahead4_dummy
xlookahead4_2  c_1      c_2  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum2 vdd_cla gnd lookahead4_dummy
xlookahead4_3  c_2      c_3  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum3 vdd_cla gnd lookahead4_dummy
xlookahead4_4  c_3      c_4  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum4 vdd_cla gnd lookahead4_dummy
xlookahead4_5  c_4      c_5  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum5 vdd_cla gnd lookahead4_dummy
xlookahead4_6  c_5      c_6  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum6 vdd_cla gnd lookahead4_dummy
xlookahead4_7  c_6      c_7  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum7 vdd_cla gnd lookahead4_dummy
xlookahead4_8  c_7      cout vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum8 vdd_cla gnd lookahead4_dummy
.END