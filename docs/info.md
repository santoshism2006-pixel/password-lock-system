# Password Lock System

## How it works

This project implements a simple digital Password Lock System using Verilog HDL for Tiny Tapeout.

The circuit compares a 4-bit password input from `ui_in[3:0]` with a predefined secret password.

Secret Password:
0110

### Operation

* If the entered password is correct:

  * `uo_out[0]` becomes HIGH indicating the lock is opened.
  * `uo_out[1]` becomes LOW indicating no error.

* If the entered password is incorrect:

  * `uo_out[0]` remains LOW.
  * `uo_out[1]` becomes HIGH indicating an invalid password.

The design uses combinational logic to continuously compare the input password with the stored password.

---

## How to test

1. Apply a 4-bit input password using `ui_in[3:0]`.

2. Enter the correct password:
   0110

Expected output:

* `uo_out[0] = 1`
* `uo_out[1] = 0`

3. Enter any incorrect password such as:
   0001

Expected output:

* `uo_out[0] = 0`
* `uo_out[1] = 1`

### Example Test Cases

| Password Input | Unlock Output | Error Output |
| -------------- | ------------- | ------------ |
| 0110           | 1             | 0            |
| 0000           | 0             | 1            |
| 1010           | 0             | 1            |
| 1111           | 0             | 1            |

---

## External hardware

No external hardware is required for this project.

Optional external hardware:

* LEDs for output indication
* DIP switches for password input
* Push buttons for manual testing
