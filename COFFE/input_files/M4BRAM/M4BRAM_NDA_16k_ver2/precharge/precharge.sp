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
+    TARG V(n_bl_128) VAL='0.99*supply_v_lp' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(v_precharge) VAL='supply_v_lp/2' FALL=1
+    TARG V(n_bl_128) VAL='0.99*supply_v_lp' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(v_precharge) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_eq) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xinv n_in v_precharge vdd_lp gnd inv l=gate_length w=2*gate_length
xprecharge v_precharge n_bl_0 n_br_0 vdd_eq gnd precharge
Xwire1 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer1 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram1 gnd gnd n_bl_1 gnd n_br_1 gnd vdd gnd memorycell
Xwire2 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer2 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram2 gnd gnd n_bl_2 gnd n_br_2 gnd vdd gnd memorycell
Xwire3 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer3 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram3 gnd gnd n_bl_3 gnd n_br_3 gnd vdd gnd memorycell
Xwire4 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer4 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram4 gnd gnd n_bl_4 gnd n_br_4 gnd vdd gnd memorycell
Xwire5 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer5 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram5 gnd gnd n_bl_5 gnd n_br_5 gnd vdd gnd memorycell
Xwire6 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer6 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram6 gnd gnd n_bl_6 gnd n_br_6 gnd vdd gnd memorycell
Xwire7 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer7 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram7 gnd gnd n_bl_7 gnd n_br_7 gnd vdd gnd memorycell
Xwire8 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer8 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram8 gnd gnd n_bl_8 gnd n_br_8 gnd vdd gnd memorycell
Xwire9 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer9 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram9 gnd gnd n_bl_9 gnd n_br_9 gnd vdd gnd memorycell
Xwire10 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer10 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram10 gnd gnd n_bl_10 gnd n_br_10 gnd vdd gnd memorycell
Xwire11 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer11 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram11 gnd gnd n_bl_11 gnd n_br_11 gnd vdd gnd memorycell
Xwire12 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer12 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram12 gnd gnd n_bl_12 gnd n_br_12 gnd vdd gnd memorycell
Xwire13 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer13 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram13 gnd gnd n_bl_13 gnd n_br_13 gnd vdd gnd memorycell
Xwire14 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer14 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram14 gnd gnd n_bl_14 gnd n_br_14 gnd vdd gnd memorycell
Xwire15 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer15 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram15 gnd gnd n_bl_15 gnd n_br_15 gnd vdd gnd memorycell
Xwire16 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer16 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram16 gnd gnd n_bl_16 gnd n_br_16 gnd vdd gnd memorycell
Xwire17 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer17 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram17 gnd gnd n_bl_17 gnd n_br_17 gnd vdd gnd memorycell
Xwire18 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer18 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram18 gnd gnd n_bl_18 gnd n_br_18 gnd vdd gnd memorycell
Xwire19 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer19 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram19 gnd gnd n_bl_19 gnd n_br_19 gnd vdd gnd memorycell
Xwire20 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer20 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram20 gnd gnd n_bl_20 gnd n_br_20 gnd vdd gnd memorycell
Xwire21 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer21 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram21 gnd gnd n_bl_21 gnd n_br_21 gnd vdd gnd memorycell
Xwire22 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer22 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram22 gnd gnd n_bl_22 gnd n_br_22 gnd vdd gnd memorycell
Xwire23 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer23 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram23 gnd gnd n_bl_23 gnd n_br_23 gnd vdd gnd memorycell
Xwire24 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer24 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram24 gnd gnd n_bl_24 gnd n_br_24 gnd vdd gnd memorycell
Xwire25 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer25 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram25 gnd gnd n_bl_25 gnd n_br_25 gnd vdd gnd memorycell
Xwire26 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer26 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram26 gnd gnd n_bl_26 gnd n_br_26 gnd vdd gnd memorycell
Xwire27 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer27 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram27 gnd gnd n_bl_27 gnd n_br_27 gnd vdd gnd memorycell
Xwire28 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer28 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram28 gnd gnd n_bl_28 gnd n_br_28 gnd vdd gnd memorycell
Xwire29 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer29 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram29 gnd gnd n_bl_29 gnd n_br_29 gnd vdd gnd memorycell
Xwire30 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer30 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram30 gnd gnd n_bl_30 gnd n_br_30 gnd vdd gnd memorycell
Xwire31 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer31 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram31 gnd gnd n_bl_31 gnd n_br_31 gnd vdd gnd memorycell
Xwire32 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer32 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram32 gnd gnd n_bl_32 gnd n_br_32 gnd vdd gnd memorycell
Xwire33 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer33 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram33 gnd gnd n_bl_33 gnd n_br_33 gnd vdd gnd memorycell
Xwire34 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer34 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram34 gnd gnd n_bl_34 gnd n_br_34 gnd vdd gnd memorycell
Xwire35 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer35 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram35 gnd gnd n_bl_35 gnd n_br_35 gnd vdd gnd memorycell
Xwire36 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer36 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram36 gnd gnd n_bl_36 gnd n_br_36 gnd vdd gnd memorycell
Xwire37 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer37 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram37 gnd gnd n_bl_37 gnd n_br_37 gnd vdd gnd memorycell
Xwire38 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer38 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram38 gnd gnd n_bl_38 gnd n_br_38 gnd vdd gnd memorycell
Xwire39 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer39 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram39 gnd gnd n_bl_39 gnd n_br_39 gnd vdd gnd memorycell
Xwire40 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer40 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram40 gnd gnd n_bl_40 gnd n_br_40 gnd vdd gnd memorycell
Xwire41 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer41 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram41 gnd gnd n_bl_41 gnd n_br_41 gnd vdd gnd memorycell
Xwire42 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer42 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram42 gnd gnd n_bl_42 gnd n_br_42 gnd vdd gnd memorycell
Xwire43 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer43 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram43 gnd gnd n_bl_43 gnd n_br_43 gnd vdd gnd memorycell
Xwire44 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer44 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram44 gnd gnd n_bl_44 gnd n_br_44 gnd vdd gnd memorycell
Xwire45 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer45 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram45 gnd gnd n_bl_45 gnd n_br_45 gnd vdd gnd memorycell
Xwire46 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer46 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram46 gnd gnd n_bl_46 gnd n_br_46 gnd vdd gnd memorycell
Xwire47 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer47 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram47 gnd gnd n_bl_47 gnd n_br_47 gnd vdd gnd memorycell
Xwire48 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer48 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram48 gnd gnd n_bl_48 gnd n_br_48 gnd vdd gnd memorycell
Xwire49 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer49 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram49 gnd gnd n_bl_49 gnd n_br_49 gnd vdd gnd memorycell
Xwire50 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer50 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram50 gnd gnd n_bl_50 gnd n_br_50 gnd vdd gnd memorycell
Xwire51 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer51 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram51 gnd gnd n_bl_51 gnd n_br_51 gnd vdd gnd memorycell
Xwire52 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer52 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram52 gnd gnd n_bl_52 gnd n_br_52 gnd vdd gnd memorycell
Xwire53 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer53 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram53 gnd gnd n_bl_53 gnd n_br_53 gnd vdd gnd memorycell
Xwire54 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer54 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram54 gnd gnd n_bl_54 gnd n_br_54 gnd vdd gnd memorycell
Xwire55 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer55 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram55 gnd gnd n_bl_55 gnd n_br_55 gnd vdd gnd memorycell
Xwire56 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer56 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram56 gnd gnd n_bl_56 gnd n_br_56 gnd vdd gnd memorycell
Xwire57 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer57 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram57 gnd gnd n_bl_57 gnd n_br_57 gnd vdd gnd memorycell
Xwire58 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer58 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram58 gnd gnd n_bl_58 gnd n_br_58 gnd vdd gnd memorycell
Xwire59 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer59 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram59 gnd gnd n_bl_59 gnd n_br_59 gnd vdd gnd memorycell
Xwire60 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer60 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram60 gnd gnd n_bl_60 gnd n_br_60 gnd vdd gnd memorycell
Xwire61 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer61 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram61 gnd gnd n_bl_61 gnd n_br_61 gnd vdd gnd memorycell
Xwire62 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer62 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram62 gnd gnd n_bl_62 gnd n_br_62 gnd vdd gnd memorycell
Xwire63 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer63 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram63 gnd gnd n_bl_63 gnd n_br_63 gnd vdd gnd memorycell
Xwire64 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer64 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram64 gnd gnd n_bl_64 gnd n_br_64 gnd vdd gnd memorycell
Xwire65 n_bl_64 n_bl_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer65 n_br_64 n_br_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram65 gnd gnd n_bl_65 gnd n_br_65 gnd vdd gnd memorycell
Xwire66 n_bl_65 n_bl_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer66 n_br_65 n_br_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram66 gnd gnd n_bl_66 gnd n_br_66 gnd vdd gnd memorycell
Xwire67 n_bl_66 n_bl_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer67 n_br_66 n_br_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram67 gnd gnd n_bl_67 gnd n_br_67 gnd vdd gnd memorycell
Xwire68 n_bl_67 n_bl_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer68 n_br_67 n_br_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram68 gnd gnd n_bl_68 gnd n_br_68 gnd vdd gnd memorycell
Xwire69 n_bl_68 n_bl_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer69 n_br_68 n_br_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram69 gnd gnd n_bl_69 gnd n_br_69 gnd vdd gnd memorycell
Xwire70 n_bl_69 n_bl_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer70 n_br_69 n_br_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram70 gnd gnd n_bl_70 gnd n_br_70 gnd vdd gnd memorycell
Xwire71 n_bl_70 n_bl_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer71 n_br_70 n_br_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram71 gnd gnd n_bl_71 gnd n_br_71 gnd vdd gnd memorycell
Xwire72 n_bl_71 n_bl_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer72 n_br_71 n_br_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram72 gnd gnd n_bl_72 gnd n_br_72 gnd vdd gnd memorycell
Xwire73 n_bl_72 n_bl_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer73 n_br_72 n_br_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram73 gnd gnd n_bl_73 gnd n_br_73 gnd vdd gnd memorycell
Xwire74 n_bl_73 n_bl_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer74 n_br_73 n_br_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram74 gnd gnd n_bl_74 gnd n_br_74 gnd vdd gnd memorycell
Xwire75 n_bl_74 n_bl_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer75 n_br_74 n_br_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram75 gnd gnd n_bl_75 gnd n_br_75 gnd vdd gnd memorycell
Xwire76 n_bl_75 n_bl_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer76 n_br_75 n_br_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram76 gnd gnd n_bl_76 gnd n_br_76 gnd vdd gnd memorycell
Xwire77 n_bl_76 n_bl_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer77 n_br_76 n_br_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram77 gnd gnd n_bl_77 gnd n_br_77 gnd vdd gnd memorycell
Xwire78 n_bl_77 n_bl_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer78 n_br_77 n_br_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram78 gnd gnd n_bl_78 gnd n_br_78 gnd vdd gnd memorycell
Xwire79 n_bl_78 n_bl_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer79 n_br_78 n_br_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram79 gnd gnd n_bl_79 gnd n_br_79 gnd vdd gnd memorycell
Xwire80 n_bl_79 n_bl_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer80 n_br_79 n_br_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram80 gnd gnd n_bl_80 gnd n_br_80 gnd vdd gnd memorycell
Xwire81 n_bl_80 n_bl_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer81 n_br_80 n_br_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram81 gnd gnd n_bl_81 gnd n_br_81 gnd vdd gnd memorycell
Xwire82 n_bl_81 n_bl_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer82 n_br_81 n_br_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram82 gnd gnd n_bl_82 gnd n_br_82 gnd vdd gnd memorycell
Xwire83 n_bl_82 n_bl_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer83 n_br_82 n_br_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram83 gnd gnd n_bl_83 gnd n_br_83 gnd vdd gnd memorycell
Xwire84 n_bl_83 n_bl_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer84 n_br_83 n_br_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram84 gnd gnd n_bl_84 gnd n_br_84 gnd vdd gnd memorycell
Xwire85 n_bl_84 n_bl_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer85 n_br_84 n_br_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram85 gnd gnd n_bl_85 gnd n_br_85 gnd vdd gnd memorycell
Xwire86 n_bl_85 n_bl_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer86 n_br_85 n_br_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram86 gnd gnd n_bl_86 gnd n_br_86 gnd vdd gnd memorycell
Xwire87 n_bl_86 n_bl_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer87 n_br_86 n_br_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram87 gnd gnd n_bl_87 gnd n_br_87 gnd vdd gnd memorycell
Xwire88 n_bl_87 n_bl_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer88 n_br_87 n_br_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram88 gnd gnd n_bl_88 gnd n_br_88 gnd vdd gnd memorycell
Xwire89 n_bl_88 n_bl_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer89 n_br_88 n_br_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram89 gnd gnd n_bl_89 gnd n_br_89 gnd vdd gnd memorycell
Xwire90 n_bl_89 n_bl_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer90 n_br_89 n_br_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram90 gnd gnd n_bl_90 gnd n_br_90 gnd vdd gnd memorycell
Xwire91 n_bl_90 n_bl_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer91 n_br_90 n_br_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram91 gnd gnd n_bl_91 gnd n_br_91 gnd vdd gnd memorycell
Xwire92 n_bl_91 n_bl_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer92 n_br_91 n_br_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram92 gnd gnd n_bl_92 gnd n_br_92 gnd vdd gnd memorycell
Xwire93 n_bl_92 n_bl_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer93 n_br_92 n_br_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram93 gnd gnd n_bl_93 gnd n_br_93 gnd vdd gnd memorycell
Xwire94 n_bl_93 n_bl_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer94 n_br_93 n_br_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram94 gnd gnd n_bl_94 gnd n_br_94 gnd vdd gnd memorycell
Xwire95 n_bl_94 n_bl_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer95 n_br_94 n_br_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram95 gnd gnd n_bl_95 gnd n_br_95 gnd vdd gnd memorycell
Xwire96 n_bl_95 n_bl_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer96 n_br_95 n_br_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram96 gnd gnd n_bl_96 gnd n_br_96 gnd vdd gnd memorycell
Xwire97 n_bl_96 n_bl_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer97 n_br_96 n_br_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram97 gnd gnd n_bl_97 gnd n_br_97 gnd vdd gnd memorycell
Xwire98 n_bl_97 n_bl_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer98 n_br_97 n_br_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram98 gnd gnd n_bl_98 gnd n_br_98 gnd vdd gnd memorycell
Xwire99 n_bl_98 n_bl_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer99 n_br_98 n_br_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram99 gnd gnd n_bl_99 gnd n_br_99 gnd vdd gnd memorycell
Xwire100 n_bl_99 n_bl_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer100 n_br_99 n_br_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram100 gnd gnd n_bl_100 gnd n_br_100 gnd vdd gnd memorycell
Xwire101 n_bl_100 n_bl_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer101 n_br_100 n_br_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram101 gnd gnd n_bl_101 gnd n_br_101 gnd vdd gnd memorycell
Xwire102 n_bl_101 n_bl_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer102 n_br_101 n_br_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram102 gnd gnd n_bl_102 gnd n_br_102 gnd vdd gnd memorycell
Xwire103 n_bl_102 n_bl_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer103 n_br_102 n_br_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram103 gnd gnd n_bl_103 gnd n_br_103 gnd vdd gnd memorycell
Xwire104 n_bl_103 n_bl_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer104 n_br_103 n_br_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram104 gnd gnd n_bl_104 gnd n_br_104 gnd vdd gnd memorycell
Xwire105 n_bl_104 n_bl_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer105 n_br_104 n_br_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram105 gnd gnd n_bl_105 gnd n_br_105 gnd vdd gnd memorycell
Xwire106 n_bl_105 n_bl_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer106 n_br_105 n_br_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram106 gnd gnd n_bl_106 gnd n_br_106 gnd vdd gnd memorycell
Xwire107 n_bl_106 n_bl_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer107 n_br_106 n_br_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram107 gnd gnd n_bl_107 gnd n_br_107 gnd vdd gnd memorycell
Xwire108 n_bl_107 n_bl_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer108 n_br_107 n_br_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram108 gnd gnd n_bl_108 gnd n_br_108 gnd vdd gnd memorycell
Xwire109 n_bl_108 n_bl_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer109 n_br_108 n_br_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram109 gnd gnd n_bl_109 gnd n_br_109 gnd vdd gnd memorycell
Xwire110 n_bl_109 n_bl_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer110 n_br_109 n_br_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram110 gnd gnd n_bl_110 gnd n_br_110 gnd vdd gnd memorycell
Xwire111 n_bl_110 n_bl_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer111 n_br_110 n_br_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram111 gnd gnd n_bl_111 gnd n_br_111 gnd vdd gnd memorycell
Xwire112 n_bl_111 n_bl_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer112 n_br_111 n_br_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram112 gnd gnd n_bl_112 gnd n_br_112 gnd vdd gnd memorycell
Xwire113 n_bl_112 n_bl_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer113 n_br_112 n_br_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram113 gnd gnd n_bl_113 gnd n_br_113 gnd vdd gnd memorycell
Xwire114 n_bl_113 n_bl_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer114 n_br_113 n_br_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram114 gnd gnd n_bl_114 gnd n_br_114 gnd vdd gnd memorycell
Xwire115 n_bl_114 n_bl_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer115 n_br_114 n_br_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram115 gnd gnd n_bl_115 gnd n_br_115 gnd vdd gnd memorycell
Xwire116 n_bl_115 n_bl_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer116 n_br_115 n_br_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram116 gnd gnd n_bl_116 gnd n_br_116 gnd vdd gnd memorycell
Xwire117 n_bl_116 n_bl_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer117 n_br_116 n_br_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram117 gnd gnd n_bl_117 gnd n_br_117 gnd vdd gnd memorycell
Xwire118 n_bl_117 n_bl_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer118 n_br_117 n_br_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram118 gnd gnd n_bl_118 gnd n_br_118 gnd vdd gnd memorycell
Xwire119 n_bl_118 n_bl_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer119 n_br_118 n_br_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram119 gnd gnd n_bl_119 gnd n_br_119 gnd vdd gnd memorycell
Xwire120 n_bl_119 n_bl_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer120 n_br_119 n_br_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram120 gnd gnd n_bl_120 gnd n_br_120 gnd vdd gnd memorycell
Xwire121 n_bl_120 n_bl_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer121 n_br_120 n_br_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram121 gnd gnd n_bl_121 gnd n_br_121 gnd vdd gnd memorycell
Xwire122 n_bl_121 n_bl_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer122 n_br_121 n_br_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram122 gnd gnd n_bl_122 gnd n_br_122 gnd vdd gnd memorycell
Xwire123 n_bl_122 n_bl_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer123 n_br_122 n_br_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram123 gnd gnd n_bl_123 gnd n_br_123 gnd vdd gnd memorycell
Xwire124 n_bl_123 n_bl_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer124 n_br_123 n_br_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram124 gnd gnd n_bl_124 gnd n_br_124 gnd vdd gnd memorycell
Xwire125 n_bl_124 n_bl_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer125 n_br_124 n_br_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram125 gnd gnd n_bl_125 gnd n_br_125 gnd vdd gnd memorycell
Xwire126 n_bl_125 n_bl_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer126 n_br_125 n_br_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram126 gnd gnd n_bl_126 gnd n_br_126 gnd vdd gnd memorycell
Xwire127 n_bl_126 n_bl_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer127 n_br_126 n_br_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram127 gnd gnd n_bl_127 gnd n_br_127 gnd vdd gnd memorycell
Xwire128 n_bl_127 n_bl_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer128 n_br_127 n_br_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram128 gnd gnd n_bl_128 gnd n_br_128 gnd vdd gnd memorycell
xtgate1 n_bl_128 tgate_l vdd_lp gnd vdd_lp gnd RAM_tgate_lp
xtgater n_br_128 tgate_r vdd_lp gnd vdd_lp gnd RAM_tgate_lp
xwrite gnd gnd tgate_l tgate_r vdd_lp gnd writedriver
xsamp1 gnd tgate_l tgate_r n_samp_out vdd_lp gnd samp1
.IC V(n_bl_0) = 0
.IC V(n_br_0) = 'supply_v_lp'
.IC V(tgate_r) = 'supply_v_lp'
.END