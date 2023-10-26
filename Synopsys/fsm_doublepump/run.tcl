set tsmc28 /pdks/tsmc/tsmc-28nm-cln28hpc-nda/stdview
set workdir /home/yc2367/Desktop/Research/M4BRAM/Synopsys
set_app_var target_library "$tsmc28/stdcells.db"
set_app_var link_library   "* $target_library"
analyze -format sverilog $workdir/fsm_doublepump/fsm_doublepump.v
elaborate fsm_doublepump

check_design
write -format verilog -hierarchy -output pre-synth.v

create_clock clk -name ideal_clock1 -period 0.4
compile

write -format verilog -hierarchy -output post-synth.v
write -format ddc     -hierarchy -output post-synth.ddc
report_resources -nosplit -hierarchy
report_timing -nosplit -transition_time -nets -attributes
report_timing -from state_now[0] -to raddr_1_dummy[1][1]
report_area -nosplit -hierarchy
report_power -nosplit -hierarchy

exit