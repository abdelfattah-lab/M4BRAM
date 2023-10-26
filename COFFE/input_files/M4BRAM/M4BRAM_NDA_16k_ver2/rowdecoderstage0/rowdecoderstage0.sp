.TITLE RAM row decoder stage 0

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
VIN n_in gnd PULSE (0 supply_v_lp 0 0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_test vdd_test gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_rowdecoderstage0_1 delay
.MEASURE TRAN meas_inv_rowdecoderstage0_1_tfall TRIG V(n_1_4) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_12) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_rowdecoderstage0_1_trise TRIG V(n_1_4) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_12) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_4) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_12) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_4) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_12) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_test) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

Xrouting_wire_load_1 n_in n_1_1 n_1_2 vsram vsram_n vdd gnd vdd vdd routing_wire_load
Xlocal_routing_wire_load_1 n_1_2 n_1_3 vsram vsram_n vdd gnd vdd RAM_local_routing_wire_load
Xinv_ff_output_driver n_1_3 n_1_4 vdd_lp gnd inv_lp Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xdstage0 n_1_4 n_1_5 vdd_test gnd rowdecoderstage0
Xwire5 n_1_5 n_1_6 wire Rw=wire_rowdecoderstage0_res/7 Cw=wire_rowdecoderstage0_cap/7
Xnand25 n_1_6 n_hang_5 vdd_lp gnd nand2_lp Wn=inv_nand2_rowdecoderstage12_1_nmos Wp=inv_nand2_rowdecoderstage12_1_pmos
Xwire6 n_1_6 n_1_7 wire Rw=wire_rowdecoderstage0_res/7 Cw=wire_rowdecoderstage0_cap/7
Xnand26 n_1_7 n_hang_6 vdd_lp gnd nand2_lp Wn=inv_nand2_rowdecoderstage12_1_nmos Wp=inv_nand2_rowdecoderstage12_1_pmos
Xwire7 n_1_7 n_1_8 wire Rw=wire_rowdecoderstage0_res/7 Cw=wire_rowdecoderstage0_cap/7
Xnand27 n_1_8 n_hang_7 vdd_lp gnd nand2_lp Wn=inv_nand2_rowdecoderstage12_1_nmos Wp=inv_nand2_rowdecoderstage12_1_pmos
Xwire8 n_1_8 n_1_9 wire Rw=wire_rowdecoderstage0_res/7 Cw=wire_rowdecoderstage0_cap/7
Xnand28 n_1_9 n_hang_8 vdd_lp gnd nand2_lp Wn=inv_nand2_rowdecoderstage12_1_nmos Wp=inv_nand2_rowdecoderstage12_1_pmos
Xwire39 n_1_9 n_1_10 wire Rw=wire_rowdecoderstage0_res/7 Cw=wire_rowdecoderstage0_cap/7
Xnand39 n_1_10 n_hang_9 vdd_lp gnd nand3_lp Wn=inv_nand3_rowdecoderstage13_1_nmos Wp=inv_nand3_rowdecoderstage13_1_pmos
Xwire310 n_1_10 n_1_11 wire Rw=wire_rowdecoderstage0_res/7 Cw=wire_rowdecoderstage0_cap/7
Xnand310 n_1_11 n_hang_10 vdd_lp gnd nand3_lp Wn=inv_nand3_rowdecoderstage13_1_nmos Wp=inv_nand3_rowdecoderstage13_1_pmos
Xwire311 n_1_11 n_1_12 wire Rw=wire_rowdecoderstage0_res/7 Cw=wire_rowdecoderstage0_cap/7
Xnand311 n_1_12 n_hang_11 vdd_lp gnd nand3_lp Wn=inv_nand3_rowdecoderstage13_1_nmos Wp=inv_nand3_rowdecoderstage13_1_pmos
.END