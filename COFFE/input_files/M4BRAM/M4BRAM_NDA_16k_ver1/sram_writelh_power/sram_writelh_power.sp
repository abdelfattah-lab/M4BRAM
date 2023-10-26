.TITLE SRAM write power measurement circuit 

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.TRAN 1p '4 * ram_frequency' SWEEP DATA=sweep_data
.OPTIONS BRIEF=1

* Input signal
Vprecharge n_precharge gnd PULSE (supply_v_lp 0 0 50p 50p 'precharge_max' 'ram_frequency')
Vdatain n_data_in gnd PULSE (supply_v_lp 0 0 0 0 'ram_frequency' ' 2 * ram_frequency')
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_selected vdd_selected gnd supply_v_lp

V_unselected vdd_unselected gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current_selected INTEGRAL I(V_selected) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_selected PARAM = '-(meas_current_selected/(4 * ram_frequency)) * supply_v_lp'

.MEASURE TRAN meas_current_unselected INTEGRAL I(V_unselected) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_unselected PARAM = '-(meas_current_unselected/(4 * ram_frequency)) * supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xsamp1 vdd_lp tgate_l tgate_r n_hang_samp vdd_selected gnd samp1
xwrite n_precharge n_data_in tgate_l tgate_r vdd_selected gnd writedriver
xtgate1 n_bl_0 tgate_l vdd_lp gnd vdd_selected gnd RAM_tgate
xtgater n_br_0 tgate_r vdd_lp gnd vdd_selected gnd RAM_tgate
xprecharge n_precharge n_bl_0 n_br_0 vdd_selected gnd precharge
xtgatel_0 n_bl0_0 tgate_l gnd vdd_lp vdd_unselected gnd RAM_tgate
xtgater_0 n_br0_0 tgate_r gnd vdd_lp vdd_unselected gnd RAM_tgate
xprecharge0 n_precharge n_bl0_0 n_br0_0 vdd_unselected gnd precharge
xtgatel_1 n_bl1_0 tgate_l gnd vdd_lp vdd_unselected gnd RAM_tgate
xtgater_1 n_br1_0 tgate_r gnd vdd_lp vdd_unselected gnd RAM_tgate
xprecharge1 n_precharge n_bl1_0 n_br1_0 vdd_unselected gnd precharge
xtgatel_2 n_bl2_0 tgate_l gnd vdd_lp vdd_unselected gnd RAM_tgate
xtgater_2 n_br2_0 tgate_r gnd vdd_lp vdd_unselected gnd RAM_tgate
xprecharge2 n_precharge n_bl2_0 n_br2_0 vdd_unselected gnd precharge
Xwirel0 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer0 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram0 gnd gnd n_bl_1 gnd n_br_1 gnd vdd_selected gnd memorycell
Xwirel1 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer1 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram1 gnd gnd n_bl_2 gnd n_br_2 gnd vdd_selected gnd memorycell
Xwirel2 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer2 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram2 gnd gnd n_bl_3 gnd n_br_3 gnd vdd_selected gnd memorycell
Xwirel3 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer3 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram3 gnd gnd n_bl_4 gnd n_br_4 gnd vdd_selected gnd memorycell
Xwirel4 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer4 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram4 gnd gnd n_bl_5 gnd n_br_5 gnd vdd_selected gnd memorycell
Xwirel5 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer5 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram5 gnd gnd n_bl_6 gnd n_br_6 gnd vdd_selected gnd memorycell
Xwirel6 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer6 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram6 gnd gnd n_bl_7 gnd n_br_7 gnd vdd_selected gnd memorycell
Xwirel7 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer7 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram7 gnd gnd n_bl_8 gnd n_br_8 gnd vdd_selected gnd memorycell
Xwirel8 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer8 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram8 gnd gnd n_bl_9 gnd n_br_9 gnd vdd_selected gnd memorycell
Xwirel9 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer9 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram9 gnd gnd n_bl_10 gnd n_br_10 gnd vdd_selected gnd memorycell
Xwirel10 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer10 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram10 gnd gnd n_bl_11 gnd n_br_11 gnd vdd_selected gnd memorycell
Xwirel11 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer11 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram11 gnd gnd n_bl_12 gnd n_br_12 gnd vdd_selected gnd memorycell
Xwirel12 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer12 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram12 gnd gnd n_bl_13 gnd n_br_13 gnd vdd_selected gnd memorycell
Xwirel13 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer13 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram13 gnd gnd n_bl_14 gnd n_br_14 gnd vdd_selected gnd memorycell
Xwirel14 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer14 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram14 gnd gnd n_bl_15 gnd n_br_15 gnd vdd_selected gnd memorycell
Xwirel15 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer15 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram15 gnd gnd n_bl_16 gnd n_br_16 gnd vdd_selected gnd memorycell
Xwirel16 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer16 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram16 gnd gnd n_bl_17 gnd n_br_17 gnd vdd_selected gnd memorycell
Xwirel17 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer17 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram17 gnd gnd n_bl_18 gnd n_br_18 gnd vdd_selected gnd memorycell
Xwirel18 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer18 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram18 gnd gnd n_bl_19 gnd n_br_19 gnd vdd_selected gnd memorycell
Xwirel19 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer19 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram19 gnd gnd n_bl_20 gnd n_br_20 gnd vdd_selected gnd memorycell
Xwirel20 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer20 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram20 gnd gnd n_bl_21 gnd n_br_21 gnd vdd_selected gnd memorycell
Xwirel21 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer21 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram21 gnd gnd n_bl_22 gnd n_br_22 gnd vdd_selected gnd memorycell
Xwirel22 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer22 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram22 gnd gnd n_bl_23 gnd n_br_23 gnd vdd_selected gnd memorycell
Xwirel23 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer23 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram23 gnd gnd n_bl_24 gnd n_br_24 gnd vdd_selected gnd memorycell
Xwirel24 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer24 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram24 gnd gnd n_bl_25 gnd n_br_25 gnd vdd_selected gnd memorycell
Xwirel25 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer25 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram25 gnd gnd n_bl_26 gnd n_br_26 gnd vdd_selected gnd memorycell
Xwirel26 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer26 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram26 gnd gnd n_bl_27 gnd n_br_27 gnd vdd_selected gnd memorycell
Xwirel27 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer27 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram27 gnd gnd n_bl_28 gnd n_br_28 gnd vdd_selected gnd memorycell
Xwirel28 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer28 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram28 gnd gnd n_bl_29 gnd n_br_29 gnd vdd_selected gnd memorycell
Xwirel29 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer29 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram29 gnd gnd n_bl_30 gnd n_br_30 gnd vdd_selected gnd memorycell
Xwirel30 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer30 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram30 gnd gnd n_bl_31 gnd n_br_31 gnd vdd_selected gnd memorycell
Xwirel31 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer31 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram31 gnd gnd n_bl_32 gnd n_br_32 gnd vdd_selected gnd memorycell
Xwirel32 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer32 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram32 gnd gnd n_bl_33 gnd n_br_33 gnd vdd_selected gnd memorycell
Xwirel33 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer33 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram33 gnd gnd n_bl_34 gnd n_br_34 gnd vdd_selected gnd memorycell
Xwirel34 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer34 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram34 gnd gnd n_bl_35 gnd n_br_35 gnd vdd_selected gnd memorycell
Xwirel35 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer35 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram35 gnd gnd n_bl_36 gnd n_br_36 gnd vdd_selected gnd memorycell
Xwirel36 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer36 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram36 gnd gnd n_bl_37 gnd n_br_37 gnd vdd_selected gnd memorycell
Xwirel37 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer37 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram37 gnd gnd n_bl_38 gnd n_br_38 gnd vdd_selected gnd memorycell
Xwirel38 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer38 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram38 gnd gnd n_bl_39 gnd n_br_39 gnd vdd_selected gnd memorycell
Xwirel39 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer39 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram39 gnd gnd n_bl_40 gnd n_br_40 gnd vdd_selected gnd memorycell
Xwirel40 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer40 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram40 gnd gnd n_bl_41 gnd n_br_41 gnd vdd_selected gnd memorycell
Xwirel41 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer41 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram41 gnd gnd n_bl_42 gnd n_br_42 gnd vdd_selected gnd memorycell
Xwirel42 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer42 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram42 gnd gnd n_bl_43 gnd n_br_43 gnd vdd_selected gnd memorycell
Xwirel43 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer43 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram43 gnd gnd n_bl_44 gnd n_br_44 gnd vdd_selected gnd memorycell
Xwirel44 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer44 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram44 gnd gnd n_bl_45 gnd n_br_45 gnd vdd_selected gnd memorycell
Xwirel45 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer45 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram45 gnd gnd n_bl_46 gnd n_br_46 gnd vdd_selected gnd memorycell
Xwirel46 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer46 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram46 gnd gnd n_bl_47 gnd n_br_47 gnd vdd_selected gnd memorycell
Xwirel47 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer47 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram47 gnd gnd n_bl_48 gnd n_br_48 gnd vdd_selected gnd memorycell
Xwirel48 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer48 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram48 gnd gnd n_bl_49 gnd n_br_49 gnd vdd_selected gnd memorycell
Xwirel49 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer49 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram49 gnd gnd n_bl_50 gnd n_br_50 gnd vdd_selected gnd memorycell
Xwirel50 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer50 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram50 gnd gnd n_bl_51 gnd n_br_51 gnd vdd_selected gnd memorycell
Xwirel51 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer51 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram51 gnd gnd n_bl_52 gnd n_br_52 gnd vdd_selected gnd memorycell
Xwirel52 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer52 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram52 gnd gnd n_bl_53 gnd n_br_53 gnd vdd_selected gnd memorycell
Xwirel53 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer53 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram53 gnd gnd n_bl_54 gnd n_br_54 gnd vdd_selected gnd memorycell
Xwirel54 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer54 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram54 gnd gnd n_bl_55 gnd n_br_55 gnd vdd_selected gnd memorycell
Xwirel55 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer55 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram55 gnd gnd n_bl_56 gnd n_br_56 gnd vdd_selected gnd memorycell
Xwirel56 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer56 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram56 gnd gnd n_bl_57 gnd n_br_57 gnd vdd_selected gnd memorycell
Xwirel57 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer57 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram57 gnd gnd n_bl_58 gnd n_br_58 gnd vdd_selected gnd memorycell
Xwirel58 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer58 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram58 gnd gnd n_bl_59 gnd n_br_59 gnd vdd_selected gnd memorycell
Xwirel59 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer59 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram59 gnd gnd n_bl_60 gnd n_br_60 gnd vdd_selected gnd memorycell
Xwirel60 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer60 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram60 gnd gnd n_bl_61 gnd n_br_61 gnd vdd_selected gnd memorycell
Xwirel61 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer61 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram61 gnd gnd n_bl_62 gnd n_br_62 gnd vdd_selected gnd memorycell
Xwirel62 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer62 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram62 gnd gnd n_bl_63 gnd n_br_63 gnd vdd_selected gnd memorycell
Xwirel63 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer63 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram63 gnd gnd n_bl_64 gnd n_br_64 gnd vdd_selected gnd memorycell
Xwirel64 n_bl_64 n_bl_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer64 n_br_64 n_br_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram64 gnd gnd n_bl_65 gnd n_br_65 gnd vdd_selected gnd memorycell
Xwirel65 n_bl_65 n_bl_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer65 n_br_65 n_br_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram65 gnd gnd n_bl_66 gnd n_br_66 gnd vdd_selected gnd memorycell
Xwirel66 n_bl_66 n_bl_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer66 n_br_66 n_br_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram66 gnd gnd n_bl_67 gnd n_br_67 gnd vdd_selected gnd memorycell
Xwirel67 n_bl_67 n_bl_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer67 n_br_67 n_br_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram67 gnd gnd n_bl_68 gnd n_br_68 gnd vdd_selected gnd memorycell
Xwirel68 n_bl_68 n_bl_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer68 n_br_68 n_br_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram68 gnd gnd n_bl_69 gnd n_br_69 gnd vdd_selected gnd memorycell
Xwirel69 n_bl_69 n_bl_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer69 n_br_69 n_br_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram69 gnd gnd n_bl_70 gnd n_br_70 gnd vdd_selected gnd memorycell
Xwirel70 n_bl_70 n_bl_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer70 n_br_70 n_br_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram70 gnd gnd n_bl_71 gnd n_br_71 gnd vdd_selected gnd memorycell
Xwirel71 n_bl_71 n_bl_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer71 n_br_71 n_br_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram71 gnd gnd n_bl_72 gnd n_br_72 gnd vdd_selected gnd memorycell
Xwirel72 n_bl_72 n_bl_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer72 n_br_72 n_br_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram72 gnd gnd n_bl_73 gnd n_br_73 gnd vdd_selected gnd memorycell
Xwirel73 n_bl_73 n_bl_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer73 n_br_73 n_br_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram73 gnd gnd n_bl_74 gnd n_br_74 gnd vdd_selected gnd memorycell
Xwirel74 n_bl_74 n_bl_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer74 n_br_74 n_br_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram74 gnd gnd n_bl_75 gnd n_br_75 gnd vdd_selected gnd memorycell
Xwirel75 n_bl_75 n_bl_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer75 n_br_75 n_br_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram75 gnd gnd n_bl_76 gnd n_br_76 gnd vdd_selected gnd memorycell
Xwirel76 n_bl_76 n_bl_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer76 n_br_76 n_br_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram76 gnd gnd n_bl_77 gnd n_br_77 gnd vdd_selected gnd memorycell
Xwirel77 n_bl_77 n_bl_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer77 n_br_77 n_br_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram77 gnd gnd n_bl_78 gnd n_br_78 gnd vdd_selected gnd memorycell
Xwirel78 n_bl_78 n_bl_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer78 n_br_78 n_br_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram78 gnd gnd n_bl_79 gnd n_br_79 gnd vdd_selected gnd memorycell
Xwirel79 n_bl_79 n_bl_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer79 n_br_79 n_br_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram79 gnd gnd n_bl_80 gnd n_br_80 gnd vdd_selected gnd memorycell
Xwirel80 n_bl_80 n_bl_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer80 n_br_80 n_br_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram80 gnd gnd n_bl_81 gnd n_br_81 gnd vdd_selected gnd memorycell
Xwirel81 n_bl_81 n_bl_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer81 n_br_81 n_br_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram81 gnd gnd n_bl_82 gnd n_br_82 gnd vdd_selected gnd memorycell
Xwirel82 n_bl_82 n_bl_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer82 n_br_82 n_br_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram82 gnd gnd n_bl_83 gnd n_br_83 gnd vdd_selected gnd memorycell
Xwirel83 n_bl_83 n_bl_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer83 n_br_83 n_br_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram83 gnd gnd n_bl_84 gnd n_br_84 gnd vdd_selected gnd memorycell
Xwirel84 n_bl_84 n_bl_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer84 n_br_84 n_br_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram84 gnd gnd n_bl_85 gnd n_br_85 gnd vdd_selected gnd memorycell
Xwirel85 n_bl_85 n_bl_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer85 n_br_85 n_br_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram85 gnd gnd n_bl_86 gnd n_br_86 gnd vdd_selected gnd memorycell
Xwirel86 n_bl_86 n_bl_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer86 n_br_86 n_br_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram86 gnd gnd n_bl_87 gnd n_br_87 gnd vdd_selected gnd memorycell
Xwirel87 n_bl_87 n_bl_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer87 n_br_87 n_br_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram87 gnd gnd n_bl_88 gnd n_br_88 gnd vdd_selected gnd memorycell
Xwirel88 n_bl_88 n_bl_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer88 n_br_88 n_br_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram88 gnd gnd n_bl_89 gnd n_br_89 gnd vdd_selected gnd memorycell
Xwirel89 n_bl_89 n_bl_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer89 n_br_89 n_br_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram89 gnd gnd n_bl_90 gnd n_br_90 gnd vdd_selected gnd memorycell
Xwirel90 n_bl_90 n_bl_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer90 n_br_90 n_br_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram90 gnd gnd n_bl_91 gnd n_br_91 gnd vdd_selected gnd memorycell
Xwirel91 n_bl_91 n_bl_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer91 n_br_91 n_br_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram91 gnd gnd n_bl_92 gnd n_br_92 gnd vdd_selected gnd memorycell
Xwirel92 n_bl_92 n_bl_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer92 n_br_92 n_br_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram92 gnd gnd n_bl_93 gnd n_br_93 gnd vdd_selected gnd memorycell
Xwirel93 n_bl_93 n_bl_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer93 n_br_93 n_br_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram93 gnd gnd n_bl_94 gnd n_br_94 gnd vdd_selected gnd memorycell
Xwirel94 n_bl_94 n_bl_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer94 n_br_94 n_br_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram94 gnd gnd n_bl_95 gnd n_br_95 gnd vdd_selected gnd memorycell
Xwirel95 n_bl_95 n_bl_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer95 n_br_95 n_br_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram95 gnd gnd n_bl_96 gnd n_br_96 gnd vdd_selected gnd memorycell
Xwirel96 n_bl_96 n_bl_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer96 n_br_96 n_br_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram96 gnd gnd n_bl_97 gnd n_br_97 gnd vdd_selected gnd memorycell
Xwirel97 n_bl_97 n_bl_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer97 n_br_97 n_br_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram97 gnd gnd n_bl_98 gnd n_br_98 gnd vdd_selected gnd memorycell
Xwirel98 n_bl_98 n_bl_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer98 n_br_98 n_br_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram98 gnd gnd n_bl_99 gnd n_br_99 gnd vdd_selected gnd memorycell
Xwirel99 n_bl_99 n_bl_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer99 n_br_99 n_br_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram99 gnd gnd n_bl_100 gnd n_br_100 gnd vdd_selected gnd memorycell
Xwirel100 n_bl_100 n_bl_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer100 n_br_100 n_br_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram100 gnd gnd n_bl_101 gnd n_br_101 gnd vdd_selected gnd memorycell
Xwirel101 n_bl_101 n_bl_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer101 n_br_101 n_br_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram101 gnd gnd n_bl_102 gnd n_br_102 gnd vdd_selected gnd memorycell
Xwirel102 n_bl_102 n_bl_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer102 n_br_102 n_br_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram102 gnd gnd n_bl_103 gnd n_br_103 gnd vdd_selected gnd memorycell
Xwirel103 n_bl_103 n_bl_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer103 n_br_103 n_br_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram103 gnd gnd n_bl_104 gnd n_br_104 gnd vdd_selected gnd memorycell
Xwirel104 n_bl_104 n_bl_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer104 n_br_104 n_br_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram104 gnd gnd n_bl_105 gnd n_br_105 gnd vdd_selected gnd memorycell
Xwirel105 n_bl_105 n_bl_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer105 n_br_105 n_br_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram105 gnd gnd n_bl_106 gnd n_br_106 gnd vdd_selected gnd memorycell
Xwirel106 n_bl_106 n_bl_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer106 n_br_106 n_br_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram106 gnd gnd n_bl_107 gnd n_br_107 gnd vdd_selected gnd memorycell
Xwirel107 n_bl_107 n_bl_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer107 n_br_107 n_br_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram107 gnd gnd n_bl_108 gnd n_br_108 gnd vdd_selected gnd memorycell
Xwirel108 n_bl_108 n_bl_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer108 n_br_108 n_br_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram108 gnd gnd n_bl_109 gnd n_br_109 gnd vdd_selected gnd memorycell
Xwirel109 n_bl_109 n_bl_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer109 n_br_109 n_br_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram109 gnd gnd n_bl_110 gnd n_br_110 gnd vdd_selected gnd memorycell
Xwirel110 n_bl_110 n_bl_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer110 n_br_110 n_br_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram110 gnd gnd n_bl_111 gnd n_br_111 gnd vdd_selected gnd memorycell
Xwirel111 n_bl_111 n_bl_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer111 n_br_111 n_br_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram111 gnd gnd n_bl_112 gnd n_br_112 gnd vdd_selected gnd memorycell
Xwirel112 n_bl_112 n_bl_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer112 n_br_112 n_br_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram112 gnd gnd n_bl_113 gnd n_br_113 gnd vdd_selected gnd memorycell
Xwirel113 n_bl_113 n_bl_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer113 n_br_113 n_br_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram113 gnd gnd n_bl_114 gnd n_br_114 gnd vdd_selected gnd memorycell
Xwirel114 n_bl_114 n_bl_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer114 n_br_114 n_br_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram114 gnd gnd n_bl_115 gnd n_br_115 gnd vdd_selected gnd memorycell
Xwirel115 n_bl_115 n_bl_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer115 n_br_115 n_br_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram115 gnd gnd n_bl_116 gnd n_br_116 gnd vdd_selected gnd memorycell
Xwirel116 n_bl_116 n_bl_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer116 n_br_116 n_br_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram116 gnd gnd n_bl_117 gnd n_br_117 gnd vdd_selected gnd memorycell
Xwirel117 n_bl_117 n_bl_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer117 n_br_117 n_br_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram117 gnd gnd n_bl_118 gnd n_br_118 gnd vdd_selected gnd memorycell
Xwirel118 n_bl_118 n_bl_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer118 n_br_118 n_br_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram118 gnd gnd n_bl_119 gnd n_br_119 gnd vdd_selected gnd memorycell
Xwirel119 n_bl_119 n_bl_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer119 n_br_119 n_br_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram119 gnd gnd n_bl_120 gnd n_br_120 gnd vdd_selected gnd memorycell
Xwirel120 n_bl_120 n_bl_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer120 n_br_120 n_br_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram120 gnd gnd n_bl_121 gnd n_br_121 gnd vdd_selected gnd memorycell
Xwirel121 n_bl_121 n_bl_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer121 n_br_121 n_br_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram121 gnd gnd n_bl_122 gnd n_br_122 gnd vdd_selected gnd memorycell
Xwirel122 n_bl_122 n_bl_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer122 n_br_122 n_br_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram122 gnd gnd n_bl_123 gnd n_br_123 gnd vdd_selected gnd memorycell
Xwirel123 n_bl_123 n_bl_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer123 n_br_123 n_br_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram123 gnd gnd n_bl_124 gnd n_br_124 gnd vdd_selected gnd memorycell
Xwirel124 n_bl_124 n_bl_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer124 n_br_124 n_br_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram124 gnd gnd n_bl_125 gnd n_br_125 gnd vdd_selected gnd memorycell
Xwirel125 n_bl_125 n_bl_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer125 n_br_125 n_br_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram125 gnd gnd n_bl_126 gnd n_br_126 gnd vdd_selected gnd memorycell
Xwirel126 n_bl_126 n_bl_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer126 n_br_126 n_br_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram126 gnd gnd n_bl_127 gnd n_br_127 gnd vdd_selected gnd memorycell
Xwirel127 n_bl_127 n_bl_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwirer127 n_br_127 n_br_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram127 n_precharge gnd n_bl_128 gnd n_br_128 gnd vdd_selected gnd memorycell
Xwire0l0 n_bl0_0 n_bl0_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r0 n_br0_0 n_br0_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_0 gnd gnd n_bl0_1 gnd n_br0_1 gnd vdd_unselected gnd memorycell
Xwire0l1 n_bl0_1 n_bl0_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r1 n_br0_1 n_br0_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_1 gnd gnd n_bl0_2 gnd n_br0_2 gnd vdd_unselected gnd memorycell
Xwire0l2 n_bl0_2 n_bl0_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r2 n_br0_2 n_br0_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_2 gnd gnd n_bl0_3 gnd n_br0_3 gnd vdd_unselected gnd memorycell
Xwire0l3 n_bl0_3 n_bl0_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r3 n_br0_3 n_br0_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_3 gnd gnd n_bl0_4 gnd n_br0_4 gnd vdd_unselected gnd memorycell
Xwire0l4 n_bl0_4 n_bl0_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r4 n_br0_4 n_br0_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_4 gnd gnd n_bl0_5 gnd n_br0_5 gnd vdd_unselected gnd memorycell
Xwire0l5 n_bl0_5 n_bl0_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r5 n_br0_5 n_br0_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_5 gnd gnd n_bl0_6 gnd n_br0_6 gnd vdd_unselected gnd memorycell
Xwire0l6 n_bl0_6 n_bl0_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r6 n_br0_6 n_br0_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_6 gnd gnd n_bl0_7 gnd n_br0_7 gnd vdd_unselected gnd memorycell
Xwire0l7 n_bl0_7 n_bl0_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r7 n_br0_7 n_br0_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_7 gnd gnd n_bl0_8 gnd n_br0_8 gnd vdd_unselected gnd memorycell
Xwire0l8 n_bl0_8 n_bl0_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r8 n_br0_8 n_br0_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_8 gnd gnd n_bl0_9 gnd n_br0_9 gnd vdd_unselected gnd memorycell
Xwire0l9 n_bl0_9 n_bl0_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r9 n_br0_9 n_br0_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_9 gnd gnd n_bl0_10 gnd n_br0_10 gnd vdd_unselected gnd memorycell
Xwire0l10 n_bl0_10 n_bl0_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r10 n_br0_10 n_br0_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_10 gnd gnd n_bl0_11 gnd n_br0_11 gnd vdd_unselected gnd memorycell
Xwire0l11 n_bl0_11 n_bl0_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r11 n_br0_11 n_br0_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_11 gnd gnd n_bl0_12 gnd n_br0_12 gnd vdd_unselected gnd memorycell
Xwire0l12 n_bl0_12 n_bl0_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r12 n_br0_12 n_br0_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_12 gnd gnd n_bl0_13 gnd n_br0_13 gnd vdd_unselected gnd memorycell
Xwire0l13 n_bl0_13 n_bl0_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r13 n_br0_13 n_br0_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_13 gnd gnd n_bl0_14 gnd n_br0_14 gnd vdd_unselected gnd memorycell
Xwire0l14 n_bl0_14 n_bl0_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r14 n_br0_14 n_br0_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_14 gnd gnd n_bl0_15 gnd n_br0_15 gnd vdd_unselected gnd memorycell
Xwire0l15 n_bl0_15 n_bl0_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r15 n_br0_15 n_br0_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_15 gnd gnd n_bl0_16 gnd n_br0_16 gnd vdd_unselected gnd memorycell
Xwire0l16 n_bl0_16 n_bl0_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r16 n_br0_16 n_br0_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_16 gnd gnd n_bl0_17 gnd n_br0_17 gnd vdd_unselected gnd memorycell
Xwire0l17 n_bl0_17 n_bl0_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r17 n_br0_17 n_br0_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_17 gnd gnd n_bl0_18 gnd n_br0_18 gnd vdd_unselected gnd memorycell
Xwire0l18 n_bl0_18 n_bl0_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r18 n_br0_18 n_br0_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_18 gnd gnd n_bl0_19 gnd n_br0_19 gnd vdd_unselected gnd memorycell
Xwire0l19 n_bl0_19 n_bl0_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r19 n_br0_19 n_br0_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_19 gnd gnd n_bl0_20 gnd n_br0_20 gnd vdd_unselected gnd memorycell
Xwire0l20 n_bl0_20 n_bl0_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r20 n_br0_20 n_br0_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_20 gnd gnd n_bl0_21 gnd n_br0_21 gnd vdd_unselected gnd memorycell
Xwire0l21 n_bl0_21 n_bl0_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r21 n_br0_21 n_br0_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_21 gnd gnd n_bl0_22 gnd n_br0_22 gnd vdd_unselected gnd memorycell
Xwire0l22 n_bl0_22 n_bl0_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r22 n_br0_22 n_br0_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_22 gnd gnd n_bl0_23 gnd n_br0_23 gnd vdd_unselected gnd memorycell
Xwire0l23 n_bl0_23 n_bl0_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r23 n_br0_23 n_br0_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_23 gnd gnd n_bl0_24 gnd n_br0_24 gnd vdd_unselected gnd memorycell
Xwire0l24 n_bl0_24 n_bl0_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r24 n_br0_24 n_br0_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_24 gnd gnd n_bl0_25 gnd n_br0_25 gnd vdd_unselected gnd memorycell
Xwire0l25 n_bl0_25 n_bl0_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r25 n_br0_25 n_br0_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_25 gnd gnd n_bl0_26 gnd n_br0_26 gnd vdd_unselected gnd memorycell
Xwire0l26 n_bl0_26 n_bl0_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r26 n_br0_26 n_br0_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_26 gnd gnd n_bl0_27 gnd n_br0_27 gnd vdd_unselected gnd memorycell
Xwire0l27 n_bl0_27 n_bl0_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r27 n_br0_27 n_br0_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_27 gnd gnd n_bl0_28 gnd n_br0_28 gnd vdd_unselected gnd memorycell
Xwire0l28 n_bl0_28 n_bl0_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r28 n_br0_28 n_br0_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_28 gnd gnd n_bl0_29 gnd n_br0_29 gnd vdd_unselected gnd memorycell
Xwire0l29 n_bl0_29 n_bl0_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r29 n_br0_29 n_br0_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_29 gnd gnd n_bl0_30 gnd n_br0_30 gnd vdd_unselected gnd memorycell
Xwire0l30 n_bl0_30 n_bl0_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r30 n_br0_30 n_br0_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_30 gnd gnd n_bl0_31 gnd n_br0_31 gnd vdd_unselected gnd memorycell
Xwire0l31 n_bl0_31 n_bl0_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r31 n_br0_31 n_br0_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_31 gnd gnd n_bl0_32 gnd n_br0_32 gnd vdd_unselected gnd memorycell
Xwire0l32 n_bl0_32 n_bl0_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r32 n_br0_32 n_br0_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_32 gnd gnd n_bl0_33 gnd n_br0_33 gnd vdd_unselected gnd memorycell
Xwire0l33 n_bl0_33 n_bl0_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r33 n_br0_33 n_br0_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_33 gnd gnd n_bl0_34 gnd n_br0_34 gnd vdd_unselected gnd memorycell
Xwire0l34 n_bl0_34 n_bl0_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r34 n_br0_34 n_br0_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_34 gnd gnd n_bl0_35 gnd n_br0_35 gnd vdd_unselected gnd memorycell
Xwire0l35 n_bl0_35 n_bl0_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r35 n_br0_35 n_br0_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_35 gnd gnd n_bl0_36 gnd n_br0_36 gnd vdd_unselected gnd memorycell
Xwire0l36 n_bl0_36 n_bl0_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r36 n_br0_36 n_br0_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_36 gnd gnd n_bl0_37 gnd n_br0_37 gnd vdd_unselected gnd memorycell
Xwire0l37 n_bl0_37 n_bl0_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r37 n_br0_37 n_br0_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_37 gnd gnd n_bl0_38 gnd n_br0_38 gnd vdd_unselected gnd memorycell
Xwire0l38 n_bl0_38 n_bl0_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r38 n_br0_38 n_br0_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_38 gnd gnd n_bl0_39 gnd n_br0_39 gnd vdd_unselected gnd memorycell
Xwire0l39 n_bl0_39 n_bl0_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r39 n_br0_39 n_br0_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_39 gnd gnd n_bl0_40 gnd n_br0_40 gnd vdd_unselected gnd memorycell
Xwire0l40 n_bl0_40 n_bl0_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r40 n_br0_40 n_br0_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_40 gnd gnd n_bl0_41 gnd n_br0_41 gnd vdd_unselected gnd memorycell
Xwire0l41 n_bl0_41 n_bl0_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r41 n_br0_41 n_br0_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_41 gnd gnd n_bl0_42 gnd n_br0_42 gnd vdd_unselected gnd memorycell
Xwire0l42 n_bl0_42 n_bl0_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r42 n_br0_42 n_br0_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_42 gnd gnd n_bl0_43 gnd n_br0_43 gnd vdd_unselected gnd memorycell
Xwire0l43 n_bl0_43 n_bl0_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r43 n_br0_43 n_br0_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_43 gnd gnd n_bl0_44 gnd n_br0_44 gnd vdd_unselected gnd memorycell
Xwire0l44 n_bl0_44 n_bl0_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r44 n_br0_44 n_br0_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_44 gnd gnd n_bl0_45 gnd n_br0_45 gnd vdd_unselected gnd memorycell
Xwire0l45 n_bl0_45 n_bl0_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r45 n_br0_45 n_br0_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_45 gnd gnd n_bl0_46 gnd n_br0_46 gnd vdd_unselected gnd memorycell
Xwire0l46 n_bl0_46 n_bl0_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r46 n_br0_46 n_br0_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_46 gnd gnd n_bl0_47 gnd n_br0_47 gnd vdd_unselected gnd memorycell
Xwire0l47 n_bl0_47 n_bl0_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r47 n_br0_47 n_br0_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_47 gnd gnd n_bl0_48 gnd n_br0_48 gnd vdd_unselected gnd memorycell
Xwire0l48 n_bl0_48 n_bl0_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r48 n_br0_48 n_br0_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_48 gnd gnd n_bl0_49 gnd n_br0_49 gnd vdd_unselected gnd memorycell
Xwire0l49 n_bl0_49 n_bl0_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r49 n_br0_49 n_br0_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_49 gnd gnd n_bl0_50 gnd n_br0_50 gnd vdd_unselected gnd memorycell
Xwire0l50 n_bl0_50 n_bl0_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r50 n_br0_50 n_br0_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_50 gnd gnd n_bl0_51 gnd n_br0_51 gnd vdd_unselected gnd memorycell
Xwire0l51 n_bl0_51 n_bl0_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r51 n_br0_51 n_br0_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_51 gnd gnd n_bl0_52 gnd n_br0_52 gnd vdd_unselected gnd memorycell
Xwire0l52 n_bl0_52 n_bl0_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r52 n_br0_52 n_br0_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_52 gnd gnd n_bl0_53 gnd n_br0_53 gnd vdd_unselected gnd memorycell
Xwire0l53 n_bl0_53 n_bl0_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r53 n_br0_53 n_br0_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_53 gnd gnd n_bl0_54 gnd n_br0_54 gnd vdd_unselected gnd memorycell
Xwire0l54 n_bl0_54 n_bl0_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r54 n_br0_54 n_br0_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_54 gnd gnd n_bl0_55 gnd n_br0_55 gnd vdd_unselected gnd memorycell
Xwire0l55 n_bl0_55 n_bl0_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r55 n_br0_55 n_br0_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_55 gnd gnd n_bl0_56 gnd n_br0_56 gnd vdd_unselected gnd memorycell
Xwire0l56 n_bl0_56 n_bl0_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r56 n_br0_56 n_br0_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_56 gnd gnd n_bl0_57 gnd n_br0_57 gnd vdd_unselected gnd memorycell
Xwire0l57 n_bl0_57 n_bl0_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r57 n_br0_57 n_br0_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_57 gnd gnd n_bl0_58 gnd n_br0_58 gnd vdd_unselected gnd memorycell
Xwire0l58 n_bl0_58 n_bl0_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r58 n_br0_58 n_br0_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_58 gnd gnd n_bl0_59 gnd n_br0_59 gnd vdd_unselected gnd memorycell
Xwire0l59 n_bl0_59 n_bl0_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r59 n_br0_59 n_br0_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_59 gnd gnd n_bl0_60 gnd n_br0_60 gnd vdd_unselected gnd memorycell
Xwire0l60 n_bl0_60 n_bl0_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r60 n_br0_60 n_br0_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_60 gnd gnd n_bl0_61 gnd n_br0_61 gnd vdd_unselected gnd memorycell
Xwire0l61 n_bl0_61 n_bl0_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r61 n_br0_61 n_br0_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_61 gnd gnd n_bl0_62 gnd n_br0_62 gnd vdd_unselected gnd memorycell
Xwire0l62 n_bl0_62 n_bl0_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r62 n_br0_62 n_br0_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_62 gnd gnd n_bl0_63 gnd n_br0_63 gnd vdd_unselected gnd memorycell
Xwire0l63 n_bl0_63 n_bl0_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r63 n_br0_63 n_br0_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_63 gnd gnd n_bl0_64 gnd n_br0_64 gnd vdd_unselected gnd memorycell
Xwire0l64 n_bl0_64 n_bl0_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r64 n_br0_64 n_br0_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_64 gnd gnd n_bl0_65 gnd n_br0_65 gnd vdd_unselected gnd memorycell
Xwire0l65 n_bl0_65 n_bl0_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r65 n_br0_65 n_br0_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_65 gnd gnd n_bl0_66 gnd n_br0_66 gnd vdd_unselected gnd memorycell
Xwire0l66 n_bl0_66 n_bl0_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r66 n_br0_66 n_br0_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_66 gnd gnd n_bl0_67 gnd n_br0_67 gnd vdd_unselected gnd memorycell
Xwire0l67 n_bl0_67 n_bl0_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r67 n_br0_67 n_br0_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_67 gnd gnd n_bl0_68 gnd n_br0_68 gnd vdd_unselected gnd memorycell
Xwire0l68 n_bl0_68 n_bl0_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r68 n_br0_68 n_br0_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_68 gnd gnd n_bl0_69 gnd n_br0_69 gnd vdd_unselected gnd memorycell
Xwire0l69 n_bl0_69 n_bl0_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r69 n_br0_69 n_br0_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_69 gnd gnd n_bl0_70 gnd n_br0_70 gnd vdd_unselected gnd memorycell
Xwire0l70 n_bl0_70 n_bl0_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r70 n_br0_70 n_br0_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_70 gnd gnd n_bl0_71 gnd n_br0_71 gnd vdd_unselected gnd memorycell
Xwire0l71 n_bl0_71 n_bl0_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r71 n_br0_71 n_br0_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_71 gnd gnd n_bl0_72 gnd n_br0_72 gnd vdd_unselected gnd memorycell
Xwire0l72 n_bl0_72 n_bl0_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r72 n_br0_72 n_br0_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_72 gnd gnd n_bl0_73 gnd n_br0_73 gnd vdd_unselected gnd memorycell
Xwire0l73 n_bl0_73 n_bl0_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r73 n_br0_73 n_br0_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_73 gnd gnd n_bl0_74 gnd n_br0_74 gnd vdd_unselected gnd memorycell
Xwire0l74 n_bl0_74 n_bl0_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r74 n_br0_74 n_br0_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_74 gnd gnd n_bl0_75 gnd n_br0_75 gnd vdd_unselected gnd memorycell
Xwire0l75 n_bl0_75 n_bl0_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r75 n_br0_75 n_br0_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_75 gnd gnd n_bl0_76 gnd n_br0_76 gnd vdd_unselected gnd memorycell
Xwire0l76 n_bl0_76 n_bl0_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r76 n_br0_76 n_br0_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_76 gnd gnd n_bl0_77 gnd n_br0_77 gnd vdd_unselected gnd memorycell
Xwire0l77 n_bl0_77 n_bl0_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r77 n_br0_77 n_br0_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_77 gnd gnd n_bl0_78 gnd n_br0_78 gnd vdd_unselected gnd memorycell
Xwire0l78 n_bl0_78 n_bl0_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r78 n_br0_78 n_br0_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_78 gnd gnd n_bl0_79 gnd n_br0_79 gnd vdd_unselected gnd memorycell
Xwire0l79 n_bl0_79 n_bl0_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r79 n_br0_79 n_br0_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_79 gnd gnd n_bl0_80 gnd n_br0_80 gnd vdd_unselected gnd memorycell
Xwire0l80 n_bl0_80 n_bl0_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r80 n_br0_80 n_br0_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_80 gnd gnd n_bl0_81 gnd n_br0_81 gnd vdd_unselected gnd memorycell
Xwire0l81 n_bl0_81 n_bl0_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r81 n_br0_81 n_br0_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_81 gnd gnd n_bl0_82 gnd n_br0_82 gnd vdd_unselected gnd memorycell
Xwire0l82 n_bl0_82 n_bl0_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r82 n_br0_82 n_br0_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_82 gnd gnd n_bl0_83 gnd n_br0_83 gnd vdd_unselected gnd memorycell
Xwire0l83 n_bl0_83 n_bl0_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r83 n_br0_83 n_br0_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_83 gnd gnd n_bl0_84 gnd n_br0_84 gnd vdd_unselected gnd memorycell
Xwire0l84 n_bl0_84 n_bl0_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r84 n_br0_84 n_br0_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_84 gnd gnd n_bl0_85 gnd n_br0_85 gnd vdd_unselected gnd memorycell
Xwire0l85 n_bl0_85 n_bl0_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r85 n_br0_85 n_br0_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_85 gnd gnd n_bl0_86 gnd n_br0_86 gnd vdd_unselected gnd memorycell
Xwire0l86 n_bl0_86 n_bl0_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r86 n_br0_86 n_br0_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_86 gnd gnd n_bl0_87 gnd n_br0_87 gnd vdd_unselected gnd memorycell
Xwire0l87 n_bl0_87 n_bl0_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r87 n_br0_87 n_br0_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_87 gnd gnd n_bl0_88 gnd n_br0_88 gnd vdd_unselected gnd memorycell
Xwire0l88 n_bl0_88 n_bl0_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r88 n_br0_88 n_br0_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_88 gnd gnd n_bl0_89 gnd n_br0_89 gnd vdd_unselected gnd memorycell
Xwire0l89 n_bl0_89 n_bl0_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r89 n_br0_89 n_br0_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_89 gnd gnd n_bl0_90 gnd n_br0_90 gnd vdd_unselected gnd memorycell
Xwire0l90 n_bl0_90 n_bl0_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r90 n_br0_90 n_br0_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_90 gnd gnd n_bl0_91 gnd n_br0_91 gnd vdd_unselected gnd memorycell
Xwire0l91 n_bl0_91 n_bl0_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r91 n_br0_91 n_br0_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_91 gnd gnd n_bl0_92 gnd n_br0_92 gnd vdd_unselected gnd memorycell
Xwire0l92 n_bl0_92 n_bl0_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r92 n_br0_92 n_br0_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_92 gnd gnd n_bl0_93 gnd n_br0_93 gnd vdd_unselected gnd memorycell
Xwire0l93 n_bl0_93 n_bl0_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r93 n_br0_93 n_br0_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_93 gnd gnd n_bl0_94 gnd n_br0_94 gnd vdd_unselected gnd memorycell
Xwire0l94 n_bl0_94 n_bl0_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r94 n_br0_94 n_br0_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_94 gnd gnd n_bl0_95 gnd n_br0_95 gnd vdd_unselected gnd memorycell
Xwire0l95 n_bl0_95 n_bl0_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r95 n_br0_95 n_br0_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_95 gnd gnd n_bl0_96 gnd n_br0_96 gnd vdd_unselected gnd memorycell
Xwire0l96 n_bl0_96 n_bl0_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r96 n_br0_96 n_br0_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_96 gnd gnd n_bl0_97 gnd n_br0_97 gnd vdd_unselected gnd memorycell
Xwire0l97 n_bl0_97 n_bl0_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r97 n_br0_97 n_br0_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_97 gnd gnd n_bl0_98 gnd n_br0_98 gnd vdd_unselected gnd memorycell
Xwire0l98 n_bl0_98 n_bl0_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r98 n_br0_98 n_br0_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_98 gnd gnd n_bl0_99 gnd n_br0_99 gnd vdd_unselected gnd memorycell
Xwire0l99 n_bl0_99 n_bl0_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r99 n_br0_99 n_br0_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_99 gnd gnd n_bl0_100 gnd n_br0_100 gnd vdd_unselected gnd memorycell
Xwire0l100 n_bl0_100 n_bl0_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r100 n_br0_100 n_br0_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_100 gnd gnd n_bl0_101 gnd n_br0_101 gnd vdd_unselected gnd memorycell
Xwire0l101 n_bl0_101 n_bl0_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r101 n_br0_101 n_br0_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_101 gnd gnd n_bl0_102 gnd n_br0_102 gnd vdd_unselected gnd memorycell
Xwire0l102 n_bl0_102 n_bl0_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r102 n_br0_102 n_br0_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_102 gnd gnd n_bl0_103 gnd n_br0_103 gnd vdd_unselected gnd memorycell
Xwire0l103 n_bl0_103 n_bl0_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r103 n_br0_103 n_br0_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_103 gnd gnd n_bl0_104 gnd n_br0_104 gnd vdd_unselected gnd memorycell
Xwire0l104 n_bl0_104 n_bl0_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r104 n_br0_104 n_br0_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_104 gnd gnd n_bl0_105 gnd n_br0_105 gnd vdd_unselected gnd memorycell
Xwire0l105 n_bl0_105 n_bl0_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r105 n_br0_105 n_br0_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_105 gnd gnd n_bl0_106 gnd n_br0_106 gnd vdd_unselected gnd memorycell
Xwire0l106 n_bl0_106 n_bl0_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r106 n_br0_106 n_br0_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_106 gnd gnd n_bl0_107 gnd n_br0_107 gnd vdd_unselected gnd memorycell
Xwire0l107 n_bl0_107 n_bl0_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r107 n_br0_107 n_br0_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_107 gnd gnd n_bl0_108 gnd n_br0_108 gnd vdd_unselected gnd memorycell
Xwire0l108 n_bl0_108 n_bl0_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r108 n_br0_108 n_br0_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_108 gnd gnd n_bl0_109 gnd n_br0_109 gnd vdd_unselected gnd memorycell
Xwire0l109 n_bl0_109 n_bl0_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r109 n_br0_109 n_br0_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_109 gnd gnd n_bl0_110 gnd n_br0_110 gnd vdd_unselected gnd memorycell
Xwire0l110 n_bl0_110 n_bl0_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r110 n_br0_110 n_br0_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_110 gnd gnd n_bl0_111 gnd n_br0_111 gnd vdd_unselected gnd memorycell
Xwire0l111 n_bl0_111 n_bl0_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r111 n_br0_111 n_br0_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_111 gnd gnd n_bl0_112 gnd n_br0_112 gnd vdd_unselected gnd memorycell
Xwire0l112 n_bl0_112 n_bl0_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r112 n_br0_112 n_br0_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_112 gnd gnd n_bl0_113 gnd n_br0_113 gnd vdd_unselected gnd memorycell
Xwire0l113 n_bl0_113 n_bl0_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r113 n_br0_113 n_br0_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_113 gnd gnd n_bl0_114 gnd n_br0_114 gnd vdd_unselected gnd memorycell
Xwire0l114 n_bl0_114 n_bl0_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r114 n_br0_114 n_br0_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_114 gnd gnd n_bl0_115 gnd n_br0_115 gnd vdd_unselected gnd memorycell
Xwire0l115 n_bl0_115 n_bl0_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r115 n_br0_115 n_br0_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_115 gnd gnd n_bl0_116 gnd n_br0_116 gnd vdd_unselected gnd memorycell
Xwire0l116 n_bl0_116 n_bl0_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r116 n_br0_116 n_br0_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_116 gnd gnd n_bl0_117 gnd n_br0_117 gnd vdd_unselected gnd memorycell
Xwire0l117 n_bl0_117 n_bl0_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r117 n_br0_117 n_br0_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_117 gnd gnd n_bl0_118 gnd n_br0_118 gnd vdd_unselected gnd memorycell
Xwire0l118 n_bl0_118 n_bl0_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r118 n_br0_118 n_br0_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_118 gnd gnd n_bl0_119 gnd n_br0_119 gnd vdd_unselected gnd memorycell
Xwire0l119 n_bl0_119 n_bl0_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r119 n_br0_119 n_br0_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_119 gnd gnd n_bl0_120 gnd n_br0_120 gnd vdd_unselected gnd memorycell
Xwire0l120 n_bl0_120 n_bl0_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r120 n_br0_120 n_br0_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_120 gnd gnd n_bl0_121 gnd n_br0_121 gnd vdd_unselected gnd memorycell
Xwire0l121 n_bl0_121 n_bl0_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r121 n_br0_121 n_br0_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_121 gnd gnd n_bl0_122 gnd n_br0_122 gnd vdd_unselected gnd memorycell
Xwire0l122 n_bl0_122 n_bl0_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r122 n_br0_122 n_br0_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_122 gnd gnd n_bl0_123 gnd n_br0_123 gnd vdd_unselected gnd memorycell
Xwire0l123 n_bl0_123 n_bl0_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r123 n_br0_123 n_br0_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_123 gnd gnd n_bl0_124 gnd n_br0_124 gnd vdd_unselected gnd memorycell
Xwire0l124 n_bl0_124 n_bl0_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r124 n_br0_124 n_br0_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_124 gnd gnd n_bl0_125 gnd n_br0_125 gnd vdd_unselected gnd memorycell
Xwire0l125 n_bl0_125 n_bl0_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r125 n_br0_125 n_br0_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_125 gnd gnd n_bl0_126 gnd n_br0_126 gnd vdd_unselected gnd memorycell
Xwire0l126 n_bl0_126 n_bl0_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r126 n_br0_126 n_br0_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_126 gnd gnd n_bl0_127 gnd n_br0_127 gnd vdd_unselected gnd memorycell
Xwire0l127 n_bl0_127 n_bl0_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire0r127 n_br0_127 n_br0_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_0_127 n_precharge gnd n_bl0_128 gnd n_br0_128 gnd vdd_unselected gnd memorycell
Xwire1l0 n_bl1_0 n_bl1_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r0 n_br1_0 n_br1_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_0 gnd gnd n_bl1_1 gnd n_br1_1 gnd vdd_unselected gnd memorycell
Xwire1l1 n_bl1_1 n_bl1_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r1 n_br1_1 n_br1_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_1 gnd gnd n_bl1_2 gnd n_br1_2 gnd vdd_unselected gnd memorycell
Xwire1l2 n_bl1_2 n_bl1_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r2 n_br1_2 n_br1_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_2 gnd gnd n_bl1_3 gnd n_br1_3 gnd vdd_unselected gnd memorycell
Xwire1l3 n_bl1_3 n_bl1_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r3 n_br1_3 n_br1_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_3 gnd gnd n_bl1_4 gnd n_br1_4 gnd vdd_unselected gnd memorycell
Xwire1l4 n_bl1_4 n_bl1_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r4 n_br1_4 n_br1_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_4 gnd gnd n_bl1_5 gnd n_br1_5 gnd vdd_unselected gnd memorycell
Xwire1l5 n_bl1_5 n_bl1_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r5 n_br1_5 n_br1_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_5 gnd gnd n_bl1_6 gnd n_br1_6 gnd vdd_unselected gnd memorycell
Xwire1l6 n_bl1_6 n_bl1_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r6 n_br1_6 n_br1_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_6 gnd gnd n_bl1_7 gnd n_br1_7 gnd vdd_unselected gnd memorycell
Xwire1l7 n_bl1_7 n_bl1_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r7 n_br1_7 n_br1_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_7 gnd gnd n_bl1_8 gnd n_br1_8 gnd vdd_unselected gnd memorycell
Xwire1l8 n_bl1_8 n_bl1_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r8 n_br1_8 n_br1_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_8 gnd gnd n_bl1_9 gnd n_br1_9 gnd vdd_unselected gnd memorycell
Xwire1l9 n_bl1_9 n_bl1_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r9 n_br1_9 n_br1_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_9 gnd gnd n_bl1_10 gnd n_br1_10 gnd vdd_unselected gnd memorycell
Xwire1l10 n_bl1_10 n_bl1_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r10 n_br1_10 n_br1_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_10 gnd gnd n_bl1_11 gnd n_br1_11 gnd vdd_unselected gnd memorycell
Xwire1l11 n_bl1_11 n_bl1_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r11 n_br1_11 n_br1_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_11 gnd gnd n_bl1_12 gnd n_br1_12 gnd vdd_unselected gnd memorycell
Xwire1l12 n_bl1_12 n_bl1_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r12 n_br1_12 n_br1_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_12 gnd gnd n_bl1_13 gnd n_br1_13 gnd vdd_unselected gnd memorycell
Xwire1l13 n_bl1_13 n_bl1_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r13 n_br1_13 n_br1_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_13 gnd gnd n_bl1_14 gnd n_br1_14 gnd vdd_unselected gnd memorycell
Xwire1l14 n_bl1_14 n_bl1_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r14 n_br1_14 n_br1_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_14 gnd gnd n_bl1_15 gnd n_br1_15 gnd vdd_unselected gnd memorycell
Xwire1l15 n_bl1_15 n_bl1_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r15 n_br1_15 n_br1_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_15 gnd gnd n_bl1_16 gnd n_br1_16 gnd vdd_unselected gnd memorycell
Xwire1l16 n_bl1_16 n_bl1_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r16 n_br1_16 n_br1_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_16 gnd gnd n_bl1_17 gnd n_br1_17 gnd vdd_unselected gnd memorycell
Xwire1l17 n_bl1_17 n_bl1_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r17 n_br1_17 n_br1_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_17 gnd gnd n_bl1_18 gnd n_br1_18 gnd vdd_unselected gnd memorycell
Xwire1l18 n_bl1_18 n_bl1_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r18 n_br1_18 n_br1_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_18 gnd gnd n_bl1_19 gnd n_br1_19 gnd vdd_unselected gnd memorycell
Xwire1l19 n_bl1_19 n_bl1_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r19 n_br1_19 n_br1_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_19 gnd gnd n_bl1_20 gnd n_br1_20 gnd vdd_unselected gnd memorycell
Xwire1l20 n_bl1_20 n_bl1_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r20 n_br1_20 n_br1_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_20 gnd gnd n_bl1_21 gnd n_br1_21 gnd vdd_unselected gnd memorycell
Xwire1l21 n_bl1_21 n_bl1_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r21 n_br1_21 n_br1_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_21 gnd gnd n_bl1_22 gnd n_br1_22 gnd vdd_unselected gnd memorycell
Xwire1l22 n_bl1_22 n_bl1_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r22 n_br1_22 n_br1_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_22 gnd gnd n_bl1_23 gnd n_br1_23 gnd vdd_unselected gnd memorycell
Xwire1l23 n_bl1_23 n_bl1_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r23 n_br1_23 n_br1_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_23 gnd gnd n_bl1_24 gnd n_br1_24 gnd vdd_unselected gnd memorycell
Xwire1l24 n_bl1_24 n_bl1_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r24 n_br1_24 n_br1_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_24 gnd gnd n_bl1_25 gnd n_br1_25 gnd vdd_unselected gnd memorycell
Xwire1l25 n_bl1_25 n_bl1_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r25 n_br1_25 n_br1_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_25 gnd gnd n_bl1_26 gnd n_br1_26 gnd vdd_unselected gnd memorycell
Xwire1l26 n_bl1_26 n_bl1_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r26 n_br1_26 n_br1_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_26 gnd gnd n_bl1_27 gnd n_br1_27 gnd vdd_unselected gnd memorycell
Xwire1l27 n_bl1_27 n_bl1_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r27 n_br1_27 n_br1_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_27 gnd gnd n_bl1_28 gnd n_br1_28 gnd vdd_unselected gnd memorycell
Xwire1l28 n_bl1_28 n_bl1_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r28 n_br1_28 n_br1_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_28 gnd gnd n_bl1_29 gnd n_br1_29 gnd vdd_unselected gnd memorycell
Xwire1l29 n_bl1_29 n_bl1_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r29 n_br1_29 n_br1_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_29 gnd gnd n_bl1_30 gnd n_br1_30 gnd vdd_unselected gnd memorycell
Xwire1l30 n_bl1_30 n_bl1_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r30 n_br1_30 n_br1_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_30 gnd gnd n_bl1_31 gnd n_br1_31 gnd vdd_unselected gnd memorycell
Xwire1l31 n_bl1_31 n_bl1_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r31 n_br1_31 n_br1_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_31 gnd gnd n_bl1_32 gnd n_br1_32 gnd vdd_unselected gnd memorycell
Xwire1l32 n_bl1_32 n_bl1_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r32 n_br1_32 n_br1_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_32 gnd gnd n_bl1_33 gnd n_br1_33 gnd vdd_unselected gnd memorycell
Xwire1l33 n_bl1_33 n_bl1_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r33 n_br1_33 n_br1_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_33 gnd gnd n_bl1_34 gnd n_br1_34 gnd vdd_unselected gnd memorycell
Xwire1l34 n_bl1_34 n_bl1_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r34 n_br1_34 n_br1_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_34 gnd gnd n_bl1_35 gnd n_br1_35 gnd vdd_unselected gnd memorycell
Xwire1l35 n_bl1_35 n_bl1_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r35 n_br1_35 n_br1_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_35 gnd gnd n_bl1_36 gnd n_br1_36 gnd vdd_unselected gnd memorycell
Xwire1l36 n_bl1_36 n_bl1_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r36 n_br1_36 n_br1_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_36 gnd gnd n_bl1_37 gnd n_br1_37 gnd vdd_unselected gnd memorycell
Xwire1l37 n_bl1_37 n_bl1_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r37 n_br1_37 n_br1_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_37 gnd gnd n_bl1_38 gnd n_br1_38 gnd vdd_unselected gnd memorycell
Xwire1l38 n_bl1_38 n_bl1_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r38 n_br1_38 n_br1_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_38 gnd gnd n_bl1_39 gnd n_br1_39 gnd vdd_unselected gnd memorycell
Xwire1l39 n_bl1_39 n_bl1_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r39 n_br1_39 n_br1_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_39 gnd gnd n_bl1_40 gnd n_br1_40 gnd vdd_unselected gnd memorycell
Xwire1l40 n_bl1_40 n_bl1_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r40 n_br1_40 n_br1_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_40 gnd gnd n_bl1_41 gnd n_br1_41 gnd vdd_unselected gnd memorycell
Xwire1l41 n_bl1_41 n_bl1_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r41 n_br1_41 n_br1_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_41 gnd gnd n_bl1_42 gnd n_br1_42 gnd vdd_unselected gnd memorycell
Xwire1l42 n_bl1_42 n_bl1_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r42 n_br1_42 n_br1_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_42 gnd gnd n_bl1_43 gnd n_br1_43 gnd vdd_unselected gnd memorycell
Xwire1l43 n_bl1_43 n_bl1_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r43 n_br1_43 n_br1_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_43 gnd gnd n_bl1_44 gnd n_br1_44 gnd vdd_unselected gnd memorycell
Xwire1l44 n_bl1_44 n_bl1_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r44 n_br1_44 n_br1_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_44 gnd gnd n_bl1_45 gnd n_br1_45 gnd vdd_unselected gnd memorycell
Xwire1l45 n_bl1_45 n_bl1_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r45 n_br1_45 n_br1_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_45 gnd gnd n_bl1_46 gnd n_br1_46 gnd vdd_unselected gnd memorycell
Xwire1l46 n_bl1_46 n_bl1_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r46 n_br1_46 n_br1_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_46 gnd gnd n_bl1_47 gnd n_br1_47 gnd vdd_unselected gnd memorycell
Xwire1l47 n_bl1_47 n_bl1_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r47 n_br1_47 n_br1_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_47 gnd gnd n_bl1_48 gnd n_br1_48 gnd vdd_unselected gnd memorycell
Xwire1l48 n_bl1_48 n_bl1_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r48 n_br1_48 n_br1_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_48 gnd gnd n_bl1_49 gnd n_br1_49 gnd vdd_unselected gnd memorycell
Xwire1l49 n_bl1_49 n_bl1_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r49 n_br1_49 n_br1_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_49 gnd gnd n_bl1_50 gnd n_br1_50 gnd vdd_unselected gnd memorycell
Xwire1l50 n_bl1_50 n_bl1_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r50 n_br1_50 n_br1_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_50 gnd gnd n_bl1_51 gnd n_br1_51 gnd vdd_unselected gnd memorycell
Xwire1l51 n_bl1_51 n_bl1_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r51 n_br1_51 n_br1_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_51 gnd gnd n_bl1_52 gnd n_br1_52 gnd vdd_unselected gnd memorycell
Xwire1l52 n_bl1_52 n_bl1_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r52 n_br1_52 n_br1_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_52 gnd gnd n_bl1_53 gnd n_br1_53 gnd vdd_unselected gnd memorycell
Xwire1l53 n_bl1_53 n_bl1_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r53 n_br1_53 n_br1_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_53 gnd gnd n_bl1_54 gnd n_br1_54 gnd vdd_unselected gnd memorycell
Xwire1l54 n_bl1_54 n_bl1_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r54 n_br1_54 n_br1_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_54 gnd gnd n_bl1_55 gnd n_br1_55 gnd vdd_unselected gnd memorycell
Xwire1l55 n_bl1_55 n_bl1_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r55 n_br1_55 n_br1_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_55 gnd gnd n_bl1_56 gnd n_br1_56 gnd vdd_unselected gnd memorycell
Xwire1l56 n_bl1_56 n_bl1_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r56 n_br1_56 n_br1_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_56 gnd gnd n_bl1_57 gnd n_br1_57 gnd vdd_unselected gnd memorycell
Xwire1l57 n_bl1_57 n_bl1_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r57 n_br1_57 n_br1_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_57 gnd gnd n_bl1_58 gnd n_br1_58 gnd vdd_unselected gnd memorycell
Xwire1l58 n_bl1_58 n_bl1_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r58 n_br1_58 n_br1_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_58 gnd gnd n_bl1_59 gnd n_br1_59 gnd vdd_unselected gnd memorycell
Xwire1l59 n_bl1_59 n_bl1_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r59 n_br1_59 n_br1_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_59 gnd gnd n_bl1_60 gnd n_br1_60 gnd vdd_unselected gnd memorycell
Xwire1l60 n_bl1_60 n_bl1_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r60 n_br1_60 n_br1_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_60 gnd gnd n_bl1_61 gnd n_br1_61 gnd vdd_unselected gnd memorycell
Xwire1l61 n_bl1_61 n_bl1_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r61 n_br1_61 n_br1_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_61 gnd gnd n_bl1_62 gnd n_br1_62 gnd vdd_unselected gnd memorycell
Xwire1l62 n_bl1_62 n_bl1_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r62 n_br1_62 n_br1_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_62 gnd gnd n_bl1_63 gnd n_br1_63 gnd vdd_unselected gnd memorycell
Xwire1l63 n_bl1_63 n_bl1_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r63 n_br1_63 n_br1_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_63 gnd gnd n_bl1_64 gnd n_br1_64 gnd vdd_unselected gnd memorycell
Xwire1l64 n_bl1_64 n_bl1_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r64 n_br1_64 n_br1_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_64 gnd gnd n_bl1_65 gnd n_br1_65 gnd vdd_unselected gnd memorycell
Xwire1l65 n_bl1_65 n_bl1_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r65 n_br1_65 n_br1_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_65 gnd gnd n_bl1_66 gnd n_br1_66 gnd vdd_unselected gnd memorycell
Xwire1l66 n_bl1_66 n_bl1_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r66 n_br1_66 n_br1_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_66 gnd gnd n_bl1_67 gnd n_br1_67 gnd vdd_unselected gnd memorycell
Xwire1l67 n_bl1_67 n_bl1_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r67 n_br1_67 n_br1_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_67 gnd gnd n_bl1_68 gnd n_br1_68 gnd vdd_unselected gnd memorycell
Xwire1l68 n_bl1_68 n_bl1_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r68 n_br1_68 n_br1_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_68 gnd gnd n_bl1_69 gnd n_br1_69 gnd vdd_unselected gnd memorycell
Xwire1l69 n_bl1_69 n_bl1_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r69 n_br1_69 n_br1_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_69 gnd gnd n_bl1_70 gnd n_br1_70 gnd vdd_unselected gnd memorycell
Xwire1l70 n_bl1_70 n_bl1_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r70 n_br1_70 n_br1_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_70 gnd gnd n_bl1_71 gnd n_br1_71 gnd vdd_unselected gnd memorycell
Xwire1l71 n_bl1_71 n_bl1_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r71 n_br1_71 n_br1_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_71 gnd gnd n_bl1_72 gnd n_br1_72 gnd vdd_unselected gnd memorycell
Xwire1l72 n_bl1_72 n_bl1_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r72 n_br1_72 n_br1_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_72 gnd gnd n_bl1_73 gnd n_br1_73 gnd vdd_unselected gnd memorycell
Xwire1l73 n_bl1_73 n_bl1_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r73 n_br1_73 n_br1_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_73 gnd gnd n_bl1_74 gnd n_br1_74 gnd vdd_unselected gnd memorycell
Xwire1l74 n_bl1_74 n_bl1_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r74 n_br1_74 n_br1_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_74 gnd gnd n_bl1_75 gnd n_br1_75 gnd vdd_unselected gnd memorycell
Xwire1l75 n_bl1_75 n_bl1_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r75 n_br1_75 n_br1_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_75 gnd gnd n_bl1_76 gnd n_br1_76 gnd vdd_unselected gnd memorycell
Xwire1l76 n_bl1_76 n_bl1_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r76 n_br1_76 n_br1_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_76 gnd gnd n_bl1_77 gnd n_br1_77 gnd vdd_unselected gnd memorycell
Xwire1l77 n_bl1_77 n_bl1_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r77 n_br1_77 n_br1_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_77 gnd gnd n_bl1_78 gnd n_br1_78 gnd vdd_unselected gnd memorycell
Xwire1l78 n_bl1_78 n_bl1_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r78 n_br1_78 n_br1_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_78 gnd gnd n_bl1_79 gnd n_br1_79 gnd vdd_unselected gnd memorycell
Xwire1l79 n_bl1_79 n_bl1_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r79 n_br1_79 n_br1_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_79 gnd gnd n_bl1_80 gnd n_br1_80 gnd vdd_unselected gnd memorycell
Xwire1l80 n_bl1_80 n_bl1_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r80 n_br1_80 n_br1_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_80 gnd gnd n_bl1_81 gnd n_br1_81 gnd vdd_unselected gnd memorycell
Xwire1l81 n_bl1_81 n_bl1_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r81 n_br1_81 n_br1_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_81 gnd gnd n_bl1_82 gnd n_br1_82 gnd vdd_unselected gnd memorycell
Xwire1l82 n_bl1_82 n_bl1_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r82 n_br1_82 n_br1_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_82 gnd gnd n_bl1_83 gnd n_br1_83 gnd vdd_unselected gnd memorycell
Xwire1l83 n_bl1_83 n_bl1_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r83 n_br1_83 n_br1_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_83 gnd gnd n_bl1_84 gnd n_br1_84 gnd vdd_unselected gnd memorycell
Xwire1l84 n_bl1_84 n_bl1_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r84 n_br1_84 n_br1_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_84 gnd gnd n_bl1_85 gnd n_br1_85 gnd vdd_unselected gnd memorycell
Xwire1l85 n_bl1_85 n_bl1_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r85 n_br1_85 n_br1_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_85 gnd gnd n_bl1_86 gnd n_br1_86 gnd vdd_unselected gnd memorycell
Xwire1l86 n_bl1_86 n_bl1_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r86 n_br1_86 n_br1_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_86 gnd gnd n_bl1_87 gnd n_br1_87 gnd vdd_unselected gnd memorycell
Xwire1l87 n_bl1_87 n_bl1_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r87 n_br1_87 n_br1_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_87 gnd gnd n_bl1_88 gnd n_br1_88 gnd vdd_unselected gnd memorycell
Xwire1l88 n_bl1_88 n_bl1_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r88 n_br1_88 n_br1_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_88 gnd gnd n_bl1_89 gnd n_br1_89 gnd vdd_unselected gnd memorycell
Xwire1l89 n_bl1_89 n_bl1_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r89 n_br1_89 n_br1_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_89 gnd gnd n_bl1_90 gnd n_br1_90 gnd vdd_unselected gnd memorycell
Xwire1l90 n_bl1_90 n_bl1_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r90 n_br1_90 n_br1_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_90 gnd gnd n_bl1_91 gnd n_br1_91 gnd vdd_unselected gnd memorycell
Xwire1l91 n_bl1_91 n_bl1_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r91 n_br1_91 n_br1_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_91 gnd gnd n_bl1_92 gnd n_br1_92 gnd vdd_unselected gnd memorycell
Xwire1l92 n_bl1_92 n_bl1_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r92 n_br1_92 n_br1_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_92 gnd gnd n_bl1_93 gnd n_br1_93 gnd vdd_unselected gnd memorycell
Xwire1l93 n_bl1_93 n_bl1_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r93 n_br1_93 n_br1_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_93 gnd gnd n_bl1_94 gnd n_br1_94 gnd vdd_unselected gnd memorycell
Xwire1l94 n_bl1_94 n_bl1_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r94 n_br1_94 n_br1_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_94 gnd gnd n_bl1_95 gnd n_br1_95 gnd vdd_unselected gnd memorycell
Xwire1l95 n_bl1_95 n_bl1_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r95 n_br1_95 n_br1_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_95 gnd gnd n_bl1_96 gnd n_br1_96 gnd vdd_unselected gnd memorycell
Xwire1l96 n_bl1_96 n_bl1_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r96 n_br1_96 n_br1_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_96 gnd gnd n_bl1_97 gnd n_br1_97 gnd vdd_unselected gnd memorycell
Xwire1l97 n_bl1_97 n_bl1_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r97 n_br1_97 n_br1_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_97 gnd gnd n_bl1_98 gnd n_br1_98 gnd vdd_unselected gnd memorycell
Xwire1l98 n_bl1_98 n_bl1_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r98 n_br1_98 n_br1_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_98 gnd gnd n_bl1_99 gnd n_br1_99 gnd vdd_unselected gnd memorycell
Xwire1l99 n_bl1_99 n_bl1_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r99 n_br1_99 n_br1_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_99 gnd gnd n_bl1_100 gnd n_br1_100 gnd vdd_unselected gnd memorycell
Xwire1l100 n_bl1_100 n_bl1_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r100 n_br1_100 n_br1_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_100 gnd gnd n_bl1_101 gnd n_br1_101 gnd vdd_unselected gnd memorycell
Xwire1l101 n_bl1_101 n_bl1_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r101 n_br1_101 n_br1_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_101 gnd gnd n_bl1_102 gnd n_br1_102 gnd vdd_unselected gnd memorycell
Xwire1l102 n_bl1_102 n_bl1_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r102 n_br1_102 n_br1_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_102 gnd gnd n_bl1_103 gnd n_br1_103 gnd vdd_unselected gnd memorycell
Xwire1l103 n_bl1_103 n_bl1_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r103 n_br1_103 n_br1_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_103 gnd gnd n_bl1_104 gnd n_br1_104 gnd vdd_unselected gnd memorycell
Xwire1l104 n_bl1_104 n_bl1_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r104 n_br1_104 n_br1_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_104 gnd gnd n_bl1_105 gnd n_br1_105 gnd vdd_unselected gnd memorycell
Xwire1l105 n_bl1_105 n_bl1_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r105 n_br1_105 n_br1_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_105 gnd gnd n_bl1_106 gnd n_br1_106 gnd vdd_unselected gnd memorycell
Xwire1l106 n_bl1_106 n_bl1_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r106 n_br1_106 n_br1_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_106 gnd gnd n_bl1_107 gnd n_br1_107 gnd vdd_unselected gnd memorycell
Xwire1l107 n_bl1_107 n_bl1_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r107 n_br1_107 n_br1_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_107 gnd gnd n_bl1_108 gnd n_br1_108 gnd vdd_unselected gnd memorycell
Xwire1l108 n_bl1_108 n_bl1_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r108 n_br1_108 n_br1_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_108 gnd gnd n_bl1_109 gnd n_br1_109 gnd vdd_unselected gnd memorycell
Xwire1l109 n_bl1_109 n_bl1_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r109 n_br1_109 n_br1_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_109 gnd gnd n_bl1_110 gnd n_br1_110 gnd vdd_unselected gnd memorycell
Xwire1l110 n_bl1_110 n_bl1_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r110 n_br1_110 n_br1_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_110 gnd gnd n_bl1_111 gnd n_br1_111 gnd vdd_unselected gnd memorycell
Xwire1l111 n_bl1_111 n_bl1_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r111 n_br1_111 n_br1_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_111 gnd gnd n_bl1_112 gnd n_br1_112 gnd vdd_unselected gnd memorycell
Xwire1l112 n_bl1_112 n_bl1_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r112 n_br1_112 n_br1_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_112 gnd gnd n_bl1_113 gnd n_br1_113 gnd vdd_unselected gnd memorycell
Xwire1l113 n_bl1_113 n_bl1_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r113 n_br1_113 n_br1_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_113 gnd gnd n_bl1_114 gnd n_br1_114 gnd vdd_unselected gnd memorycell
Xwire1l114 n_bl1_114 n_bl1_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r114 n_br1_114 n_br1_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_114 gnd gnd n_bl1_115 gnd n_br1_115 gnd vdd_unselected gnd memorycell
Xwire1l115 n_bl1_115 n_bl1_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r115 n_br1_115 n_br1_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_115 gnd gnd n_bl1_116 gnd n_br1_116 gnd vdd_unselected gnd memorycell
Xwire1l116 n_bl1_116 n_bl1_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r116 n_br1_116 n_br1_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_116 gnd gnd n_bl1_117 gnd n_br1_117 gnd vdd_unselected gnd memorycell
Xwire1l117 n_bl1_117 n_bl1_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r117 n_br1_117 n_br1_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_117 gnd gnd n_bl1_118 gnd n_br1_118 gnd vdd_unselected gnd memorycell
Xwire1l118 n_bl1_118 n_bl1_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r118 n_br1_118 n_br1_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_118 gnd gnd n_bl1_119 gnd n_br1_119 gnd vdd_unselected gnd memorycell
Xwire1l119 n_bl1_119 n_bl1_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r119 n_br1_119 n_br1_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_119 gnd gnd n_bl1_120 gnd n_br1_120 gnd vdd_unselected gnd memorycell
Xwire1l120 n_bl1_120 n_bl1_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r120 n_br1_120 n_br1_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_120 gnd gnd n_bl1_121 gnd n_br1_121 gnd vdd_unselected gnd memorycell
Xwire1l121 n_bl1_121 n_bl1_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r121 n_br1_121 n_br1_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_121 gnd gnd n_bl1_122 gnd n_br1_122 gnd vdd_unselected gnd memorycell
Xwire1l122 n_bl1_122 n_bl1_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r122 n_br1_122 n_br1_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_122 gnd gnd n_bl1_123 gnd n_br1_123 gnd vdd_unselected gnd memorycell
Xwire1l123 n_bl1_123 n_bl1_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r123 n_br1_123 n_br1_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_123 gnd gnd n_bl1_124 gnd n_br1_124 gnd vdd_unselected gnd memorycell
Xwire1l124 n_bl1_124 n_bl1_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r124 n_br1_124 n_br1_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_124 gnd gnd n_bl1_125 gnd n_br1_125 gnd vdd_unselected gnd memorycell
Xwire1l125 n_bl1_125 n_bl1_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r125 n_br1_125 n_br1_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_125 gnd gnd n_bl1_126 gnd n_br1_126 gnd vdd_unselected gnd memorycell
Xwire1l126 n_bl1_126 n_bl1_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r126 n_br1_126 n_br1_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_126 gnd gnd n_bl1_127 gnd n_br1_127 gnd vdd_unselected gnd memorycell
Xwire1l127 n_bl1_127 n_bl1_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire1r127 n_br1_127 n_br1_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_1_127 n_precharge gnd n_bl1_128 gnd n_br1_128 gnd vdd_unselected gnd memorycell
Xwire2l0 n_bl2_0 n_bl2_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r0 n_br2_0 n_br2_1 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_0 gnd gnd n_bl2_1 gnd n_br2_1 gnd vdd_unselected gnd memorycell
Xwire2l1 n_bl2_1 n_bl2_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r1 n_br2_1 n_br2_2 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_1 gnd gnd n_bl2_2 gnd n_br2_2 gnd vdd_unselected gnd memorycell
Xwire2l2 n_bl2_2 n_bl2_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r2 n_br2_2 n_br2_3 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_2 gnd gnd n_bl2_3 gnd n_br2_3 gnd vdd_unselected gnd memorycell
Xwire2l3 n_bl2_3 n_bl2_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r3 n_br2_3 n_br2_4 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_3 gnd gnd n_bl2_4 gnd n_br2_4 gnd vdd_unselected gnd memorycell
Xwire2l4 n_bl2_4 n_bl2_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r4 n_br2_4 n_br2_5 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_4 gnd gnd n_bl2_5 gnd n_br2_5 gnd vdd_unselected gnd memorycell
Xwire2l5 n_bl2_5 n_bl2_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r5 n_br2_5 n_br2_6 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_5 gnd gnd n_bl2_6 gnd n_br2_6 gnd vdd_unselected gnd memorycell
Xwire2l6 n_bl2_6 n_bl2_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r6 n_br2_6 n_br2_7 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_6 gnd gnd n_bl2_7 gnd n_br2_7 gnd vdd_unselected gnd memorycell
Xwire2l7 n_bl2_7 n_bl2_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r7 n_br2_7 n_br2_8 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_7 gnd gnd n_bl2_8 gnd n_br2_8 gnd vdd_unselected gnd memorycell
Xwire2l8 n_bl2_8 n_bl2_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r8 n_br2_8 n_br2_9 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_8 gnd gnd n_bl2_9 gnd n_br2_9 gnd vdd_unselected gnd memorycell
Xwire2l9 n_bl2_9 n_bl2_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r9 n_br2_9 n_br2_10 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_9 gnd gnd n_bl2_10 gnd n_br2_10 gnd vdd_unselected gnd memorycell
Xwire2l10 n_bl2_10 n_bl2_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r10 n_br2_10 n_br2_11 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_10 gnd gnd n_bl2_11 gnd n_br2_11 gnd vdd_unselected gnd memorycell
Xwire2l11 n_bl2_11 n_bl2_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r11 n_br2_11 n_br2_12 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_11 gnd gnd n_bl2_12 gnd n_br2_12 gnd vdd_unselected gnd memorycell
Xwire2l12 n_bl2_12 n_bl2_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r12 n_br2_12 n_br2_13 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_12 gnd gnd n_bl2_13 gnd n_br2_13 gnd vdd_unselected gnd memorycell
Xwire2l13 n_bl2_13 n_bl2_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r13 n_br2_13 n_br2_14 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_13 gnd gnd n_bl2_14 gnd n_br2_14 gnd vdd_unselected gnd memorycell
Xwire2l14 n_bl2_14 n_bl2_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r14 n_br2_14 n_br2_15 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_14 gnd gnd n_bl2_15 gnd n_br2_15 gnd vdd_unselected gnd memorycell
Xwire2l15 n_bl2_15 n_bl2_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r15 n_br2_15 n_br2_16 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_15 gnd gnd n_bl2_16 gnd n_br2_16 gnd vdd_unselected gnd memorycell
Xwire2l16 n_bl2_16 n_bl2_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r16 n_br2_16 n_br2_17 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_16 gnd gnd n_bl2_17 gnd n_br2_17 gnd vdd_unselected gnd memorycell
Xwire2l17 n_bl2_17 n_bl2_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r17 n_br2_17 n_br2_18 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_17 gnd gnd n_bl2_18 gnd n_br2_18 gnd vdd_unselected gnd memorycell
Xwire2l18 n_bl2_18 n_bl2_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r18 n_br2_18 n_br2_19 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_18 gnd gnd n_bl2_19 gnd n_br2_19 gnd vdd_unselected gnd memorycell
Xwire2l19 n_bl2_19 n_bl2_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r19 n_br2_19 n_br2_20 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_19 gnd gnd n_bl2_20 gnd n_br2_20 gnd vdd_unselected gnd memorycell
Xwire2l20 n_bl2_20 n_bl2_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r20 n_br2_20 n_br2_21 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_20 gnd gnd n_bl2_21 gnd n_br2_21 gnd vdd_unselected gnd memorycell
Xwire2l21 n_bl2_21 n_bl2_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r21 n_br2_21 n_br2_22 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_21 gnd gnd n_bl2_22 gnd n_br2_22 gnd vdd_unselected gnd memorycell
Xwire2l22 n_bl2_22 n_bl2_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r22 n_br2_22 n_br2_23 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_22 gnd gnd n_bl2_23 gnd n_br2_23 gnd vdd_unselected gnd memorycell
Xwire2l23 n_bl2_23 n_bl2_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r23 n_br2_23 n_br2_24 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_23 gnd gnd n_bl2_24 gnd n_br2_24 gnd vdd_unselected gnd memorycell
Xwire2l24 n_bl2_24 n_bl2_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r24 n_br2_24 n_br2_25 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_24 gnd gnd n_bl2_25 gnd n_br2_25 gnd vdd_unselected gnd memorycell
Xwire2l25 n_bl2_25 n_bl2_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r25 n_br2_25 n_br2_26 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_25 gnd gnd n_bl2_26 gnd n_br2_26 gnd vdd_unselected gnd memorycell
Xwire2l26 n_bl2_26 n_bl2_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r26 n_br2_26 n_br2_27 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_26 gnd gnd n_bl2_27 gnd n_br2_27 gnd vdd_unselected gnd memorycell
Xwire2l27 n_bl2_27 n_bl2_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r27 n_br2_27 n_br2_28 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_27 gnd gnd n_bl2_28 gnd n_br2_28 gnd vdd_unselected gnd memorycell
Xwire2l28 n_bl2_28 n_bl2_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r28 n_br2_28 n_br2_29 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_28 gnd gnd n_bl2_29 gnd n_br2_29 gnd vdd_unselected gnd memorycell
Xwire2l29 n_bl2_29 n_bl2_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r29 n_br2_29 n_br2_30 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_29 gnd gnd n_bl2_30 gnd n_br2_30 gnd vdd_unselected gnd memorycell
Xwire2l30 n_bl2_30 n_bl2_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r30 n_br2_30 n_br2_31 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_30 gnd gnd n_bl2_31 gnd n_br2_31 gnd vdd_unselected gnd memorycell
Xwire2l31 n_bl2_31 n_bl2_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r31 n_br2_31 n_br2_32 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_31 gnd gnd n_bl2_32 gnd n_br2_32 gnd vdd_unselected gnd memorycell
Xwire2l32 n_bl2_32 n_bl2_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r32 n_br2_32 n_br2_33 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_32 gnd gnd n_bl2_33 gnd n_br2_33 gnd vdd_unselected gnd memorycell
Xwire2l33 n_bl2_33 n_bl2_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r33 n_br2_33 n_br2_34 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_33 gnd gnd n_bl2_34 gnd n_br2_34 gnd vdd_unselected gnd memorycell
Xwire2l34 n_bl2_34 n_bl2_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r34 n_br2_34 n_br2_35 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_34 gnd gnd n_bl2_35 gnd n_br2_35 gnd vdd_unselected gnd memorycell
Xwire2l35 n_bl2_35 n_bl2_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r35 n_br2_35 n_br2_36 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_35 gnd gnd n_bl2_36 gnd n_br2_36 gnd vdd_unselected gnd memorycell
Xwire2l36 n_bl2_36 n_bl2_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r36 n_br2_36 n_br2_37 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_36 gnd gnd n_bl2_37 gnd n_br2_37 gnd vdd_unselected gnd memorycell
Xwire2l37 n_bl2_37 n_bl2_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r37 n_br2_37 n_br2_38 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_37 gnd gnd n_bl2_38 gnd n_br2_38 gnd vdd_unselected gnd memorycell
Xwire2l38 n_bl2_38 n_bl2_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r38 n_br2_38 n_br2_39 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_38 gnd gnd n_bl2_39 gnd n_br2_39 gnd vdd_unselected gnd memorycell
Xwire2l39 n_bl2_39 n_bl2_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r39 n_br2_39 n_br2_40 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_39 gnd gnd n_bl2_40 gnd n_br2_40 gnd vdd_unselected gnd memorycell
Xwire2l40 n_bl2_40 n_bl2_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r40 n_br2_40 n_br2_41 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_40 gnd gnd n_bl2_41 gnd n_br2_41 gnd vdd_unselected gnd memorycell
Xwire2l41 n_bl2_41 n_bl2_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r41 n_br2_41 n_br2_42 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_41 gnd gnd n_bl2_42 gnd n_br2_42 gnd vdd_unselected gnd memorycell
Xwire2l42 n_bl2_42 n_bl2_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r42 n_br2_42 n_br2_43 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_42 gnd gnd n_bl2_43 gnd n_br2_43 gnd vdd_unselected gnd memorycell
Xwire2l43 n_bl2_43 n_bl2_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r43 n_br2_43 n_br2_44 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_43 gnd gnd n_bl2_44 gnd n_br2_44 gnd vdd_unselected gnd memorycell
Xwire2l44 n_bl2_44 n_bl2_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r44 n_br2_44 n_br2_45 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_44 gnd gnd n_bl2_45 gnd n_br2_45 gnd vdd_unselected gnd memorycell
Xwire2l45 n_bl2_45 n_bl2_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r45 n_br2_45 n_br2_46 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_45 gnd gnd n_bl2_46 gnd n_br2_46 gnd vdd_unselected gnd memorycell
Xwire2l46 n_bl2_46 n_bl2_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r46 n_br2_46 n_br2_47 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_46 gnd gnd n_bl2_47 gnd n_br2_47 gnd vdd_unselected gnd memorycell
Xwire2l47 n_bl2_47 n_bl2_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r47 n_br2_47 n_br2_48 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_47 gnd gnd n_bl2_48 gnd n_br2_48 gnd vdd_unselected gnd memorycell
Xwire2l48 n_bl2_48 n_bl2_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r48 n_br2_48 n_br2_49 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_48 gnd gnd n_bl2_49 gnd n_br2_49 gnd vdd_unselected gnd memorycell
Xwire2l49 n_bl2_49 n_bl2_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r49 n_br2_49 n_br2_50 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_49 gnd gnd n_bl2_50 gnd n_br2_50 gnd vdd_unselected gnd memorycell
Xwire2l50 n_bl2_50 n_bl2_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r50 n_br2_50 n_br2_51 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_50 gnd gnd n_bl2_51 gnd n_br2_51 gnd vdd_unselected gnd memorycell
Xwire2l51 n_bl2_51 n_bl2_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r51 n_br2_51 n_br2_52 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_51 gnd gnd n_bl2_52 gnd n_br2_52 gnd vdd_unselected gnd memorycell
Xwire2l52 n_bl2_52 n_bl2_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r52 n_br2_52 n_br2_53 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_52 gnd gnd n_bl2_53 gnd n_br2_53 gnd vdd_unselected gnd memorycell
Xwire2l53 n_bl2_53 n_bl2_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r53 n_br2_53 n_br2_54 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_53 gnd gnd n_bl2_54 gnd n_br2_54 gnd vdd_unselected gnd memorycell
Xwire2l54 n_bl2_54 n_bl2_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r54 n_br2_54 n_br2_55 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_54 gnd gnd n_bl2_55 gnd n_br2_55 gnd vdd_unselected gnd memorycell
Xwire2l55 n_bl2_55 n_bl2_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r55 n_br2_55 n_br2_56 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_55 gnd gnd n_bl2_56 gnd n_br2_56 gnd vdd_unselected gnd memorycell
Xwire2l56 n_bl2_56 n_bl2_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r56 n_br2_56 n_br2_57 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_56 gnd gnd n_bl2_57 gnd n_br2_57 gnd vdd_unselected gnd memorycell
Xwire2l57 n_bl2_57 n_bl2_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r57 n_br2_57 n_br2_58 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_57 gnd gnd n_bl2_58 gnd n_br2_58 gnd vdd_unselected gnd memorycell
Xwire2l58 n_bl2_58 n_bl2_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r58 n_br2_58 n_br2_59 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_58 gnd gnd n_bl2_59 gnd n_br2_59 gnd vdd_unselected gnd memorycell
Xwire2l59 n_bl2_59 n_bl2_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r59 n_br2_59 n_br2_60 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_59 gnd gnd n_bl2_60 gnd n_br2_60 gnd vdd_unselected gnd memorycell
Xwire2l60 n_bl2_60 n_bl2_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r60 n_br2_60 n_br2_61 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_60 gnd gnd n_bl2_61 gnd n_br2_61 gnd vdd_unselected gnd memorycell
Xwire2l61 n_bl2_61 n_bl2_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r61 n_br2_61 n_br2_62 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_61 gnd gnd n_bl2_62 gnd n_br2_62 gnd vdd_unselected gnd memorycell
Xwire2l62 n_bl2_62 n_bl2_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r62 n_br2_62 n_br2_63 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_62 gnd gnd n_bl2_63 gnd n_br2_63 gnd vdd_unselected gnd memorycell
Xwire2l63 n_bl2_63 n_bl2_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r63 n_br2_63 n_br2_64 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_63 gnd gnd n_bl2_64 gnd n_br2_64 gnd vdd_unselected gnd memorycell
Xwire2l64 n_bl2_64 n_bl2_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r64 n_br2_64 n_br2_65 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_64 gnd gnd n_bl2_65 gnd n_br2_65 gnd vdd_unselected gnd memorycell
Xwire2l65 n_bl2_65 n_bl2_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r65 n_br2_65 n_br2_66 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_65 gnd gnd n_bl2_66 gnd n_br2_66 gnd vdd_unselected gnd memorycell
Xwire2l66 n_bl2_66 n_bl2_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r66 n_br2_66 n_br2_67 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_66 gnd gnd n_bl2_67 gnd n_br2_67 gnd vdd_unselected gnd memorycell
Xwire2l67 n_bl2_67 n_bl2_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r67 n_br2_67 n_br2_68 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_67 gnd gnd n_bl2_68 gnd n_br2_68 gnd vdd_unselected gnd memorycell
Xwire2l68 n_bl2_68 n_bl2_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r68 n_br2_68 n_br2_69 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_68 gnd gnd n_bl2_69 gnd n_br2_69 gnd vdd_unselected gnd memorycell
Xwire2l69 n_bl2_69 n_bl2_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r69 n_br2_69 n_br2_70 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_69 gnd gnd n_bl2_70 gnd n_br2_70 gnd vdd_unselected gnd memorycell
Xwire2l70 n_bl2_70 n_bl2_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r70 n_br2_70 n_br2_71 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_70 gnd gnd n_bl2_71 gnd n_br2_71 gnd vdd_unselected gnd memorycell
Xwire2l71 n_bl2_71 n_bl2_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r71 n_br2_71 n_br2_72 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_71 gnd gnd n_bl2_72 gnd n_br2_72 gnd vdd_unselected gnd memorycell
Xwire2l72 n_bl2_72 n_bl2_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r72 n_br2_72 n_br2_73 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_72 gnd gnd n_bl2_73 gnd n_br2_73 gnd vdd_unselected gnd memorycell
Xwire2l73 n_bl2_73 n_bl2_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r73 n_br2_73 n_br2_74 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_73 gnd gnd n_bl2_74 gnd n_br2_74 gnd vdd_unselected gnd memorycell
Xwire2l74 n_bl2_74 n_bl2_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r74 n_br2_74 n_br2_75 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_74 gnd gnd n_bl2_75 gnd n_br2_75 gnd vdd_unselected gnd memorycell
Xwire2l75 n_bl2_75 n_bl2_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r75 n_br2_75 n_br2_76 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_75 gnd gnd n_bl2_76 gnd n_br2_76 gnd vdd_unselected gnd memorycell
Xwire2l76 n_bl2_76 n_bl2_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r76 n_br2_76 n_br2_77 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_76 gnd gnd n_bl2_77 gnd n_br2_77 gnd vdd_unselected gnd memorycell
Xwire2l77 n_bl2_77 n_bl2_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r77 n_br2_77 n_br2_78 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_77 gnd gnd n_bl2_78 gnd n_br2_78 gnd vdd_unselected gnd memorycell
Xwire2l78 n_bl2_78 n_bl2_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r78 n_br2_78 n_br2_79 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_78 gnd gnd n_bl2_79 gnd n_br2_79 gnd vdd_unselected gnd memorycell
Xwire2l79 n_bl2_79 n_bl2_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r79 n_br2_79 n_br2_80 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_79 gnd gnd n_bl2_80 gnd n_br2_80 gnd vdd_unselected gnd memorycell
Xwire2l80 n_bl2_80 n_bl2_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r80 n_br2_80 n_br2_81 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_80 gnd gnd n_bl2_81 gnd n_br2_81 gnd vdd_unselected gnd memorycell
Xwire2l81 n_bl2_81 n_bl2_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r81 n_br2_81 n_br2_82 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_81 gnd gnd n_bl2_82 gnd n_br2_82 gnd vdd_unselected gnd memorycell
Xwire2l82 n_bl2_82 n_bl2_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r82 n_br2_82 n_br2_83 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_82 gnd gnd n_bl2_83 gnd n_br2_83 gnd vdd_unselected gnd memorycell
Xwire2l83 n_bl2_83 n_bl2_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r83 n_br2_83 n_br2_84 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_83 gnd gnd n_bl2_84 gnd n_br2_84 gnd vdd_unselected gnd memorycell
Xwire2l84 n_bl2_84 n_bl2_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r84 n_br2_84 n_br2_85 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_84 gnd gnd n_bl2_85 gnd n_br2_85 gnd vdd_unselected gnd memorycell
Xwire2l85 n_bl2_85 n_bl2_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r85 n_br2_85 n_br2_86 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_85 gnd gnd n_bl2_86 gnd n_br2_86 gnd vdd_unselected gnd memorycell
Xwire2l86 n_bl2_86 n_bl2_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r86 n_br2_86 n_br2_87 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_86 gnd gnd n_bl2_87 gnd n_br2_87 gnd vdd_unselected gnd memorycell
Xwire2l87 n_bl2_87 n_bl2_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r87 n_br2_87 n_br2_88 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_87 gnd gnd n_bl2_88 gnd n_br2_88 gnd vdd_unselected gnd memorycell
Xwire2l88 n_bl2_88 n_bl2_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r88 n_br2_88 n_br2_89 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_88 gnd gnd n_bl2_89 gnd n_br2_89 gnd vdd_unselected gnd memorycell
Xwire2l89 n_bl2_89 n_bl2_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r89 n_br2_89 n_br2_90 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_89 gnd gnd n_bl2_90 gnd n_br2_90 gnd vdd_unselected gnd memorycell
Xwire2l90 n_bl2_90 n_bl2_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r90 n_br2_90 n_br2_91 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_90 gnd gnd n_bl2_91 gnd n_br2_91 gnd vdd_unselected gnd memorycell
Xwire2l91 n_bl2_91 n_bl2_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r91 n_br2_91 n_br2_92 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_91 gnd gnd n_bl2_92 gnd n_br2_92 gnd vdd_unselected gnd memorycell
Xwire2l92 n_bl2_92 n_bl2_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r92 n_br2_92 n_br2_93 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_92 gnd gnd n_bl2_93 gnd n_br2_93 gnd vdd_unselected gnd memorycell
Xwire2l93 n_bl2_93 n_bl2_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r93 n_br2_93 n_br2_94 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_93 gnd gnd n_bl2_94 gnd n_br2_94 gnd vdd_unselected gnd memorycell
Xwire2l94 n_bl2_94 n_bl2_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r94 n_br2_94 n_br2_95 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_94 gnd gnd n_bl2_95 gnd n_br2_95 gnd vdd_unselected gnd memorycell
Xwire2l95 n_bl2_95 n_bl2_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r95 n_br2_95 n_br2_96 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_95 gnd gnd n_bl2_96 gnd n_br2_96 gnd vdd_unselected gnd memorycell
Xwire2l96 n_bl2_96 n_bl2_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r96 n_br2_96 n_br2_97 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_96 gnd gnd n_bl2_97 gnd n_br2_97 gnd vdd_unselected gnd memorycell
Xwire2l97 n_bl2_97 n_bl2_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r97 n_br2_97 n_br2_98 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_97 gnd gnd n_bl2_98 gnd n_br2_98 gnd vdd_unselected gnd memorycell
Xwire2l98 n_bl2_98 n_bl2_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r98 n_br2_98 n_br2_99 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_98 gnd gnd n_bl2_99 gnd n_br2_99 gnd vdd_unselected gnd memorycell
Xwire2l99 n_bl2_99 n_bl2_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r99 n_br2_99 n_br2_100 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_99 gnd gnd n_bl2_100 gnd n_br2_100 gnd vdd_unselected gnd memorycell
Xwire2l100 n_bl2_100 n_bl2_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r100 n_br2_100 n_br2_101 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_100 gnd gnd n_bl2_101 gnd n_br2_101 gnd vdd_unselected gnd memorycell
Xwire2l101 n_bl2_101 n_bl2_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r101 n_br2_101 n_br2_102 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_101 gnd gnd n_bl2_102 gnd n_br2_102 gnd vdd_unselected gnd memorycell
Xwire2l102 n_bl2_102 n_bl2_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r102 n_br2_102 n_br2_103 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_102 gnd gnd n_bl2_103 gnd n_br2_103 gnd vdd_unselected gnd memorycell
Xwire2l103 n_bl2_103 n_bl2_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r103 n_br2_103 n_br2_104 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_103 gnd gnd n_bl2_104 gnd n_br2_104 gnd vdd_unselected gnd memorycell
Xwire2l104 n_bl2_104 n_bl2_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r104 n_br2_104 n_br2_105 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_104 gnd gnd n_bl2_105 gnd n_br2_105 gnd vdd_unselected gnd memorycell
Xwire2l105 n_bl2_105 n_bl2_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r105 n_br2_105 n_br2_106 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_105 gnd gnd n_bl2_106 gnd n_br2_106 gnd vdd_unselected gnd memorycell
Xwire2l106 n_bl2_106 n_bl2_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r106 n_br2_106 n_br2_107 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_106 gnd gnd n_bl2_107 gnd n_br2_107 gnd vdd_unselected gnd memorycell
Xwire2l107 n_bl2_107 n_bl2_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r107 n_br2_107 n_br2_108 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_107 gnd gnd n_bl2_108 gnd n_br2_108 gnd vdd_unselected gnd memorycell
Xwire2l108 n_bl2_108 n_bl2_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r108 n_br2_108 n_br2_109 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_108 gnd gnd n_bl2_109 gnd n_br2_109 gnd vdd_unselected gnd memorycell
Xwire2l109 n_bl2_109 n_bl2_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r109 n_br2_109 n_br2_110 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_109 gnd gnd n_bl2_110 gnd n_br2_110 gnd vdd_unselected gnd memorycell
Xwire2l110 n_bl2_110 n_bl2_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r110 n_br2_110 n_br2_111 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_110 gnd gnd n_bl2_111 gnd n_br2_111 gnd vdd_unselected gnd memorycell
Xwire2l111 n_bl2_111 n_bl2_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r111 n_br2_111 n_br2_112 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_111 gnd gnd n_bl2_112 gnd n_br2_112 gnd vdd_unselected gnd memorycell
Xwire2l112 n_bl2_112 n_bl2_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r112 n_br2_112 n_br2_113 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_112 gnd gnd n_bl2_113 gnd n_br2_113 gnd vdd_unselected gnd memorycell
Xwire2l113 n_bl2_113 n_bl2_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r113 n_br2_113 n_br2_114 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_113 gnd gnd n_bl2_114 gnd n_br2_114 gnd vdd_unselected gnd memorycell
Xwire2l114 n_bl2_114 n_bl2_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r114 n_br2_114 n_br2_115 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_114 gnd gnd n_bl2_115 gnd n_br2_115 gnd vdd_unselected gnd memorycell
Xwire2l115 n_bl2_115 n_bl2_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r115 n_br2_115 n_br2_116 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_115 gnd gnd n_bl2_116 gnd n_br2_116 gnd vdd_unselected gnd memorycell
Xwire2l116 n_bl2_116 n_bl2_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r116 n_br2_116 n_br2_117 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_116 gnd gnd n_bl2_117 gnd n_br2_117 gnd vdd_unselected gnd memorycell
Xwire2l117 n_bl2_117 n_bl2_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r117 n_br2_117 n_br2_118 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_117 gnd gnd n_bl2_118 gnd n_br2_118 gnd vdd_unselected gnd memorycell
Xwire2l118 n_bl2_118 n_bl2_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r118 n_br2_118 n_br2_119 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_118 gnd gnd n_bl2_119 gnd n_br2_119 gnd vdd_unselected gnd memorycell
Xwire2l119 n_bl2_119 n_bl2_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r119 n_br2_119 n_br2_120 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_119 gnd gnd n_bl2_120 gnd n_br2_120 gnd vdd_unselected gnd memorycell
Xwire2l120 n_bl2_120 n_bl2_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r120 n_br2_120 n_br2_121 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_120 gnd gnd n_bl2_121 gnd n_br2_121 gnd vdd_unselected gnd memorycell
Xwire2l121 n_bl2_121 n_bl2_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r121 n_br2_121 n_br2_122 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_121 gnd gnd n_bl2_122 gnd n_br2_122 gnd vdd_unselected gnd memorycell
Xwire2l122 n_bl2_122 n_bl2_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r122 n_br2_122 n_br2_123 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_122 gnd gnd n_bl2_123 gnd n_br2_123 gnd vdd_unselected gnd memorycell
Xwire2l123 n_bl2_123 n_bl2_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r123 n_br2_123 n_br2_124 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_123 gnd gnd n_bl2_124 gnd n_br2_124 gnd vdd_unselected gnd memorycell
Xwire2l124 n_bl2_124 n_bl2_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r124 n_br2_124 n_br2_125 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_124 gnd gnd n_bl2_125 gnd n_br2_125 gnd vdd_unselected gnd memorycell
Xwire2l125 n_bl2_125 n_bl2_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r125 n_br2_125 n_br2_126 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_125 gnd gnd n_bl2_126 gnd n_br2_126 gnd vdd_unselected gnd memorycell
Xwire2l126 n_bl2_126 n_bl2_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r126 n_br2_126 n_br2_127 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_126 gnd gnd n_bl2_127 gnd n_br2_127 gnd vdd_unselected gnd memorycell
Xwire2l127 n_bl2_127 n_bl2_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xwire2r127 n_br2_127 n_br2_128 wire Rw=wire_memorycell_vertical_res/128 Cw=wire_memorycell_vertical_cap/128
Xsram_2_127 n_precharge gnd n_bl2_128 gnd n_br2_128 gnd vdd_unselected gnd memorycell
.IC V(n_bl_0) = 'supply_v_lp' 
.IC V(n_br_0) = 0 
.IC V(Xsram0.n_1_1) = 'supply_v_lp' 
.IC V(Xsram0.n_1_2) = 0 
.IC V(Xsram1.n_1_1) = 'supply_v_lp' 
.IC V(Xsram1.n_1_2) = 0 
.IC V(Xsram2.n_1_1) = 'supply_v_lp' 
.IC V(Xsram2.n_1_2) = 0 
.IC V(Xsram3.n_1_1) = 'supply_v_lp' 
.IC V(Xsram3.n_1_2) = 0 
.IC V(Xsram4.n_1_1) = 'supply_v_lp' 
.IC V(Xsram4.n_1_2) = 0 
.IC V(Xsram5.n_1_1) = 'supply_v_lp' 
.IC V(Xsram5.n_1_2) = 0 
.IC V(Xsram6.n_1_1) = 'supply_v_lp' 
.IC V(Xsram6.n_1_2) = 0 
.IC V(Xsram7.n_1_1) = 'supply_v_lp' 
.IC V(Xsram7.n_1_2) = 0 
.IC V(Xsram8.n_1_1) = 'supply_v_lp' 
.IC V(Xsram8.n_1_2) = 0 
.IC V(Xsram9.n_1_1) = 'supply_v_lp' 
.IC V(Xsram9.n_1_2) = 0 
.IC V(Xsram10.n_1_1) = 'supply_v_lp' 
.IC V(Xsram10.n_1_2) = 0 
.IC V(Xsram11.n_1_1) = 'supply_v_lp' 
.IC V(Xsram11.n_1_2) = 0 
.IC V(Xsram12.n_1_1) = 'supply_v_lp' 
.IC V(Xsram12.n_1_2) = 0 
.IC V(Xsram13.n_1_1) = 'supply_v_lp' 
.IC V(Xsram13.n_1_2) = 0 
.IC V(Xsram14.n_1_1) = 'supply_v_lp' 
.IC V(Xsram14.n_1_2) = 0 
.IC V(Xsram15.n_1_1) = 'supply_v_lp' 
.IC V(Xsram15.n_1_2) = 0 
.IC V(Xsram16.n_1_1) = 'supply_v_lp' 
.IC V(Xsram16.n_1_2) = 0 
.IC V(Xsram17.n_1_1) = 'supply_v_lp' 
.IC V(Xsram17.n_1_2) = 0 
.IC V(Xsram18.n_1_1) = 'supply_v_lp' 
.IC V(Xsram18.n_1_2) = 0 
.IC V(Xsram19.n_1_1) = 'supply_v_lp' 
.IC V(Xsram19.n_1_2) = 0 
.IC V(Xsram20.n_1_1) = 'supply_v_lp' 
.IC V(Xsram20.n_1_2) = 0 
.IC V(Xsram21.n_1_1) = 'supply_v_lp' 
.IC V(Xsram21.n_1_2) = 0 
.IC V(Xsram22.n_1_1) = 'supply_v_lp' 
.IC V(Xsram22.n_1_2) = 0 
.IC V(Xsram23.n_1_1) = 'supply_v_lp' 
.IC V(Xsram23.n_1_2) = 0 
.IC V(Xsram24.n_1_1) = 'supply_v_lp' 
.IC V(Xsram24.n_1_2) = 0 
.IC V(Xsram25.n_1_1) = 'supply_v_lp' 
.IC V(Xsram25.n_1_2) = 0 
.IC V(Xsram26.n_1_1) = 'supply_v_lp' 
.IC V(Xsram26.n_1_2) = 0 
.IC V(Xsram27.n_1_1) = 'supply_v_lp' 
.IC V(Xsram27.n_1_2) = 0 
.IC V(Xsram28.n_1_1) = 'supply_v_lp' 
.IC V(Xsram28.n_1_2) = 0 
.IC V(Xsram29.n_1_1) = 'supply_v_lp' 
.IC V(Xsram29.n_1_2) = 0 
.IC V(Xsram30.n_1_1) = 'supply_v_lp' 
.IC V(Xsram30.n_1_2) = 0 
.IC V(Xsram31.n_1_1) = 'supply_v_lp' 
.IC V(Xsram31.n_1_2) = 0 
.IC V(Xsram32.n_1_1) = 'supply_v_lp' 
.IC V(Xsram32.n_1_2) = 0 
.IC V(Xsram33.n_1_1) = 'supply_v_lp' 
.IC V(Xsram33.n_1_2) = 0 
.IC V(Xsram34.n_1_1) = 'supply_v_lp' 
.IC V(Xsram34.n_1_2) = 0 
.IC V(Xsram35.n_1_1) = 'supply_v_lp' 
.IC V(Xsram35.n_1_2) = 0 
.IC V(Xsram36.n_1_1) = 'supply_v_lp' 
.IC V(Xsram36.n_1_2) = 0 
.IC V(Xsram37.n_1_1) = 'supply_v_lp' 
.IC V(Xsram37.n_1_2) = 0 
.IC V(Xsram38.n_1_1) = 'supply_v_lp' 
.IC V(Xsram38.n_1_2) = 0 
.IC V(Xsram39.n_1_1) = 'supply_v_lp' 
.IC V(Xsram39.n_1_2) = 0 
.IC V(Xsram40.n_1_1) = 'supply_v_lp' 
.IC V(Xsram40.n_1_2) = 0 
.IC V(Xsram41.n_1_1) = 'supply_v_lp' 
.IC V(Xsram41.n_1_2) = 0 
.IC V(Xsram42.n_1_1) = 'supply_v_lp' 
.IC V(Xsram42.n_1_2) = 0 
.IC V(Xsram43.n_1_1) = 'supply_v_lp' 
.IC V(Xsram43.n_1_2) = 0 
.IC V(Xsram44.n_1_1) = 'supply_v_lp' 
.IC V(Xsram44.n_1_2) = 0 
.IC V(Xsram45.n_1_1) = 'supply_v_lp' 
.IC V(Xsram45.n_1_2) = 0 
.IC V(Xsram46.n_1_1) = 'supply_v_lp' 
.IC V(Xsram46.n_1_2) = 0 
.IC V(Xsram47.n_1_1) = 'supply_v_lp' 
.IC V(Xsram47.n_1_2) = 0 
.IC V(Xsram48.n_1_1) = 'supply_v_lp' 
.IC V(Xsram48.n_1_2) = 0 
.IC V(Xsram49.n_1_1) = 'supply_v_lp' 
.IC V(Xsram49.n_1_2) = 0 
.IC V(Xsram50.n_1_1) = 'supply_v_lp' 
.IC V(Xsram50.n_1_2) = 0 
.IC V(Xsram51.n_1_1) = 'supply_v_lp' 
.IC V(Xsram51.n_1_2) = 0 
.IC V(Xsram52.n_1_1) = 'supply_v_lp' 
.IC V(Xsram52.n_1_2) = 0 
.IC V(Xsram53.n_1_1) = 'supply_v_lp' 
.IC V(Xsram53.n_1_2) = 0 
.IC V(Xsram54.n_1_1) = 'supply_v_lp' 
.IC V(Xsram54.n_1_2) = 0 
.IC V(Xsram55.n_1_1) = 'supply_v_lp' 
.IC V(Xsram55.n_1_2) = 0 
.IC V(Xsram56.n_1_1) = 'supply_v_lp' 
.IC V(Xsram56.n_1_2) = 0 
.IC V(Xsram57.n_1_1) = 'supply_v_lp' 
.IC V(Xsram57.n_1_2) = 0 
.IC V(Xsram58.n_1_1) = 'supply_v_lp' 
.IC V(Xsram58.n_1_2) = 0 
.IC V(Xsram59.n_1_1) = 'supply_v_lp' 
.IC V(Xsram59.n_1_2) = 0 
.IC V(Xsram60.n_1_1) = 'supply_v_lp' 
.IC V(Xsram60.n_1_2) = 0 
.IC V(Xsram61.n_1_1) = 'supply_v_lp' 
.IC V(Xsram61.n_1_2) = 0 
.IC V(Xsram62.n_1_1) = 'supply_v_lp' 
.IC V(Xsram62.n_1_2) = 0 
.IC V(Xsram63.n_1_1) = 'supply_v_lp' 
.IC V(Xsram63.n_1_2) = 0 
.IC V(Xsram64.n_1_1) = 'supply_v_lp' 
.IC V(Xsram64.n_1_2) = 0 
.IC V(Xsram65.n_1_1) = 'supply_v_lp' 
.IC V(Xsram65.n_1_2) = 0 
.IC V(Xsram66.n_1_1) = 'supply_v_lp' 
.IC V(Xsram66.n_1_2) = 0 
.IC V(Xsram67.n_1_1) = 'supply_v_lp' 
.IC V(Xsram67.n_1_2) = 0 
.IC V(Xsram68.n_1_1) = 'supply_v_lp' 
.IC V(Xsram68.n_1_2) = 0 
.IC V(Xsram69.n_1_1) = 'supply_v_lp' 
.IC V(Xsram69.n_1_2) = 0 
.IC V(Xsram70.n_1_1) = 'supply_v_lp' 
.IC V(Xsram70.n_1_2) = 0 
.IC V(Xsram71.n_1_1) = 'supply_v_lp' 
.IC V(Xsram71.n_1_2) = 0 
.IC V(Xsram72.n_1_1) = 'supply_v_lp' 
.IC V(Xsram72.n_1_2) = 0 
.IC V(Xsram73.n_1_1) = 'supply_v_lp' 
.IC V(Xsram73.n_1_2) = 0 
.IC V(Xsram74.n_1_1) = 'supply_v_lp' 
.IC V(Xsram74.n_1_2) = 0 
.IC V(Xsram75.n_1_1) = 'supply_v_lp' 
.IC V(Xsram75.n_1_2) = 0 
.IC V(Xsram76.n_1_1) = 'supply_v_lp' 
.IC V(Xsram76.n_1_2) = 0 
.IC V(Xsram77.n_1_1) = 'supply_v_lp' 
.IC V(Xsram77.n_1_2) = 0 
.IC V(Xsram78.n_1_1) = 'supply_v_lp' 
.IC V(Xsram78.n_1_2) = 0 
.IC V(Xsram79.n_1_1) = 'supply_v_lp' 
.IC V(Xsram79.n_1_2) = 0 
.IC V(Xsram80.n_1_1) = 'supply_v_lp' 
.IC V(Xsram80.n_1_2) = 0 
.IC V(Xsram81.n_1_1) = 'supply_v_lp' 
.IC V(Xsram81.n_1_2) = 0 
.IC V(Xsram82.n_1_1) = 'supply_v_lp' 
.IC V(Xsram82.n_1_2) = 0 
.IC V(Xsram83.n_1_1) = 'supply_v_lp' 
.IC V(Xsram83.n_1_2) = 0 
.IC V(Xsram84.n_1_1) = 'supply_v_lp' 
.IC V(Xsram84.n_1_2) = 0 
.IC V(Xsram85.n_1_1) = 'supply_v_lp' 
.IC V(Xsram85.n_1_2) = 0 
.IC V(Xsram86.n_1_1) = 'supply_v_lp' 
.IC V(Xsram86.n_1_2) = 0 
.IC V(Xsram87.n_1_1) = 'supply_v_lp' 
.IC V(Xsram87.n_1_2) = 0 
.IC V(Xsram88.n_1_1) = 'supply_v_lp' 
.IC V(Xsram88.n_1_2) = 0 
.IC V(Xsram89.n_1_1) = 'supply_v_lp' 
.IC V(Xsram89.n_1_2) = 0 
.IC V(Xsram90.n_1_1) = 'supply_v_lp' 
.IC V(Xsram90.n_1_2) = 0 
.IC V(Xsram91.n_1_1) = 'supply_v_lp' 
.IC V(Xsram91.n_1_2) = 0 
.IC V(Xsram92.n_1_1) = 'supply_v_lp' 
.IC V(Xsram92.n_1_2) = 0 
.IC V(Xsram93.n_1_1) = 'supply_v_lp' 
.IC V(Xsram93.n_1_2) = 0 
.IC V(Xsram94.n_1_1) = 'supply_v_lp' 
.IC V(Xsram94.n_1_2) = 0 
.IC V(Xsram95.n_1_1) = 'supply_v_lp' 
.IC V(Xsram95.n_1_2) = 0 
.IC V(Xsram96.n_1_1) = 'supply_v_lp' 
.IC V(Xsram96.n_1_2) = 0 
.IC V(Xsram97.n_1_1) = 'supply_v_lp' 
.IC V(Xsram97.n_1_2) = 0 
.IC V(Xsram98.n_1_1) = 'supply_v_lp' 
.IC V(Xsram98.n_1_2) = 0 
.IC V(Xsram99.n_1_1) = 'supply_v_lp' 
.IC V(Xsram99.n_1_2) = 0 
.IC V(Xsram100.n_1_1) = 'supply_v_lp' 
.IC V(Xsram100.n_1_2) = 0 
.IC V(Xsram101.n_1_1) = 'supply_v_lp' 
.IC V(Xsram101.n_1_2) = 0 
.IC V(Xsram102.n_1_1) = 'supply_v_lp' 
.IC V(Xsram102.n_1_2) = 0 
.IC V(Xsram103.n_1_1) = 'supply_v_lp' 
.IC V(Xsram103.n_1_2) = 0 
.IC V(Xsram104.n_1_1) = 'supply_v_lp' 
.IC V(Xsram104.n_1_2) = 0 
.IC V(Xsram105.n_1_1) = 'supply_v_lp' 
.IC V(Xsram105.n_1_2) = 0 
.IC V(Xsram106.n_1_1) = 'supply_v_lp' 
.IC V(Xsram106.n_1_2) = 0 
.IC V(Xsram107.n_1_1) = 'supply_v_lp' 
.IC V(Xsram107.n_1_2) = 0 
.IC V(Xsram108.n_1_1) = 'supply_v_lp' 
.IC V(Xsram108.n_1_2) = 0 
.IC V(Xsram109.n_1_1) = 'supply_v_lp' 
.IC V(Xsram109.n_1_2) = 0 
.IC V(Xsram110.n_1_1) = 'supply_v_lp' 
.IC V(Xsram110.n_1_2) = 0 
.IC V(Xsram111.n_1_1) = 'supply_v_lp' 
.IC V(Xsram111.n_1_2) = 0 
.IC V(Xsram112.n_1_1) = 'supply_v_lp' 
.IC V(Xsram112.n_1_2) = 0 
.IC V(Xsram113.n_1_1) = 'supply_v_lp' 
.IC V(Xsram113.n_1_2) = 0 
.IC V(Xsram114.n_1_1) = 'supply_v_lp' 
.IC V(Xsram114.n_1_2) = 0 
.IC V(Xsram115.n_1_1) = 'supply_v_lp' 
.IC V(Xsram115.n_1_2) = 0 
.IC V(Xsram116.n_1_1) = 'supply_v_lp' 
.IC V(Xsram116.n_1_2) = 0 
.IC V(Xsram117.n_1_1) = 'supply_v_lp' 
.IC V(Xsram117.n_1_2) = 0 
.IC V(Xsram118.n_1_1) = 'supply_v_lp' 
.IC V(Xsram118.n_1_2) = 0 
.IC V(Xsram119.n_1_1) = 'supply_v_lp' 
.IC V(Xsram119.n_1_2) = 0 
.IC V(Xsram120.n_1_1) = 'supply_v_lp' 
.IC V(Xsram120.n_1_2) = 0 
.IC V(Xsram121.n_1_1) = 'supply_v_lp' 
.IC V(Xsram121.n_1_2) = 0 
.IC V(Xsram122.n_1_1) = 'supply_v_lp' 
.IC V(Xsram122.n_1_2) = 0 
.IC V(Xsram123.n_1_1) = 'supply_v_lp' 
.IC V(Xsram123.n_1_2) = 0 
.IC V(Xsram124.n_1_1) = 'supply_v_lp' 
.IC V(Xsram124.n_1_2) = 0 
.IC V(Xsram125.n_1_1) = 'supply_v_lp' 
.IC V(Xsram125.n_1_2) = 0 
.IC V(Xsram126.n_1_1) = 'supply_v_lp' 
.IC V(Xsram126.n_1_2) = 0 
.IC V(Xsram127.n_1_1) = 'supply_v_lp' 
.IC V(Xsram127.n_1_2) = 0 
.IC V(n_bl0_0) = 'supply_v_lp' 
.IC V(n_br0_0) = 0 
.IC V(Xsram_0_0.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_0.n_1_2) = 0 
.IC V(n_bl1_0) = 'supply_v_lp' 
.IC V(n_br1_0) = 0 
.IC V(Xsram_1_0.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_0.n_1_2) = 0 
.IC V(n_bl2_0) = 'supply_v_lp' 
.IC V(n_br2_0) = 0 
.IC V(Xsram_2_0.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_0.n_1_2) = 0 
.IC V(n_bl0_1) = 'supply_v_lp' 
.IC V(n_br0_1) = 0 
.IC V(Xsram_0_1.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_1.n_1_2) = 0 
.IC V(n_bl1_1) = 'supply_v_lp' 
.IC V(n_br1_1) = 0 
.IC V(Xsram_1_1.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_1.n_1_2) = 0 
.IC V(n_bl2_1) = 'supply_v_lp' 
.IC V(n_br2_1) = 0 
.IC V(Xsram_2_1.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_1.n_1_2) = 0 
.IC V(n_bl0_2) = 'supply_v_lp' 
.IC V(n_br0_2) = 0 
.IC V(Xsram_0_2.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_2.n_1_2) = 0 
.IC V(n_bl1_2) = 'supply_v_lp' 
.IC V(n_br1_2) = 0 
.IC V(Xsram_1_2.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_2.n_1_2) = 0 
.IC V(n_bl2_2) = 'supply_v_lp' 
.IC V(n_br2_2) = 0 
.IC V(Xsram_2_2.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_2.n_1_2) = 0 
.IC V(n_bl0_3) = 'supply_v_lp' 
.IC V(n_br0_3) = 0 
.IC V(Xsram_0_3.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_3.n_1_2) = 0 
.IC V(n_bl1_3) = 'supply_v_lp' 
.IC V(n_br1_3) = 0 
.IC V(Xsram_1_3.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_3.n_1_2) = 0 
.IC V(n_bl2_3) = 'supply_v_lp' 
.IC V(n_br2_3) = 0 
.IC V(Xsram_2_3.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_3.n_1_2) = 0 
.IC V(n_bl0_4) = 'supply_v_lp' 
.IC V(n_br0_4) = 0 
.IC V(Xsram_0_4.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_4.n_1_2) = 0 
.IC V(n_bl1_4) = 'supply_v_lp' 
.IC V(n_br1_4) = 0 
.IC V(Xsram_1_4.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_4.n_1_2) = 0 
.IC V(n_bl2_4) = 'supply_v_lp' 
.IC V(n_br2_4) = 0 
.IC V(Xsram_2_4.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_4.n_1_2) = 0 
.IC V(n_bl0_5) = 'supply_v_lp' 
.IC V(n_br0_5) = 0 
.IC V(Xsram_0_5.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_5.n_1_2) = 0 
.IC V(n_bl1_5) = 'supply_v_lp' 
.IC V(n_br1_5) = 0 
.IC V(Xsram_1_5.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_5.n_1_2) = 0 
.IC V(n_bl2_5) = 'supply_v_lp' 
.IC V(n_br2_5) = 0 
.IC V(Xsram_2_5.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_5.n_1_2) = 0 
.IC V(n_bl0_6) = 'supply_v_lp' 
.IC V(n_br0_6) = 0 
.IC V(Xsram_0_6.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_6.n_1_2) = 0 
.IC V(n_bl1_6) = 'supply_v_lp' 
.IC V(n_br1_6) = 0 
.IC V(Xsram_1_6.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_6.n_1_2) = 0 
.IC V(n_bl2_6) = 'supply_v_lp' 
.IC V(n_br2_6) = 0 
.IC V(Xsram_2_6.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_6.n_1_2) = 0 
.IC V(n_bl0_7) = 'supply_v_lp' 
.IC V(n_br0_7) = 0 
.IC V(Xsram_0_7.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_7.n_1_2) = 0 
.IC V(n_bl1_7) = 'supply_v_lp' 
.IC V(n_br1_7) = 0 
.IC V(Xsram_1_7.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_7.n_1_2) = 0 
.IC V(n_bl2_7) = 'supply_v_lp' 
.IC V(n_br2_7) = 0 
.IC V(Xsram_2_7.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_7.n_1_2) = 0 
.IC V(n_bl0_8) = 'supply_v_lp' 
.IC V(n_br0_8) = 0 
.IC V(Xsram_0_8.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_8.n_1_2) = 0 
.IC V(n_bl1_8) = 'supply_v_lp' 
.IC V(n_br1_8) = 0 
.IC V(Xsram_1_8.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_8.n_1_2) = 0 
.IC V(n_bl2_8) = 'supply_v_lp' 
.IC V(n_br2_8) = 0 
.IC V(Xsram_2_8.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_8.n_1_2) = 0 
.IC V(n_bl0_9) = 'supply_v_lp' 
.IC V(n_br0_9) = 0 
.IC V(Xsram_0_9.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_9.n_1_2) = 0 
.IC V(n_bl1_9) = 'supply_v_lp' 
.IC V(n_br1_9) = 0 
.IC V(Xsram_1_9.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_9.n_1_2) = 0 
.IC V(n_bl2_9) = 'supply_v_lp' 
.IC V(n_br2_9) = 0 
.IC V(Xsram_2_9.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_9.n_1_2) = 0 
.IC V(n_bl0_10) = 'supply_v_lp' 
.IC V(n_br0_10) = 0 
.IC V(Xsram_0_10.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_10.n_1_2) = 0 
.IC V(n_bl1_10) = 'supply_v_lp' 
.IC V(n_br1_10) = 0 
.IC V(Xsram_1_10.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_10.n_1_2) = 0 
.IC V(n_bl2_10) = 'supply_v_lp' 
.IC V(n_br2_10) = 0 
.IC V(Xsram_2_10.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_10.n_1_2) = 0 
.IC V(n_bl0_11) = 'supply_v_lp' 
.IC V(n_br0_11) = 0 
.IC V(Xsram_0_11.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_11.n_1_2) = 0 
.IC V(n_bl1_11) = 'supply_v_lp' 
.IC V(n_br1_11) = 0 
.IC V(Xsram_1_11.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_11.n_1_2) = 0 
.IC V(n_bl2_11) = 'supply_v_lp' 
.IC V(n_br2_11) = 0 
.IC V(Xsram_2_11.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_11.n_1_2) = 0 
.IC V(n_bl0_12) = 'supply_v_lp' 
.IC V(n_br0_12) = 0 
.IC V(Xsram_0_12.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_12.n_1_2) = 0 
.IC V(n_bl1_12) = 'supply_v_lp' 
.IC V(n_br1_12) = 0 
.IC V(Xsram_1_12.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_12.n_1_2) = 0 
.IC V(n_bl2_12) = 'supply_v_lp' 
.IC V(n_br2_12) = 0 
.IC V(Xsram_2_12.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_12.n_1_2) = 0 
.IC V(n_bl0_13) = 'supply_v_lp' 
.IC V(n_br0_13) = 0 
.IC V(Xsram_0_13.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_13.n_1_2) = 0 
.IC V(n_bl1_13) = 'supply_v_lp' 
.IC V(n_br1_13) = 0 
.IC V(Xsram_1_13.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_13.n_1_2) = 0 
.IC V(n_bl2_13) = 'supply_v_lp' 
.IC V(n_br2_13) = 0 
.IC V(Xsram_2_13.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_13.n_1_2) = 0 
.IC V(n_bl0_14) = 'supply_v_lp' 
.IC V(n_br0_14) = 0 
.IC V(Xsram_0_14.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_14.n_1_2) = 0 
.IC V(n_bl1_14) = 'supply_v_lp' 
.IC V(n_br1_14) = 0 
.IC V(Xsram_1_14.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_14.n_1_2) = 0 
.IC V(n_bl2_14) = 'supply_v_lp' 
.IC V(n_br2_14) = 0 
.IC V(Xsram_2_14.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_14.n_1_2) = 0 
.IC V(n_bl0_15) = 'supply_v_lp' 
.IC V(n_br0_15) = 0 
.IC V(Xsram_0_15.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_15.n_1_2) = 0 
.IC V(n_bl1_15) = 'supply_v_lp' 
.IC V(n_br1_15) = 0 
.IC V(Xsram_1_15.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_15.n_1_2) = 0 
.IC V(n_bl2_15) = 'supply_v_lp' 
.IC V(n_br2_15) = 0 
.IC V(Xsram_2_15.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_15.n_1_2) = 0 
.IC V(n_bl0_16) = 'supply_v_lp' 
.IC V(n_br0_16) = 0 
.IC V(Xsram_0_16.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_16.n_1_2) = 0 
.IC V(n_bl1_16) = 'supply_v_lp' 
.IC V(n_br1_16) = 0 
.IC V(Xsram_1_16.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_16.n_1_2) = 0 
.IC V(n_bl2_16) = 'supply_v_lp' 
.IC V(n_br2_16) = 0 
.IC V(Xsram_2_16.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_16.n_1_2) = 0 
.IC V(n_bl0_17) = 'supply_v_lp' 
.IC V(n_br0_17) = 0 
.IC V(Xsram_0_17.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_17.n_1_2) = 0 
.IC V(n_bl1_17) = 'supply_v_lp' 
.IC V(n_br1_17) = 0 
.IC V(Xsram_1_17.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_17.n_1_2) = 0 
.IC V(n_bl2_17) = 'supply_v_lp' 
.IC V(n_br2_17) = 0 
.IC V(Xsram_2_17.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_17.n_1_2) = 0 
.IC V(n_bl0_18) = 'supply_v_lp' 
.IC V(n_br0_18) = 0 
.IC V(Xsram_0_18.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_18.n_1_2) = 0 
.IC V(n_bl1_18) = 'supply_v_lp' 
.IC V(n_br1_18) = 0 
.IC V(Xsram_1_18.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_18.n_1_2) = 0 
.IC V(n_bl2_18) = 'supply_v_lp' 
.IC V(n_br2_18) = 0 
.IC V(Xsram_2_18.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_18.n_1_2) = 0 
.IC V(n_bl0_19) = 'supply_v_lp' 
.IC V(n_br0_19) = 0 
.IC V(Xsram_0_19.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_19.n_1_2) = 0 
.IC V(n_bl1_19) = 'supply_v_lp' 
.IC V(n_br1_19) = 0 
.IC V(Xsram_1_19.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_19.n_1_2) = 0 
.IC V(n_bl2_19) = 'supply_v_lp' 
.IC V(n_br2_19) = 0 
.IC V(Xsram_2_19.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_19.n_1_2) = 0 
.IC V(n_bl0_20) = 'supply_v_lp' 
.IC V(n_br0_20) = 0 
.IC V(Xsram_0_20.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_20.n_1_2) = 0 
.IC V(n_bl1_20) = 'supply_v_lp' 
.IC V(n_br1_20) = 0 
.IC V(Xsram_1_20.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_20.n_1_2) = 0 
.IC V(n_bl2_20) = 'supply_v_lp' 
.IC V(n_br2_20) = 0 
.IC V(Xsram_2_20.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_20.n_1_2) = 0 
.IC V(n_bl0_21) = 'supply_v_lp' 
.IC V(n_br0_21) = 0 
.IC V(Xsram_0_21.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_21.n_1_2) = 0 
.IC V(n_bl1_21) = 'supply_v_lp' 
.IC V(n_br1_21) = 0 
.IC V(Xsram_1_21.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_21.n_1_2) = 0 
.IC V(n_bl2_21) = 'supply_v_lp' 
.IC V(n_br2_21) = 0 
.IC V(Xsram_2_21.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_21.n_1_2) = 0 
.IC V(n_bl0_22) = 'supply_v_lp' 
.IC V(n_br0_22) = 0 
.IC V(Xsram_0_22.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_22.n_1_2) = 0 
.IC V(n_bl1_22) = 'supply_v_lp' 
.IC V(n_br1_22) = 0 
.IC V(Xsram_1_22.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_22.n_1_2) = 0 
.IC V(n_bl2_22) = 'supply_v_lp' 
.IC V(n_br2_22) = 0 
.IC V(Xsram_2_22.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_22.n_1_2) = 0 
.IC V(n_bl0_23) = 'supply_v_lp' 
.IC V(n_br0_23) = 0 
.IC V(Xsram_0_23.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_23.n_1_2) = 0 
.IC V(n_bl1_23) = 'supply_v_lp' 
.IC V(n_br1_23) = 0 
.IC V(Xsram_1_23.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_23.n_1_2) = 0 
.IC V(n_bl2_23) = 'supply_v_lp' 
.IC V(n_br2_23) = 0 
.IC V(Xsram_2_23.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_23.n_1_2) = 0 
.IC V(n_bl0_24) = 'supply_v_lp' 
.IC V(n_br0_24) = 0 
.IC V(Xsram_0_24.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_24.n_1_2) = 0 
.IC V(n_bl1_24) = 'supply_v_lp' 
.IC V(n_br1_24) = 0 
.IC V(Xsram_1_24.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_24.n_1_2) = 0 
.IC V(n_bl2_24) = 'supply_v_lp' 
.IC V(n_br2_24) = 0 
.IC V(Xsram_2_24.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_24.n_1_2) = 0 
.IC V(n_bl0_25) = 'supply_v_lp' 
.IC V(n_br0_25) = 0 
.IC V(Xsram_0_25.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_25.n_1_2) = 0 
.IC V(n_bl1_25) = 'supply_v_lp' 
.IC V(n_br1_25) = 0 
.IC V(Xsram_1_25.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_25.n_1_2) = 0 
.IC V(n_bl2_25) = 'supply_v_lp' 
.IC V(n_br2_25) = 0 
.IC V(Xsram_2_25.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_25.n_1_2) = 0 
.IC V(n_bl0_26) = 'supply_v_lp' 
.IC V(n_br0_26) = 0 
.IC V(Xsram_0_26.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_26.n_1_2) = 0 
.IC V(n_bl1_26) = 'supply_v_lp' 
.IC V(n_br1_26) = 0 
.IC V(Xsram_1_26.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_26.n_1_2) = 0 
.IC V(n_bl2_26) = 'supply_v_lp' 
.IC V(n_br2_26) = 0 
.IC V(Xsram_2_26.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_26.n_1_2) = 0 
.IC V(n_bl0_27) = 'supply_v_lp' 
.IC V(n_br0_27) = 0 
.IC V(Xsram_0_27.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_27.n_1_2) = 0 
.IC V(n_bl1_27) = 'supply_v_lp' 
.IC V(n_br1_27) = 0 
.IC V(Xsram_1_27.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_27.n_1_2) = 0 
.IC V(n_bl2_27) = 'supply_v_lp' 
.IC V(n_br2_27) = 0 
.IC V(Xsram_2_27.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_27.n_1_2) = 0 
.IC V(n_bl0_28) = 'supply_v_lp' 
.IC V(n_br0_28) = 0 
.IC V(Xsram_0_28.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_28.n_1_2) = 0 
.IC V(n_bl1_28) = 'supply_v_lp' 
.IC V(n_br1_28) = 0 
.IC V(Xsram_1_28.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_28.n_1_2) = 0 
.IC V(n_bl2_28) = 'supply_v_lp' 
.IC V(n_br2_28) = 0 
.IC V(Xsram_2_28.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_28.n_1_2) = 0 
.IC V(n_bl0_29) = 'supply_v_lp' 
.IC V(n_br0_29) = 0 
.IC V(Xsram_0_29.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_29.n_1_2) = 0 
.IC V(n_bl1_29) = 'supply_v_lp' 
.IC V(n_br1_29) = 0 
.IC V(Xsram_1_29.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_29.n_1_2) = 0 
.IC V(n_bl2_29) = 'supply_v_lp' 
.IC V(n_br2_29) = 0 
.IC V(Xsram_2_29.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_29.n_1_2) = 0 
.IC V(n_bl0_30) = 'supply_v_lp' 
.IC V(n_br0_30) = 0 
.IC V(Xsram_0_30.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_30.n_1_2) = 0 
.IC V(n_bl1_30) = 'supply_v_lp' 
.IC V(n_br1_30) = 0 
.IC V(Xsram_1_30.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_30.n_1_2) = 0 
.IC V(n_bl2_30) = 'supply_v_lp' 
.IC V(n_br2_30) = 0 
.IC V(Xsram_2_30.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_30.n_1_2) = 0 
.IC V(n_bl0_31) = 'supply_v_lp' 
.IC V(n_br0_31) = 0 
.IC V(Xsram_0_31.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_31.n_1_2) = 0 
.IC V(n_bl1_31) = 'supply_v_lp' 
.IC V(n_br1_31) = 0 
.IC V(Xsram_1_31.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_31.n_1_2) = 0 
.IC V(n_bl2_31) = 'supply_v_lp' 
.IC V(n_br2_31) = 0 
.IC V(Xsram_2_31.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_31.n_1_2) = 0 
.IC V(n_bl0_32) = 'supply_v_lp' 
.IC V(n_br0_32) = 0 
.IC V(Xsram_0_32.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_32.n_1_2) = 0 
.IC V(n_bl1_32) = 'supply_v_lp' 
.IC V(n_br1_32) = 0 
.IC V(Xsram_1_32.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_32.n_1_2) = 0 
.IC V(n_bl2_32) = 'supply_v_lp' 
.IC V(n_br2_32) = 0 
.IC V(Xsram_2_32.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_32.n_1_2) = 0 
.IC V(n_bl0_33) = 'supply_v_lp' 
.IC V(n_br0_33) = 0 
.IC V(Xsram_0_33.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_33.n_1_2) = 0 
.IC V(n_bl1_33) = 'supply_v_lp' 
.IC V(n_br1_33) = 0 
.IC V(Xsram_1_33.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_33.n_1_2) = 0 
.IC V(n_bl2_33) = 'supply_v_lp' 
.IC V(n_br2_33) = 0 
.IC V(Xsram_2_33.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_33.n_1_2) = 0 
.IC V(n_bl0_34) = 'supply_v_lp' 
.IC V(n_br0_34) = 0 
.IC V(Xsram_0_34.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_34.n_1_2) = 0 
.IC V(n_bl1_34) = 'supply_v_lp' 
.IC V(n_br1_34) = 0 
.IC V(Xsram_1_34.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_34.n_1_2) = 0 
.IC V(n_bl2_34) = 'supply_v_lp' 
.IC V(n_br2_34) = 0 
.IC V(Xsram_2_34.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_34.n_1_2) = 0 
.IC V(n_bl0_35) = 'supply_v_lp' 
.IC V(n_br0_35) = 0 
.IC V(Xsram_0_35.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_35.n_1_2) = 0 
.IC V(n_bl1_35) = 'supply_v_lp' 
.IC V(n_br1_35) = 0 
.IC V(Xsram_1_35.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_35.n_1_2) = 0 
.IC V(n_bl2_35) = 'supply_v_lp' 
.IC V(n_br2_35) = 0 
.IC V(Xsram_2_35.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_35.n_1_2) = 0 
.IC V(n_bl0_36) = 'supply_v_lp' 
.IC V(n_br0_36) = 0 
.IC V(Xsram_0_36.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_36.n_1_2) = 0 
.IC V(n_bl1_36) = 'supply_v_lp' 
.IC V(n_br1_36) = 0 
.IC V(Xsram_1_36.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_36.n_1_2) = 0 
.IC V(n_bl2_36) = 'supply_v_lp' 
.IC V(n_br2_36) = 0 
.IC V(Xsram_2_36.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_36.n_1_2) = 0 
.IC V(n_bl0_37) = 'supply_v_lp' 
.IC V(n_br0_37) = 0 
.IC V(Xsram_0_37.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_37.n_1_2) = 0 
.IC V(n_bl1_37) = 'supply_v_lp' 
.IC V(n_br1_37) = 0 
.IC V(Xsram_1_37.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_37.n_1_2) = 0 
.IC V(n_bl2_37) = 'supply_v_lp' 
.IC V(n_br2_37) = 0 
.IC V(Xsram_2_37.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_37.n_1_2) = 0 
.IC V(n_bl0_38) = 'supply_v_lp' 
.IC V(n_br0_38) = 0 
.IC V(Xsram_0_38.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_38.n_1_2) = 0 
.IC V(n_bl1_38) = 'supply_v_lp' 
.IC V(n_br1_38) = 0 
.IC V(Xsram_1_38.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_38.n_1_2) = 0 
.IC V(n_bl2_38) = 'supply_v_lp' 
.IC V(n_br2_38) = 0 
.IC V(Xsram_2_38.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_38.n_1_2) = 0 
.IC V(n_bl0_39) = 'supply_v_lp' 
.IC V(n_br0_39) = 0 
.IC V(Xsram_0_39.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_39.n_1_2) = 0 
.IC V(n_bl1_39) = 'supply_v_lp' 
.IC V(n_br1_39) = 0 
.IC V(Xsram_1_39.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_39.n_1_2) = 0 
.IC V(n_bl2_39) = 'supply_v_lp' 
.IC V(n_br2_39) = 0 
.IC V(Xsram_2_39.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_39.n_1_2) = 0 
.IC V(n_bl0_40) = 'supply_v_lp' 
.IC V(n_br0_40) = 0 
.IC V(Xsram_0_40.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_40.n_1_2) = 0 
.IC V(n_bl1_40) = 'supply_v_lp' 
.IC V(n_br1_40) = 0 
.IC V(Xsram_1_40.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_40.n_1_2) = 0 
.IC V(n_bl2_40) = 'supply_v_lp' 
.IC V(n_br2_40) = 0 
.IC V(Xsram_2_40.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_40.n_1_2) = 0 
.IC V(n_bl0_41) = 'supply_v_lp' 
.IC V(n_br0_41) = 0 
.IC V(Xsram_0_41.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_41.n_1_2) = 0 
.IC V(n_bl1_41) = 'supply_v_lp' 
.IC V(n_br1_41) = 0 
.IC V(Xsram_1_41.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_41.n_1_2) = 0 
.IC V(n_bl2_41) = 'supply_v_lp' 
.IC V(n_br2_41) = 0 
.IC V(Xsram_2_41.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_41.n_1_2) = 0 
.IC V(n_bl0_42) = 'supply_v_lp' 
.IC V(n_br0_42) = 0 
.IC V(Xsram_0_42.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_42.n_1_2) = 0 
.IC V(n_bl1_42) = 'supply_v_lp' 
.IC V(n_br1_42) = 0 
.IC V(Xsram_1_42.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_42.n_1_2) = 0 
.IC V(n_bl2_42) = 'supply_v_lp' 
.IC V(n_br2_42) = 0 
.IC V(Xsram_2_42.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_42.n_1_2) = 0 
.IC V(n_bl0_43) = 'supply_v_lp' 
.IC V(n_br0_43) = 0 
.IC V(Xsram_0_43.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_43.n_1_2) = 0 
.IC V(n_bl1_43) = 'supply_v_lp' 
.IC V(n_br1_43) = 0 
.IC V(Xsram_1_43.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_43.n_1_2) = 0 
.IC V(n_bl2_43) = 'supply_v_lp' 
.IC V(n_br2_43) = 0 
.IC V(Xsram_2_43.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_43.n_1_2) = 0 
.IC V(n_bl0_44) = 'supply_v_lp' 
.IC V(n_br0_44) = 0 
.IC V(Xsram_0_44.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_44.n_1_2) = 0 
.IC V(n_bl1_44) = 'supply_v_lp' 
.IC V(n_br1_44) = 0 
.IC V(Xsram_1_44.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_44.n_1_2) = 0 
.IC V(n_bl2_44) = 'supply_v_lp' 
.IC V(n_br2_44) = 0 
.IC V(Xsram_2_44.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_44.n_1_2) = 0 
.IC V(n_bl0_45) = 'supply_v_lp' 
.IC V(n_br0_45) = 0 
.IC V(Xsram_0_45.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_45.n_1_2) = 0 
.IC V(n_bl1_45) = 'supply_v_lp' 
.IC V(n_br1_45) = 0 
.IC V(Xsram_1_45.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_45.n_1_2) = 0 
.IC V(n_bl2_45) = 'supply_v_lp' 
.IC V(n_br2_45) = 0 
.IC V(Xsram_2_45.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_45.n_1_2) = 0 
.IC V(n_bl0_46) = 'supply_v_lp' 
.IC V(n_br0_46) = 0 
.IC V(Xsram_0_46.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_46.n_1_2) = 0 
.IC V(n_bl1_46) = 'supply_v_lp' 
.IC V(n_br1_46) = 0 
.IC V(Xsram_1_46.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_46.n_1_2) = 0 
.IC V(n_bl2_46) = 'supply_v_lp' 
.IC V(n_br2_46) = 0 
.IC V(Xsram_2_46.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_46.n_1_2) = 0 
.IC V(n_bl0_47) = 'supply_v_lp' 
.IC V(n_br0_47) = 0 
.IC V(Xsram_0_47.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_47.n_1_2) = 0 
.IC V(n_bl1_47) = 'supply_v_lp' 
.IC V(n_br1_47) = 0 
.IC V(Xsram_1_47.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_47.n_1_2) = 0 
.IC V(n_bl2_47) = 'supply_v_lp' 
.IC V(n_br2_47) = 0 
.IC V(Xsram_2_47.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_47.n_1_2) = 0 
.IC V(n_bl0_48) = 'supply_v_lp' 
.IC V(n_br0_48) = 0 
.IC V(Xsram_0_48.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_48.n_1_2) = 0 
.IC V(n_bl1_48) = 'supply_v_lp' 
.IC V(n_br1_48) = 0 
.IC V(Xsram_1_48.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_48.n_1_2) = 0 
.IC V(n_bl2_48) = 'supply_v_lp' 
.IC V(n_br2_48) = 0 
.IC V(Xsram_2_48.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_48.n_1_2) = 0 
.IC V(n_bl0_49) = 'supply_v_lp' 
.IC V(n_br0_49) = 0 
.IC V(Xsram_0_49.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_49.n_1_2) = 0 
.IC V(n_bl1_49) = 'supply_v_lp' 
.IC V(n_br1_49) = 0 
.IC V(Xsram_1_49.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_49.n_1_2) = 0 
.IC V(n_bl2_49) = 'supply_v_lp' 
.IC V(n_br2_49) = 0 
.IC V(Xsram_2_49.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_49.n_1_2) = 0 
.IC V(n_bl0_50) = 'supply_v_lp' 
.IC V(n_br0_50) = 0 
.IC V(Xsram_0_50.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_50.n_1_2) = 0 
.IC V(n_bl1_50) = 'supply_v_lp' 
.IC V(n_br1_50) = 0 
.IC V(Xsram_1_50.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_50.n_1_2) = 0 
.IC V(n_bl2_50) = 'supply_v_lp' 
.IC V(n_br2_50) = 0 
.IC V(Xsram_2_50.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_50.n_1_2) = 0 
.IC V(n_bl0_51) = 'supply_v_lp' 
.IC V(n_br0_51) = 0 
.IC V(Xsram_0_51.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_51.n_1_2) = 0 
.IC V(n_bl1_51) = 'supply_v_lp' 
.IC V(n_br1_51) = 0 
.IC V(Xsram_1_51.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_51.n_1_2) = 0 
.IC V(n_bl2_51) = 'supply_v_lp' 
.IC V(n_br2_51) = 0 
.IC V(Xsram_2_51.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_51.n_1_2) = 0 
.IC V(n_bl0_52) = 'supply_v_lp' 
.IC V(n_br0_52) = 0 
.IC V(Xsram_0_52.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_52.n_1_2) = 0 
.IC V(n_bl1_52) = 'supply_v_lp' 
.IC V(n_br1_52) = 0 
.IC V(Xsram_1_52.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_52.n_1_2) = 0 
.IC V(n_bl2_52) = 'supply_v_lp' 
.IC V(n_br2_52) = 0 
.IC V(Xsram_2_52.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_52.n_1_2) = 0 
.IC V(n_bl0_53) = 'supply_v_lp' 
.IC V(n_br0_53) = 0 
.IC V(Xsram_0_53.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_53.n_1_2) = 0 
.IC V(n_bl1_53) = 'supply_v_lp' 
.IC V(n_br1_53) = 0 
.IC V(Xsram_1_53.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_53.n_1_2) = 0 
.IC V(n_bl2_53) = 'supply_v_lp' 
.IC V(n_br2_53) = 0 
.IC V(Xsram_2_53.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_53.n_1_2) = 0 
.IC V(n_bl0_54) = 'supply_v_lp' 
.IC V(n_br0_54) = 0 
.IC V(Xsram_0_54.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_54.n_1_2) = 0 
.IC V(n_bl1_54) = 'supply_v_lp' 
.IC V(n_br1_54) = 0 
.IC V(Xsram_1_54.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_54.n_1_2) = 0 
.IC V(n_bl2_54) = 'supply_v_lp' 
.IC V(n_br2_54) = 0 
.IC V(Xsram_2_54.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_54.n_1_2) = 0 
.IC V(n_bl0_55) = 'supply_v_lp' 
.IC V(n_br0_55) = 0 
.IC V(Xsram_0_55.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_55.n_1_2) = 0 
.IC V(n_bl1_55) = 'supply_v_lp' 
.IC V(n_br1_55) = 0 
.IC V(Xsram_1_55.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_55.n_1_2) = 0 
.IC V(n_bl2_55) = 'supply_v_lp' 
.IC V(n_br2_55) = 0 
.IC V(Xsram_2_55.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_55.n_1_2) = 0 
.IC V(n_bl0_56) = 'supply_v_lp' 
.IC V(n_br0_56) = 0 
.IC V(Xsram_0_56.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_56.n_1_2) = 0 
.IC V(n_bl1_56) = 'supply_v_lp' 
.IC V(n_br1_56) = 0 
.IC V(Xsram_1_56.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_56.n_1_2) = 0 
.IC V(n_bl2_56) = 'supply_v_lp' 
.IC V(n_br2_56) = 0 
.IC V(Xsram_2_56.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_56.n_1_2) = 0 
.IC V(n_bl0_57) = 'supply_v_lp' 
.IC V(n_br0_57) = 0 
.IC V(Xsram_0_57.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_57.n_1_2) = 0 
.IC V(n_bl1_57) = 'supply_v_lp' 
.IC V(n_br1_57) = 0 
.IC V(Xsram_1_57.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_57.n_1_2) = 0 
.IC V(n_bl2_57) = 'supply_v_lp' 
.IC V(n_br2_57) = 0 
.IC V(Xsram_2_57.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_57.n_1_2) = 0 
.IC V(n_bl0_58) = 'supply_v_lp' 
.IC V(n_br0_58) = 0 
.IC V(Xsram_0_58.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_58.n_1_2) = 0 
.IC V(n_bl1_58) = 'supply_v_lp' 
.IC V(n_br1_58) = 0 
.IC V(Xsram_1_58.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_58.n_1_2) = 0 
.IC V(n_bl2_58) = 'supply_v_lp' 
.IC V(n_br2_58) = 0 
.IC V(Xsram_2_58.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_58.n_1_2) = 0 
.IC V(n_bl0_59) = 'supply_v_lp' 
.IC V(n_br0_59) = 0 
.IC V(Xsram_0_59.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_59.n_1_2) = 0 
.IC V(n_bl1_59) = 'supply_v_lp' 
.IC V(n_br1_59) = 0 
.IC V(Xsram_1_59.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_59.n_1_2) = 0 
.IC V(n_bl2_59) = 'supply_v_lp' 
.IC V(n_br2_59) = 0 
.IC V(Xsram_2_59.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_59.n_1_2) = 0 
.IC V(n_bl0_60) = 'supply_v_lp' 
.IC V(n_br0_60) = 0 
.IC V(Xsram_0_60.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_60.n_1_2) = 0 
.IC V(n_bl1_60) = 'supply_v_lp' 
.IC V(n_br1_60) = 0 
.IC V(Xsram_1_60.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_60.n_1_2) = 0 
.IC V(n_bl2_60) = 'supply_v_lp' 
.IC V(n_br2_60) = 0 
.IC V(Xsram_2_60.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_60.n_1_2) = 0 
.IC V(n_bl0_61) = 'supply_v_lp' 
.IC V(n_br0_61) = 0 
.IC V(Xsram_0_61.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_61.n_1_2) = 0 
.IC V(n_bl1_61) = 'supply_v_lp' 
.IC V(n_br1_61) = 0 
.IC V(Xsram_1_61.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_61.n_1_2) = 0 
.IC V(n_bl2_61) = 'supply_v_lp' 
.IC V(n_br2_61) = 0 
.IC V(Xsram_2_61.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_61.n_1_2) = 0 
.IC V(n_bl0_62) = 'supply_v_lp' 
.IC V(n_br0_62) = 0 
.IC V(Xsram_0_62.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_62.n_1_2) = 0 
.IC V(n_bl1_62) = 'supply_v_lp' 
.IC V(n_br1_62) = 0 
.IC V(Xsram_1_62.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_62.n_1_2) = 0 
.IC V(n_bl2_62) = 'supply_v_lp' 
.IC V(n_br2_62) = 0 
.IC V(Xsram_2_62.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_62.n_1_2) = 0 
.IC V(n_bl0_63) = 'supply_v_lp' 
.IC V(n_br0_63) = 0 
.IC V(Xsram_0_63.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_63.n_1_2) = 0 
.IC V(n_bl1_63) = 'supply_v_lp' 
.IC V(n_br1_63) = 0 
.IC V(Xsram_1_63.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_63.n_1_2) = 0 
.IC V(n_bl2_63) = 'supply_v_lp' 
.IC V(n_br2_63) = 0 
.IC V(Xsram_2_63.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_63.n_1_2) = 0 
.IC V(n_bl0_64) = 'supply_v_lp' 
.IC V(n_br0_64) = 0 
.IC V(Xsram_0_64.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_64.n_1_2) = 0 
.IC V(n_bl1_64) = 'supply_v_lp' 
.IC V(n_br1_64) = 0 
.IC V(Xsram_1_64.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_64.n_1_2) = 0 
.IC V(n_bl2_64) = 'supply_v_lp' 
.IC V(n_br2_64) = 0 
.IC V(Xsram_2_64.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_64.n_1_2) = 0 
.IC V(n_bl0_65) = 'supply_v_lp' 
.IC V(n_br0_65) = 0 
.IC V(Xsram_0_65.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_65.n_1_2) = 0 
.IC V(n_bl1_65) = 'supply_v_lp' 
.IC V(n_br1_65) = 0 
.IC V(Xsram_1_65.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_65.n_1_2) = 0 
.IC V(n_bl2_65) = 'supply_v_lp' 
.IC V(n_br2_65) = 0 
.IC V(Xsram_2_65.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_65.n_1_2) = 0 
.IC V(n_bl0_66) = 'supply_v_lp' 
.IC V(n_br0_66) = 0 
.IC V(Xsram_0_66.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_66.n_1_2) = 0 
.IC V(n_bl1_66) = 'supply_v_lp' 
.IC V(n_br1_66) = 0 
.IC V(Xsram_1_66.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_66.n_1_2) = 0 
.IC V(n_bl2_66) = 'supply_v_lp' 
.IC V(n_br2_66) = 0 
.IC V(Xsram_2_66.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_66.n_1_2) = 0 
.IC V(n_bl0_67) = 'supply_v_lp' 
.IC V(n_br0_67) = 0 
.IC V(Xsram_0_67.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_67.n_1_2) = 0 
.IC V(n_bl1_67) = 'supply_v_lp' 
.IC V(n_br1_67) = 0 
.IC V(Xsram_1_67.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_67.n_1_2) = 0 
.IC V(n_bl2_67) = 'supply_v_lp' 
.IC V(n_br2_67) = 0 
.IC V(Xsram_2_67.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_67.n_1_2) = 0 
.IC V(n_bl0_68) = 'supply_v_lp' 
.IC V(n_br0_68) = 0 
.IC V(Xsram_0_68.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_68.n_1_2) = 0 
.IC V(n_bl1_68) = 'supply_v_lp' 
.IC V(n_br1_68) = 0 
.IC V(Xsram_1_68.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_68.n_1_2) = 0 
.IC V(n_bl2_68) = 'supply_v_lp' 
.IC V(n_br2_68) = 0 
.IC V(Xsram_2_68.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_68.n_1_2) = 0 
.IC V(n_bl0_69) = 'supply_v_lp' 
.IC V(n_br0_69) = 0 
.IC V(Xsram_0_69.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_69.n_1_2) = 0 
.IC V(n_bl1_69) = 'supply_v_lp' 
.IC V(n_br1_69) = 0 
.IC V(Xsram_1_69.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_69.n_1_2) = 0 
.IC V(n_bl2_69) = 'supply_v_lp' 
.IC V(n_br2_69) = 0 
.IC V(Xsram_2_69.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_69.n_1_2) = 0 
.IC V(n_bl0_70) = 'supply_v_lp' 
.IC V(n_br0_70) = 0 
.IC V(Xsram_0_70.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_70.n_1_2) = 0 
.IC V(n_bl1_70) = 'supply_v_lp' 
.IC V(n_br1_70) = 0 
.IC V(Xsram_1_70.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_70.n_1_2) = 0 
.IC V(n_bl2_70) = 'supply_v_lp' 
.IC V(n_br2_70) = 0 
.IC V(Xsram_2_70.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_70.n_1_2) = 0 
.IC V(n_bl0_71) = 'supply_v_lp' 
.IC V(n_br0_71) = 0 
.IC V(Xsram_0_71.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_71.n_1_2) = 0 
.IC V(n_bl1_71) = 'supply_v_lp' 
.IC V(n_br1_71) = 0 
.IC V(Xsram_1_71.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_71.n_1_2) = 0 
.IC V(n_bl2_71) = 'supply_v_lp' 
.IC V(n_br2_71) = 0 
.IC V(Xsram_2_71.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_71.n_1_2) = 0 
.IC V(n_bl0_72) = 'supply_v_lp' 
.IC V(n_br0_72) = 0 
.IC V(Xsram_0_72.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_72.n_1_2) = 0 
.IC V(n_bl1_72) = 'supply_v_lp' 
.IC V(n_br1_72) = 0 
.IC V(Xsram_1_72.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_72.n_1_2) = 0 
.IC V(n_bl2_72) = 'supply_v_lp' 
.IC V(n_br2_72) = 0 
.IC V(Xsram_2_72.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_72.n_1_2) = 0 
.IC V(n_bl0_73) = 'supply_v_lp' 
.IC V(n_br0_73) = 0 
.IC V(Xsram_0_73.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_73.n_1_2) = 0 
.IC V(n_bl1_73) = 'supply_v_lp' 
.IC V(n_br1_73) = 0 
.IC V(Xsram_1_73.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_73.n_1_2) = 0 
.IC V(n_bl2_73) = 'supply_v_lp' 
.IC V(n_br2_73) = 0 
.IC V(Xsram_2_73.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_73.n_1_2) = 0 
.IC V(n_bl0_74) = 'supply_v_lp' 
.IC V(n_br0_74) = 0 
.IC V(Xsram_0_74.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_74.n_1_2) = 0 
.IC V(n_bl1_74) = 'supply_v_lp' 
.IC V(n_br1_74) = 0 
.IC V(Xsram_1_74.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_74.n_1_2) = 0 
.IC V(n_bl2_74) = 'supply_v_lp' 
.IC V(n_br2_74) = 0 
.IC V(Xsram_2_74.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_74.n_1_2) = 0 
.IC V(n_bl0_75) = 'supply_v_lp' 
.IC V(n_br0_75) = 0 
.IC V(Xsram_0_75.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_75.n_1_2) = 0 
.IC V(n_bl1_75) = 'supply_v_lp' 
.IC V(n_br1_75) = 0 
.IC V(Xsram_1_75.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_75.n_1_2) = 0 
.IC V(n_bl2_75) = 'supply_v_lp' 
.IC V(n_br2_75) = 0 
.IC V(Xsram_2_75.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_75.n_1_2) = 0 
.IC V(n_bl0_76) = 'supply_v_lp' 
.IC V(n_br0_76) = 0 
.IC V(Xsram_0_76.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_76.n_1_2) = 0 
.IC V(n_bl1_76) = 'supply_v_lp' 
.IC V(n_br1_76) = 0 
.IC V(Xsram_1_76.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_76.n_1_2) = 0 
.IC V(n_bl2_76) = 'supply_v_lp' 
.IC V(n_br2_76) = 0 
.IC V(Xsram_2_76.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_76.n_1_2) = 0 
.IC V(n_bl0_77) = 'supply_v_lp' 
.IC V(n_br0_77) = 0 
.IC V(Xsram_0_77.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_77.n_1_2) = 0 
.IC V(n_bl1_77) = 'supply_v_lp' 
.IC V(n_br1_77) = 0 
.IC V(Xsram_1_77.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_77.n_1_2) = 0 
.IC V(n_bl2_77) = 'supply_v_lp' 
.IC V(n_br2_77) = 0 
.IC V(Xsram_2_77.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_77.n_1_2) = 0 
.IC V(n_bl0_78) = 'supply_v_lp' 
.IC V(n_br0_78) = 0 
.IC V(Xsram_0_78.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_78.n_1_2) = 0 
.IC V(n_bl1_78) = 'supply_v_lp' 
.IC V(n_br1_78) = 0 
.IC V(Xsram_1_78.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_78.n_1_2) = 0 
.IC V(n_bl2_78) = 'supply_v_lp' 
.IC V(n_br2_78) = 0 
.IC V(Xsram_2_78.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_78.n_1_2) = 0 
.IC V(n_bl0_79) = 'supply_v_lp' 
.IC V(n_br0_79) = 0 
.IC V(Xsram_0_79.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_79.n_1_2) = 0 
.IC V(n_bl1_79) = 'supply_v_lp' 
.IC V(n_br1_79) = 0 
.IC V(Xsram_1_79.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_79.n_1_2) = 0 
.IC V(n_bl2_79) = 'supply_v_lp' 
.IC V(n_br2_79) = 0 
.IC V(Xsram_2_79.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_79.n_1_2) = 0 
.IC V(n_bl0_80) = 'supply_v_lp' 
.IC V(n_br0_80) = 0 
.IC V(Xsram_0_80.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_80.n_1_2) = 0 
.IC V(n_bl1_80) = 'supply_v_lp' 
.IC V(n_br1_80) = 0 
.IC V(Xsram_1_80.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_80.n_1_2) = 0 
.IC V(n_bl2_80) = 'supply_v_lp' 
.IC V(n_br2_80) = 0 
.IC V(Xsram_2_80.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_80.n_1_2) = 0 
.IC V(n_bl0_81) = 'supply_v_lp' 
.IC V(n_br0_81) = 0 
.IC V(Xsram_0_81.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_81.n_1_2) = 0 
.IC V(n_bl1_81) = 'supply_v_lp' 
.IC V(n_br1_81) = 0 
.IC V(Xsram_1_81.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_81.n_1_2) = 0 
.IC V(n_bl2_81) = 'supply_v_lp' 
.IC V(n_br2_81) = 0 
.IC V(Xsram_2_81.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_81.n_1_2) = 0 
.IC V(n_bl0_82) = 'supply_v_lp' 
.IC V(n_br0_82) = 0 
.IC V(Xsram_0_82.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_82.n_1_2) = 0 
.IC V(n_bl1_82) = 'supply_v_lp' 
.IC V(n_br1_82) = 0 
.IC V(Xsram_1_82.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_82.n_1_2) = 0 
.IC V(n_bl2_82) = 'supply_v_lp' 
.IC V(n_br2_82) = 0 
.IC V(Xsram_2_82.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_82.n_1_2) = 0 
.IC V(n_bl0_83) = 'supply_v_lp' 
.IC V(n_br0_83) = 0 
.IC V(Xsram_0_83.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_83.n_1_2) = 0 
.IC V(n_bl1_83) = 'supply_v_lp' 
.IC V(n_br1_83) = 0 
.IC V(Xsram_1_83.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_83.n_1_2) = 0 
.IC V(n_bl2_83) = 'supply_v_lp' 
.IC V(n_br2_83) = 0 
.IC V(Xsram_2_83.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_83.n_1_2) = 0 
.IC V(n_bl0_84) = 'supply_v_lp' 
.IC V(n_br0_84) = 0 
.IC V(Xsram_0_84.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_84.n_1_2) = 0 
.IC V(n_bl1_84) = 'supply_v_lp' 
.IC V(n_br1_84) = 0 
.IC V(Xsram_1_84.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_84.n_1_2) = 0 
.IC V(n_bl2_84) = 'supply_v_lp' 
.IC V(n_br2_84) = 0 
.IC V(Xsram_2_84.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_84.n_1_2) = 0 
.IC V(n_bl0_85) = 'supply_v_lp' 
.IC V(n_br0_85) = 0 
.IC V(Xsram_0_85.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_85.n_1_2) = 0 
.IC V(n_bl1_85) = 'supply_v_lp' 
.IC V(n_br1_85) = 0 
.IC V(Xsram_1_85.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_85.n_1_2) = 0 
.IC V(n_bl2_85) = 'supply_v_lp' 
.IC V(n_br2_85) = 0 
.IC V(Xsram_2_85.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_85.n_1_2) = 0 
.IC V(n_bl0_86) = 'supply_v_lp' 
.IC V(n_br0_86) = 0 
.IC V(Xsram_0_86.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_86.n_1_2) = 0 
.IC V(n_bl1_86) = 'supply_v_lp' 
.IC V(n_br1_86) = 0 
.IC V(Xsram_1_86.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_86.n_1_2) = 0 
.IC V(n_bl2_86) = 'supply_v_lp' 
.IC V(n_br2_86) = 0 
.IC V(Xsram_2_86.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_86.n_1_2) = 0 
.IC V(n_bl0_87) = 'supply_v_lp' 
.IC V(n_br0_87) = 0 
.IC V(Xsram_0_87.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_87.n_1_2) = 0 
.IC V(n_bl1_87) = 'supply_v_lp' 
.IC V(n_br1_87) = 0 
.IC V(Xsram_1_87.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_87.n_1_2) = 0 
.IC V(n_bl2_87) = 'supply_v_lp' 
.IC V(n_br2_87) = 0 
.IC V(Xsram_2_87.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_87.n_1_2) = 0 
.IC V(n_bl0_88) = 'supply_v_lp' 
.IC V(n_br0_88) = 0 
.IC V(Xsram_0_88.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_88.n_1_2) = 0 
.IC V(n_bl1_88) = 'supply_v_lp' 
.IC V(n_br1_88) = 0 
.IC V(Xsram_1_88.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_88.n_1_2) = 0 
.IC V(n_bl2_88) = 'supply_v_lp' 
.IC V(n_br2_88) = 0 
.IC V(Xsram_2_88.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_88.n_1_2) = 0 
.IC V(n_bl0_89) = 'supply_v_lp' 
.IC V(n_br0_89) = 0 
.IC V(Xsram_0_89.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_89.n_1_2) = 0 
.IC V(n_bl1_89) = 'supply_v_lp' 
.IC V(n_br1_89) = 0 
.IC V(Xsram_1_89.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_89.n_1_2) = 0 
.IC V(n_bl2_89) = 'supply_v_lp' 
.IC V(n_br2_89) = 0 
.IC V(Xsram_2_89.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_89.n_1_2) = 0 
.IC V(n_bl0_90) = 'supply_v_lp' 
.IC V(n_br0_90) = 0 
.IC V(Xsram_0_90.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_90.n_1_2) = 0 
.IC V(n_bl1_90) = 'supply_v_lp' 
.IC V(n_br1_90) = 0 
.IC V(Xsram_1_90.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_90.n_1_2) = 0 
.IC V(n_bl2_90) = 'supply_v_lp' 
.IC V(n_br2_90) = 0 
.IC V(Xsram_2_90.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_90.n_1_2) = 0 
.IC V(n_bl0_91) = 'supply_v_lp' 
.IC V(n_br0_91) = 0 
.IC V(Xsram_0_91.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_91.n_1_2) = 0 
.IC V(n_bl1_91) = 'supply_v_lp' 
.IC V(n_br1_91) = 0 
.IC V(Xsram_1_91.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_91.n_1_2) = 0 
.IC V(n_bl2_91) = 'supply_v_lp' 
.IC V(n_br2_91) = 0 
.IC V(Xsram_2_91.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_91.n_1_2) = 0 
.IC V(n_bl0_92) = 'supply_v_lp' 
.IC V(n_br0_92) = 0 
.IC V(Xsram_0_92.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_92.n_1_2) = 0 
.IC V(n_bl1_92) = 'supply_v_lp' 
.IC V(n_br1_92) = 0 
.IC V(Xsram_1_92.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_92.n_1_2) = 0 
.IC V(n_bl2_92) = 'supply_v_lp' 
.IC V(n_br2_92) = 0 
.IC V(Xsram_2_92.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_92.n_1_2) = 0 
.IC V(n_bl0_93) = 'supply_v_lp' 
.IC V(n_br0_93) = 0 
.IC V(Xsram_0_93.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_93.n_1_2) = 0 
.IC V(n_bl1_93) = 'supply_v_lp' 
.IC V(n_br1_93) = 0 
.IC V(Xsram_1_93.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_93.n_1_2) = 0 
.IC V(n_bl2_93) = 'supply_v_lp' 
.IC V(n_br2_93) = 0 
.IC V(Xsram_2_93.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_93.n_1_2) = 0 
.IC V(n_bl0_94) = 'supply_v_lp' 
.IC V(n_br0_94) = 0 
.IC V(Xsram_0_94.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_94.n_1_2) = 0 
.IC V(n_bl1_94) = 'supply_v_lp' 
.IC V(n_br1_94) = 0 
.IC V(Xsram_1_94.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_94.n_1_2) = 0 
.IC V(n_bl2_94) = 'supply_v_lp' 
.IC V(n_br2_94) = 0 
.IC V(Xsram_2_94.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_94.n_1_2) = 0 
.IC V(n_bl0_95) = 'supply_v_lp' 
.IC V(n_br0_95) = 0 
.IC V(Xsram_0_95.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_95.n_1_2) = 0 
.IC V(n_bl1_95) = 'supply_v_lp' 
.IC V(n_br1_95) = 0 
.IC V(Xsram_1_95.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_95.n_1_2) = 0 
.IC V(n_bl2_95) = 'supply_v_lp' 
.IC V(n_br2_95) = 0 
.IC V(Xsram_2_95.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_95.n_1_2) = 0 
.IC V(n_bl0_96) = 'supply_v_lp' 
.IC V(n_br0_96) = 0 
.IC V(Xsram_0_96.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_96.n_1_2) = 0 
.IC V(n_bl1_96) = 'supply_v_lp' 
.IC V(n_br1_96) = 0 
.IC V(Xsram_1_96.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_96.n_1_2) = 0 
.IC V(n_bl2_96) = 'supply_v_lp' 
.IC V(n_br2_96) = 0 
.IC V(Xsram_2_96.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_96.n_1_2) = 0 
.IC V(n_bl0_97) = 'supply_v_lp' 
.IC V(n_br0_97) = 0 
.IC V(Xsram_0_97.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_97.n_1_2) = 0 
.IC V(n_bl1_97) = 'supply_v_lp' 
.IC V(n_br1_97) = 0 
.IC V(Xsram_1_97.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_97.n_1_2) = 0 
.IC V(n_bl2_97) = 'supply_v_lp' 
.IC V(n_br2_97) = 0 
.IC V(Xsram_2_97.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_97.n_1_2) = 0 
.IC V(n_bl0_98) = 'supply_v_lp' 
.IC V(n_br0_98) = 0 
.IC V(Xsram_0_98.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_98.n_1_2) = 0 
.IC V(n_bl1_98) = 'supply_v_lp' 
.IC V(n_br1_98) = 0 
.IC V(Xsram_1_98.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_98.n_1_2) = 0 
.IC V(n_bl2_98) = 'supply_v_lp' 
.IC V(n_br2_98) = 0 
.IC V(Xsram_2_98.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_98.n_1_2) = 0 
.IC V(n_bl0_99) = 'supply_v_lp' 
.IC V(n_br0_99) = 0 
.IC V(Xsram_0_99.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_99.n_1_2) = 0 
.IC V(n_bl1_99) = 'supply_v_lp' 
.IC V(n_br1_99) = 0 
.IC V(Xsram_1_99.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_99.n_1_2) = 0 
.IC V(n_bl2_99) = 'supply_v_lp' 
.IC V(n_br2_99) = 0 
.IC V(Xsram_2_99.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_99.n_1_2) = 0 
.IC V(n_bl0_100) = 'supply_v_lp' 
.IC V(n_br0_100) = 0 
.IC V(Xsram_0_100.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_100.n_1_2) = 0 
.IC V(n_bl1_100) = 'supply_v_lp' 
.IC V(n_br1_100) = 0 
.IC V(Xsram_1_100.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_100.n_1_2) = 0 
.IC V(n_bl2_100) = 'supply_v_lp' 
.IC V(n_br2_100) = 0 
.IC V(Xsram_2_100.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_100.n_1_2) = 0 
.IC V(n_bl0_101) = 'supply_v_lp' 
.IC V(n_br0_101) = 0 
.IC V(Xsram_0_101.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_101.n_1_2) = 0 
.IC V(n_bl1_101) = 'supply_v_lp' 
.IC V(n_br1_101) = 0 
.IC V(Xsram_1_101.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_101.n_1_2) = 0 
.IC V(n_bl2_101) = 'supply_v_lp' 
.IC V(n_br2_101) = 0 
.IC V(Xsram_2_101.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_101.n_1_2) = 0 
.IC V(n_bl0_102) = 'supply_v_lp' 
.IC V(n_br0_102) = 0 
.IC V(Xsram_0_102.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_102.n_1_2) = 0 
.IC V(n_bl1_102) = 'supply_v_lp' 
.IC V(n_br1_102) = 0 
.IC V(Xsram_1_102.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_102.n_1_2) = 0 
.IC V(n_bl2_102) = 'supply_v_lp' 
.IC V(n_br2_102) = 0 
.IC V(Xsram_2_102.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_102.n_1_2) = 0 
.IC V(n_bl0_103) = 'supply_v_lp' 
.IC V(n_br0_103) = 0 
.IC V(Xsram_0_103.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_103.n_1_2) = 0 
.IC V(n_bl1_103) = 'supply_v_lp' 
.IC V(n_br1_103) = 0 
.IC V(Xsram_1_103.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_103.n_1_2) = 0 
.IC V(n_bl2_103) = 'supply_v_lp' 
.IC V(n_br2_103) = 0 
.IC V(Xsram_2_103.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_103.n_1_2) = 0 
.IC V(n_bl0_104) = 'supply_v_lp' 
.IC V(n_br0_104) = 0 
.IC V(Xsram_0_104.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_104.n_1_2) = 0 
.IC V(n_bl1_104) = 'supply_v_lp' 
.IC V(n_br1_104) = 0 
.IC V(Xsram_1_104.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_104.n_1_2) = 0 
.IC V(n_bl2_104) = 'supply_v_lp' 
.IC V(n_br2_104) = 0 
.IC V(Xsram_2_104.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_104.n_1_2) = 0 
.IC V(n_bl0_105) = 'supply_v_lp' 
.IC V(n_br0_105) = 0 
.IC V(Xsram_0_105.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_105.n_1_2) = 0 
.IC V(n_bl1_105) = 'supply_v_lp' 
.IC V(n_br1_105) = 0 
.IC V(Xsram_1_105.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_105.n_1_2) = 0 
.IC V(n_bl2_105) = 'supply_v_lp' 
.IC V(n_br2_105) = 0 
.IC V(Xsram_2_105.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_105.n_1_2) = 0 
.IC V(n_bl0_106) = 'supply_v_lp' 
.IC V(n_br0_106) = 0 
.IC V(Xsram_0_106.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_106.n_1_2) = 0 
.IC V(n_bl1_106) = 'supply_v_lp' 
.IC V(n_br1_106) = 0 
.IC V(Xsram_1_106.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_106.n_1_2) = 0 
.IC V(n_bl2_106) = 'supply_v_lp' 
.IC V(n_br2_106) = 0 
.IC V(Xsram_2_106.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_106.n_1_2) = 0 
.IC V(n_bl0_107) = 'supply_v_lp' 
.IC V(n_br0_107) = 0 
.IC V(Xsram_0_107.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_107.n_1_2) = 0 
.IC V(n_bl1_107) = 'supply_v_lp' 
.IC V(n_br1_107) = 0 
.IC V(Xsram_1_107.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_107.n_1_2) = 0 
.IC V(n_bl2_107) = 'supply_v_lp' 
.IC V(n_br2_107) = 0 
.IC V(Xsram_2_107.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_107.n_1_2) = 0 
.IC V(n_bl0_108) = 'supply_v_lp' 
.IC V(n_br0_108) = 0 
.IC V(Xsram_0_108.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_108.n_1_2) = 0 
.IC V(n_bl1_108) = 'supply_v_lp' 
.IC V(n_br1_108) = 0 
.IC V(Xsram_1_108.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_108.n_1_2) = 0 
.IC V(n_bl2_108) = 'supply_v_lp' 
.IC V(n_br2_108) = 0 
.IC V(Xsram_2_108.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_108.n_1_2) = 0 
.IC V(n_bl0_109) = 'supply_v_lp' 
.IC V(n_br0_109) = 0 
.IC V(Xsram_0_109.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_109.n_1_2) = 0 
.IC V(n_bl1_109) = 'supply_v_lp' 
.IC V(n_br1_109) = 0 
.IC V(Xsram_1_109.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_109.n_1_2) = 0 
.IC V(n_bl2_109) = 'supply_v_lp' 
.IC V(n_br2_109) = 0 
.IC V(Xsram_2_109.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_109.n_1_2) = 0 
.IC V(n_bl0_110) = 'supply_v_lp' 
.IC V(n_br0_110) = 0 
.IC V(Xsram_0_110.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_110.n_1_2) = 0 
.IC V(n_bl1_110) = 'supply_v_lp' 
.IC V(n_br1_110) = 0 
.IC V(Xsram_1_110.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_110.n_1_2) = 0 
.IC V(n_bl2_110) = 'supply_v_lp' 
.IC V(n_br2_110) = 0 
.IC V(Xsram_2_110.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_110.n_1_2) = 0 
.IC V(n_bl0_111) = 'supply_v_lp' 
.IC V(n_br0_111) = 0 
.IC V(Xsram_0_111.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_111.n_1_2) = 0 
.IC V(n_bl1_111) = 'supply_v_lp' 
.IC V(n_br1_111) = 0 
.IC V(Xsram_1_111.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_111.n_1_2) = 0 
.IC V(n_bl2_111) = 'supply_v_lp' 
.IC V(n_br2_111) = 0 
.IC V(Xsram_2_111.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_111.n_1_2) = 0 
.IC V(n_bl0_112) = 'supply_v_lp' 
.IC V(n_br0_112) = 0 
.IC V(Xsram_0_112.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_112.n_1_2) = 0 
.IC V(n_bl1_112) = 'supply_v_lp' 
.IC V(n_br1_112) = 0 
.IC V(Xsram_1_112.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_112.n_1_2) = 0 
.IC V(n_bl2_112) = 'supply_v_lp' 
.IC V(n_br2_112) = 0 
.IC V(Xsram_2_112.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_112.n_1_2) = 0 
.IC V(n_bl0_113) = 'supply_v_lp' 
.IC V(n_br0_113) = 0 
.IC V(Xsram_0_113.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_113.n_1_2) = 0 
.IC V(n_bl1_113) = 'supply_v_lp' 
.IC V(n_br1_113) = 0 
.IC V(Xsram_1_113.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_113.n_1_2) = 0 
.IC V(n_bl2_113) = 'supply_v_lp' 
.IC V(n_br2_113) = 0 
.IC V(Xsram_2_113.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_113.n_1_2) = 0 
.IC V(n_bl0_114) = 'supply_v_lp' 
.IC V(n_br0_114) = 0 
.IC V(Xsram_0_114.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_114.n_1_2) = 0 
.IC V(n_bl1_114) = 'supply_v_lp' 
.IC V(n_br1_114) = 0 
.IC V(Xsram_1_114.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_114.n_1_2) = 0 
.IC V(n_bl2_114) = 'supply_v_lp' 
.IC V(n_br2_114) = 0 
.IC V(Xsram_2_114.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_114.n_1_2) = 0 
.IC V(n_bl0_115) = 'supply_v_lp' 
.IC V(n_br0_115) = 0 
.IC V(Xsram_0_115.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_115.n_1_2) = 0 
.IC V(n_bl1_115) = 'supply_v_lp' 
.IC V(n_br1_115) = 0 
.IC V(Xsram_1_115.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_115.n_1_2) = 0 
.IC V(n_bl2_115) = 'supply_v_lp' 
.IC V(n_br2_115) = 0 
.IC V(Xsram_2_115.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_115.n_1_2) = 0 
.IC V(n_bl0_116) = 'supply_v_lp' 
.IC V(n_br0_116) = 0 
.IC V(Xsram_0_116.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_116.n_1_2) = 0 
.IC V(n_bl1_116) = 'supply_v_lp' 
.IC V(n_br1_116) = 0 
.IC V(Xsram_1_116.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_116.n_1_2) = 0 
.IC V(n_bl2_116) = 'supply_v_lp' 
.IC V(n_br2_116) = 0 
.IC V(Xsram_2_116.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_116.n_1_2) = 0 
.IC V(n_bl0_117) = 'supply_v_lp' 
.IC V(n_br0_117) = 0 
.IC V(Xsram_0_117.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_117.n_1_2) = 0 
.IC V(n_bl1_117) = 'supply_v_lp' 
.IC V(n_br1_117) = 0 
.IC V(Xsram_1_117.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_117.n_1_2) = 0 
.IC V(n_bl2_117) = 'supply_v_lp' 
.IC V(n_br2_117) = 0 
.IC V(Xsram_2_117.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_117.n_1_2) = 0 
.IC V(n_bl0_118) = 'supply_v_lp' 
.IC V(n_br0_118) = 0 
.IC V(Xsram_0_118.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_118.n_1_2) = 0 
.IC V(n_bl1_118) = 'supply_v_lp' 
.IC V(n_br1_118) = 0 
.IC V(Xsram_1_118.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_118.n_1_2) = 0 
.IC V(n_bl2_118) = 'supply_v_lp' 
.IC V(n_br2_118) = 0 
.IC V(Xsram_2_118.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_118.n_1_2) = 0 
.IC V(n_bl0_119) = 'supply_v_lp' 
.IC V(n_br0_119) = 0 
.IC V(Xsram_0_119.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_119.n_1_2) = 0 
.IC V(n_bl1_119) = 'supply_v_lp' 
.IC V(n_br1_119) = 0 
.IC V(Xsram_1_119.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_119.n_1_2) = 0 
.IC V(n_bl2_119) = 'supply_v_lp' 
.IC V(n_br2_119) = 0 
.IC V(Xsram_2_119.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_119.n_1_2) = 0 
.IC V(n_bl0_120) = 'supply_v_lp' 
.IC V(n_br0_120) = 0 
.IC V(Xsram_0_120.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_120.n_1_2) = 0 
.IC V(n_bl1_120) = 'supply_v_lp' 
.IC V(n_br1_120) = 0 
.IC V(Xsram_1_120.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_120.n_1_2) = 0 
.IC V(n_bl2_120) = 'supply_v_lp' 
.IC V(n_br2_120) = 0 
.IC V(Xsram_2_120.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_120.n_1_2) = 0 
.IC V(n_bl0_121) = 'supply_v_lp' 
.IC V(n_br0_121) = 0 
.IC V(Xsram_0_121.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_121.n_1_2) = 0 
.IC V(n_bl1_121) = 'supply_v_lp' 
.IC V(n_br1_121) = 0 
.IC V(Xsram_1_121.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_121.n_1_2) = 0 
.IC V(n_bl2_121) = 'supply_v_lp' 
.IC V(n_br2_121) = 0 
.IC V(Xsram_2_121.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_121.n_1_2) = 0 
.IC V(n_bl0_122) = 'supply_v_lp' 
.IC V(n_br0_122) = 0 
.IC V(Xsram_0_122.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_122.n_1_2) = 0 
.IC V(n_bl1_122) = 'supply_v_lp' 
.IC V(n_br1_122) = 0 
.IC V(Xsram_1_122.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_122.n_1_2) = 0 
.IC V(n_bl2_122) = 'supply_v_lp' 
.IC V(n_br2_122) = 0 
.IC V(Xsram_2_122.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_122.n_1_2) = 0 
.IC V(n_bl0_123) = 'supply_v_lp' 
.IC V(n_br0_123) = 0 
.IC V(Xsram_0_123.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_123.n_1_2) = 0 
.IC V(n_bl1_123) = 'supply_v_lp' 
.IC V(n_br1_123) = 0 
.IC V(Xsram_1_123.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_123.n_1_2) = 0 
.IC V(n_bl2_123) = 'supply_v_lp' 
.IC V(n_br2_123) = 0 
.IC V(Xsram_2_123.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_123.n_1_2) = 0 
.IC V(n_bl0_124) = 'supply_v_lp' 
.IC V(n_br0_124) = 0 
.IC V(Xsram_0_124.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_124.n_1_2) = 0 
.IC V(n_bl1_124) = 'supply_v_lp' 
.IC V(n_br1_124) = 0 
.IC V(Xsram_1_124.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_124.n_1_2) = 0 
.IC V(n_bl2_124) = 'supply_v_lp' 
.IC V(n_br2_124) = 0 
.IC V(Xsram_2_124.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_124.n_1_2) = 0 
.IC V(n_bl0_125) = 'supply_v_lp' 
.IC V(n_br0_125) = 0 
.IC V(Xsram_0_125.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_125.n_1_2) = 0 
.IC V(n_bl1_125) = 'supply_v_lp' 
.IC V(n_br1_125) = 0 
.IC V(Xsram_1_125.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_125.n_1_2) = 0 
.IC V(n_bl2_125) = 'supply_v_lp' 
.IC V(n_br2_125) = 0 
.IC V(Xsram_2_125.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_125.n_1_2) = 0 
.IC V(n_bl0_126) = 'supply_v_lp' 
.IC V(n_br0_126) = 0 
.IC V(Xsram_0_126.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_126.n_1_2) = 0 
.IC V(n_bl1_126) = 'supply_v_lp' 
.IC V(n_br1_126) = 0 
.IC V(Xsram_1_126.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_126.n_1_2) = 0 
.IC V(n_bl2_126) = 'supply_v_lp' 
.IC V(n_br2_126) = 0 
.IC V(Xsram_2_126.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_126.n_1_2) = 0 
.IC V(n_bl0_127) = 'supply_v_lp' 
.IC V(n_br0_127) = 0 
.IC V(Xsram_0_127.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_0_127.n_1_2) = 0 
.IC V(n_bl1_127) = 'supply_v_lp' 
.IC V(n_br1_127) = 0 
.IC V(Xsram_1_127.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_1_127.n_1_2) = 0 
.IC V(n_bl2_127) = 'supply_v_lp' 
.IC V(n_br2_127) = 0 
.IC V(Xsram_2_127.n_1_1) = 'supply_v_lp' 
.IC V(Xsram_2_127.n_1_2) = 0 
.print tran V(tgate_l) V(tgate_r) V(n_bl_0) V(n_bl_128) V(n_br_0) V(Xprechargesa.n_1_2) V(n_br_128) V(n_bl0_128) V(n_br0_128) V(Xsram127.n_1_2) V(Xsram127.n_1_1) V(n_precharge) V(n_wl_eva) I(V_unselected) I(V_selected)
.END