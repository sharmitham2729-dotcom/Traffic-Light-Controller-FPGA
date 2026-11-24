# Vivado Setup Guide

1. Open AMD Xilinx Vivado and select Create Project.
2. Choose RTL Project and add rtl/traffic_light_top.v as a design source.
3. Add constraints/basys3.xdc as the constraints file.
4. Select the Digilent Basys 3 board or FPGA part XC7A35T-1CPG236C.
5. Set traffic_light_top as the top module.
6. Run synthesis, implementation, and Generate Bitstream.
7. Connect the Basys 3 over USB, open Hardware Manager, connect to the target, and program the device.

## Simulation
Add sim/tb_traffic_light_top.v as a simulation source and set tb_traffic_light_top as the simulation top. Or use Icarus Verilog:

    iverilog -g2012 -o traffic_tb rtl/traffic_light_top.v sim/tb_traffic_light_top.v
    vvp traffic_tb

The testbench uses shortened timings for a quick run. The hardware defaults retain 10 s green, 3 s yellow, and 1 s all-red. Do not connect external high-voltage lamps directly to FPGA pins; use suitable driver circuitry.
