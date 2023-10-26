.TITLE dummy array write driver

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
VIwe we gnd PULSE (0 supply_v_lp 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_write vdd_wr gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_writedriver_dummy_1 delay
.MEASURE TRAN meas_inv_writedriver_dummy_1_tfall TRIG V(xwrite.n_din) VAL='supply_v_lp/2' RISE=1
+    TARG V(xwrite.n_din1) VAL='supply_v_lp/2' RISE=1
.MEASURE TRAN meas_inv_writedriver_dummy_1_trise TRIG V(xwrite.n_din) VAL='supply_v_lp/2' FALL=1
+    TARG V(xwrite.n_din1) VAL='supply_v_lp/2' FALL=1

* inv_writedriver_dummy_2 delay
.MEASURE TRAN meas_inv_writedriver_dummy_2_tfall TRIG V(xwrite.n_we) VAL='supply_v_lp/2' RISE=1
+    TARG V(xwrite.n_web) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_inv_writedriver_dummy_2_trise TRIG V(xwrite.n_we) VAL='supply_v_lp/2' FALL=1
+    TARG V(xwrite.n_web) VAL='supply_v_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='supply_v_lp/2' RISE=1
+    TARG V(Xsram1.n_1_2) VAL='supply_v_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='supply_v_lp/2' FALL=1
+    TARG V(Xsram1.n_1_2) VAL='supply_v_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_write) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

X_inv_shape_0 n_in n_in1 vdd_lp gnd inv_lp Wn=45n Wp=55n
X_inv_shape_1 n_in1 n_in_shaped vdd_lp gnd inv_lp Wn=45n Wp=55n
X_inv_shape_2 we n_we vdd_lp gnd inv_lp Wn=45n Wp=55n
X_inv_shape_3 n_we n_we_shaped vdd_lp gnd inv_lp Wn=45n Wp=55n
xprecharge vdd_lp n_bl_0 n_br_0 vdd_lp gnd precharge_dummy
Xwire2 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer2 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram2 gnd gnd n_bl_2 gnd n_br_2 gnd vdd_lp gnd memorycell
Xwire3 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer3 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram3 gnd gnd n_bl_3 gnd n_br_3 gnd vdd_lp gnd memorycell
Xwire4 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer4 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram4 gnd gnd n_bl_4 gnd n_br_4 gnd vdd_lp gnd memorycell
Xwire5 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer5 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram5 gnd gnd n_bl_5 gnd n_br_5 gnd vdd_lp gnd memorycell
Xwire6 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer6 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram6 gnd gnd n_bl_6 gnd n_br_6 gnd vdd_lp gnd memorycell
Xwire7 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer7 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram7 gnd gnd n_bl_7 gnd n_br_7 gnd vdd_lp gnd memorycell
Xwire1 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer1 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram1 vdd_lp gnd n_bl_1 gnd n_br_1 gnd vdd_lp gnd memorycell
.IC V(Xsram1.n_1_2) = 'supply_v_lp'
.IC V(Xsram1.n_1_1) = 0
xtgate1 n_bl_0 tgate_l gnd vdd_lp vdd_lp gnd RAM_tgate_lp
xtgater n_br_0 tgate_r gnd vdd_lp vdd_lp gnd RAM_tgate_lp
xinvl n_bl_7 n_invl_out vdd_lp gnd inv_lp Wn=45n Wp=55n
xinvr n_br_7 n_invr_out vdd_lp gnd inv_lp Wn=45n Wp=55n
.IC V(tgate_r) = 'supply_v_lp'
.IC V(tgate_l) = 'supply_v_lp'
.IC V(n_br_0) = 'supply_v_lp'
.IC V(n_br_0) = 'supply_v_lp'
.IC V(n_br_1) = 'supply_v_lp'
.IC V(n_br_1) = 'supply_v_lp'
.IC V(n_br_2) = 'supply_v_lp'
.IC V(n_br_2) = 'supply_v_lp'
.IC V(n_br_3) = 'supply_v_lp'
.IC V(n_br_3) = 'supply_v_lp'
.IC V(n_br_4) = 'supply_v_lp'
.IC V(n_br_4) = 'supply_v_lp'
.IC V(n_br_5) = 'supply_v_lp'
.IC V(n_br_5) = 'supply_v_lp'
.IC V(n_br_6) = 'supply_v_lp'
.IC V(n_br_6) = 'supply_v_lp'
xwrite n_we_shaped n_in_shaped n_bl_7 n_br_7 vdd_wr gnd writedriver_dummy
.END