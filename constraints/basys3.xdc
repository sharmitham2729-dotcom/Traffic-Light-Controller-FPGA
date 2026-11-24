## Basys 3 100 MHz clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
## Center push button: synchronous active-high reset
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
## NS LEDs: LED0, LED1, LED2
set_property PACKAGE_PIN U16 [get_ports ns_red]
set_property IOSTANDARD LVCMOS33 [get_ports ns_red]
set_property PACKAGE_PIN E19 [get_ports ns_yellow]
set_property IOSTANDARD LVCMOS33 [get_ports ns_yellow]
set_property PACKAGE_PIN U19 [get_ports ns_green]
set_property IOSTANDARD LVCMOS33 [get_ports ns_green]
## EW LEDs: LED3, LED4, LED5
set_property PACKAGE_PIN V19 [get_ports ew_red]
set_property IOSTANDARD LVCMOS33 [get_ports ew_red]
set_property PACKAGE_PIN W18 [get_ports ew_yellow]
set_property IOSTANDARD LVCMOS33 [get_ports ew_yellow]
set_property PACKAGE_PIN U15 [get_ports ew_green]
set_property IOSTANDARD LVCMOS33 [get_ports ew_green]
