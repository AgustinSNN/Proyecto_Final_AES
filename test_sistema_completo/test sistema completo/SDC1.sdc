create_clock -name clk -period 20.000 [get_ports {clk}]
derive_clock_uncertainty
set_input_delay  -clock clk -max 2.000 [all_inputs]
set_input_delay  -clock clk -min 0.000 [all_inputs]
set_output_delay -clock clk -max 2.000 [all_outputs]
set_output_delay -clock clk -min 0.000 [all_outputs]

# Add this - cuts analysis of async paths that crash the TDC
set_false_path -from [get_clocks {clk}] -to [get_clocks {clk}]