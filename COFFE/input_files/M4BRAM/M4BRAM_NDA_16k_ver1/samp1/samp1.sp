.TITLE Sense amp

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
VIN n_in gnd PULSE ( 0 supply_v_lp 0 0 0 4n 8n)
VIww wordline gnd PULSE (0 supply_v_lp 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_se vdd_se gnd supply_v_lp
V_left tgate_r gnd supply_v_lp
V_right tgate_l gnd sense_v

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_out) VAL='sense_v' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_out) VAL='sense_v' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(gnd) AT=1n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_se) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

.IC V(xsamp1.n_1_2) = 'sense_v'
.IC V(xsamp1.n_1_1) = 'supply_v_lp'
xsamp1 n_in tgate_l tgate_r n_out vdd_se gnd samp1
.END