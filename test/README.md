# Password Lock System - Tiny Tapeout

## Overview

This project implements a simple Password Lock System using Verilog HDL for Tiny Tapeout.

The design compares a 4-bit input password with a predefined secret password. If the entered password matches the stored password, the system unlocks and activates the unlock output signal.

---

## Features

* 4-bit password verification
* Unlock indication output
* Error indication output
* Tiny Tapeout compatible
* Simple combinational logic design

---

## Secret Password

```text id="33t59w"
0110
```

---

## Inputs and Outputs

| Signal       | Description          |
| ------------ | -------------------- |
| `ui_in[3:0]` | 4-bit password input |
| `uo_out[0]`  | Unlock output        |
| `uo_out[1]`  | Error output         |
| `clk`        | Clock input (unused) |
| `rst_n`      | Reset input (unused) |

---

## Working Principle

The system continuously compares the input password with the predefined password.

### Correct Password

* Unlock output becomes HIGH
* Error output becomes LOW

### Incorrect Password

* Unlock output becomes LOW
* Error output becomes HIGH

---

## Verilog Module

```verilog id="a8f6vr"
module tt_um_password_lock (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    wire unlock;

    assign unlock = (ui_in[3:0] == 4'b0110);

    assign uo_out[0] = unlock;
    assign uo_out[1] = ~unlock;

    assign uo_out[7:2] = 6'b000000;

    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

endmodule
```

---

## Simulation

Run simulation using:

```bash id="jlwmg7"
make test
```

To open waveform viewer:

```bash id="h6r0lg"
make gtkwave
```

---

## Applications

* Electronic door lock systems
* Access control systems
* Embedded security applications
* Digital authentication systems

---

## Tools Used

* Verilog HDL
* Tiny Tapeout
* Icarus Verilog
* Cocotb
* GTKWave

---

## Author

Santoshi SM
