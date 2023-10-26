.TITLE SRAM read power measurement circuit 

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
Vprecharge2 n_precharge2 gnd PULSE (supply_v_lp 0 0 50p 50p 'precharge_max' 'ram_frequency')
Vwl n_wl_eva gnd PULSE (supply_v_lp 0 0 50p 50p 'wl_eva' 'ram_frequency')
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_selected vdd_selected gnd supply_v_lp

V_unselected vdd_unselected gnd supply_v_lp

********************************************************************************
** Measurement
********************************************************************************

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current_selected INTEGRAL I(V_selected) FROM=0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_selected PARAM = '-(meas_current_selected/(4 * ram_frequency)) * supply_v_lp'

.MEASURE TRAN meas_current_unselected INTEGRAL I(V_unselected) FROM=0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_unselected PARAM = '-(meas_current_unselected/(4 * ram_frequency)) * supply_v_lp'

********************************************************************************
** Circuit
********************************************************************************

xsamp1 n_wl_eva tgate_l tgate_r n_hang_samp vdd_selected gnd samp1
xwrite gnd gnd tgate_l tgate_r vdd_selected gnd writedriver
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
Xwirel0 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer0 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram0 gnd gnd n_bl_1 gnd n_br_1 gnd vdd_selected gnd memorycell
Xwirel1 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer1 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram1 gnd gnd n_bl_2 gnd n_br_2 gnd vdd_selected gnd memorycell
Xwirel2 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer2 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram2 gnd gnd n_bl_3 gnd n_br_3 gnd vdd_selected gnd memorycell
Xwirel3 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer3 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram3 gnd gnd n_bl_4 gnd n_br_4 gnd vdd_selected gnd memorycell
Xwirel4 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer4 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram4 gnd gnd n_bl_5 gnd n_br_5 gnd vdd_selected gnd memorycell
Xwirel5 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer5 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram5 gnd gnd n_bl_6 gnd n_br_6 gnd vdd_selected gnd memorycell
Xwirel6 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer6 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram6 gnd gnd n_bl_7 gnd n_br_7 gnd vdd_selected gnd memorycell
Xwirel7 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer7 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram7 gnd gnd n_bl_8 gnd n_br_8 gnd vdd_selected gnd memorycell
Xwirel8 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer8 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram8 gnd gnd n_bl_9 gnd n_br_9 gnd vdd_selected gnd memorycell
Xwirel9 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer9 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram9 gnd gnd n_bl_10 gnd n_br_10 gnd vdd_selected gnd memorycell
Xwirel10 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer10 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram10 gnd gnd n_bl_11 gnd n_br_11 gnd vdd_selected gnd memorycell
Xwirel11 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer11 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram11 gnd gnd n_bl_12 gnd n_br_12 gnd vdd_selected gnd memorycell
Xwirel12 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer12 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram12 gnd gnd n_bl_13 gnd n_br_13 gnd vdd_selected gnd memorycell
Xwirel13 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer13 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram13 gnd gnd n_bl_14 gnd n_br_14 gnd vdd_selected gnd memorycell
Xwirel14 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer14 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram14 gnd gnd n_bl_15 gnd n_br_15 gnd vdd_selected gnd memorycell
Xwirel15 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer15 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram15 gnd gnd n_bl_16 gnd n_br_16 gnd vdd_selected gnd memorycell
Xwirel16 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer16 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram16 gnd gnd n_bl_17 gnd n_br_17 gnd vdd_selected gnd memorycell
Xwirel17 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer17 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram17 gnd gnd n_bl_18 gnd n_br_18 gnd vdd_selected gnd memorycell
Xwirel18 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer18 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram18 gnd gnd n_bl_19 gnd n_br_19 gnd vdd_selected gnd memorycell
Xwirel19 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer19 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram19 gnd gnd n_bl_20 gnd n_br_20 gnd vdd_selected gnd memorycell
Xwirel20 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer20 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram20 gnd gnd n_bl_21 gnd n_br_21 gnd vdd_selected gnd memorycell
Xwirel21 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer21 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram21 gnd gnd n_bl_22 gnd n_br_22 gnd vdd_selected gnd memorycell
Xwirel22 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer22 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram22 gnd gnd n_bl_23 gnd n_br_23 gnd vdd_selected gnd memorycell
Xwirel23 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer23 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram23 gnd gnd n_bl_24 gnd n_br_24 gnd vdd_selected gnd memorycell
Xwirel24 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer24 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram24 gnd gnd n_bl_25 gnd n_br_25 gnd vdd_selected gnd memorycell
Xwirel25 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer25 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram25 gnd gnd n_bl_26 gnd n_br_26 gnd vdd_selected gnd memorycell
Xwirel26 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer26 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram26 gnd gnd n_bl_27 gnd n_br_27 gnd vdd_selected gnd memorycell
Xwirel27 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer27 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram27 gnd gnd n_bl_28 gnd n_br_28 gnd vdd_selected gnd memorycell
Xwirel28 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer28 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram28 gnd gnd n_bl_29 gnd n_br_29 gnd vdd_selected gnd memorycell
Xwirel29 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer29 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram29 gnd gnd n_bl_30 gnd n_br_30 gnd vdd_selected gnd memorycell
Xwirel30 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer30 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram30 gnd gnd n_bl_31 gnd n_br_31 gnd vdd_selected gnd memorycell
Xwirel31 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer31 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram31 gnd gnd n_bl_32 gnd n_br_32 gnd vdd_selected gnd memorycell
Xwirel32 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer32 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram32 gnd gnd n_bl_33 gnd n_br_33 gnd vdd_selected gnd memorycell
Xwirel33 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer33 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram33 gnd gnd n_bl_34 gnd n_br_34 gnd vdd_selected gnd memorycell
Xwirel34 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer34 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram34 gnd gnd n_bl_35 gnd n_br_35 gnd vdd_selected gnd memorycell
Xwirel35 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer35 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram35 gnd gnd n_bl_36 gnd n_br_36 gnd vdd_selected gnd memorycell
Xwirel36 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer36 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram36 gnd gnd n_bl_37 gnd n_br_37 gnd vdd_selected gnd memorycell
Xwirel37 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer37 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram37 gnd gnd n_bl_38 gnd n_br_38 gnd vdd_selected gnd memorycell
Xwirel38 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer38 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram38 gnd gnd n_bl_39 gnd n_br_39 gnd vdd_selected gnd memorycell
Xwirel39 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer39 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram39 gnd gnd n_bl_40 gnd n_br_40 gnd vdd_selected gnd memorycell
Xwirel40 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer40 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram40 gnd gnd n_bl_41 gnd n_br_41 gnd vdd_selected gnd memorycell
Xwirel41 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer41 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram41 gnd gnd n_bl_42 gnd n_br_42 gnd vdd_selected gnd memorycell
Xwirel42 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer42 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram42 gnd gnd n_bl_43 gnd n_br_43 gnd vdd_selected gnd memorycell
Xwirel43 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer43 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram43 gnd gnd n_bl_44 gnd n_br_44 gnd vdd_selected gnd memorycell
Xwirel44 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer44 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram44 gnd gnd n_bl_45 gnd n_br_45 gnd vdd_selected gnd memorycell
Xwirel45 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer45 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram45 gnd gnd n_bl_46 gnd n_br_46 gnd vdd_selected gnd memorycell
Xwirel46 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer46 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram46 gnd gnd n_bl_47 gnd n_br_47 gnd vdd_selected gnd memorycell
Xwirel47 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer47 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram47 gnd gnd n_bl_48 gnd n_br_48 gnd vdd_selected gnd memorycell
Xwirel48 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer48 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram48 gnd gnd n_bl_49 gnd n_br_49 gnd vdd_selected gnd memorycell
Xwirel49 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer49 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram49 gnd gnd n_bl_50 gnd n_br_50 gnd vdd_selected gnd memorycell
Xwirel50 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer50 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram50 gnd gnd n_bl_51 gnd n_br_51 gnd vdd_selected gnd memorycell
Xwirel51 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer51 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram51 gnd gnd n_bl_52 gnd n_br_52 gnd vdd_selected gnd memorycell
Xwirel52 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer52 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram52 gnd gnd n_bl_53 gnd n_br_53 gnd vdd_selected gnd memorycell
Xwirel53 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer53 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram53 gnd gnd n_bl_54 gnd n_br_54 gnd vdd_selected gnd memorycell
Xwirel54 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer54 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram54 gnd gnd n_bl_55 gnd n_br_55 gnd vdd_selected gnd memorycell
Xwirel55 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer55 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram55 gnd gnd n_bl_56 gnd n_br_56 gnd vdd_selected gnd memorycell
Xwirel56 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer56 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram56 gnd gnd n_bl_57 gnd n_br_57 gnd vdd_selected gnd memorycell
Xwirel57 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer57 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram57 gnd gnd n_bl_58 gnd n_br_58 gnd vdd_selected gnd memorycell
Xwirel58 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer58 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram58 gnd gnd n_bl_59 gnd n_br_59 gnd vdd_selected gnd memorycell
Xwirel59 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer59 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram59 gnd gnd n_bl_60 gnd n_br_60 gnd vdd_selected gnd memorycell
Xwirel60 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer60 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram60 gnd gnd n_bl_61 gnd n_br_61 gnd vdd_selected gnd memorycell
Xwirel61 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer61 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram61 gnd gnd n_bl_62 gnd n_br_62 gnd vdd_selected gnd memorycell
Xwirel62 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer62 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram62 gnd gnd n_bl_63 gnd n_br_63 gnd vdd_selected gnd memorycell
Xwirel63 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer63 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram63 n_precharge2 gnd n_bl_64 gnd n_br_64 gnd vdd_selected gnd memorycell
Xwire0l0 n_bl0_0 n_bl0_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r0 n_br0_0 n_br0_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_0 gnd gnd n_bl0_1 gnd n_br0_1 gnd vdd_unselected gnd memorycell
Xwire0l1 n_bl0_1 n_bl0_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r1 n_br0_1 n_br0_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_1 gnd gnd n_bl0_2 gnd n_br0_2 gnd vdd_unselected gnd memorycell
Xwire0l2 n_bl0_2 n_bl0_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r2 n_br0_2 n_br0_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_2 gnd gnd n_bl0_3 gnd n_br0_3 gnd vdd_unselected gnd memorycell
Xwire0l3 n_bl0_3 n_bl0_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r3 n_br0_3 n_br0_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_3 gnd gnd n_bl0_4 gnd n_br0_4 gnd vdd_unselected gnd memorycell
Xwire0l4 n_bl0_4 n_bl0_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r4 n_br0_4 n_br0_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_4 gnd gnd n_bl0_5 gnd n_br0_5 gnd vdd_unselected gnd memorycell
Xwire0l5 n_bl0_5 n_bl0_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r5 n_br0_5 n_br0_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_5 gnd gnd n_bl0_6 gnd n_br0_6 gnd vdd_unselected gnd memorycell
Xwire0l6 n_bl0_6 n_bl0_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r6 n_br0_6 n_br0_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_6 gnd gnd n_bl0_7 gnd n_br0_7 gnd vdd_unselected gnd memorycell
Xwire0l7 n_bl0_7 n_bl0_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r7 n_br0_7 n_br0_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_7 gnd gnd n_bl0_8 gnd n_br0_8 gnd vdd_unselected gnd memorycell
Xwire0l8 n_bl0_8 n_bl0_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r8 n_br0_8 n_br0_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_8 gnd gnd n_bl0_9 gnd n_br0_9 gnd vdd_unselected gnd memorycell
Xwire0l9 n_bl0_9 n_bl0_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r9 n_br0_9 n_br0_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_9 gnd gnd n_bl0_10 gnd n_br0_10 gnd vdd_unselected gnd memorycell
Xwire0l10 n_bl0_10 n_bl0_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r10 n_br0_10 n_br0_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_10 gnd gnd n_bl0_11 gnd n_br0_11 gnd vdd_unselected gnd memorycell
Xwire0l11 n_bl0_11 n_bl0_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r11 n_br0_11 n_br0_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_11 gnd gnd n_bl0_12 gnd n_br0_12 gnd vdd_unselected gnd memorycell
Xwire0l12 n_bl0_12 n_bl0_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r12 n_br0_12 n_br0_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_12 gnd gnd n_bl0_13 gnd n_br0_13 gnd vdd_unselected gnd memorycell
Xwire0l13 n_bl0_13 n_bl0_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r13 n_br0_13 n_br0_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_13 gnd gnd n_bl0_14 gnd n_br0_14 gnd vdd_unselected gnd memorycell
Xwire0l14 n_bl0_14 n_bl0_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r14 n_br0_14 n_br0_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_14 gnd gnd n_bl0_15 gnd n_br0_15 gnd vdd_unselected gnd memorycell
Xwire0l15 n_bl0_15 n_bl0_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r15 n_br0_15 n_br0_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_15 gnd gnd n_bl0_16 gnd n_br0_16 gnd vdd_unselected gnd memorycell
Xwire0l16 n_bl0_16 n_bl0_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r16 n_br0_16 n_br0_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_16 gnd gnd n_bl0_17 gnd n_br0_17 gnd vdd_unselected gnd memorycell
Xwire0l17 n_bl0_17 n_bl0_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r17 n_br0_17 n_br0_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_17 gnd gnd n_bl0_18 gnd n_br0_18 gnd vdd_unselected gnd memorycell
Xwire0l18 n_bl0_18 n_bl0_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r18 n_br0_18 n_br0_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_18 gnd gnd n_bl0_19 gnd n_br0_19 gnd vdd_unselected gnd memorycell
Xwire0l19 n_bl0_19 n_bl0_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r19 n_br0_19 n_br0_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_19 gnd gnd n_bl0_20 gnd n_br0_20 gnd vdd_unselected gnd memorycell
Xwire0l20 n_bl0_20 n_bl0_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r20 n_br0_20 n_br0_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_20 gnd gnd n_bl0_21 gnd n_br0_21 gnd vdd_unselected gnd memorycell
Xwire0l21 n_bl0_21 n_bl0_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r21 n_br0_21 n_br0_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_21 gnd gnd n_bl0_22 gnd n_br0_22 gnd vdd_unselected gnd memorycell
Xwire0l22 n_bl0_22 n_bl0_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r22 n_br0_22 n_br0_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_22 gnd gnd n_bl0_23 gnd n_br0_23 gnd vdd_unselected gnd memorycell
Xwire0l23 n_bl0_23 n_bl0_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r23 n_br0_23 n_br0_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_23 gnd gnd n_bl0_24 gnd n_br0_24 gnd vdd_unselected gnd memorycell
Xwire0l24 n_bl0_24 n_bl0_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r24 n_br0_24 n_br0_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_24 gnd gnd n_bl0_25 gnd n_br0_25 gnd vdd_unselected gnd memorycell
Xwire0l25 n_bl0_25 n_bl0_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r25 n_br0_25 n_br0_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_25 gnd gnd n_bl0_26 gnd n_br0_26 gnd vdd_unselected gnd memorycell
Xwire0l26 n_bl0_26 n_bl0_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r26 n_br0_26 n_br0_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_26 gnd gnd n_bl0_27 gnd n_br0_27 gnd vdd_unselected gnd memorycell
Xwire0l27 n_bl0_27 n_bl0_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r27 n_br0_27 n_br0_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_27 gnd gnd n_bl0_28 gnd n_br0_28 gnd vdd_unselected gnd memorycell
Xwire0l28 n_bl0_28 n_bl0_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r28 n_br0_28 n_br0_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_28 gnd gnd n_bl0_29 gnd n_br0_29 gnd vdd_unselected gnd memorycell
Xwire0l29 n_bl0_29 n_bl0_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r29 n_br0_29 n_br0_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_29 gnd gnd n_bl0_30 gnd n_br0_30 gnd vdd_unselected gnd memorycell
Xwire0l30 n_bl0_30 n_bl0_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r30 n_br0_30 n_br0_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_30 gnd gnd n_bl0_31 gnd n_br0_31 gnd vdd_unselected gnd memorycell
Xwire0l31 n_bl0_31 n_bl0_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r31 n_br0_31 n_br0_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_31 gnd gnd n_bl0_32 gnd n_br0_32 gnd vdd_unselected gnd memorycell
Xwire0l32 n_bl0_32 n_bl0_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r32 n_br0_32 n_br0_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_32 gnd gnd n_bl0_33 gnd n_br0_33 gnd vdd_unselected gnd memorycell
Xwire0l33 n_bl0_33 n_bl0_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r33 n_br0_33 n_br0_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_33 gnd gnd n_bl0_34 gnd n_br0_34 gnd vdd_unselected gnd memorycell
Xwire0l34 n_bl0_34 n_bl0_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r34 n_br0_34 n_br0_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_34 gnd gnd n_bl0_35 gnd n_br0_35 gnd vdd_unselected gnd memorycell
Xwire0l35 n_bl0_35 n_bl0_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r35 n_br0_35 n_br0_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_35 gnd gnd n_bl0_36 gnd n_br0_36 gnd vdd_unselected gnd memorycell
Xwire0l36 n_bl0_36 n_bl0_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r36 n_br0_36 n_br0_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_36 gnd gnd n_bl0_37 gnd n_br0_37 gnd vdd_unselected gnd memorycell
Xwire0l37 n_bl0_37 n_bl0_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r37 n_br0_37 n_br0_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_37 gnd gnd n_bl0_38 gnd n_br0_38 gnd vdd_unselected gnd memorycell
Xwire0l38 n_bl0_38 n_bl0_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r38 n_br0_38 n_br0_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_38 gnd gnd n_bl0_39 gnd n_br0_39 gnd vdd_unselected gnd memorycell
Xwire0l39 n_bl0_39 n_bl0_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r39 n_br0_39 n_br0_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_39 gnd gnd n_bl0_40 gnd n_br0_40 gnd vdd_unselected gnd memorycell
Xwire0l40 n_bl0_40 n_bl0_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r40 n_br0_40 n_br0_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_40 gnd gnd n_bl0_41 gnd n_br0_41 gnd vdd_unselected gnd memorycell
Xwire0l41 n_bl0_41 n_bl0_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r41 n_br0_41 n_br0_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_41 gnd gnd n_bl0_42 gnd n_br0_42 gnd vdd_unselected gnd memorycell
Xwire0l42 n_bl0_42 n_bl0_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r42 n_br0_42 n_br0_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_42 gnd gnd n_bl0_43 gnd n_br0_43 gnd vdd_unselected gnd memorycell
Xwire0l43 n_bl0_43 n_bl0_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r43 n_br0_43 n_br0_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_43 gnd gnd n_bl0_44 gnd n_br0_44 gnd vdd_unselected gnd memorycell
Xwire0l44 n_bl0_44 n_bl0_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r44 n_br0_44 n_br0_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_44 gnd gnd n_bl0_45 gnd n_br0_45 gnd vdd_unselected gnd memorycell
Xwire0l45 n_bl0_45 n_bl0_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r45 n_br0_45 n_br0_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_45 gnd gnd n_bl0_46 gnd n_br0_46 gnd vdd_unselected gnd memorycell
Xwire0l46 n_bl0_46 n_bl0_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r46 n_br0_46 n_br0_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_46 gnd gnd n_bl0_47 gnd n_br0_47 gnd vdd_unselected gnd memorycell
Xwire0l47 n_bl0_47 n_bl0_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r47 n_br0_47 n_br0_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_47 gnd gnd n_bl0_48 gnd n_br0_48 gnd vdd_unselected gnd memorycell
Xwire0l48 n_bl0_48 n_bl0_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r48 n_br0_48 n_br0_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_48 gnd gnd n_bl0_49 gnd n_br0_49 gnd vdd_unselected gnd memorycell
Xwire0l49 n_bl0_49 n_bl0_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r49 n_br0_49 n_br0_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_49 gnd gnd n_bl0_50 gnd n_br0_50 gnd vdd_unselected gnd memorycell
Xwire0l50 n_bl0_50 n_bl0_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r50 n_br0_50 n_br0_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_50 gnd gnd n_bl0_51 gnd n_br0_51 gnd vdd_unselected gnd memorycell
Xwire0l51 n_bl0_51 n_bl0_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r51 n_br0_51 n_br0_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_51 gnd gnd n_bl0_52 gnd n_br0_52 gnd vdd_unselected gnd memorycell
Xwire0l52 n_bl0_52 n_bl0_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r52 n_br0_52 n_br0_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_52 gnd gnd n_bl0_53 gnd n_br0_53 gnd vdd_unselected gnd memorycell
Xwire0l53 n_bl0_53 n_bl0_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r53 n_br0_53 n_br0_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_53 gnd gnd n_bl0_54 gnd n_br0_54 gnd vdd_unselected gnd memorycell
Xwire0l54 n_bl0_54 n_bl0_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r54 n_br0_54 n_br0_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_54 gnd gnd n_bl0_55 gnd n_br0_55 gnd vdd_unselected gnd memorycell
Xwire0l55 n_bl0_55 n_bl0_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r55 n_br0_55 n_br0_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_55 gnd gnd n_bl0_56 gnd n_br0_56 gnd vdd_unselected gnd memorycell
Xwire0l56 n_bl0_56 n_bl0_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r56 n_br0_56 n_br0_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_56 gnd gnd n_bl0_57 gnd n_br0_57 gnd vdd_unselected gnd memorycell
Xwire0l57 n_bl0_57 n_bl0_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r57 n_br0_57 n_br0_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_57 gnd gnd n_bl0_58 gnd n_br0_58 gnd vdd_unselected gnd memorycell
Xwire0l58 n_bl0_58 n_bl0_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r58 n_br0_58 n_br0_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_58 gnd gnd n_bl0_59 gnd n_br0_59 gnd vdd_unselected gnd memorycell
Xwire0l59 n_bl0_59 n_bl0_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r59 n_br0_59 n_br0_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_59 gnd gnd n_bl0_60 gnd n_br0_60 gnd vdd_unselected gnd memorycell
Xwire0l60 n_bl0_60 n_bl0_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r60 n_br0_60 n_br0_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_60 gnd gnd n_bl0_61 gnd n_br0_61 gnd vdd_unselected gnd memorycell
Xwire0l61 n_bl0_61 n_bl0_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r61 n_br0_61 n_br0_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_61 gnd gnd n_bl0_62 gnd n_br0_62 gnd vdd_unselected gnd memorycell
Xwire0l62 n_bl0_62 n_bl0_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r62 n_br0_62 n_br0_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_62 gnd gnd n_bl0_63 gnd n_br0_63 gnd vdd_unselected gnd memorycell
Xwire0l63 n_bl0_63 n_bl0_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r63 n_br0_63 n_br0_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_63 n_precharge2 gnd n_bl0_64 gnd n_br0_64 gnd vdd_unselected gnd memorycell
Xwire1l0 n_bl1_0 n_bl1_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r0 n_br1_0 n_br1_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_0 gnd gnd n_bl1_1 gnd n_br1_1 gnd vdd_unselected gnd memorycell
Xwire1l1 n_bl1_1 n_bl1_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r1 n_br1_1 n_br1_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_1 gnd gnd n_bl1_2 gnd n_br1_2 gnd vdd_unselected gnd memorycell
Xwire1l2 n_bl1_2 n_bl1_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r2 n_br1_2 n_br1_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_2 gnd gnd n_bl1_3 gnd n_br1_3 gnd vdd_unselected gnd memorycell
Xwire1l3 n_bl1_3 n_bl1_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r3 n_br1_3 n_br1_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_3 gnd gnd n_bl1_4 gnd n_br1_4 gnd vdd_unselected gnd memorycell
Xwire1l4 n_bl1_4 n_bl1_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r4 n_br1_4 n_br1_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_4 gnd gnd n_bl1_5 gnd n_br1_5 gnd vdd_unselected gnd memorycell
Xwire1l5 n_bl1_5 n_bl1_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r5 n_br1_5 n_br1_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_5 gnd gnd n_bl1_6 gnd n_br1_6 gnd vdd_unselected gnd memorycell
Xwire1l6 n_bl1_6 n_bl1_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r6 n_br1_6 n_br1_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_6 gnd gnd n_bl1_7 gnd n_br1_7 gnd vdd_unselected gnd memorycell
Xwire1l7 n_bl1_7 n_bl1_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r7 n_br1_7 n_br1_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_7 gnd gnd n_bl1_8 gnd n_br1_8 gnd vdd_unselected gnd memorycell
Xwire1l8 n_bl1_8 n_bl1_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r8 n_br1_8 n_br1_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_8 gnd gnd n_bl1_9 gnd n_br1_9 gnd vdd_unselected gnd memorycell
Xwire1l9 n_bl1_9 n_bl1_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r9 n_br1_9 n_br1_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_9 gnd gnd n_bl1_10 gnd n_br1_10 gnd vdd_unselected gnd memorycell
Xwire1l10 n_bl1_10 n_bl1_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r10 n_br1_10 n_br1_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_10 gnd gnd n_bl1_11 gnd n_br1_11 gnd vdd_unselected gnd memorycell
Xwire1l11 n_bl1_11 n_bl1_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r11 n_br1_11 n_br1_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_11 gnd gnd n_bl1_12 gnd n_br1_12 gnd vdd_unselected gnd memorycell
Xwire1l12 n_bl1_12 n_bl1_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r12 n_br1_12 n_br1_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_12 gnd gnd n_bl1_13 gnd n_br1_13 gnd vdd_unselected gnd memorycell
Xwire1l13 n_bl1_13 n_bl1_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r13 n_br1_13 n_br1_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_13 gnd gnd n_bl1_14 gnd n_br1_14 gnd vdd_unselected gnd memorycell
Xwire1l14 n_bl1_14 n_bl1_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r14 n_br1_14 n_br1_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_14 gnd gnd n_bl1_15 gnd n_br1_15 gnd vdd_unselected gnd memorycell
Xwire1l15 n_bl1_15 n_bl1_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r15 n_br1_15 n_br1_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_15 gnd gnd n_bl1_16 gnd n_br1_16 gnd vdd_unselected gnd memorycell
Xwire1l16 n_bl1_16 n_bl1_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r16 n_br1_16 n_br1_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_16 gnd gnd n_bl1_17 gnd n_br1_17 gnd vdd_unselected gnd memorycell
Xwire1l17 n_bl1_17 n_bl1_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r17 n_br1_17 n_br1_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_17 gnd gnd n_bl1_18 gnd n_br1_18 gnd vdd_unselected gnd memorycell
Xwire1l18 n_bl1_18 n_bl1_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r18 n_br1_18 n_br1_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_18 gnd gnd n_bl1_19 gnd n_br1_19 gnd vdd_unselected gnd memorycell
Xwire1l19 n_bl1_19 n_bl1_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r19 n_br1_19 n_br1_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_19 gnd gnd n_bl1_20 gnd n_br1_20 gnd vdd_unselected gnd memorycell
Xwire1l20 n_bl1_20 n_bl1_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r20 n_br1_20 n_br1_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_20 gnd gnd n_bl1_21 gnd n_br1_21 gnd vdd_unselected gnd memorycell
Xwire1l21 n_bl1_21 n_bl1_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r21 n_br1_21 n_br1_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_21 gnd gnd n_bl1_22 gnd n_br1_22 gnd vdd_unselected gnd memorycell
Xwire1l22 n_bl1_22 n_bl1_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r22 n_br1_22 n_br1_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_22 gnd gnd n_bl1_23 gnd n_br1_23 gnd vdd_unselected gnd memorycell
Xwire1l23 n_bl1_23 n_bl1_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r23 n_br1_23 n_br1_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_23 gnd gnd n_bl1_24 gnd n_br1_24 gnd vdd_unselected gnd memorycell
Xwire1l24 n_bl1_24 n_bl1_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r24 n_br1_24 n_br1_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_24 gnd gnd n_bl1_25 gnd n_br1_25 gnd vdd_unselected gnd memorycell
Xwire1l25 n_bl1_25 n_bl1_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r25 n_br1_25 n_br1_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_25 gnd gnd n_bl1_26 gnd n_br1_26 gnd vdd_unselected gnd memorycell
Xwire1l26 n_bl1_26 n_bl1_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r26 n_br1_26 n_br1_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_26 gnd gnd n_bl1_27 gnd n_br1_27 gnd vdd_unselected gnd memorycell
Xwire1l27 n_bl1_27 n_bl1_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r27 n_br1_27 n_br1_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_27 gnd gnd n_bl1_28 gnd n_br1_28 gnd vdd_unselected gnd memorycell
Xwire1l28 n_bl1_28 n_bl1_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r28 n_br1_28 n_br1_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_28 gnd gnd n_bl1_29 gnd n_br1_29 gnd vdd_unselected gnd memorycell
Xwire1l29 n_bl1_29 n_bl1_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r29 n_br1_29 n_br1_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_29 gnd gnd n_bl1_30 gnd n_br1_30 gnd vdd_unselected gnd memorycell
Xwire1l30 n_bl1_30 n_bl1_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r30 n_br1_30 n_br1_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_30 gnd gnd n_bl1_31 gnd n_br1_31 gnd vdd_unselected gnd memorycell
Xwire1l31 n_bl1_31 n_bl1_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r31 n_br1_31 n_br1_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_31 gnd gnd n_bl1_32 gnd n_br1_32 gnd vdd_unselected gnd memorycell
Xwire1l32 n_bl1_32 n_bl1_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r32 n_br1_32 n_br1_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_32 gnd gnd n_bl1_33 gnd n_br1_33 gnd vdd_unselected gnd memorycell
Xwire1l33 n_bl1_33 n_bl1_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r33 n_br1_33 n_br1_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_33 gnd gnd n_bl1_34 gnd n_br1_34 gnd vdd_unselected gnd memorycell
Xwire1l34 n_bl1_34 n_bl1_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r34 n_br1_34 n_br1_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_34 gnd gnd n_bl1_35 gnd n_br1_35 gnd vdd_unselected gnd memorycell
Xwire1l35 n_bl1_35 n_bl1_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r35 n_br1_35 n_br1_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_35 gnd gnd n_bl1_36 gnd n_br1_36 gnd vdd_unselected gnd memorycell
Xwire1l36 n_bl1_36 n_bl1_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r36 n_br1_36 n_br1_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_36 gnd gnd n_bl1_37 gnd n_br1_37 gnd vdd_unselected gnd memorycell
Xwire1l37 n_bl1_37 n_bl1_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r37 n_br1_37 n_br1_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_37 gnd gnd n_bl1_38 gnd n_br1_38 gnd vdd_unselected gnd memorycell
Xwire1l38 n_bl1_38 n_bl1_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r38 n_br1_38 n_br1_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_38 gnd gnd n_bl1_39 gnd n_br1_39 gnd vdd_unselected gnd memorycell
Xwire1l39 n_bl1_39 n_bl1_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r39 n_br1_39 n_br1_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_39 gnd gnd n_bl1_40 gnd n_br1_40 gnd vdd_unselected gnd memorycell
Xwire1l40 n_bl1_40 n_bl1_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r40 n_br1_40 n_br1_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_40 gnd gnd n_bl1_41 gnd n_br1_41 gnd vdd_unselected gnd memorycell
Xwire1l41 n_bl1_41 n_bl1_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r41 n_br1_41 n_br1_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_41 gnd gnd n_bl1_42 gnd n_br1_42 gnd vdd_unselected gnd memorycell
Xwire1l42 n_bl1_42 n_bl1_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r42 n_br1_42 n_br1_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_42 gnd gnd n_bl1_43 gnd n_br1_43 gnd vdd_unselected gnd memorycell
Xwire1l43 n_bl1_43 n_bl1_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r43 n_br1_43 n_br1_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_43 gnd gnd n_bl1_44 gnd n_br1_44 gnd vdd_unselected gnd memorycell
Xwire1l44 n_bl1_44 n_bl1_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r44 n_br1_44 n_br1_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_44 gnd gnd n_bl1_45 gnd n_br1_45 gnd vdd_unselected gnd memorycell
Xwire1l45 n_bl1_45 n_bl1_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r45 n_br1_45 n_br1_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_45 gnd gnd n_bl1_46 gnd n_br1_46 gnd vdd_unselected gnd memorycell
Xwire1l46 n_bl1_46 n_bl1_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r46 n_br1_46 n_br1_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_46 gnd gnd n_bl1_47 gnd n_br1_47 gnd vdd_unselected gnd memorycell
Xwire1l47 n_bl1_47 n_bl1_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r47 n_br1_47 n_br1_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_47 gnd gnd n_bl1_48 gnd n_br1_48 gnd vdd_unselected gnd memorycell
Xwire1l48 n_bl1_48 n_bl1_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r48 n_br1_48 n_br1_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_48 gnd gnd n_bl1_49 gnd n_br1_49 gnd vdd_unselected gnd memorycell
Xwire1l49 n_bl1_49 n_bl1_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r49 n_br1_49 n_br1_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_49 gnd gnd n_bl1_50 gnd n_br1_50 gnd vdd_unselected gnd memorycell
Xwire1l50 n_bl1_50 n_bl1_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r50 n_br1_50 n_br1_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_50 gnd gnd n_bl1_51 gnd n_br1_51 gnd vdd_unselected gnd memorycell
Xwire1l51 n_bl1_51 n_bl1_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r51 n_br1_51 n_br1_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_51 gnd gnd n_bl1_52 gnd n_br1_52 gnd vdd_unselected gnd memorycell
Xwire1l52 n_bl1_52 n_bl1_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r52 n_br1_52 n_br1_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_52 gnd gnd n_bl1_53 gnd n_br1_53 gnd vdd_unselected gnd memorycell
Xwire1l53 n_bl1_53 n_bl1_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r53 n_br1_53 n_br1_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_53 gnd gnd n_bl1_54 gnd n_br1_54 gnd vdd_unselected gnd memorycell
Xwire1l54 n_bl1_54 n_bl1_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r54 n_br1_54 n_br1_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_54 gnd gnd n_bl1_55 gnd n_br1_55 gnd vdd_unselected gnd memorycell
Xwire1l55 n_bl1_55 n_bl1_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r55 n_br1_55 n_br1_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_55 gnd gnd n_bl1_56 gnd n_br1_56 gnd vdd_unselected gnd memorycell
Xwire1l56 n_bl1_56 n_bl1_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r56 n_br1_56 n_br1_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_56 gnd gnd n_bl1_57 gnd n_br1_57 gnd vdd_unselected gnd memorycell
Xwire1l57 n_bl1_57 n_bl1_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r57 n_br1_57 n_br1_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_57 gnd gnd n_bl1_58 gnd n_br1_58 gnd vdd_unselected gnd memorycell
Xwire1l58 n_bl1_58 n_bl1_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r58 n_br1_58 n_br1_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_58 gnd gnd n_bl1_59 gnd n_br1_59 gnd vdd_unselected gnd memorycell
Xwire1l59 n_bl1_59 n_bl1_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r59 n_br1_59 n_br1_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_59 gnd gnd n_bl1_60 gnd n_br1_60 gnd vdd_unselected gnd memorycell
Xwire1l60 n_bl1_60 n_bl1_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r60 n_br1_60 n_br1_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_60 gnd gnd n_bl1_61 gnd n_br1_61 gnd vdd_unselected gnd memorycell
Xwire1l61 n_bl1_61 n_bl1_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r61 n_br1_61 n_br1_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_61 gnd gnd n_bl1_62 gnd n_br1_62 gnd vdd_unselected gnd memorycell
Xwire1l62 n_bl1_62 n_bl1_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r62 n_br1_62 n_br1_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_62 gnd gnd n_bl1_63 gnd n_br1_63 gnd vdd_unselected gnd memorycell
Xwire1l63 n_bl1_63 n_bl1_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire1r63 n_br1_63 n_br1_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_1_63 n_precharge2 gnd n_bl1_64 gnd n_br1_64 gnd vdd_unselected gnd memorycell
Xwire2l0 n_bl2_0 n_bl2_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r0 n_br2_0 n_br2_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_0 gnd gnd n_bl2_1 gnd n_br2_1 gnd vdd_unselected gnd memorycell
Xwire2l1 n_bl2_1 n_bl2_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r1 n_br2_1 n_br2_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_1 gnd gnd n_bl2_2 gnd n_br2_2 gnd vdd_unselected gnd memorycell
Xwire2l2 n_bl2_2 n_bl2_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r2 n_br2_2 n_br2_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_2 gnd gnd n_bl2_3 gnd n_br2_3 gnd vdd_unselected gnd memorycell
Xwire2l3 n_bl2_3 n_bl2_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r3 n_br2_3 n_br2_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_3 gnd gnd n_bl2_4 gnd n_br2_4 gnd vdd_unselected gnd memorycell
Xwire2l4 n_bl2_4 n_bl2_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r4 n_br2_4 n_br2_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_4 gnd gnd n_bl2_5 gnd n_br2_5 gnd vdd_unselected gnd memorycell
Xwire2l5 n_bl2_5 n_bl2_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r5 n_br2_5 n_br2_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_5 gnd gnd n_bl2_6 gnd n_br2_6 gnd vdd_unselected gnd memorycell
Xwire2l6 n_bl2_6 n_bl2_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r6 n_br2_6 n_br2_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_6 gnd gnd n_bl2_7 gnd n_br2_7 gnd vdd_unselected gnd memorycell
Xwire2l7 n_bl2_7 n_bl2_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r7 n_br2_7 n_br2_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_7 gnd gnd n_bl2_8 gnd n_br2_8 gnd vdd_unselected gnd memorycell
Xwire2l8 n_bl2_8 n_bl2_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r8 n_br2_8 n_br2_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_8 gnd gnd n_bl2_9 gnd n_br2_9 gnd vdd_unselected gnd memorycell
Xwire2l9 n_bl2_9 n_bl2_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r9 n_br2_9 n_br2_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_9 gnd gnd n_bl2_10 gnd n_br2_10 gnd vdd_unselected gnd memorycell
Xwire2l10 n_bl2_10 n_bl2_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r10 n_br2_10 n_br2_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_10 gnd gnd n_bl2_11 gnd n_br2_11 gnd vdd_unselected gnd memorycell
Xwire2l11 n_bl2_11 n_bl2_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r11 n_br2_11 n_br2_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_11 gnd gnd n_bl2_12 gnd n_br2_12 gnd vdd_unselected gnd memorycell
Xwire2l12 n_bl2_12 n_bl2_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r12 n_br2_12 n_br2_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_12 gnd gnd n_bl2_13 gnd n_br2_13 gnd vdd_unselected gnd memorycell
Xwire2l13 n_bl2_13 n_bl2_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r13 n_br2_13 n_br2_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_13 gnd gnd n_bl2_14 gnd n_br2_14 gnd vdd_unselected gnd memorycell
Xwire2l14 n_bl2_14 n_bl2_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r14 n_br2_14 n_br2_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_14 gnd gnd n_bl2_15 gnd n_br2_15 gnd vdd_unselected gnd memorycell
Xwire2l15 n_bl2_15 n_bl2_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r15 n_br2_15 n_br2_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_15 gnd gnd n_bl2_16 gnd n_br2_16 gnd vdd_unselected gnd memorycell
Xwire2l16 n_bl2_16 n_bl2_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r16 n_br2_16 n_br2_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_16 gnd gnd n_bl2_17 gnd n_br2_17 gnd vdd_unselected gnd memorycell
Xwire2l17 n_bl2_17 n_bl2_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r17 n_br2_17 n_br2_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_17 gnd gnd n_bl2_18 gnd n_br2_18 gnd vdd_unselected gnd memorycell
Xwire2l18 n_bl2_18 n_bl2_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r18 n_br2_18 n_br2_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_18 gnd gnd n_bl2_19 gnd n_br2_19 gnd vdd_unselected gnd memorycell
Xwire2l19 n_bl2_19 n_bl2_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r19 n_br2_19 n_br2_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_19 gnd gnd n_bl2_20 gnd n_br2_20 gnd vdd_unselected gnd memorycell
Xwire2l20 n_bl2_20 n_bl2_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r20 n_br2_20 n_br2_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_20 gnd gnd n_bl2_21 gnd n_br2_21 gnd vdd_unselected gnd memorycell
Xwire2l21 n_bl2_21 n_bl2_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r21 n_br2_21 n_br2_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_21 gnd gnd n_bl2_22 gnd n_br2_22 gnd vdd_unselected gnd memorycell
Xwire2l22 n_bl2_22 n_bl2_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r22 n_br2_22 n_br2_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_22 gnd gnd n_bl2_23 gnd n_br2_23 gnd vdd_unselected gnd memorycell
Xwire2l23 n_bl2_23 n_bl2_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r23 n_br2_23 n_br2_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_23 gnd gnd n_bl2_24 gnd n_br2_24 gnd vdd_unselected gnd memorycell
Xwire2l24 n_bl2_24 n_bl2_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r24 n_br2_24 n_br2_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_24 gnd gnd n_bl2_25 gnd n_br2_25 gnd vdd_unselected gnd memorycell
Xwire2l25 n_bl2_25 n_bl2_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r25 n_br2_25 n_br2_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_25 gnd gnd n_bl2_26 gnd n_br2_26 gnd vdd_unselected gnd memorycell
Xwire2l26 n_bl2_26 n_bl2_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r26 n_br2_26 n_br2_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_26 gnd gnd n_bl2_27 gnd n_br2_27 gnd vdd_unselected gnd memorycell
Xwire2l27 n_bl2_27 n_bl2_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r27 n_br2_27 n_br2_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_27 gnd gnd n_bl2_28 gnd n_br2_28 gnd vdd_unselected gnd memorycell
Xwire2l28 n_bl2_28 n_bl2_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r28 n_br2_28 n_br2_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_28 gnd gnd n_bl2_29 gnd n_br2_29 gnd vdd_unselected gnd memorycell
Xwire2l29 n_bl2_29 n_bl2_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r29 n_br2_29 n_br2_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_29 gnd gnd n_bl2_30 gnd n_br2_30 gnd vdd_unselected gnd memorycell
Xwire2l30 n_bl2_30 n_bl2_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r30 n_br2_30 n_br2_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_30 gnd gnd n_bl2_31 gnd n_br2_31 gnd vdd_unselected gnd memorycell
Xwire2l31 n_bl2_31 n_bl2_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r31 n_br2_31 n_br2_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_31 gnd gnd n_bl2_32 gnd n_br2_32 gnd vdd_unselected gnd memorycell
Xwire2l32 n_bl2_32 n_bl2_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r32 n_br2_32 n_br2_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_32 gnd gnd n_bl2_33 gnd n_br2_33 gnd vdd_unselected gnd memorycell
Xwire2l33 n_bl2_33 n_bl2_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r33 n_br2_33 n_br2_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_33 gnd gnd n_bl2_34 gnd n_br2_34 gnd vdd_unselected gnd memorycell
Xwire2l34 n_bl2_34 n_bl2_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r34 n_br2_34 n_br2_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_34 gnd gnd n_bl2_35 gnd n_br2_35 gnd vdd_unselected gnd memorycell
Xwire2l35 n_bl2_35 n_bl2_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r35 n_br2_35 n_br2_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_35 gnd gnd n_bl2_36 gnd n_br2_36 gnd vdd_unselected gnd memorycell
Xwire2l36 n_bl2_36 n_bl2_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r36 n_br2_36 n_br2_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_36 gnd gnd n_bl2_37 gnd n_br2_37 gnd vdd_unselected gnd memorycell
Xwire2l37 n_bl2_37 n_bl2_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r37 n_br2_37 n_br2_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_37 gnd gnd n_bl2_38 gnd n_br2_38 gnd vdd_unselected gnd memorycell
Xwire2l38 n_bl2_38 n_bl2_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r38 n_br2_38 n_br2_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_38 gnd gnd n_bl2_39 gnd n_br2_39 gnd vdd_unselected gnd memorycell
Xwire2l39 n_bl2_39 n_bl2_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r39 n_br2_39 n_br2_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_39 gnd gnd n_bl2_40 gnd n_br2_40 gnd vdd_unselected gnd memorycell
Xwire2l40 n_bl2_40 n_bl2_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r40 n_br2_40 n_br2_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_40 gnd gnd n_bl2_41 gnd n_br2_41 gnd vdd_unselected gnd memorycell
Xwire2l41 n_bl2_41 n_bl2_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r41 n_br2_41 n_br2_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_41 gnd gnd n_bl2_42 gnd n_br2_42 gnd vdd_unselected gnd memorycell
Xwire2l42 n_bl2_42 n_bl2_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r42 n_br2_42 n_br2_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_42 gnd gnd n_bl2_43 gnd n_br2_43 gnd vdd_unselected gnd memorycell
Xwire2l43 n_bl2_43 n_bl2_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r43 n_br2_43 n_br2_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_43 gnd gnd n_bl2_44 gnd n_br2_44 gnd vdd_unselected gnd memorycell
Xwire2l44 n_bl2_44 n_bl2_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r44 n_br2_44 n_br2_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_44 gnd gnd n_bl2_45 gnd n_br2_45 gnd vdd_unselected gnd memorycell
Xwire2l45 n_bl2_45 n_bl2_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r45 n_br2_45 n_br2_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_45 gnd gnd n_bl2_46 gnd n_br2_46 gnd vdd_unselected gnd memorycell
Xwire2l46 n_bl2_46 n_bl2_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r46 n_br2_46 n_br2_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_46 gnd gnd n_bl2_47 gnd n_br2_47 gnd vdd_unselected gnd memorycell
Xwire2l47 n_bl2_47 n_bl2_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r47 n_br2_47 n_br2_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_47 gnd gnd n_bl2_48 gnd n_br2_48 gnd vdd_unselected gnd memorycell
Xwire2l48 n_bl2_48 n_bl2_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r48 n_br2_48 n_br2_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_48 gnd gnd n_bl2_49 gnd n_br2_49 gnd vdd_unselected gnd memorycell
Xwire2l49 n_bl2_49 n_bl2_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r49 n_br2_49 n_br2_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_49 gnd gnd n_bl2_50 gnd n_br2_50 gnd vdd_unselected gnd memorycell
Xwire2l50 n_bl2_50 n_bl2_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r50 n_br2_50 n_br2_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_50 gnd gnd n_bl2_51 gnd n_br2_51 gnd vdd_unselected gnd memorycell
Xwire2l51 n_bl2_51 n_bl2_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r51 n_br2_51 n_br2_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_51 gnd gnd n_bl2_52 gnd n_br2_52 gnd vdd_unselected gnd memorycell
Xwire2l52 n_bl2_52 n_bl2_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r52 n_br2_52 n_br2_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_52 gnd gnd n_bl2_53 gnd n_br2_53 gnd vdd_unselected gnd memorycell
Xwire2l53 n_bl2_53 n_bl2_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r53 n_br2_53 n_br2_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_53 gnd gnd n_bl2_54 gnd n_br2_54 gnd vdd_unselected gnd memorycell
Xwire2l54 n_bl2_54 n_bl2_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r54 n_br2_54 n_br2_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_54 gnd gnd n_bl2_55 gnd n_br2_55 gnd vdd_unselected gnd memorycell
Xwire2l55 n_bl2_55 n_bl2_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r55 n_br2_55 n_br2_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_55 gnd gnd n_bl2_56 gnd n_br2_56 gnd vdd_unselected gnd memorycell
Xwire2l56 n_bl2_56 n_bl2_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r56 n_br2_56 n_br2_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_56 gnd gnd n_bl2_57 gnd n_br2_57 gnd vdd_unselected gnd memorycell
Xwire2l57 n_bl2_57 n_bl2_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r57 n_br2_57 n_br2_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_57 gnd gnd n_bl2_58 gnd n_br2_58 gnd vdd_unselected gnd memorycell
Xwire2l58 n_bl2_58 n_bl2_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r58 n_br2_58 n_br2_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_58 gnd gnd n_bl2_59 gnd n_br2_59 gnd vdd_unselected gnd memorycell
Xwire2l59 n_bl2_59 n_bl2_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r59 n_br2_59 n_br2_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_59 gnd gnd n_bl2_60 gnd n_br2_60 gnd vdd_unselected gnd memorycell
Xwire2l60 n_bl2_60 n_bl2_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r60 n_br2_60 n_br2_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_60 gnd gnd n_bl2_61 gnd n_br2_61 gnd vdd_unselected gnd memorycell
Xwire2l61 n_bl2_61 n_bl2_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r61 n_br2_61 n_br2_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_61 gnd gnd n_bl2_62 gnd n_br2_62 gnd vdd_unselected gnd memorycell
Xwire2l62 n_bl2_62 n_bl2_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r62 n_br2_62 n_br2_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_62 gnd gnd n_bl2_63 gnd n_br2_63 gnd vdd_unselected gnd memorycell
Xwire2l63 n_bl2_63 n_bl2_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire2r63 n_br2_63 n_br2_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_2_63 n_precharge2 gnd n_bl2_64 gnd n_br2_64 gnd vdd_unselected gnd memorycell
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
.END