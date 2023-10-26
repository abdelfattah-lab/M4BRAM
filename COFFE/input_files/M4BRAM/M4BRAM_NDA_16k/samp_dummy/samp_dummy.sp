.TITLE Dummy array sense amp

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
VIN n_in gnd PULSE ( supply_v_lp 0 0 0 0 4n 8n)
VIww wordline gnd PULSE (0 supply_v_lp 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_se vdd_se gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='sense_v' FALL=1
+    TARG V(xsamp1.n_1_2) VAL='sense_v' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='sense_v' FALL=1
+    TARG V(xsamp1.n_1_2) VAL='sense_v' FALL=1

.MEASURE TRAN meas_logic_low_voltage FIND V(gnd) AT=1n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_se) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xprecharge vdd_lp n_bl_0 n_br_0 vdd_lp gnd precharge_dummy
Xwire2 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer2 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/128 Cw= wire_memorycell_vertical_cap/128
Xsram2 gnd gnd n_bl_2 gnd n_br_2 gnd vdd_lp gnd memorycell
Xwire3 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer3 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/128 Cw= wire_memorycell_vertical_cap/128
Xsram3 gnd gnd n_bl_3 gnd n_br_3 gnd vdd_lp gnd memorycell
Xwire4 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer4 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/128 Cw= wire_memorycell_vertical_cap/128
Xsram4 gnd gnd n_bl_4 gnd n_br_4 gnd vdd_lp gnd memorycell
Xwire5 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer5 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/128 Cw= wire_memorycell_vertical_cap/128
Xsram5 gnd gnd n_bl_5 gnd n_br_5 gnd vdd_lp gnd memorycell
Xwire6 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer6 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/128 Cw= wire_memorycell_vertical_cap/128
Xsram6 gnd gnd n_bl_6 gnd n_br_6 gnd vdd_lp gnd memorycell
Xwire7 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer7 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/128 Cw= wire_memorycell_vertical_cap/128
Xsram7 gnd gnd n_bl_7 gnd n_br_7 gnd vdd_lp gnd memorycell
Xwire1 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer1 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram1 gnd gnd n_bl_1 gnd n_br_1 gnd vdd_lp gnd memorycell
Iread n_br_1 gnd PULSE(0 Rcurrent 0 0 0 4n 8n)
.IC V(n_bl_0) = 'supply_v_lp'
.IC V(n_br_0) = 'supply_v_lp'
.IC V(n_bl_1) = 'supply_v_lp'
.IC V(n_br_1) = 'supply_v_lp'
.IC V(n_bl_2) = 'supply_v_lp'
.IC V(n_br_2) = 'supply_v_lp'
.IC V(n_bl_3) = 'supply_v_lp'
.IC V(n_br_3) = 'supply_v_lp'
.IC V(n_bl_4) = 'supply_v_lp'
.IC V(n_br_4) = 'supply_v_lp'
.IC V(n_bl_5) = 'supply_v_lp'
.IC V(n_br_5) = 'supply_v_lp'
.IC V(n_bl_6) = 'supply_v_lp'
.IC V(n_br_6) = 'supply_v_lp'
.IC V(n_bl_7) = 'supply_v_lp'
.IC V(n_br_7) = 'supply_v_lp'
.IC V(tgate_l) = 'supply_v_lp'
.IC V(tgate_r) = 'supply_v_lp'
.IC V(xsamp1.n_1_2) = 'supply_v_lp'
.IC V(xsamp1.n_1_1) = 'supply_v_lp'
xtgate1 n_bl_7 tgate_l vdd_lp gnd vdd_lp gnd RAM_tgate_lp
xtgater n_br_7 tgate_r vdd_lp gnd vdd_lp gnd RAM_tgate_lp
xwrite gnd gnd n_bl_7 n_br_7 vdd_lp gnd writedriver_dummy
xsamp1 gnd n_bl_7 n_br_7 n_out vdd_se gnd samp_dummy
.END