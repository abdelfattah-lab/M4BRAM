.TITLE precharge and equalization

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
+    TARG V(n_bl_64) VAL='0.99*supply_v_lp' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(v_precharge) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_bl_64) VAL='0.99*supply_v_lp' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(v_precharge) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_eq) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xinv n_in v_precharge vdd_lp gnd inv l=gate_length w=2*gate_length
xprecharge v_precharge n_bl_0 n_br_0 vdd_eq gnd precharge
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
Xwire8 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer8 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram8 gnd gnd n_bl_8 gnd n_br_8 gnd vdd gnd memorycell
Xwire9 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer9 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram9 gnd gnd n_bl_9 gnd n_br_9 gnd vdd gnd memorycell
Xwire10 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer10 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram10 gnd gnd n_bl_10 gnd n_br_10 gnd vdd gnd memorycell
Xwire11 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer11 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram11 gnd gnd n_bl_11 gnd n_br_11 gnd vdd gnd memorycell
Xwire12 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer12 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram12 gnd gnd n_bl_12 gnd n_br_12 gnd vdd gnd memorycell
Xwire13 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer13 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram13 gnd gnd n_bl_13 gnd n_br_13 gnd vdd gnd memorycell
Xwire14 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer14 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram14 gnd gnd n_bl_14 gnd n_br_14 gnd vdd gnd memorycell
Xwire15 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer15 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram15 gnd gnd n_bl_15 gnd n_br_15 gnd vdd gnd memorycell
Xwire16 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer16 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram16 gnd gnd n_bl_16 gnd n_br_16 gnd vdd gnd memorycell
Xwire17 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer17 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram17 gnd gnd n_bl_17 gnd n_br_17 gnd vdd gnd memorycell
Xwire18 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer18 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram18 gnd gnd n_bl_18 gnd n_br_18 gnd vdd gnd memorycell
Xwire19 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer19 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram19 gnd gnd n_bl_19 gnd n_br_19 gnd vdd gnd memorycell
Xwire20 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer20 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram20 gnd gnd n_bl_20 gnd n_br_20 gnd vdd gnd memorycell
Xwire21 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer21 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram21 gnd gnd n_bl_21 gnd n_br_21 gnd vdd gnd memorycell
Xwire22 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer22 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram22 gnd gnd n_bl_22 gnd n_br_22 gnd vdd gnd memorycell
Xwire23 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer23 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram23 gnd gnd n_bl_23 gnd n_br_23 gnd vdd gnd memorycell
Xwire24 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer24 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram24 gnd gnd n_bl_24 gnd n_br_24 gnd vdd gnd memorycell
Xwire25 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer25 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram25 gnd gnd n_bl_25 gnd n_br_25 gnd vdd gnd memorycell
Xwire26 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer26 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram26 gnd gnd n_bl_26 gnd n_br_26 gnd vdd gnd memorycell
Xwire27 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer27 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram27 gnd gnd n_bl_27 gnd n_br_27 gnd vdd gnd memorycell
Xwire28 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer28 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram28 gnd gnd n_bl_28 gnd n_br_28 gnd vdd gnd memorycell
Xwire29 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer29 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram29 gnd gnd n_bl_29 gnd n_br_29 gnd vdd gnd memorycell
Xwire30 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer30 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram30 gnd gnd n_bl_30 gnd n_br_30 gnd vdd gnd memorycell
Xwire31 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer31 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram31 gnd gnd n_bl_31 gnd n_br_31 gnd vdd gnd memorycell
Xwire32 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer32 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram32 gnd gnd n_bl_32 gnd n_br_32 gnd vdd gnd memorycell
Xwire33 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer33 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram33 gnd gnd n_bl_33 gnd n_br_33 gnd vdd gnd memorycell
Xwire34 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer34 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram34 gnd gnd n_bl_34 gnd n_br_34 gnd vdd gnd memorycell
Xwire35 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer35 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram35 gnd gnd n_bl_35 gnd n_br_35 gnd vdd gnd memorycell
Xwire36 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer36 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram36 gnd gnd n_bl_36 gnd n_br_36 gnd vdd gnd memorycell
Xwire37 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer37 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram37 gnd gnd n_bl_37 gnd n_br_37 gnd vdd gnd memorycell
Xwire38 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer38 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram38 gnd gnd n_bl_38 gnd n_br_38 gnd vdd gnd memorycell
Xwire39 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer39 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram39 gnd gnd n_bl_39 gnd n_br_39 gnd vdd gnd memorycell
Xwire40 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer40 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram40 gnd gnd n_bl_40 gnd n_br_40 gnd vdd gnd memorycell
Xwire41 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer41 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram41 gnd gnd n_bl_41 gnd n_br_41 gnd vdd gnd memorycell
Xwire42 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer42 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram42 gnd gnd n_bl_42 gnd n_br_42 gnd vdd gnd memorycell
Xwire43 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer43 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram43 gnd gnd n_bl_43 gnd n_br_43 gnd vdd gnd memorycell
Xwire44 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer44 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram44 gnd gnd n_bl_44 gnd n_br_44 gnd vdd gnd memorycell
Xwire45 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer45 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram45 gnd gnd n_bl_45 gnd n_br_45 gnd vdd gnd memorycell
Xwire46 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer46 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram46 gnd gnd n_bl_46 gnd n_br_46 gnd vdd gnd memorycell
Xwire47 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer47 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram47 gnd gnd n_bl_47 gnd n_br_47 gnd vdd gnd memorycell
Xwire48 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer48 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram48 gnd gnd n_bl_48 gnd n_br_48 gnd vdd gnd memorycell
Xwire49 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer49 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram49 gnd gnd n_bl_49 gnd n_br_49 gnd vdd gnd memorycell
Xwire50 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer50 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram50 gnd gnd n_bl_50 gnd n_br_50 gnd vdd gnd memorycell
Xwire51 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer51 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram51 gnd gnd n_bl_51 gnd n_br_51 gnd vdd gnd memorycell
Xwire52 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer52 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram52 gnd gnd n_bl_52 gnd n_br_52 gnd vdd gnd memorycell
Xwire53 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer53 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram53 gnd gnd n_bl_53 gnd n_br_53 gnd vdd gnd memorycell
Xwire54 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer54 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram54 gnd gnd n_bl_54 gnd n_br_54 gnd vdd gnd memorycell
Xwire55 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer55 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram55 gnd gnd n_bl_55 gnd n_br_55 gnd vdd gnd memorycell
Xwire56 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer56 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram56 gnd gnd n_bl_56 gnd n_br_56 gnd vdd gnd memorycell
Xwire57 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer57 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram57 gnd gnd n_bl_57 gnd n_br_57 gnd vdd gnd memorycell
Xwire58 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer58 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram58 gnd gnd n_bl_58 gnd n_br_58 gnd vdd gnd memorycell
Xwire59 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer59 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram59 gnd gnd n_bl_59 gnd n_br_59 gnd vdd gnd memorycell
Xwire60 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer60 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram60 gnd gnd n_bl_60 gnd n_br_60 gnd vdd gnd memorycell
Xwire61 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer61 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram61 gnd gnd n_bl_61 gnd n_br_61 gnd vdd gnd memorycell
Xwire62 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer62 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram62 gnd gnd n_bl_62 gnd n_br_62 gnd vdd gnd memorycell
Xwire63 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer63 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram63 gnd gnd n_bl_63 gnd n_br_63 gnd vdd gnd memorycell
Xwire64 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer64 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram64 gnd gnd n_bl_64 gnd n_br_64 gnd vdd gnd memorycell
xtgate1 n_bl_64 tgate_l vdd_lp gnd vdd_lp gnd RAM_tgate_lp
xtgater n_br_64 tgate_r vdd_lp gnd vdd_lp gnd RAM_tgate_lp
xwrite gnd gnd tgate_l tgate_r vdd_lp gnd writedriver
xsamp1 gnd tgate_l tgate_r n_samp_out vdd_lp gnd samp1
.IC V(n_bl_0) = 0
.IC V(n_br_0) = 'supply_v_lp'
.IC V(tgate_r) = 'supply_v_lp'
.END