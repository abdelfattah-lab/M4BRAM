.TITLE wordline driver

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
V_wordline vdd_wordline gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_wordline_driver_dummy delay
.MEASURE TRAN meas_inv_nand2_wordline_driver_dummy_1_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xwordline.n_1_1) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_nand2_wordline_driver_dummy_1_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xwordline.n_1_1) VAL='supply_v_lp/2' RISE=1

* inv_wordline_driver_dummy delay
.MEASURE TRAN meas_inv_wordline_driver_dummy_2_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xwordline.n_1_2) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_dummy_2_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xwordline.n_1_2) VAL='supply_v_lp/2' RISE=1

* inv_wordline_driver_dummy delay
.MEASURE TRAN meas_inv_wordline_driver_dummy_3_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xwordline.n_1_3) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_dummy_3_trise TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xwordline.n_1_3) VAL='supply_v_lp/2' RISE=1

* inv_wordline_driver_dummy delay
.MEASURE TRAN meas_inv_wordline_driver_dummy_4_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_33) VAL='supply_v_lp * 0.1' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_dummy_4_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_33) VAL='supply_v_lp * 0.9' RISE=1

* Total delays
.MEASURE TRAN meaz1_total_tfall TRIG V(n_1_1) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_1_33) VAL='supply_v_lp * 0.1' FALL=1
.MEASURE TRAN meaz1_total_trise TRIG V(n_1_1) VAL='supply_v_lp/2' RISE=1
+    TARG V(n_1_33) VAL='supply_v_lp * 0.9' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_wordline) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

Xnandu n_in n_1_1 vdd_lp gnd rowdecoderstage3
Xwordline n_1_1 n_1_2 vdd_wordline gnd wordline_driver_dummy
Xmemcell2 n_1_2 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel2 n_1_2 n_1_3 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell3 n_1_3 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel3 n_1_3 n_1_4 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell4 n_1_4 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel4 n_1_4 n_1_5 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell5 n_1_5 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel5 n_1_5 n_1_6 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell6 n_1_6 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel6 n_1_6 n_1_7 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell7 n_1_7 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel7 n_1_7 n_1_8 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell8 n_1_8 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel8 n_1_8 n_1_9 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell9 n_1_9 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel9 n_1_9 n_1_10 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell10 n_1_10 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel10 n_1_10 n_1_11 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell11 n_1_11 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel11 n_1_11 n_1_12 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell12 n_1_12 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel12 n_1_12 n_1_13 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell13 n_1_13 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel13 n_1_13 n_1_14 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell14 n_1_14 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel14 n_1_14 n_1_15 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell15 n_1_15 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel15 n_1_15 n_1_16 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell16 n_1_16 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel16 n_1_16 n_1_17 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell17 n_1_17 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel17 n_1_17 n_1_18 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell18 n_1_18 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel18 n_1_18 n_1_19 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell19 n_1_19 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel19 n_1_19 n_1_20 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell20 n_1_20 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel20 n_1_20 n_1_21 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell21 n_1_21 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel21 n_1_21 n_1_22 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell22 n_1_22 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel22 n_1_22 n_1_23 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell23 n_1_23 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel23 n_1_23 n_1_24 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell24 n_1_24 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel24 n_1_24 n_1_25 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell25 n_1_25 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel25 n_1_25 n_1_26 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell26 n_1_26 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel26 n_1_26 n_1_27 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell27 n_1_27 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel27 n_1_27 n_1_28 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell28 n_1_28 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel28 n_1_28 n_1_29 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell29 n_1_29 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel29 n_1_29 n_1_30 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell30 n_1_30 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel30 n_1_30 n_1_31 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell31 n_1_31 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel31 n_1_31 n_1_32 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell32 n_1_32 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel32 n_1_32 n_1_33 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
Xmemcell33 n_1_33 gnd gnd gnd gnd gnd vdd_lp gnd memorycell
Xwirel33 n_1_33 n_1_34 wire Rw=wire_wordline_driver_res/32 Cw=wire_wordline_driver_cap/32
.END