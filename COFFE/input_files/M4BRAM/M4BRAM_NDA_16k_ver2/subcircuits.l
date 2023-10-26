*** SUBCIRCUITS

.LIB SUBCIRCUITS

******************************************************************************************
* sb_mux driver subcircuit (12:1)
******************************************************************************************
.SUBCKT sb_mux_driver n_in n_out n_vdd n_gnd
Xrest_sb_mux n_in n_1_1 n_vdd n_gnd rest Wp=rest_sb_mux_pmos
Xinv_sb_mux_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_sb_mux_1_nmos Wp=inv_sb_mux_1_pmos
Xwire_sb_mux_driver n_1_1 n_1_2 wire Rw=wire_sb_mux_driver_res Cw=wire_sb_mux_driver_cap
Xinv_sb_mux_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_sb_mux_2_nmos Wp=inv_sb_mux_2_pmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), turned off 
******************************************************************************************
.SUBCKT sb_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_sb_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), partially turned on
******************************************************************************************
.SUBCKT sb_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_sb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_1 n_1 n_1_1 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L2 n_1_4 n_gnd n_gnd n_gnd ptran Wn=ptran_sb_mux_L2_nmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT sb_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_sb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_1 n_1 n_1_1 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L2 n_1_4 n_2 n_gate n_gnd ptran Wn=ptran_sb_mux_L2_nmos
Xwire_sb_mux_L2_1 n_2 n_out wire Rw='wire_sb_mux_L2_res/2' Cw='wire_sb_mux_L2_cap/2'
Xptran_sb_mux_L2_1h n_gnd n_out n_gnd n_gnd ptran Wn=ptran_sb_mux_L2_nmos
Xwire_sb_mux_L2_2  n_out n_2_1 wire Rw='wire_sb_mux_L2_res/2' Cw='wire_sb_mux_L2_cap/2'
Xptran_sb_mux_L2_2h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_sb_mux_L2_nmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), fully turned on 
******************************************************************************************
.SUBCKT sb_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xsb_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd sb_mux_on_mux_only
Xsb_mux_driver n_1_1 n_out n_vdd n_gnd sb_mux_driver
.ENDS


******************************************************************************************
* cb_mux driver subcircuit (64:1)
******************************************************************************************
.SUBCKT cb_mux_driver n_in n_out n_vdd n_gnd
Xrest_cb_mux n_in n_1_1 n_vdd n_gnd rest Wp=rest_cb_mux_pmos
Xinv_cb_mux_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_cb_mux_1_nmos Wp=inv_cb_mux_1_pmos
Xwire_cb_mux_driver n_1_1 n_1_2 wire Rw=wire_cb_mux_driver_res Cw=wire_cb_mux_driver_cap
Xinv_cb_mux_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_cb_mux_2_nmos Wp=inv_cb_mux_2_pmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), turned off 
******************************************************************************************
.SUBCKT cb_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_cb_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), partially turned on
******************************************************************************************
.SUBCKT cb_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_cb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_1 n_1 n_1_1 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_5h n_gnd n_1_5 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_6 n_1_5 n_1_6 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_6h n_gnd n_1_6 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_7 n_1_6 n_1_7 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_7h n_gnd n_1_7 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_8 n_1_7 n_1_8 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L2 n_1_8 n_gnd n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT cb_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_cb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_1 n_1 n_1_1 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_5h n_gnd n_1_5 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_6 n_1_5 n_1_6 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_6h n_gnd n_1_6 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_7 n_1_6 n_1_7 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_7h n_gnd n_1_7 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_8 n_1_7 n_1_8 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L2 n_1_8 n_2 n_gate n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_1 n_2 n_2_1 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_1h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_2 n_2_1 n_2_2 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_2h n_gnd n_2_2 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_3 n_2_2 n_2_3 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_3h n_gnd n_2_3 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_4 n_2_3 n_out wire Rw='wire_cb_mux_L2_res/14' Cw='wire_cb_mux_L2_cap/14'
Xwire_cb_mux_L2_5  n_out n_2_4 wire Rw='wire_cb_mux_L2_res/14' Cw='wire_cb_mux_L2_cap/14'
Xptran_cb_mux_L2_4h n_gnd n_2_4 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_6 n_2_4 n_2_5 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_5h n_gnd n_2_5 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_7 n_2_5 n_2_6 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_6h n_gnd n_2_6 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_8 n_2_6 n_2_7 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_7h n_gnd n_2_7 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), fully turned on 
******************************************************************************************
.SUBCKT cb_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xcb_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd cb_mux_on_mux_only
Xcb_mux_driver n_1_1 n_out n_vdd n_gnd cb_mux_driver
.ENDS


******************************************************************************************
* 6-LUT subcircuit 
******************************************************************************************
.SUBCKT lut n_in n_out n_a n_b n_c n_d n_e n_f n_vdd n_gnd
Xinv_lut_sram_driver_1 n_in n_1_1 n_vdd n_gnd inv Wn=45n Wp=75.015n
Xwire_lut_sram_driver n_1_1 n_1_2 wire Rw=wire_lut_sram_driver_res Cw=wire_lut_sram_driver_cap
Xinv_lut_sram_driver_2 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_lut_0sram_driver_2_nmos Wp=inv_lut_0sram_driver_2_pmos
Xwire_lut_sram_driver_out n_2_1 n_2_2 wire Rw=wire_lut_sram_driver_out_res Cw=wire_lut_sram_driver_out_cap

* First chain
Xptran_lut_L1 n_2_2 n_3_1 n_a n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_L1 n_3_1 n_3_2 wire Rw='wire_lut_L1_res/2' Cw='wire_lut_L1_cap/2'
Xwire_lut_L1h n_3_2 n_3_3 wire Rw='wire_lut_L1_res/2' Cw='wire_lut_L1_cap/2'
Xptran_lut_L1h n_gnd n_3_3 n_gnd n_gnd ptran Wn=ptran_lut_L1_nmos
Xptran_lut_L2 n_3_2 n_4_1 n_b n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_L2 n_4_1 n_4_2 wire Rw='wire_lut_L2_res/2' Cw='wire_lut_L2_cap/2'
Xwire_lut_L2h n_4_2 n_4_3 wire Rw='wire_lut_L2_res/2' Cw='wire_lut_L2_cap/2'
Xptran_lut_L2h n_gnd n_4_3 n_gnd n_gnd ptran Wn=ptran_lut_L2_nmos
Xptran_lut_L3 n_4_2 n_5_1 n_c n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_L3 n_5_1 n_5_2 wire Rw='wire_lut_L3_res/2' Cw='wire_lut_L3_cap/2'
Xwire_lut_L3h n_5_2 n_5_3 wire Rw='wire_lut_L3_res/2' Cw='wire_lut_L3_cap/2'
Xptran_lut_L3h n_gnd n_5_3 n_gnd n_gnd ptran Wn=ptran_lut_L3_nmos

* Internal buffer 
Xrest_lut_int_buffer n_5_2 n_6_1 n_vdd n_gnd rest Wp=rest_lut_int_buffer_pmos
Xinv_lut_int_buffer_1 n_5_2 n_6_1 n_vdd n_gnd inv Wn=inv_lut_int_buffer_1_nmos Wp=inv_lut_int_buffer_1_pmos
Xwire_lut_int_buffer n_6_1 n_6_2 wire Rw=wire_lut_int_buffer_res Cw=wire_lut_int_buffer_cap
Xinv_lut_int_buffer_2 n_6_2 n_7_1 n_vdd n_gnd inv Wn=inv_lut_int_buffer_2_nmos Wp=inv_lut_int_buffer_2_pmos
Xwire_lut_int_buffer_out n_7_1 n_7_2 wire Rw=wire_lut_int_buffer_out_res Cw=wire_lut_int_buffer_out_cap

* Second chain
Xptran_lut_L4 n_7_2 n_8_1 n_d n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_L4 n_8_1 n_8_2 wire Rw='wire_lut_L4_res/2' Cw='wire_lut_L4_cap/2'
Xwire_lut_L4h n_8_2 n_8_3 wire Rw='wire_lut_L4_res/2' Cw='wire_lut_L4_cap/2'
Xptran_lut_L4h n_gnd n_8_3 n_gnd n_gnd ptran Wn=ptran_lut_L4_nmos
Xptran_lut_L5 n_8_2 n_9_1 n_e n_gnd ptran Wn=ptran_lut_L5_nmos
Xwire_lut_L5 n_9_1 n_9_2 wire Rw='wire_lut_L5_res/2' Cw='wire_lut_L5_cap/2'
Xwire_lut_L5h n_9_2 n_9_3 wire Rw='wire_lut_L5_res/2' Cw='wire_lut_L5_cap/2'
Xptran_lut_L5h n_gnd n_9_3 n_gnd n_gnd ptran Wn=ptran_lut_L5_nmos
Xptran_lut_L6 n_9_2 n_10_1 n_f n_gnd ptran Wn=ptran_lut_L6_nmos
Xwire_lut_L6 n_10_1 n_10_2 wire Rw='wire_lut_L6_res/2' Cw='wire_lut_L6_cap/2'
Xwire_lut_L6h n_10_2 n_10_3 wire Rw='wire_lut_L6_res/2' Cw='wire_lut_L6_cap/2'
Xptran_lut_L6h n_gnd n_10_3 n_gnd n_gnd ptran Wn=ptran_lut_L6_nmos

* Output buffer 
Xrest_lut_out_buffer n_10_2 n_11_1 n_vdd n_gnd rest Wp=rest_lut_out_buffer_pmos
Xinv_lut_out_buffer_1 n_10_2 n_11_1 n_vdd n_gnd inv Wn=inv_lut_out_buffer_1_nmos Wp=inv_lut_out_buffer_1_pmos
Xwire_lut_out_buffer n_11_1 n_11_2 wire Rw=wire_lut_out_buffer_res Cw=wire_lut_out_buffer_cap
Xinv_lut_out_buffer_2 n_11_2 n_out n_vdd n_gnd inv Wn=inv_lut_out_buffer_2_nmos Wp=inv_lut_out_buffer_2_pmos

.ENDS


******************************************************************************************
* LUT lut_a_driver subcircuit 
******************************************************************************************
.SUBCKT lut_a_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_a_driver n_in n_not_input wire Rw=wire_lut_a_driver_res Cw=wire_lut_a_driver_cap
Xinv_lut_a_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_a_driver_2_nmos Wp=inv_lut_a_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_a_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_a_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_a_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_a_driver_not_1_nmos Wp=inv_lut_a_driver_not_1_pmos
Xwire_lut_a_driver_not n_1_1 n_1_2 wire Rw=wire_lut_a_driver_not_res Cw=wire_lut_a_driver_not_cap
Xinv_lut_a_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_a_driver_not_2_nmos Wp=inv_lut_a_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_b_driver subcircuit 
******************************************************************************************
.SUBCKT lut_b_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_b_driver n_in n_not_input wire Rw=wire_lut_b_driver_res Cw=wire_lut_b_driver_cap
Xinv_lut_b_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_b_driver_2_nmos Wp=inv_lut_b_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_b_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_b_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_b_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_b_driver_not_1_nmos Wp=inv_lut_b_driver_not_1_pmos
Xwire_lut_b_driver_not n_1_1 n_1_2 wire Rw=wire_lut_b_driver_not_res Cw=wire_lut_b_driver_not_cap
Xinv_lut_b_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_b_driver_not_2_nmos Wp=inv_lut_b_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_c_driver subcircuit 
******************************************************************************************
.SUBCKT lut_c_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xinv_lut_c_driver_0 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_c_driver_0_nmos Wp=inv_lut_c_driver_0_pmos
Xwire_lut_c_driver_0_rsel n_1_1 n_rsel wire Rw=wire_lut_c_driver_0_rsel_res Cw=wire_lut_c_driver_0_rsel_cap
Xwire_lut_c_driver_0_out n_1_1 n_1_2 wire Rw=wire_lut_c_driver_0_out_res Cw=wire_lut_c_driver_0_out_cap
Xptran_lut_c_driver_0 n_1_2 n_2_1 n_gate n_gnd ptran Wn=ptran_lut_c_driver_0_nmos
Xwire_lut_c_driver_0 n_2_1 n_2_2 wire Rw='wire_lut_c_driver_0_res/2' Cw='wire_lut_c_driver_0_cap/2'
Xwire_lut_c_driver_0h n_2_2 n_2_3 wire Rw='wire_lut_c_driver_0_res/2' Cw='wire_lut_c_driver_0_cap/2'
Xptran_lut_c_driver_0h n_gnd n_2_3 n_gate_n n_gnd ptran Wn=ptran_lut_c_driver_0_nmos
Xrest_lut_c_driver n_2_2 n_3_1 n_vdd n_gnd rest Wp=rest_lut_c_driver_pmos
Xinv_lut_c_driver_1 n_2_2 n_3_1 n_vdd n_gnd inv Wn=inv_lut_c_driver_1_nmos Wp=inv_lut_c_driver_1_pmos
Xwire_lut_c_driver n_3_1 n_not_input wire Rw=wire_lut_c_driver_res Cw=wire_lut_c_driver_cap
Xinv_lut_c_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_c_driver_2_nmos Wp=inv_lut_c_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_c_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_c_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_c_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_c_driver_not_1_nmos Wp=inv_lut_c_driver_not_1_pmos
Xwire_lut_c_driver_not n_1_1 n_1_2 wire Rw=wire_lut_c_driver_not_res Cw=wire_lut_c_driver_not_cap
Xinv_lut_c_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_c_driver_not_2_nmos Wp=inv_lut_c_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_d_driver subcircuit 
******************************************************************************************
.SUBCKT lut_d_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_d_driver n_in n_not_input wire Rw=wire_lut_d_driver_res Cw=wire_lut_d_driver_cap
Xinv_lut_d_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_d_driver_2_nmos Wp=inv_lut_d_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_d_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_d_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_d_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_d_driver_not_1_nmos Wp=inv_lut_d_driver_not_1_pmos
Xwire_lut_d_driver_not n_1_1 n_1_2 wire Rw=wire_lut_d_driver_not_res Cw=wire_lut_d_driver_not_cap
Xinv_lut_d_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_d_driver_not_2_nmos Wp=inv_lut_d_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_e_driver subcircuit 
******************************************************************************************
.SUBCKT lut_e_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_e_driver n_in n_not_input wire Rw=wire_lut_e_driver_res Cw=wire_lut_e_driver_cap
Xinv_lut_e_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_e_driver_2_nmos Wp=inv_lut_e_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_e_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_e_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_e_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_e_driver_not_1_nmos Wp=inv_lut_e_driver_not_1_pmos
Xwire_lut_e_driver_not n_1_1 n_1_2 wire Rw=wire_lut_e_driver_not_res Cw=wire_lut_e_driver_not_cap
Xinv_lut_e_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_e_driver_not_2_nmos Wp=inv_lut_e_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_f_driver subcircuit 
******************************************************************************************
.SUBCKT lut_f_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_f_driver n_in n_not_input wire Rw=wire_lut_f_driver_res Cw=wire_lut_f_driver_cap
Xinv_lut_f_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_f_driver_2_nmos Wp=inv_lut_f_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_f_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_f_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_f_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_f_driver_not_1_nmos Wp=inv_lut_f_driver_not_1_pmos
Xwire_lut_f_driver_not n_1_1 n_1_2 wire Rw=wire_lut_f_driver_not_res Cw=wire_lut_f_driver_not_cap
Xinv_lut_f_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_f_driver_not_2_nmos Wp=inv_lut_f_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT a-input load subcircuit 
******************************************************************************************
.SUBCKT lut_a_driver_load n_1 n_vdd n_gnd
Xwire_lut_a_driver_load_1 n_1 n_2 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_2 n_2 n_3 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_3 n_3 n_4 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_4 n_4 n_5 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_5 n_5 n_6 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_5 n_gnd n_gnd n_6 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_6 n_6 n_7 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_6 n_gnd n_gnd n_7 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_7 n_7 n_8 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_7 n_gnd n_gnd n_8 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_8 n_8 n_9 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_8 n_gnd n_gnd n_9 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_9 n_9 n_10 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_9 n_gnd n_gnd n_10 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_10 n_10 n_11 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_10 n_gnd n_gnd n_11 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_11 n_11 n_12 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_11 n_gnd n_gnd n_12 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_12 n_12 n_13 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_12 n_gnd n_gnd n_13 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_13 n_13 n_14 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_13 n_gnd n_gnd n_14 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_14 n_14 n_15 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_14 n_gnd n_gnd n_15 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_15 n_15 n_16 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_15 n_gnd n_gnd n_16 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_16 n_16 n_17 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_16 n_gnd n_gnd n_17 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_17 n_17 n_18 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_17 n_gnd n_gnd n_18 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_18 n_18 n_19 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_18 n_gnd n_gnd n_19 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_19 n_19 n_20 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_19 n_gnd n_gnd n_20 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_20 n_20 n_21 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_20 n_gnd n_gnd n_21 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_21 n_21 n_22 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_21 n_gnd n_gnd n_22 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_22 n_22 n_23 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_22 n_gnd n_gnd n_23 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_23 n_23 n_24 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_23 n_gnd n_gnd n_24 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_24 n_24 n_25 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_24 n_gnd n_gnd n_25 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_25 n_25 n_26 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_25 n_gnd n_gnd n_26 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_26 n_26 n_27 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_26 n_gnd n_gnd n_27 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_27 n_27 n_28 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_27 n_gnd n_gnd n_28 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_28 n_28 n_29 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_28 n_gnd n_gnd n_29 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_29 n_29 n_30 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_29 n_gnd n_gnd n_30 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_30 n_30 n_31 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_30 n_gnd n_gnd n_31 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_31 n_31 n_32 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_31 n_gnd n_gnd n_32 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_32 n_32 n_33 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_32 n_gnd n_gnd n_33 n_gnd ptran Wn=ptran_lut_L1_nmos
.ENDS


******************************************************************************************
* LUT b-input load subcircuit 
******************************************************************************************
.SUBCKT lut_b_driver_load n_1 n_vdd n_gnd
Xwire_lut_b_driver_load_1 n_1 n_2 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_2 n_2 n_3 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_3 n_3 n_4 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_4 n_4 n_5 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_5 n_5 n_6 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_5 n_gnd n_gnd n_6 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_6 n_6 n_7 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_6 n_gnd n_gnd n_7 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_7 n_7 n_8 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_7 n_gnd n_gnd n_8 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_8 n_8 n_9 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_8 n_gnd n_gnd n_9 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_9 n_9 n_10 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_9 n_gnd n_gnd n_10 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_10 n_10 n_11 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_10 n_gnd n_gnd n_11 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_11 n_11 n_12 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_11 n_gnd n_gnd n_12 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_12 n_12 n_13 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_12 n_gnd n_gnd n_13 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_13 n_13 n_14 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_13 n_gnd n_gnd n_14 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_14 n_14 n_15 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_14 n_gnd n_gnd n_15 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_15 n_15 n_16 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_15 n_gnd n_gnd n_16 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_16 n_16 n_17 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_16 n_gnd n_gnd n_17 n_gnd ptran Wn=ptran_lut_L2_nmos
.ENDS


******************************************************************************************
* LUT c-input load subcircuit 
******************************************************************************************
.SUBCKT lut_c_driver_load n_1 n_vdd n_gnd
Xwire_lut_c_driver_load_1 n_1 n_2 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_2 n_2 n_3 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_3 n_3 n_4 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_4 n_4 n_5 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_5 n_5 n_6 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_5 n_gnd n_gnd n_6 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_6 n_6 n_7 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_6 n_gnd n_gnd n_7 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_7 n_7 n_8 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_7 n_gnd n_gnd n_8 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_8 n_8 n_9 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_8 n_gnd n_gnd n_9 n_gnd ptran Wn=ptran_lut_L3_nmos
.ENDS


******************************************************************************************
* LUT d-input load subcircuit 
******************************************************************************************
.SUBCKT lut_d_driver_load n_1 n_vdd n_gnd
Xwire_lut_d_driver_load_1 n_1 n_2 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_d_driver_load_2 n_2 n_3 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_d_driver_load_3 n_3 n_4 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_d_driver_load_4 n_4 n_5 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L4_nmos
.ENDS


******************************************************************************************
* LUT e-input load subcircuit 
******************************************************************************************
.SUBCKT lut_e_driver_load n_1 n_vdd n_gnd
Xwire_lut_e_driver_load_1 n_1 n_2 wire Rw='wire_lut_e_driver_load_res/2' Cw='wire_lut_e_driver_load_cap/2'
Xptran_lut_e_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L5_nmos
Xwire_lut_e_driver_load_2 n_2 n_3 wire Rw='wire_lut_e_driver_load_res/2' Cw='wire_lut_e_driver_load_cap/2'
Xptran_lut_e_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L5_nmos
.ENDS


******************************************************************************************
* LUT f-input load subcircuit 
******************************************************************************************
.SUBCKT lut_f_driver_load n_1 n_vdd n_gnd
Xwire_lut_f_driver_load_1 n_1 n_2 wire Rw='wire_lut_f_driver_load_res/1' Cw='wire_lut_f_driver_load_cap/1'
Xptran_lut_f_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L6_nmos
.ENDS


******************************************************************************************
* FF subcircuit 
******************************************************************************************
.SUBCKT ff n_in n_out n_gate n_gate_n n_clk n_clk_n n_set n_set_n n_reset n_reset_n n_vdd n_gnd
* Input selection MUX
Xptran_ff_input_select n_in n_1_1 n_gate n_gnd ptran Wn=ptran_ff_input_select_nmos
Xwire_ff_input_select n_1_1 n_1_2 wire Rw='wire_ff_input_select_res/2' Cw='wire_ff_input_select_cap/2'
Xwire_ff_input_select_h n_1_2 n_1_3 wire Rw='wire_ff_input_select_res/2' Cw='wire_ff_input_select_cap/2'
Xptran_ff_input_select_h n_gnd n_1_3 n_gate_n n_gnd ptran Wn=ptran_ff_input_select_nmos
Xrest_ff_input_select n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_ff_input_select_pmos
Xinv_ff_input_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_ff_input_1_nmos Wp=inv_ff_input_1_pmos

* First T-gate and cross-coupled inverters
Xwire_ff_input_out n_2_1 n_2_2 wire Rw=wire_ff_input_out_res Cw=wire_ff_input_out_cap
Xtgate_ff_1 n_2_2 n_3_1 n_clk_n n_clk n_vdd n_gnd tgate Wn=tgate_ff_1_nmos Wp=tgate_ff_1_pmos
MPtran_ff_set_n n_3_1 n_set_n n_vdd n_vdd pmos L=gate_length W=tran_ff_set_n_pmos
MNtran_ff_reset n_3_1 n_reset n_gnd n_gnd nmos L=gate_length W=tran_ff_reset_nmos
Xwire_ff_tgate_1_out n_3_1 n_3_2 wire Rw=wire_ff_tgate_1_out_res Cw=wire_ff_tgate_1_out_cap
Xinv_ff_cc1_1 n_3_2 n_4_1 n_vdd n_gnd inv Wn=inv_ff_cc1_1_nmos Wp=inv_ff_cc1_1_pmos
Xinv_ff_cc1_2 n_4_1 n_3_2 n_vdd n_gnd inv Wn=inv_ff_cc1_2_nmos Wp=inv_ff_cc1_2_pmos
Xwire_ff_cc1_out n_4_1 n_4_2 wire Rw=wire_ff_cc1_out_res Cw=wire_ff_cc1_out_cap

* Second T-gate and cross-coupled inverters
Xtgate_ff_2 n_4_2 n_5_1 n_clk n_clk_n n_vdd n_gnd tgate Wn=tgate_ff_2_nmos Wp=tgate_ff_2_pmos
MPtran_ff_reset_n n_5_1 n_reset_n n_vdd n_vdd pmos L=gate_length W=tran_ff_reset_n_pmos
MNtran_ff_set n_5_1 n_set n_gnd n_gnd nmos L=gate_length W=tran_ff_set_nmos
Xwire_ff_tgate_2_out n_5_1 n_5_2 wire Rw=wire_ff_tgate_2_out_res Cw=wire_ff_tgate_2_out_cap
Xinv_ff_cc2_1 n_5_2 n_6_1 n_vdd n_gnd inv Wn=inv_ff_cc2_1_nmos Wp=inv_ff_cc2_1_pmos
Xinv_ff_cc2_2 n_6_1 n_5_2 n_vdd n_gnd inv Wn=inv_ff_cc2_2_nmos Wp=inv_ff_cc2_2_pmos
Xwire_ff_cc2_out n_6_1 n_6_2 wire Rw=wire_ff_cc2_out_res Cw=wire_ff_cc2_out_cap

* Output driver
Xinv_ff_output_driver n_6_2 n_out n_vdd n_gnd inv Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos

.ENDS


******************************************************************************************
* local_ble_output subcircuit (2:1)
******************************************************************************************
.SUBCKT local_ble_output n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_local_ble_output n_in n_1_1 n_gate n_gnd ptran Wn=ptran_local_ble_output_nmos
Xwire_local_ble_output n_1_1 n_1_2 wire Rw='wire_local_ble_output_res/2' Cw='wire_local_ble_output_cap/2'
Xwire_local_ble_output_h n_1_2 n_1_3 wire Rw='wire_local_ble_output_res/2' Cw='wire_local_ble_output_cap/2'
Xptran_local_ble_output_h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_local_ble_output_nmos
Xrest_local_ble_output n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_local_ble_output_pmos
Xinv_local_ble_output_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_local_ble_output_1_nmos Wp=inv_local_ble_output_1_pmos
Xwire_local_ble_output_driver n_2_1 n_2_2 wire Rw=wire_local_ble_output_driver_res Cw=wire_local_ble_output_driver_cap
Xinv_local_ble_output_2 n_2_2 n_out n_vdd n_gnd inv Wn=inv_local_ble_output_2_nmos Wp=inv_local_ble_output_2_pmos
.ENDS


******************************************************************************************
* general_ble_output subcircuit (2:1)
******************************************************************************************
.SUBCKT general_ble_output n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_general_ble_output n_in n_1_1 n_gate n_gnd ptran Wn=ptran_general_ble_output_nmos
Xwire_general_ble_output n_1_1 n_1_2 wire Rw='wire_general_ble_output_res/2' Cw='wire_general_ble_output_cap/2'
Xwire_general_ble_output_h n_1_2 n_1_3 wire Rw='wire_general_ble_output_res/2' Cw='wire_general_ble_output_cap/2'
Xptran_general_ble_output_h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_general_ble_output_nmos
Xrest_general_ble_output n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_general_ble_output_pmos
Xinv_general_ble_output_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_general_ble_output_1_nmos Wp=inv_general_ble_output_1_pmos
Xwire_general_ble_output_driver n_2_1 n_2_2 wire Rw=wire_general_ble_output_driver_res Cw=wire_general_ble_output_driver_cap
Xinv_general_ble_output_2 n_2_2 n_out n_vdd n_gnd inv Wn=inv_general_ble_output_2_nmos Wp=inv_general_ble_output_2_pmos
.ENDS


******************************************************************************************
* BLE outputs
******************************************************************************************
.SUBCKT ble_outputs n_1_3 n_local_out n_general_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_output_on n_vdd_general_output_on
Xlocal_ble_output_1 n_1_2 n_local_out n_gate n_gate_n n_vdd_local_output_on n_gnd local_ble_output
Xwire_ble_outputs_1 n_1_2 n_1_3 wire Rw='wire_ble_outputs_res/2' Cw='wire_ble_outputs_cap/2'
Xgeneral_ble_output_1 n_1_3 n_general_out n_gate n_gate_n n_vdd_general_output_on n_gnd general_ble_output
Xwire_ble_outputs_2 n_1_3 n_1_4 wire Rw='wire_ble_outputs_res/2' Cw='wire_ble_outputs_cap/2'
Xgeneral_ble_output_2 n_1_4 n_hang_4 n_gate n_gate_n n_vdd n_gnd general_ble_output
.ENDS


******************************************************************************************
* LUT output load
******************************************************************************************
.SUBCKT lut_output_load n_in n_local_out n_general_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_output_on n_vdd_general_output_on
Xwire_lut_output_load_1 n_in n_1_1 wire Rw='wire_lut_output_load_1_res' Cw='wire_lut_output_load_1_cap'
Xff n_1_1 n_hang1 n_gate n_gate_n n_vdd n_gnd n_gnd n_vdd n_gnd n_vdd n_vdd n_gnd ff
Xwire_lut_output_load_2 n_1_1 n_1_2 wire Rw='wire_lut_output_load_2_res' Cw='wire_lut_output_load_2_cap'
Xble_outputs n_1_2 n_local_out n_general_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_output_on n_vdd_general_output_on ble_outputs
.ENDS


******************************************************************************************
* local_mux sense inverter subcircuit (25:1)
******************************************************************************************
.SUBCKT local_mux_sense n_in n_out n_vdd n_gnd
Xrest_local_mux n_in n_out n_vdd n_gnd rest Wp=rest_local_mux_pmos
Xinv_local_mux_1 n_in n_out n_vdd n_gnd inv Wn=inv_local_mux_1_nmos Wp=inv_local_mux_1_pmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), turned off 
******************************************************************************************
.SUBCKT local_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_local_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), partially turned on
******************************************************************************************
.SUBCKT local_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L2 n_1_5 n_gnd n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT local_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L2 n_1_5 n_2 n_gate n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_1 n_2 n_2_1 wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_1h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_2 n_2_1 n_out wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_2h n_gnd n_out n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_3  n_out n_2_2 wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_3h n_gnd n_2_2 n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_4 n_2_2 n_2_3 wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_4h n_gnd n_2_3 n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), fully turned on 
******************************************************************************************
.SUBCKT local_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xlocal_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd local_mux_on_mux_only
Xlocal_mux_sense n_1_1 n_out n_vdd n_gnd local_mux_sense
.ENDS


******************************************************************************************
* Local routing wire load
******************************************************************************************
.SUBCKT local_routing_wire_load n_in n_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_mux_on
Xwire_local_routing_1 n_in n_1 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_1 n_1 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_2 n_1 n_2 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_2 n_2 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_3 n_2 n_3 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_3 n_3 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_4 n_3 n_4 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_4 n_4 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_5 n_4 n_5 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_5 n_5 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_6 n_5 n_6 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_6 n_6 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_7 n_6 n_7 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_1 n_7 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_8 n_7 n_8 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_7 n_8 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_9 n_8 n_9 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_8 n_9 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_10 n_9 n_10 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_9 n_10 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_11 n_10 n_11 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_10 n_11 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_12 n_11 n_12 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_11 n_12 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_13 n_12 n_13 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_12 n_13 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_14 n_13 n_14 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_2 n_14 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_15 n_14 n_15 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_13 n_15 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_16 n_15 n_16 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_14 n_16 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_17 n_16 n_17 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_15 n_17 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_18 n_17 n_18 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_16 n_18 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_19 n_18 n_19 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_17 n_19 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_20 n_19 n_20 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_18 n_20 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_21 n_20 n_21 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_3 n_21 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_22 n_21 n_22 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_19 n_22 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_23 n_22 n_23 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_20 n_23 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_24 n_23 n_24 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_21 n_24 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_25 n_24 n_25 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_22 n_25 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_26 n_25 n_26 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_23 n_26 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_27 n_26 n_27 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_24 n_27 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_28 n_27 n_28 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_4 n_28 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_29 n_28 n_29 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_on_1 n_29 n_out n_gate n_gate_n n_vdd_local_mux_on n_gnd local_mux_on
Xwire_local_routing_30 n_29 n_30 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_25 n_30 n_gate n_gate_n n_vdd n_gnd local_mux_off
.ENDS


******************************************************************************************
* Local BLE output load
******************************************************************************************
.SUBCKT local_ble_output_load n_in n_gate n_gate_n n_vdd n_gnd
Xwire_local_ble_output_feedback n_in n_1_1 wire Rw='wire_local_ble_output_feedback_res' Cw='wire_local_ble_output_feedback_cap'
Xlocal_routing_wire_load_1 n_1_1 n_1_2 n_gate n_gate_n n_vdd n_gnd n_vdd local_routing_wire_load
Xlut_a_driver_1 n_1_2 n_hang1 vsram vsram_n n_hang2 n_hang3 n_vdd n_gnd lut_a_driver

.ENDS


******************************************************************************************
* General BLE output load
******************************************************************************************
.SUBCKT general_ble_output_load n_1_1 n_out n_gate n_gate_n n_vdd n_gnd
Xwire_general_ble_output_1 n_1_1 n_1_2 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_1 n_1_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_2 n_1_2 n_1_3 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_2 n_1_3 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_3 n_1_3 n_1_4 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_3 n_1_4 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_4 n_1_4 n_1_5 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_4 n_1_5 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_5 n_1_5 n_1_6 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_5 n_1_6 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_6 n_1_6 n_1_7 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_6 n_1_7 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_7 n_1_7 n_1_8 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_partial_1 n_1_8 n_gate n_gate_n n_vdd n_gnd sb_mux_partial
Xwire_general_ble_output_8 n_1_8 n_meas_point wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_on_1 n_meas_point n_out n_gate n_gate_n n_vdd n_gnd sb_mux_on
.ENDS


******************************************************************************************
* Routing wire load tile 1
******************************************************************************************
.SUBCKT routing_wire_load_tile_1 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd n_vdd_sb_mux_on n_vdd_cb_mux_on
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_partial_1 n_1_1 n_1_sb_partial_1 wire Rw=wire_sb_load_partial_res Cw=wire_sb_load_partial_cap
Xsb_load_partial_1 n_1_sb_partial_1 n_gate n_gate_n n_vdd n_gnd sb_mux_partial

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_on_1 n_1_1 n_1_cb_on_1 wire Rw=wire_cb_load_on_res Cw=wire_cb_load_on_cap
Xcb_load_on_1 n_1_cb_on_1 n_cb_out n_gate n_gate_n n_vdd_cb_mux_on n_gnd cb_mux_on

Xwire_cb_load_partial_1 n_1_1 n_1_cb_partial_1 wire Rw=wire_cb_load_partial_res Cw=wire_cb_load_partial_cap
Xcb_load_partial_1 n_1_cb_partial_1 n_gate n_gate_n n_vdd n_gnd cb_mux_partial

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_1_2 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
Xsb_mux_on_out n_1_2 n_out n_gate n_gate_n n_vdd_sb_mux_on n_gnd sb_mux_on
.ENDS


******************************************************************************************
* Routing wire load tile 2
******************************************************************************************
.SUBCKT routing_wire_load_tile_2 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_sb_load_off_2 n_1_1 n_1_sb_off_2 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_2 n_1_sb_off_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_3 n_1_1 n_1_cb_off_3 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_3 n_1_cb_off_3 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_4 n_1_1 n_1_cb_off_4 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_4 n_1_cb_off_4 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_out wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
.ENDS


******************************************************************************************
* Routing wire load tile 3
******************************************************************************************
.SUBCKT routing_wire_load_tile_3 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_sb_load_off_2 n_1_1 n_1_sb_off_2 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_2 n_1_sb_off_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_3 n_1_1 n_1_cb_off_3 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_3 n_1_cb_off_3 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_4 n_1_1 n_1_cb_off_4 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_4 n_1_cb_off_4 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_out wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
.ENDS


******************************************************************************************
* Routing wire load tile 4
******************************************************************************************
.SUBCKT routing_wire_load_tile_4 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_sb_load_off_2 n_1_1 n_1_sb_off_2 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_2 n_1_sb_off_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_3 n_1_1 n_1_cb_off_3 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_3 n_1_cb_off_3 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_4 n_1_1 n_1_cb_off_4 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_4 n_1_cb_off_4 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_out wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
.ENDS


******************************************************************************************
* Routing wire load tile 4
******************************************************************************************
.SUBCKT routing_wire_load n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd n_vdd_sb_mux_on n_vdd_cb_mux_on
Xrouting_wire_load_tile_4 n_in n_4 n_hang_4 n_gate n_gate_n n_vdd n_gnd routing_wire_load_tile_4
Xrouting_wire_load_tile_3 n_4 n_3 n_hang_3 n_gate n_gate_n n_vdd n_gnd routing_wire_load_tile_3
Xrouting_wire_load_tile_2 n_3 n_2 n_hang_2 n_gate n_gate_n n_vdd n_gnd routing_wire_load_tile_2
Xrouting_wire_load_tile_1 n_2 n_out n_cb_out n_gate n_gate_n n_vdd n_gnd n_vdd_sb_mux_on n_vdd_cb_mux_on routing_wire_load_tile_1
.ENDS


******************************************************************************************
* ram_local_mux sense inverter subcircuit (25:1)
******************************************************************************************
.SUBCKT ram_local_mux_sense n_in n_out n_vdd n_gnd
Xrest_ram_local_mux n_in n_out n_vdd n_gnd rest Wp=rest_ram_local_mux_pmos
Xinv_ram_local_mux_1 n_in n_out n_vdd n_gnd inv Wn=inv_ram_local_mux_1_nmos Wp=inv_ram_local_mux_1_pmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), turned off 
******************************************************************************************
.SUBCKT ram_local_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_ram_local_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), partially turned on
******************************************************************************************
.SUBCKT ram_local_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_ram_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L2 n_1_5 n_gnd n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT ram_local_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_ram_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L2 n_1_5 n_2 n_gate n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_1 n_2 n_2_1 wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_1h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_2 n_2_1 n_out wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_2h n_gnd n_out n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_3  n_out n_2_2 wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_3h n_gnd n_2_2 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_4 n_2_2 n_2_3 wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_4h n_gnd n_2_3 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), fully turned on 
******************************************************************************************
.SUBCKT ram_local_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xram_local_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd ram_local_mux_on_mux_only
Xram_local_mux_sense n_1_1 n_out n_vdd n_gnd ram_local_mux_sense
.ENDS


******************************************************************************************
* rowdecoderstage12 low power stage 0 of row decoder
******************************************************************************************
.SUBCKT rowdecoderstage12 n_in n_out n_vdd n_gnd
Xrowdecoderstage12_nand n_in n_1_1 n_vdd n_gnd nand2_lp Wn=inv_nand2_rowdecoderstage12_1_nmos Wp=inv_nand2_rowdecoderstage12_1_pmos
Xrowdecoderstage12_inv n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_rowdecoderstage12_2_nmos Wp=inv_rowdecoderstage12_2_pmos
.ENDS


******************************************************************************************
* rowdecoderstage13 low power stage 0 of row decoder
******************************************************************************************
.SUBCKT rowdecoderstage13 n_in n_out n_vdd n_gnd
Xrowdecoderstage13_nand n_in n_1_1 n_vdd n_gnd nand3_lp Wn=inv_nand3_rowdecoderstage13_1_nmos Wp=inv_nand3_rowdecoderstage13_1_pmos
Xrowdecoderstage13_inv n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_rowdecoderstage13_2_nmos Wp=inv_rowdecoderstage13_2_pmos
.ENDS


******************************************************************************************
* rowdecoderstage3 subcircuit row decoder last stage 
******************************************************************************************
.SUBCKT rowdecoderstage3 n_in n_out n_vdd n_gnd
X0rowdecoderstage3_nand3 n_in n_1_1 n_vdd n_gnd nand3 Wn=inv_nand3_rowdecoderstage3_1_nmos Wp=inv_nand3_rowdecoderstage3_1_pmos
X_invrowdecoderstage3_2 n_1_1 n_out n_vdd n_gnd inv Wn=inv_rowdecoderstage3_2_nmos Wp=inv_rowdecoderstage3_2_pmos
.ENDS


******************************************************************************************
* rowdecoderstage0 low power stage 0 of row decoder
******************************************************************************************
.SUBCKT rowdecoderstage0 n_in n_out n_vdd n_gnd
Xrowdecoderstage0 n_in n_out n_vdd n_gnd inv_lp Wn=inv_rowdecoderstage0_1_nmos Wp=inv_rowdecoderstage0_1_pmos
.ENDS


******************************************************************************************
* wordline_driver subcircuit predecoder stage 3 
******************************************************************************************
.SUBCKT wordline_driver n_in n_out n_vdd n_gnd
Xwordline_driver_nand2 n_in n_1_1 n_vdd n_gnd nand2_lp Wn=inv_nand2_wordline_driver_1_nmos Wp=inv_nand2_wordline_driver_1_pmos
X_invwordline_driver_2 n_1_1 n_1_2 n_vdd n_gnd inv_lp Wn=inv_wordline_driver_2_nmos Wp=inv_wordline_driver_2_pmos
X_invwordline_driver_3 n_1_2 n_1_3 n_vdd n_gnd inv_lp Wn=inv_wordline_driver_3_nmos Wp=inv_wordline_driver_3_pmos
X_invwordline_driver_4 n_1_3 n_out n_vdd n_gnd inv_lp Wn=inv_wordline_driver_4_nmos Wp=inv_wordline_driver_4_pmos
.ENDS


******************************************************************************************
* RAM local routing wire load
******************************************************************************************
.SUBCKT RAM_local_routing_wire_load n_in n_out n_gate n_gate_n n_vdd n_gnd n_vdd_RAM_local_mux_on
Xwire_RAM_local_routing_1 n_in n_1 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_1 n_1 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_2 n_1 n_2 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_2 n_2 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_3 n_2 n_3 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_3 n_3 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_4 n_3 n_4 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_4 n_4 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_5 n_4 n_5 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_5 n_5 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_6 n_5 n_6 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_6 n_6 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_7 n_6 n_7 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_7 n_7 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_8 n_7 n_8 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_8 n_8 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_9 n_8 n_9 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_9 n_9 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_10 n_9 n_10 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_10 n_10 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_11 n_10 n_11 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_11 n_11 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_12 n_11 n_12 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_12 n_12 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_13 n_12 n_13 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_13 n_13 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_14 n_13 n_14 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_14 n_14 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_15 n_14 n_15 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_15 n_15 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_16 n_15 n_16 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_16 n_16 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_17 n_16 n_17 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_17 n_17 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_18 n_17 n_18 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_18 n_18 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_19 n_18 n_19 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_19 n_19 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_20 n_19 n_20 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_20 n_20 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_21 n_20 n_21 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_21 n_21 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_22 n_21 n_22 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_22 n_22 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_23 n_22 n_23 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_23 n_23 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_24 n_23 n_24 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_partial_1 n_24 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_partial
Xwire_RAM_local_routing_25 n_24 n_25 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_on_1 n_25 n_out n_gate n_gate_n n_vdd_RAM_local_mux_on n_gnd RAM_local_mux_on
.ENDS


******************************************************************************************
* memorycell subcircuit low power memory sram cell 
******************************************************************************************
.SUBCKT memorycell n_wl1 n_wl2 n_bl1 n_bl2 n_br1 n_br2 n_vdd n_gnd
M1 n_1_1 n_1_2 n_gnd n_gnd nmos_lp L=22n W=115n AD=6.9f PD=295n AS=4.6f PS=195n
M0 n_1_2 n_1_1 n_gnd n_gnd nmos_lp L=22n W=115n AD=6.9f PD=295n AS=4.6f PS=195n
M3 n_1_1 n_1_2 n_vdd n_vdd pmos_lp L=22n W=45n AD=2.7f PD=210n AS=1.8f PS=125n
M2 n_1_2 n_1_1 n_vdd n_vdd pmos_lp L=22n W=45n AD=2.7f PD=210n AS=1.8f PS=125n
M4 n_bl1 n_wl1 n_1_2 n_gnd nmos_lp L=22n W=55n AD=2.2f PD=135n AS=3.3f PS=230n
M5 n_br1 n_wl1 n_1_1 n_gnd nmos_lp L=22n W=55n AD=2.2f PD=135n AS=1.1f PS=40n
M6 n_bl2 n_wl2 n_1_1 n_gnd nmos_lp L=22n W=55n AD=2.2f PD=135n AS=3.3f PS=230n
M7 n_br2 n_wl2 n_1_2 n_gnd nmos_lp L=22n W=55n AD=2.2f PD=135n AS=1.1f PS=40n
.ENDS


******************************************************************************************
* precharge subcircuit low power precharge and equalization 
******************************************************************************************
.SUBCKT precharge n_precharge_bar n_bl n_blbar n_vdd n_gnd
M1 n_bl n_precharge_bar n_vdd n_vdd pmos_lp L=gate_length W=ptran_precharge_side_nmos AS=ptran_precharge_side_nmos*trans_diffusion_length AD=ptran_precharge_side_nmos*trans_diffusion_length PS=ptran_precharge_side_nmos+2*trans_diffusion_length PD=ptran_precharge_side_nmos+2*trans_diffusion_length
M0 n_blbar n_precharge_bar n_vdd n_vdd pmos_lp L=gate_length W=ptran_precharge_side_nmos AS=ptran_precharge_side_nmos*trans_diffusion_length AD=ptran_precharge_side_nmos*trans_diffusion_length PS=ptran_precharge_side_nmos+2*trans_diffusion_length PD=ptran_precharge_side_nmos+2*trans_diffusion_length
M2 n_bl n_precharge_bar n_blbar n_vdd pmos_lp L=gate_length W=ptran_precharge_side_nmos AS=ptran_equalization_nmos*trans_diffusion_length AD=ptran_equalization_nmos*trans_diffusion_length PS=ptran_equalization_nmos+2*trans_diffusion_length PD=ptran_equalization_nmos+2*trans_diffusion_length
.ENDS


******************************************************************************************
* samp1 subcircuit sense amp 
******************************************************************************************
.SUBCKT samp1 n_se n_in1 n_in2 n_out n_vdd n_gnd 
M1 n_in1 n_se n_1_1 n_vdd pmos_lp L=32n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M0 n_1_1 n_1_2 n_vdd n_vdd pmos_lp L=65n W=100n AS=100n*trans_diffusion_length AD=100n*trans_diffusion_length PS=100n+2*trans_diffusion_length PD=100n+2*trans_diffusion_length
M2 n_1_2 n_1_1 n_vdd  n_vdd pmos_lp L=65n W=100n AS=100n*trans_diffusion_length AD=100n*trans_diffusion_length PS=100n+2*trans_diffusion_length PD=100n+2*trans_diffusion_length
M3 n_in2 n_se n_1_2 n_vdd pmos_lp L=32n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M4 n_1_1 n_1_2 n_gnd2 n_gnd nmos_lp L=65n W=900n AS=900n*trans_diffusion_length AD=900n*trans_diffusion_length PS=900n+2*trans_diffusion_length PD=900n+2*trans_diffusion_length
M5 n_1_2 n_1_1 n_gnd2 n_gnd nmos_lp L=65n W=900n AS=900n*trans_diffusion_length AD=900n*trans_diffusion_length PS=900n+2*trans_diffusion_length PD=900n+2*trans_diffusion_length
M6 n_gnd2 n_se n_gnd n_gnd nmos_lp L=65n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
X_invsamp1_1 n_1_1 n_hang n_vdd n_gnd inv_lp Wn=2*min_tran_width Wp=2.44*min_tran_width
X_invsamp1_2 n_1_2 n_out n_vdd n_gnd inv_lp Wn=2*min_tran_width Wp=2.44*min_tran_width
.ENDS


******************************************************************************************
* writedriver subcircuit low power write driver 
******************************************************************************************
.SUBCKT writedriver n_we n_din n_bl n_br n_vdd n_gnd
M1 p_1_1 n_web n_vdd n_vdd pmos_lp L=gate_length W=150n AS=150n*trans_diffusion_length AD=150n*trans_diffusion_length PS=150n+2*trans_diffusion_length PD=150n+2*trans_diffusion_length
M0 p_1_2 n_web n_vdd n_vdd pmos_lp L=gate_length W=150n AS=150n*trans_diffusion_length AD=150n*trans_diffusion_length PS=150n+2*trans_diffusion_length PD=150n+2*trans_diffusion_length
M2 n_bl n_din p_1_1  n_vdd pmos_lp L=gate_length W=150n AS=150n*trans_diffusion_length AD=150n*trans_diffusion_length PS=150n+2*trans_diffusion_length PD=150n+2*trans_diffusion_length
M3 n_br n_dinb p_1_2 n_vdd pmos_lp L=gate_length W=150n AS=150n*trans_diffusion_length AD=150n*trans_diffusion_length PS=150n+2*trans_diffusion_length PD=150n+2*trans_diffusion_length
M4 n_1_1 n_we n_gnd n_gnd nmos_lp L=gate_length W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M5 n_1_2 n_we n_gnd n_gnd nmos_lp L=gate_length W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M6 n_bl n_din n_1_1 n_gnd nmos_lp L=gate_length W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M7 n_br n_dinb n_1_2 n_gnd nmos_lp L=gate_length W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
X_inv_writedriver_1 n_din n_dinb n_vdd n_gnd inv_lp Wn=55n Wp=110n
X_inv_writedriver_2 n_we n_web n_vdd n_gnd inv_lp Wn=55n Wp=110n
.ENDS


******************************************************************************************
* precharge_dummy subcircuit dummy-array precharge and equalization 
******************************************************************************************
.SUBCKT precharge_dummy n_precharge_bar n_bl n_blbar n_vdd n_gnd
M1 n_bl n_precharge_bar n_vdd n_vdd pmos_lp L=gate_length W=90n AS=90n*trans_diffusion_length AD=90n*trans_diffusion_length PS=90n+2*trans_diffusion_length PD=90n+2*trans_diffusion_length
M0 n_blbar n_precharge_bar n_vdd n_vdd pmos_lp L=gate_length W=90n AS=90n*trans_diffusion_length AD=90n*trans_diffusion_length PS=90n+2*trans_diffusion_length PD=90n+2*trans_diffusion_length
M2 n_bl n_precharge_bar n_blbar n_vdd pmos_lp L=gate_length W=45n AS=45n*trans_diffusion_length AD=45n*trans_diffusion_length PS=45n+2*trans_diffusion_length PD=45n+2*trans_diffusion_length
.ENDS


******************************************************************************************
* wordline_driver_dummy subcircuit dummy-array wordline_driver 
******************************************************************************************
.SUBCKT wordline_driver_dummy n_in n_out n_vdd n_gnd
Xwordline_driver_dummy_nand2 n_in n_1_1 n_vdd n_gnd nand2_lp Wn=inv_nand2_wordline_driver_dummy_1_nmos Wp=inv_nand2_wordline_driver_dummy_1_pmos
X_invwordline_driver_dummy_2 n_1_1 n_1_2 n_vdd n_gnd inv_lp Wn=inv_wordline_driver_dummy_2_nmos Wp=inv_wordline_driver_dummy_2_pmos
X_invwordline_driver_dummy_3 n_1_2 n_1_3 n_vdd n_gnd inv_lp Wn=inv_wordline_driver_dummy_3_nmos Wp=inv_wordline_driver_dummy_3_pmos
X_invwordline_driver_dummy_4 n_1_3 n_out n_vdd n_gnd inv_lp Wn=inv_wordline_driver_dummy_4_nmos Wp=inv_wordline_driver_dummy_4_pmos
.ENDS


******************************************************************************************
* samp_dummy subcircuit dummy-array sense amp 
******************************************************************************************
.SUBCKT samp_dummy n_se n_in1 n_in2 n_out n_vdd n_gnd 
M1 n_in1 n_se n_1_1 n_vdd pmos_lp L=32n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M0 n_1_1 n_1_2 n_vdd n_vdd pmos_lp L=65n W=100n AS=100n*trans_diffusion_length AD=100n*trans_diffusion_length PS=100n+2*trans_diffusion_length PD=100n+2*trans_diffusion_length
M2 n_1_2 n_1_1 n_vdd  n_vdd pmos_lp L=65n W=100n AS=100n*trans_diffusion_length AD=100n*trans_diffusion_length PS=100n+2*trans_diffusion_length PD=100n+2*trans_diffusion_length
M3 n_in2 n_se n_1_2 n_vdd pmos_lp L=32n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M4 n_1_1 n_1_2 n_gnd2 n_gnd nmos_lp L=65n W=900n AS=900n*trans_diffusion_length AD=900n*trans_diffusion_length PS=900n+2*trans_diffusion_length PD=900n+2*trans_diffusion_length
M5 n_1_2 n_1_1 n_gnd2 n_gnd nmos_lp L=65n W=900n AS=900n*trans_diffusion_length AD=900n*trans_diffusion_length PS=900n+2*trans_diffusion_length PD=900n+2*trans_diffusion_length
M6 n_gnd2 n_se n_gnd n_gnd nmos_lp L=65n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
X_invsamp_dummy_1 n_1_1 n_hang n_vdd n_gnd inv_lp Wn=90n Wp=110n
X_invsamp_dummy_2 n_1_2 n_out n_vdd n_gnd inv_lp Wn=90n Wp=110n
.ENDS


******************************************************************************************
* writedriver_dummy subcircuit dummy array write driver 
******************************************************************************************
.SUBCKT writedriver_dummy n_we n_din n_bl n_br n_vdd n_gnd
M0 p_1_1 n_web n_vdd n_vdd pmos_lp L=gate_length W=90n AS=90n*trans_diffusion_length AD=90n*trans_diffusion_length PS=90n+2*trans_diffusion_length PD=90n+2*trans_diffusion_length
M1 p_1_2 n_web n_vdd n_vdd pmos_lp L=gate_length W=90n AS=90n*trans_diffusion_length AD=90n*trans_diffusion_length PS=90n+2*trans_diffusion_length PD=90n+2*trans_diffusion_length
M2 n_bl n_din1 p_1_1 n_vdd pmos_lp L=gate_length W=90n AS=90n*trans_diffusion_length AD=90n*trans_diffusion_length PS=90n+2*trans_diffusion_length PD=90n+2*trans_diffusion_length
M3 n_br n_dinb p_1_2 n_vdd pmos_lp L=gate_length W=90n AS=90n*trans_diffusion_length AD=90n*trans_diffusion_length PS=90n+2*trans_diffusion_length PD=90n+2*trans_diffusion_length
M4 n_1_1 n_we n_gnd n_gnd nmos_lp L=gate_length W=120n AS=120n*trans_diffusion_length AD=120n*trans_diffusion_length PS=120n+2*trans_diffusion_length PD=120n+2*trans_diffusion_length
M5 n_1_2 n_we n_gnd n_gnd nmos_lp L=gate_length W=120n AS=120n*trans_diffusion_length AD=120n*trans_diffusion_length PS=120n+2*trans_diffusion_length PD=120n+2*trans_diffusion_length
M6 n_bl n_din1 n_1_1 n_gnd nmos_lp L=gate_length W=120n AS=120n*trans_diffusion_length AD=120n*trans_diffusion_length PS=120n+2*trans_diffusion_length PD=120n+2*trans_diffusion_length
M7 n_br n_dinb n_1_2 n_gnd nmos_lp L=gate_length W=120n AS=120n*trans_diffusion_length AD=120n*trans_diffusion_length PS=120n+2*trans_diffusion_length PD=120n+2*trans_diffusion_length
X_inv_writedriver_dummy_1 n_din  n_dinb n_vdd n_gnd inv_lp Wn=45n Wp=55n
X_inv_writedriver_dummy_2 n_dinb n_din1  n_vdd n_gnd inv_lp Wn=45n Wp=55n
X_inv_writedriver_dummy_3 n_we n_web n_vdd n_gnd inv_lp Wn=45n Wp=55n
.ENDS


******************************************************************************************
* fulladder_dummy subcircuit dummy-array full adder 
******************************************************************************************
.SUBCKT fulladder_dummy op cin cout sum n_vdd n_gnd
X_inv_fulladder_dummy_0 op  opbar  n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_fulladder_dummy_1 cin cinbar n_vdd n_gnd inv Wn=45n Wp=55n
X_tgate_fulladder_dummy_1 op  n_1 n_vdd n_gnd n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_fulladder_dummy_2 gnd n_1 n_gnd n_vdd n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_fulladder_dummy_2   n_1 n_1_1 n_vdd n_gnd           inv   Wn=45n Wp=55n
X_tgate_fulladder_dummy_3 n_1_1 sumbar cinbar cin    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_fulladder_dummy_4 n_1   sumbar cin    cinbar n_vdd n_gnd tgate Wn=45n Wp=55n
Xfulladder_dummy_nand2_1  opbar n_vdd o_1 n_vdd n_gnd nand2_dummy  Wn=tgate_fulladder_dummy_1_nmos Wp=tgate_fulladder_dummy_1_pmos
Xfulladder_dummy_nor2_1   opbar n_vdd o_2 n_vdd n_gnd nor2_dummy   Wn=tgate_fulladder_dummy_1_nmos Wp=tgate_fulladder_dummy_1_pmos
X_tgate_fulladder_dummy_5 o_1   cout1 cin    cinbar n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_fulladder_dummy_6 o_2   cout1 cinbar cin    n_vdd n_gnd tgate Wn=45n Wp=55n
Xwire1 cout1 cout wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
X_inv_fulladder_dummy_3 sumbar  sum  n_vdd n_gnd inv Wn=65n Wp=80n
.ENDS


******************************************************************************************
* manchester4_dummy subcircuit dummy-array 4-bit manchester carry chain full adder 
******************************************************************************************
.SUBCKT manchester4_dummy clk cinb cout ina3 ina2 ina1 ina0 inb3 inb2 inb1 inb0 sum4 n_vdd n_gnd
X_inv_manchester4_dummy_21 cinb   c_x1  n_vdd n_gnd inv Wn=65n Wp=80n
M01 n_vdd clk cin_buff n_vdd pmos L=gate_length W=45n AS=45n*trans_diffusion_length AD=45n*trans_diffusion_length PS=45n+2*trans_diffusion_length PD=45n+2*trans_diffusion_length
M02 cib0 c_x1 c_x2 n_gnd nmos L=gate_length W=ptran_manchester4_dummy_1_nmos AS=ptran_manchester4_dummy_1_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_1_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_1_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_1_nmos+2*trans_diffusion_length
M03 c_x2 clk n_gnd n_gnd nmos L=gate_length W=ptran_manchester4_dummy_1_nmos AS=ptran_manchester4_dummy_1_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_1_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_1_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_1_nmos+2*trans_diffusion_length
Xmanchester4_dummy_nor2_1 a0b b0b gen_1 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
Xmanchester4_dummy_nor2_2 a1b b1b gen_2 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
Xmanchester4_dummy_nor2_3 a2b b2b gen_3 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
Xmanchester4_dummy_nor2_4 a3b b3b gen_4 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
X_tgate_manchester4_dummy_1 a0 prop_1 b0b b0 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_2 a0b prop_1 b0 b0b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_3 a1 prop_2 b1b b1 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_4 a1b prop_2 b1 b1b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_5 a2 prop_3 b2b b2 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_6 a2b prop_3 b2 b2b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_7 a3 prop_4 b3b b3 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_8 a3b prop_4 b3 b3b n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_manchester4_dummy_1 cib1_1 c1  n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_2 c1     c1b n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_3 cib2_2 c2  n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_4 c2     c2b n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_5 cib3_3 c3  n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_6 c3     c3b n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_7 cib4_4 c4  n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_8 c4     c4b n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_11    prop_1 n_1    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_manchester4_dummy_12  n_1    sumb1  c1b   c1    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_13  prop_1 sumb1  c1    c1b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_manchester4_dummy_14    prop_2 n_2    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_manchester4_dummy_15  n_2    sumb2  c2b   c2    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_16  prop_2 sumb2  c2    c2b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_manchester4_dummy_17    prop_3 n_3    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_manchester4_dummy_18  n_3    sumb3  c3b   c3    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_19  prop_3 sumb3  c3    c3b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_manchester4_dummy_20    prop_4 n_4    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_manchester4_dummy_21  n_4    sumb4  c4b   c4    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_manchester4_dummy_22  prop_4 sumb4  c4    c4b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_manchester4_dummy_31 sumb1  sum1  n_vdd n_gnd inv Wn=65n Wp=80n
X_inv_manchester4_dummy_32 sumb2  sum2  n_vdd n_gnd inv Wn=65n Wp=80n
X_inv_manchester4_dummy_33 sumb3  sum3  n_vdd n_gnd inv Wn=65n Wp=80n
X_inv_manchester4_dummy_34 sumb4  sum4  n_vdd n_gnd inv Wn=65n Wp=80n
M11  cib0    prop_1 cib1_1  n_gnd nmos L=gate_length W=ptran_manchester4_dummy_5_nmos AS=ptran_manchester4_dummy_5_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_5_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length
M12  n_vdd   clk    cib1_1  n_vdd pmos L=gate_length W=45n AS=45n*trans_diffusion_length AD=45n*trans_diffusion_length PS=45n+2*trans_diffusion_length PD=45n+2*trans_diffusion_length
M13  cib1_1  gen_1  n_x1    n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
M14  n_x1    clk    n_gnd   n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
Xwire1 cib1_1 cib1 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
M21  cib1    prop_2 cib2_2  n_gnd nmos L=gate_length W=ptran_manchester4_dummy_5_nmos AS=ptran_manchester4_dummy_5_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_5_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length
M22  n_vdd   clk    cib2_2  n_vdd pmos L=gate_length W=45n AS=45n*trans_diffusion_length AD=45n*trans_diffusion_length PS=45n+2*trans_diffusion_length PD=45n+2*trans_diffusion_length
M23  cib2_2  gen_2  n_x2    n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
M24  n_x2    clk    n_gnd   n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
Xwire2 cib2_2 cib2 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
M31  cib2    prop_3 cib3_3  n_gnd nmos L=gate_length W=ptran_manchester4_dummy_5_nmos AS=ptran_manchester4_dummy_5_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_5_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length
M32  n_vdd   clk    cib3_3  n_vdd pmos L=gate_length W=45n AS=45n*trans_diffusion_length AD=45n*trans_diffusion_length PS=45n+2*trans_diffusion_length PD=45n+2*trans_diffusion_length
M33  cib3_3  gen_3  n_x3     n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
M34  n_x3    clk    n_gnd   n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
Xwire3 cib3_3 cib3 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
M41  cib3    prop_4 cout_0  n_gnd nmos L=gate_length W=ptran_manchester4_dummy_5_nmos AS=ptran_manchester4_dummy_5_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_5_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length
M42  n_vdd   clk    cout_0  n_vdd pmos L=gate_length W=45n AS=45n*trans_diffusion_length AD=45n*trans_diffusion_length PS=45n+2*trans_diffusion_length PD=45n+2*trans_diffusion_length
M43  cout_0  gen_4  n_x4    n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
M44  n_x4    clk    n_gnd   n_gnd nmos L=gate_length W=ptran_manchester4_dummy_6_nmos AS=ptran_manchester4_dummy_6_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_6_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_6_nmos+2*trans_diffusion_length
Xwire4 cib4_4 cout wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
Xwire11 prop_1 prop_1_1 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwire12 prop_2 prop_2_2 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwire13 prop_3 prop_3_3 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xwire14 prop_4 prop_4_4 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
Xmanchester4_dummy_nand2_11 prop_1_1 prop_2_2 n_z1   n_vdd n_gnd nand2_dummy Wn=45n Wp=55n
Xmanchester4_dummy_nand2_12 prop_3_3 prop_4_4 n_z2   n_vdd n_gnd nand2_dummy Wn=45n Wp=55n
Xmanchester4_dummy_nor2_13  n_z1  n_z2    byp n_vdd n_gnd nor2_dummy  Wn=45n Wp=55n
X_inv_manchester4_dummy_41 byp   bypassb      n_vdd n_gnd inv Wn=65n Wp=80n
X_inv_manchester4_dummy_42 bypassb   bypass      n_vdd n_gnd inv Wn=65n Wp=80n
Xwire5 cib0 cout_1 wire Rw=wire_memorycell_horizontal_res/32 Cw=wire_memorycell_horizontal_cap/32
M51 cout_1 bypass cout  n_gnd nmos L=gate_length W=ptran_manchester4_dummy_5_nmos AS=ptran_manchester4_dummy_5_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_5_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length
M52 cout_0 bypassb cout  n_gnd nmos L=gate_length W=ptran_manchester4_dummy_5_nmos AS=ptran_manchester4_dummy_5_nmos*trans_diffusion_length AD=ptran_manchester4_dummy_5_nmos*trans_diffusion_length PS=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length PD=ptran_manchester4_dummy_5_nmos+2*trans_diffusion_length
X_inv_manchester4_dummy_51 ina3  a3b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_52 a3b   a3    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_53 ina2  a2b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_54 a2b   a2    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_55 ina1  a1b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_56 a1b   a1    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_57 ina0  a0b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_58 a0b   a0    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_61 inb3  b3b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_62 b3b   b3    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_63 inb2  b2b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_64 b2b   b2    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_65 inb1  b1b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_66 b1b   b1    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_67 inb0  b0b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_manchester4_dummy_68 b0b   b0    n_vdd n_gnd inv Wn=45n Wp=55n
.ENDS


******************************************************************************************
* lookahead4_dummy subcircuit dummy-array 4-bit manchester carry chain full adder 
******************************************************************************************
.SUBCKT lookahead4_dummy cin cout ina3 ina2 ina1 ina0 inb3 inb2 inb1 inb0 sum4 n_vdd n_gnd
Xlookahead4_dummy_nor2_1 a0b b0b gen_1 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
Xlookahead4_dummy_nor2_2 a1b b1b gen_2 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
Xlookahead4_dummy_nor2_3 a2b b2b gen_3 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
Xlookahead4_dummy_nor2_4 a3b b3b gen_4 n_vdd n_gnd nor2_dummy Wn=45n Wp=55n
X_tgate_lookahead4_dummy_1 a0 prop_1 b0b b0 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_2 a0b prop_1 b0 b0b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_3 a1 prop_2 b1b b1 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_4 a1b prop_2 b1 b1b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_5 a2 prop_3 b2b b2 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_6 a2b prop_3 b2 b2b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_7 a3 prop_4 b3b b3 n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_8 a3b prop_4 b3 b3b n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_lookahead4_dummy_91   cin c0b    n_vdd n_gnd inv   Wn=45n Wp=55n
Xlookahead4_dummy_nand2_1   a0b b0b z1 n_vdd n_gnd nand2_dummy  Wn=45n Wp=55n
X_tgate_fulladder_dummy_91  z1      c1_1 cin c0b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_fulladder_dummy_92  gen_1   c1_1 c0b cin n_vdd n_gnd tgate Wn=45n Wp=55n
Xwire11 c1_1 c1 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
X_inv_lookahead4_dummy_92   c1  c1b    n_vdd n_gnd inv   Wn=45n Wp=55n
Xlookahead4_dummy_nand2_2   a1b b1b z2 n_vdd n_gnd nand2_dummy  Wn=45n Wp=55n
X_tgate_fulladder_dummy_93  z2      c2_2 c1  c1b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_fulladder_dummy_94  gen_2   c2_2 c1b c1 n_vdd n_gnd tgate Wn=45n Wp=55n
Xwire12 c2_2 c2 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
X_inv_lookahead4_dummy_93   c2  c2b    n_vdd n_gnd inv   Wn=45n Wp=55n
Xlookahead4_dummy_nand2_3   a2b b2b z3 n_vdd n_gnd nand2_dummy  Wn=45n Wp=55n
X_tgate_fulladder_dummy_95  z3      c3_3 c2  c2b n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_fulladder_dummy_96  gen_3   c3_3 c2b c2 n_vdd n_gnd tgate Wn=45n Wp=55n
Xwire13 c3_3 c3 wire Rw=wire_memorycell_horizontal_res/128 Cw=wire_memorycell_horizontal_cap/128
X_inv_lookahead4_dummy_94   c3  c3b    n_vdd n_gnd inv   Wn=45n Wp=55n
X_inv_lookahead4_dummy_11    prop_1 n_1    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_lookahead4_dummy_12  n_1    sumb1  c0b   cin    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_13  prop_1 sumb1  cin    c0b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_lookahead4_dummy_14    prop_2 n_2    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_lookahead4_dummy_15  n_2    sumb2  c1b   c1    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_16  prop_2 sumb2  c1    c1b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_lookahead4_dummy_17    prop_3 n_3    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_lookahead4_dummy_18  n_3    sumb3  c2b   c2    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_19  prop_3 sumb3  c2    c2b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_lookahead4_dummy_20    prop_4 n_4    n_vdd n_gnd inv   Wn=45n Wp=55n
X_tgate_lookahead4_dummy_21  n_4    sumb4  c3b   c3    n_vdd n_gnd tgate Wn=45n Wp=55n
X_tgate_lookahead4_dummy_22  prop_4 sumb4  c3    c3b   n_vdd n_gnd tgate Wn=45n Wp=55n
X_inv_lookahead4_dummy_31 sumb1  sum1  n_vdd n_gnd inv Wn=65n Wp=80n
X_inv_lookahead4_dummy_32 sumb2  sum2  n_vdd n_gnd inv Wn=65n Wp=80n
X_inv_lookahead4_dummy_33 sumb3  sum3  n_vdd n_gnd inv Wn=65n Wp=80n
X_inv_lookahead4_dummy_34 sumb4  sum4  n_vdd n_gnd inv Wn=65n Wp=80n
Xwire21 prop_1 prop_1_1 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwire22 prop_2 prop_2_2 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwire23 prop_3 prop_3_3 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwire24 prop_4 prop_4_4 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwire25 gen_1  gen_1_1  wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwire26 gen_2  gen_2_2  wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwire27 gen_3  gen_3_3  wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwire28 gen_4  gen_4_4  wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
M11  n_vdd  gen_4_4 x3 n_vdd pmos L=gate_length W=inv_lookahead4_dummy_1_pmos AS=inv_lookahead4_dummy_1_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length
M12  x3     gen_3_3 x2 n_vdd pmos L=gate_length W=inv_lookahead4_dummy_1_pmos AS=inv_lookahead4_dummy_1_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length
M13  x2     gen_2_2 x1 n_vdd pmos L=gate_length W=inv_lookahead4_dummy_1_pmos AS=inv_lookahead4_dummy_1_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length
M14  x1     gen_1_1 x0 n_vdd pmos L=gate_length W=inv_lookahead4_dummy_1_pmos AS=inv_lookahead4_dummy_1_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length
M15  x0     cin  coutbar n_vdd pmos L=gate_length W=inv_lookahead4_dummy_1_pmos AS=inv_lookahead4_dummy_1_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_pmos+2*trans_diffusion_length
M21  n_vdd  prop_4_4  coutbar n_vdd pmos L=gate_length W=inv_lookahead4_dummy_2_pmos AS=inv_lookahead4_dummy_2_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length
M22  x3     prop_3_3  coutbar n_vdd pmos L=gate_length W=inv_lookahead4_dummy_2_pmos AS=inv_lookahead4_dummy_2_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length
M23  x2     prop_2_2  coutbar n_vdd pmos L=gate_length W=inv_lookahead4_dummy_2_pmos AS=inv_lookahead4_dummy_2_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length
M24  x1     prop_1_1  coutbar n_vdd pmos L=gate_length W=inv_lookahead4_dummy_2_pmos AS=inv_lookahead4_dummy_2_pmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_pmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_pmos+2*trans_diffusion_length
M31  n_gnd  prop_4_4 y3 n_gnd nmos L=gate_length W=inv_lookahead4_dummy_1_nmos AS=inv_lookahead4_dummy_1_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length
M32  y3     prop_3_3 y2 n_gnd nmos L=gate_length W=inv_lookahead4_dummy_1_nmos AS=inv_lookahead4_dummy_1_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length
M33  y2     prop_2_2 y1 n_gnd nmos L=gate_length W=inv_lookahead4_dummy_1_nmos AS=inv_lookahead4_dummy_1_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length
M34  y1     prop_1_1 y0 n_gnd nmos L=gate_length W=inv_lookahead4_dummy_1_nmos AS=inv_lookahead4_dummy_1_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length
M35  y0     cin  coutbar n_gnd nmos L=gate_length W=inv_lookahead4_dummy_1_nmos AS=inv_lookahead4_dummy_1_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_1_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_1_nmos+2*trans_diffusion_length
M41  n_gnd  gen_4_4 coutbar n_gnd nmos L=gate_length W=inv_lookahead4_dummy_2_nmos AS=inv_lookahead4_dummy_2_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length
M42  y3     gen_3_3 coutbar n_gnd nmos L=gate_length W=inv_lookahead4_dummy_2_nmos AS=inv_lookahead4_dummy_2_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length
M43  y2     gen_2_2 coutbar n_gnd nmos L=gate_length W=inv_lookahead4_dummy_2_nmos AS=inv_lookahead4_dummy_2_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length
M44  y1     gen_1_1 coutbar n_gnd nmos L=gate_length W=inv_lookahead4_dummy_2_nmos AS=inv_lookahead4_dummy_2_nmos*trans_diffusion_length AD=inv_lookahead4_dummy_2_nmos*trans_diffusion_length PS=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length PD=inv_lookahead4_dummy_2_nmos+2*trans_diffusion_length
X_inv_lookahead4_dummy_40    coutbar cout_1    n_vdd n_gnd inv   Wn=inv_lookahead4_dummy_3_nmos Wp=inv_lookahead4_dummy_3_pmos
Xwire31 cout_1  cout  wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
X_inv_lookahead4_dummy_51 ina3  a3b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_52 a3b   a3    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_53 ina2  a2b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_54 a2b   a2    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_55 ina1  a1b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_56 a1b   a1    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_57 ina0  a0b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_58 a0b   a0    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_61 inb3  b3b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_62 b3b   b3    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_63 inb2  b2b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_64 b2b   b2    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_65 inb1  b1b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_66 b1b   b1    n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_67 inb0  b0b   n_vdd n_gnd inv Wn=45n Wp=55n
X_inv_lookahead4_dummy_68 b0b   b0    n_vdd n_gnd inv Wn=45n Wp=55n
.ENDS


******************************************************************************************
* mux4_dummy subcircuit dummy-array 4:1 mux 
******************************************************************************************
.SUBCKT mux4_dummy n_in n_out n_gate_nmos n_gate_pmos n_vdd n_gnd
X_tgate_mux3_dummy_1   n_in   n_out  n_gate_nmos n_gate_pmos  n_vdd n_gnd tgate_lp Wn=45n Wp=90n
X_tgate_mux3_dummy_2   n_vdd  n_out  n_gnd       n_vdd        n_vdd n_gnd tgate_lp Wn=45n Wp=90n
X_tgate_mux3_dummy_3   n_vdd  n_out  n_gnd       n_vdd        n_vdd n_gnd tgate_lp Wn=45n Wp=90n
X_tgate_mux3_dummy_4   n_vdd  n_out  n_gnd       n_vdd        n_vdd n_gnd tgate_lp Wn=45n Wp=90n
.ENDS


******************************************************************************************
* mux3_dummy subcircuit dummy-array 3:1 mux 
******************************************************************************************
.SUBCKT mux3_dummy n_in n_out n_gate_nmos n_gate_pmos n_vdd n_gnd
X_tgate_mux3_dummy_1   n_in   n_out  n_gate_nmos n_gate_pmos  n_vdd n_gnd tgate_lp Wn=45n Wp=90n
X_tgate_mux3_dummy_2   n_vdd  n_out  n_gnd       n_vdd        n_vdd n_gnd tgate_lp Wn=45n Wp=90n
X_tgate_mux3_dummy_3   n_vdd  n_out  n_gnd       n_vdd        n_vdd n_gnd tgate_lp Wn=45n Wp=90n
.ENDS


******************************************************************************************
* mux2_dummy subcircuit dummy-array 2:1 mux 
******************************************************************************************
.SUBCKT mux2_dummy n_in n_out n_gate_nmos n_gate_pmos n_vdd n_gnd
X_tgate_mux2_dummy_1   n_in   n_out  n_gate_nmos n_gate_pmos  n_vdd n_gnd tgate_lp Wn=45n Wp=90n
X_tgate_mux2_dummy_2   n_vdd  n_out  n_gnd       n_vdd        n_vdd n_gnd tgate_lp Wn=45n Wp=90n
.ENDS


******************************************************************************************
* level_shifter subcircuit level shifter 
******************************************************************************************
.SUBCKT level_shifter n_in n_out n_vdd n_vddlp n_gnd
X_invlevel_shifter_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_level_shifter_1_nmos Wp=inv_level_shifter_1_pmos
X_invlevel_shifter_2 n_1_1 n_1_2 n_vdd n_gnd inv Wn=inv_level_shifter_1_nmos Wp=inv_level_shifter_1_pmos
M0 n_gnd n_1_1 n_1_3 n_gnd nmos_lp L=22n W=ptran_level_shifter_2_nmos AS=ptran_level_shifter_2_nmos*trans_diffusion_length AD=ptran_level_shifter_2_nmos*trans_diffusion_length PS=ptran_level_shifter_2_nmos+2*trans_diffusion_length PD=ptran_level_shifter_2_nmos+2*trans_diffusion_length
M1 n_gnd n_1_2 n_1_4 n_gnd nmos_lp L=22n W=ptran_level_shifter_2_nmos AS=ptran_level_shifter_2_nmos*trans_diffusion_length AD=ptran_level_shifter_2_nmos*trans_diffusion_length PS=ptran_level_shifter_2_nmos+2*trans_diffusion_length PD=ptran_level_shifter_2_nmos+2*trans_diffusion_length
M2 n_1_3 n_1_4 n_vddlp n_vddlp pmos_lp L=22n W=ptran_level_shifter_2_nmos AS=ptran_level_shifter_3_pmos*trans_diffusion_length AD=ptran_level_shifter_3_pmos*trans_diffusion_length PS=ptran_level_shifter_3_pmos+2*trans_diffusion_length PD=ptran_level_shifter_3_pmos+2*trans_diffusion_length
M3 n_1_4 n_1_3 n_vddlp n_vddlp pmos_lp L=22n W=ptran_level_shifter_3_pmos AS=ptran_level_shifter_3_pmos*trans_diffusion_length AD=ptran_level_shifter_3_pmos*trans_diffusion_length PS=ptran_level_shifter_3_pmos+2*trans_diffusion_length PD=ptran_level_shifter_3_pmos+2*trans_diffusion_length
X_invlevel_shifter_3 n_1_4 n_out n_vddlp n_gnd inv_lp Wn=inv_level_shifter_1_nmos Wp=inv_level_shifter_1_pmos
.ENDS


******************************************************************************************
* columndecoder subcircuit write driver 
******************************************************************************************
.SUBCKT columndecoder n_in n_out n_vdd n_gnd
X_inv_columndecoder_1 n_in n_1_1 n_vdd n_gnd inv_lp Wn=inv_columndecoder_1_nmos Wp=inv_columndecoder_1_pmos
X_inv_columndecoder_2 n_1_1 n_1_2 n_vdd n_gnd nand2_lp Wn=inv_columndecoder_2_nmos Wp=inv_columndecoder_2_pmos
X_inv_columndecoder_3 n_1_2 n_out n_vdd n_gnd inv_lp Wn=inv_columndecoder_3_nmos Wp=inv_columndecoder_3_pmos
.ENDS


******************************************************************************************
* xconfigurabledecoderi part of the configurable decoder
******************************************************************************************
.SUBCKT xconfigurabledecoderi n_in n_out n_vdd n_gnd
Xxconfigurabledecoderi n_in n_1_1 n_vdd n_gnd inv_lp Wn=inv_xconfigurabledecoderi_1_nmos Wp=inv_xconfigurabledecoderi_1_pmos
Xtgatexconfigurabledecoderi_1 n_1_1 n_out n_vdd n_gnd n_vdd n_gnd tgate_lp Wn=tgate_xconfigurabledecoderi_2_nmos Wp=tgate_xconfigurabledecoderi_2_pmos
.ENDS


******************************************************************************************
* xconfigurabledecoderiii subcircuit configurable decoder 
******************************************************************************************
.SUBCKT xconfigurabledecoderiii n_in n_out n_vdd n_gnd
Xxconfigurabledecoderiii_nand2 n_in n_1_1 n_vdd n_gnd nand2_lp Wn=inv_nand2_xconfigurabledecoderiii_1_nmos Wp=inv_nand2_xconfigurabledecoderiii_1_pmos
X_invxconfigurabledecoderiii n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_xconfigurabledecoderiii_2_nmos Wp=inv_xconfigurabledecoderiii_2_pmos
.ENDS


******************************************************************************************
* xconfigurabledecoder3ii subcircuit configurable decoder 
******************************************************************************************
.SUBCKT xconfigurabledecoder3ii n_in n_out n_vdd n_gnd
Xxconfigurabledecoder3ii_nand3 n_in n_1_1 n_vdd n_gnd nand3_lp Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
X_invxconfigurabledecoder3ii n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_xconfigurabledecoder3ii_2_nmos Wp=inv_xconfigurabledecoder3ii_2_pmos
.ENDS


******************************************************************************************
* xconfigurabledecoder2ii subcircuit configurable decoder 
******************************************************************************************
.SUBCKT xconfigurabledecoder2ii n_in n_out n_vdd n_gnd
Xxconfigurabledecoder2ii_nand2 n_in n_1_1 n_vdd n_gnd nand2_lp Wn=inv_nand2_xconfigurabledecoder2ii_1_nmos Wp=inv_nand2_xconfigurabledecoder2ii_1_pmos
X_invxconfigurabledecoder2ii n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_xconfigurabledecoder2ii_2_nmos Wp=inv_xconfigurabledecoder2ii_2_pmos
.ENDS


******************************************************************************************
* pgateoutputcrossbar subcircuit pgate output crossbar 
******************************************************************************************
.SUBCKT pgateoutputcrossbar n_in n_out n_vdd n_sram_v n_gnd
X_inv_pgateoutputcrossbar_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_1_nmos Wp=inv_pgateoutputcrossbar_1_pmos
X_inv_pgateoutputcrossbar_2 n_1_1 n_1_2 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_2_nmos Wp=inv_pgateoutputcrossbar_2_pmos
M0 n_t_up n_gnd n_vdd n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M1 n_0_0 n_1_2 n_t_up n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M2 n_0_0 n_1_2 n_t_bot  n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
M3 n_t_bot n_vdd n_gnd n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
X_wire_0_0 n_0_0 n_0_1 wire Rw=wire_pgateoutputcrossbar_res/2 Cw=wire_pgateoutputcrossbar_cap/2 
X_ptran_0_1 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_2 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_3 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_4 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_5 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_wire_0_1 n_0_1 n_1_3 wire Rw=wire_pgateoutputcrossbar_res/2 Cw=wire_pgateoutputcrossbar_cap/2 
X_ptran_0 n_1_3 n_1_4 n_sram_v n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_wire_out n_1_4 n_out wire Rw=wire_pgateoutputcrossbar_res Cw=wire_pgateoutputcrossbar_cap 
X_wire_0 n_1_4 n_1_5 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32 
X_tgate1 n_x_1 n_hang_1 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_1 n_hang_1 n_1_5 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_1 n_1_5 n_1_6 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate2 n_x_2 n_hang_2 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_2 n_hang_2 n_1_6 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_2 n_1_6 n_1_7 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate3 n_x_3 n_hang_3 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_3 n_hang_3 n_1_7 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_3 n_1_7 n_1_8 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate4 n_x_4 n_hang_4 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_4 n_hang_4 n_1_8 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_4 n_1_8 n_1_9 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate5 n_x_5 n_hang_5 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_5 n_hang_5 n_1_9 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_5 n_1_9 n_1_10 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate6 n_x_6 n_hang_6 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_6 n_hang_6 n_1_10 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_6 n_1_10 n_1_11 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate7 n_x_7 n_hang_7 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_7 n_hang_7 n_1_11 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_7 n_1_11 n_1_12 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate8 n_x_8 n_hang_8 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_8 n_hang_8 n_1_12 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_8 n_1_12 n_1_13 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate9 n_x_9 n_hang_9 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_9 n_hang_9 n_1_13 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_9 n_1_13 n_1_14 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate10 n_x_10 n_hang_10 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_10 n_hang_10 n_1_14 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_10 n_1_14 n_1_15 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate11 n_x_11 n_hang_11 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_11 n_hang_11 n_1_15 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_11 n_1_15 n_1_16 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate12 n_x_12 n_hang_12 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_12 n_hang_12 n_1_16 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_12 n_1_16 n_1_17 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate13 n_x_13 n_hang_13 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_13 n_hang_13 n_1_17 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_13 n_1_17 n_1_18 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate14 n_x_14 n_hang_14 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_14 n_hang_14 n_1_18 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_14 n_1_18 n_1_19 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate15 n_x_15 n_hang_15 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_15 n_hang_15 n_1_19 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_15 n_1_19 n_1_20 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate16 n_x_16 n_hang_16 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_16 n_hang_16 n_1_20 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_16 n_1_20 n_1_21 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate17 n_x_17 n_hang_17 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_17 n_hang_17 n_1_21 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_17 n_1_21 n_1_22 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate18 n_x_18 n_hang_18 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_18 n_hang_18 n_1_22 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_18 n_1_22 n_1_23 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate19 n_x_19 n_hang_19 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_19 n_hang_19 n_1_23 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_19 n_1_23 n_1_24 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate20 n_x_20 n_hang_20 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_20 n_hang_20 n_1_24 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_20 n_1_24 n_1_25 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate21 n_x_21 n_hang_21 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_21 n_hang_21 n_1_25 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_21 n_1_25 n_1_26 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate22 n_x_22 n_hang_22 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_22 n_hang_22 n_1_26 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_22 n_1_26 n_1_27 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate23 n_x_23 n_hang_23 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_23 n_hang_23 n_1_27 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_23 n_1_27 n_1_28 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate24 n_x_24 n_hang_24 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_24 n_hang_24 n_1_28 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_24 n_1_28 n_1_29 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate25 n_x_25 n_hang_25 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_25 n_hang_25 n_1_29 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_25 n_1_29 n_1_30 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate26 n_x_26 n_hang_26 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_26 n_hang_26 n_1_30 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_26 n_1_30 n_1_31 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate27 n_x_27 n_hang_27 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_27 n_hang_27 n_1_31 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_27 n_1_31 n_1_32 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate28 n_x_28 n_hang_28 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_28 n_hang_28 n_1_32 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_28 n_1_32 n_1_33 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate29 n_x_29 n_hang_29 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_29 n_hang_29 n_1_33 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_29 n_1_33 n_1_34 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate30 n_x_30 n_hang_30 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_30 n_hang_30 n_1_34 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_30 n_1_34 n_1_35 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate31 n_x_31 n_hang_31 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_31 n_hang_31 n_1_35 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_31 n_1_35 n_1_36 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate32 n_x_32 n_hang_32 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_32 n_hang_32 n_1_36 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_32 n_1_36 n_1_37 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate33 n_x_33 n_hang_33 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_33 n_hang_33 n_1_37 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_33 n_1_37 n_1_38 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate34 n_x_34 n_hang_34 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_34 n_hang_34 n_1_38 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_34 n_1_38 n_1_39 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate35 n_x_35 n_hang_35 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_35 n_hang_35 n_1_39 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_35 n_1_39 n_1_40 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate36 n_x_36 n_hang_36 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_36 n_hang_36 n_1_40 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_36 n_1_40 n_1_41 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate37 n_x_37 n_hang_37 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_37 n_hang_37 n_1_41 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_37 n_1_41 n_1_42 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate38 n_x_38 n_hang_38 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_38 n_hang_38 n_1_42 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_38 n_1_42 n_1_43 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate39 n_x_39 n_hang_39 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_39 n_hang_39 n_1_43 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_39 n_1_43 n_1_44 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate40 n_x_40 n_hang_40 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_40 n_hang_40 n_1_44 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_40 n_1_44 n_1_45 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate41 n_x_41 n_hang_41 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_41 n_hang_41 n_1_45 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_41 n_1_45 n_1_46 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate42 n_x_42 n_hang_42 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_42 n_hang_42 n_1_46 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_42 n_1_46 n_1_47 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate43 n_x_43 n_hang_43 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_43 n_hang_43 n_1_47 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_43 n_1_47 n_1_48 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate44 n_x_44 n_hang_44 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_44 n_hang_44 n_1_48 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_44 n_1_48 n_1_49 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate45 n_x_45 n_hang_45 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_45 n_hang_45 n_1_49 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_45 n_1_49 n_1_50 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate46 n_x_46 n_hang_46 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_46 n_hang_46 n_1_50 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_46 n_1_50 n_1_51 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate47 n_x_47 n_hang_47 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_47 n_hang_47 n_1_51 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_47 n_1_51 n_1_52 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate48 n_x_48 n_hang_48 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_48 n_hang_48 n_1_52 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_48 n_1_52 n_1_53 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate49 n_x_49 n_hang_49 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_49 n_hang_49 n_1_53 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_49 n_1_53 n_1_54 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate50 n_x_50 n_hang_50 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_50 n_hang_50 n_1_54 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_50 n_1_54 n_1_55 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate51 n_x_51 n_hang_51 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_51 n_hang_51 n_1_55 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_51 n_1_55 n_1_56 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate52 n_x_52 n_hang_52 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_52 n_hang_52 n_1_56 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_52 n_1_56 n_1_57 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate53 n_x_53 n_hang_53 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_53 n_hang_53 n_1_57 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_53 n_1_57 n_1_58 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate54 n_x_54 n_hang_54 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_54 n_hang_54 n_1_58 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_54 n_1_58 n_1_59 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate55 n_x_55 n_hang_55 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_55 n_hang_55 n_1_59 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_55 n_1_59 n_1_60 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate56 n_x_56 n_hang_56 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_56 n_hang_56 n_1_60 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_56 n_1_60 n_1_61 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate57 n_x_57 n_hang_57 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_57 n_hang_57 n_1_61 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_57 n_1_61 n_1_62 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate58 n_x_58 n_hang_58 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_58 n_hang_58 n_1_62 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_58 n_1_62 n_1_63 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate59 n_x_59 n_hang_59 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_59 n_hang_59 n_1_63 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_59 n_1_63 n_1_64 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate60 n_x_60 n_hang_60 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_60 n_hang_60 n_1_64 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_60 n_1_64 n_1_65 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate61 n_x_61 n_hang_61 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_61 n_hang_61 n_1_65 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_61 n_1_65 n_1_66 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate62 n_x_62 n_hang_62 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_62 n_hang_62 n_1_66 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_62 n_1_66 n_1_67 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_tgate63 n_x_63 n_hang_63 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_63 n_hang_63 n_1_67 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_63 n_1_67 n_1_68 wire Rw=wire_pgateoutputcrossbar_res/32 Cw=wire_pgateoutputcrossbar_cap/32
X_inv_pgateoutputcrossbarp_1 n_in n_2_1 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_1_nmos Wp=inv_pgateoutputcrossbar_1_pmos
X_inv_pgateoutputcrossbarp_2 n_2_1 n_2_2 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_2_nmos Wp=inv_pgateoutputcrossbar_2_pmos
M02 n_2t_up n_gnd n_vdd n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M12 n_20_0 n_2_2 n_2t_up n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M22 n_20_0 n_2_2 n_2t_bot  n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
M32 n_2t_bot n_vdd n_gnd n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
X_wire2_0_0 n_20_0 n_hang wire Rw=wire_pgateoutputcrossbar_res Cw=wire_pgateoutputcrossbar_cap 
.ENDS


.ENDL SUBCIRCUITS