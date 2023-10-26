.TITLE dummy array fulladder

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
VIN op gnd PULSE (0 supply_v_lp 0 0 0 4n 8n)
Vcin cin gnd PULSE (0 supply_v_lp 0.1n 0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_fa vdd_fa gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_fulladder_dummy delay
.MEASURE TRAN meas_inv_fulladder_dummy_1_tfall TRIG V(op) VAL='supply_v_lp/2' FALL=1
+    TARG V(xfulladder1.o_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_fulladder_dummy_1_trise TRIG V(op) VAL='supply_v_lp/2' RISE=1
+    TARG V(xfulladder1.o_1) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_trise TRIG V(cin) VAL='supply_v_lp/2' RISE=1
+    TARG V(cout32) VAL='supply_v_lp/2' RISE=1
.MEASURE TRAN meas_total_tfall TRIG V(cin) VAL='supply_v_lp/2' FALL=1
+    TARG V(cout32) VAL='supply_v_lp/2' FALL=1

.MEASURE TRAN meas_logic_low_voltage FIND V(gnd) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_fa) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xfulladder1 op cin cout1 sum1 vdd_fa gnd fulladder_dummy
xfulladder2 op cout1 cout2 sum2 vdd_fa gnd fulladder_dummy
xfulladder3 op cout2 cout3 sum3 vdd_fa gnd fulladder_dummy
xfulladder4 op cout3 cout4 sum4 vdd_fa gnd fulladder_dummy
xfulladder5 op cout4 cout5 sum5 vdd_fa gnd fulladder_dummy
xfulladder6 op cout5 cout6 sum6 vdd_fa gnd fulladder_dummy
xfulladder7 op cout6 cout7 sum7 vdd_fa gnd fulladder_dummy
xfulladder8 op cout7 cout8 sum8 vdd_fa gnd fulladder_dummy
xfulladder9 op cout8 cout9 sum9 vdd_fa gnd fulladder_dummy
xfulladder10 op cout9 cout10 sum10 vdd_fa gnd fulladder_dummy
xfulladder11 op cout10 cout11 sum11 vdd_fa gnd fulladder_dummy
xfulladder12 op cout11 cout12 sum12 vdd_fa gnd fulladder_dummy
xfulladder13 op cout12 cout13 sum13 vdd_fa gnd fulladder_dummy
xfulladder14 op cout13 cout14 sum14 vdd_fa gnd fulladder_dummy
xfulladder15 op cout14 cout15 sum15 vdd_fa gnd fulladder_dummy
xfulladder16 op cout15 cout16 sum16 vdd_fa gnd fulladder_dummy
xfulladder17 op cout16 cout17 sum17 vdd_fa gnd fulladder_dummy
xfulladder18 op cout17 cout18 sum18 vdd_fa gnd fulladder_dummy
xfulladder19 op cout18 cout19 sum19 vdd_fa gnd fulladder_dummy
xfulladder20 op cout19 cout20 sum20 vdd_fa gnd fulladder_dummy
xfulladder21 op cout20 cout21 sum21 vdd_fa gnd fulladder_dummy
xfulladder22 op cout21 cout22 sum22 vdd_fa gnd fulladder_dummy
xfulladder23 op cout22 cout23 sum23 vdd_fa gnd fulladder_dummy
xfulladder24 op cout23 cout24 sum24 vdd_fa gnd fulladder_dummy
xfulladder25 op cout24 cout25 sum25 vdd_fa gnd fulladder_dummy
xfulladder26 op cout25 cout26 sum26 vdd_fa gnd fulladder_dummy
xfulladder27 op cout26 cout27 sum27 vdd_fa gnd fulladder_dummy
xfulladder28 op cout27 cout28 sum28 vdd_fa gnd fulladder_dummy
xfulladder29 op cout28 cout29 sum29 vdd_fa gnd fulladder_dummy
xfulladder30 op cout29 cout30 sum30 vdd_fa gnd fulladder_dummy
xfulladder31 op cout30 cout31 sum31 vdd_fa gnd fulladder_dummy
xfulladder32 op cout31 cout32 sum32 vdd_fa gnd fulladder_dummy
.END