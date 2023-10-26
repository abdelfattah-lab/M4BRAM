.TITLE dummy array 2:1 mux

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
VIN op gnd PULSE   (0 supply_v_lp 0.1n 0 0 2n 4n)
Vsel sel gnd PULSE (0 supply_v_lp 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_mux2 vdd_mux2 gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_trise TRIG V(op) VAL='supply_v_lp/2' RISE=1
+    TARG V(mux2_out) VAL='supply_v_lp/2' RISE=1
.MEASURE TRAN meas_total_tfall TRIG V(op) VAL='supply_v_lp/2' FALL=1
+    TARG V(mux2_out) VAL='supply_v_lp/2' FALL=1

.MEASURE TRAN meas_logic_low_voltage FIND V(gnd) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_mux2) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xinv1 sel selbar vdd_lp gnd inv_lp Wn=45n Wp=55n
xmux  op mux2_out sel selbar vdd_mux2 gnd mux2_dummy
xwrite gnd mux2_out n_bl n_br vdd_lp gnd writedriver_dummy
.IC V(xmux.n_out) = 0
.END