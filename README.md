# uart-fifo-systemverilog
# UART + FIFO in SystemVerilog

Parameterized UART transmitter/receiver with a synchronous FIFO, verified with self-checking and randomized testbenches. Synthesized with Yosys/nextpnr.

**Key results**
- Fmax: _TODO_ MHz on iCE40 (nextpnr)
- Utilization: _TODO_ LUTs / _TODO_ FFs
- Verification: _TODO_ random bytes, 0 errors, framing-error and back-to-back cases covered

## Block diagram

_TODO: add docs/block_diagram.png (TX -> serial line -> RX -> FIFO -> TX loopback)_

## Design overview

| Module | Description |
|---|---|
| `uart_tx` | FSM: idle, start, 8 data bits (LSB first), stop. Parameterized `CLKS_PER_BIT`. |
| `uart_rx` | Mid-bit sampling, framing error detection. |
| `fifo` | Synchronous FIFO with full/empty flags. Depth/width parameterized. |
| `top` | RX -> FIFO -> TX loopback. |

## Verification

- `tb/tb_uart.sv`: self-checking, randomized bytes, scoreboard compares sent vs. received
- Edge cases covered: back-to-back bytes, idle line, framing error, reset mid-byte _(update to match what you actually test)_
- Waveform: _TODO: docs/waveform.png_

## How to run

```bash
iverilog -g2012 -o sim tb/tb_uart.sv rtl/*.sv
vvp sim
gtkwave uart.vcd
```

Synthesis:
```bash
yosys -p "read_verilog -sv rtl/*.sv; synth_ice40 -top top -json top.json"
nextpnr-ice40 --hx8k --json top.json --freq 50
```

## What I learned / bugs I hit

_TODO: 2 to 3 real bugs you found and how you debugged them. Interviewers love this section._

## Future work

- RV32I core that uses this UART as its console
- Parity bit and configurable data width
