.TITLE dummy array manchester adder

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
Vclk clk gnd PULSE (0 supply_v_lp 0.2n 0 0 2n 4n)
Vcin cin gnd PULSE (supply_v_lp 0 0    0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_mc vdd_mc gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_trise TRIG V(clk) VAL='supply_v_lp/2' RISE=1
+    TARG V(sum8) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_tfall TRIG V(clk) VAL='supply_v_lp/2' RISE=1
+    TARG V(sum6) VAL='supply_v_lp/2' FALL=1

.MEASURE TRAN meas_logic_low_voltage FIND V(gnd) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_mc) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

X_inv_manchester4_dummy_1 cin   cinb vdd_lp gnd inv Wn=45n Wp=55n
xmanchester4_1 clk cinb  c_1  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd vdd_lp   sum1 vdd_mc gnd manchester4_dummy
xmanchester4_2 clk c_1   c_2  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum2 vdd_mc gnd manchester4_dummy
xmanchester4_3 clk c_2   c_3  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum3 vdd_mc gnd manchester4_dummy
xmanchester4_4 clk c_3   c_4  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum4 vdd_mc gnd manchester4_dummy
xmanchester4_5 clk c_4   c_5  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum5 vdd_mc gnd manchester4_dummy
xmanchester4_6 clk c_5   c_6  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum6 vdd_mc gnd manchester4_dummy
xmanchester4_7 clk c_6   c_7  vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum7 vdd_mc gnd manchester4_dummy
xmanchester4_8 clk c_7   cout vdd_lp vdd_lp vdd_lp vdd_lp   gnd gnd gnd gnd      sum8 vdd_mc gnd manchester4_dummy
.END