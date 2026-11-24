# Traffic Light Controller — Basys 3 FPGA

A four-way traffic-light controller written in Verilog for the Digilent Basys 3 (Artix-7) FPGA board.

## Features
- Six-state FSM: NS green, NS yellow, all-red clearance, EW green, EW yellow, all-red clearance.
- Default timings: green 10 s, yellow 3 s, all-red 1 s.
- 100 MHz board clock and active-high synchronous reset on BTNC.
- Parameterized timing for simulation and hardware.

## LED mapping
| LED | Signal |
|---|---|
| LED0 | NS red |
| LED1 | NS yellow |
| LED2 | NS green |
| LED3 | EW red |
| LED4 | EW yellow |
| LED5 | EW green |

## Structure
- `rtl/traffic_light_top.v` — synthesizable RTL.
- `sim/tb_traffic_light_top.v` — simulation testbench.
- `constraints/basys3.xdc` — Basys 3 pin constraints.
- `docs/` — architecture, expected sequence, and Vivado setup.

## Simulate with Icarus Verilog
```bash
iverilog -g2012 -o traffic_tb rtl/traffic_light_top.v sim/tb_traffic_light_top.v
vvp traffic_tb
```

The testbench uses shortened timings and checks that both directions are never green simultaneously. See `docs/vivado_setup.md` for the Vivado workflow.

**Verification note:** RTL and testbench sources are provided. Do not claim synthesis, bitstream generation, or physical board testing until those steps have actually been run.

## License
MIT
