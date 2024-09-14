create_clock -name sys_clk -period 10.000 [get_ports clk]
set_input_delay -clock sys_clk -max 2.5 [get_ports {data_in[*]}]
set_output_delay -clock sys_clk -max 2.5 [get_ports {data_out[*]}]
