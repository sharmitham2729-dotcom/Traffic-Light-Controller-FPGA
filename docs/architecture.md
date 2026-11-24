# FSM Architecture

The intersection is modeled as two opposing flows: North/South (NS) and East/West (EW). Only one flow receives green at a time. Yellow warns that the active flow is about to stop. An all-red clearance interval separates the directions.

## State sequence

NS_GREEN -> NS_YELLOW -> ALL_RED_1 -> EW_GREEN -> EW_YELLOW -> ALL_RED_2 -> repeat.

## Timing

| State | Duration | NS | EW |
|---|---:|---|---|
| NS_GREEN | 10 s | Green | Red |
| NS_YELLOW | 3 s | Yellow | Red |
| ALL_RED_1 | 1 s | Red | Red |
| EW_GREEN | 10 s | Red | Green |
| EW_YELLOW | 3 s | Red | Yellow |
| ALL_RED_2 | 1 s | Red | Red |

A 32-bit counter counts clock cycles in the active phase. When the phase duration expires, the counter clears and the FSM advances. Durations are parameters in seconds multiplied by the clock frequency. The output decoder defaults to both directions red. Reset is active-high and synchronous; it returns the FSM to NS_GREEN.
