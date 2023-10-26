.TITLE dummy array precharge and equalization

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
VIN n_in gnd PULSE (0 supply_v_lp 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_eq vdd_eq gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(v_precharge) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_bl_7) VAL='0.99*supply_v_lp' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(v_precharge) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_bl_7) VAL='0.99*supply_v_lp' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(v_precharge) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_eq) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xinv n_in v_precharge vdd_lp gnd inv l=gate_length w=2*gate_length
xprecharge v_precharge n_bl_0 n_br_0 vdd_eq gnd precharge_dummy
Xwire1 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer1 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram1 gnd gnd n_bl_1 gnd n_br_1 gnd vdd gnd memorycell
Xwire2 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer2 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram2 gnd gnd n_bl_2 gnd n_br_2 gnd vdd gnd memorycell
Xwire3 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer3 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram3 gnd gnd n_bl_3 gnd n_br_3 gnd vdd gnd memorycell
Xwire4 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer4 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram4 gnd gnd n_bl_4 gnd n_br_4 gnd vdd gnd memorycell
Xwire5 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer5 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram5 gnd gnd n_bl_5 gnd n_br_5 gnd vdd gnd memorycell
Xwire6 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer6 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram6 gnd gnd n_bl_6 gnd n_br_6 gnd vdd gnd memorycell
Xwire7 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer7 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram7 gnd gnd n_bl_7 gnd n_br_7 gnd vdd gnd memorycell
xtgate1 n_bl_0 tgate_l gnd vdd_lp vdd_lp gnd RAM_tgate_lp
xtgater n_br_0 tgate_r gnd vdd_lp vdd_lp gnd RAM_tgate_lp
xinvl n_bl_7 n_invl_out vdd_lp gnd inv_lp Wn=45n Wp=55n
xinvr n_br_7 n_invr_out vdd_lp gnd inv_lp Wn=45n Wp=55n
xwrite gnd gnd n_bl_7 n_br_7 vdd_lp gnd writedriver_dummy
.IC V(n_bl_0) = 0
.IC V(n_br_0) = 'supply_v_lp'
.IC V(tgate_l) = 0
.IC V(tgate_r) = 'supply_v_lp'
.END