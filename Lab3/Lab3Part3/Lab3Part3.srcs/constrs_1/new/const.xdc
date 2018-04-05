
set_property PACKAGE_PIN W15 [get_ports cin]
set_property IOSTANDARD LVCMOS33 [get_ports cin]


create_clock -period 1.000 -name virtual_clock
set_input_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports cin]
set_input_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports cin]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports x1]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports x1]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports x2]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports x2]
set_input_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports sel_a]
set_input_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports sel_a]
set_input_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports y1]
set_input_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports y1]
set_input_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports y2]
set_input_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports y2]
set_input_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports z1]
set_input_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports z1]
set_input_delay -clock [get_clocks virtual_clock] -min -add_delay 0.100 [get_ports z2]
set_input_delay -clock [get_clocks virtual_clock] -max -add_delay 0.100 [get_ports z2]
