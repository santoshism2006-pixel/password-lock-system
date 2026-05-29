```python id="q7h1jg"
# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_password_lock(dut):

    # Initial values
    dut.ui_in.value = 0b00000000
    dut.uio_in.value = 0b00000000
    dut.ena.value = 1
    dut.clk.value = 0
    dut.rst_n.value = 1

    # Wait for initialization
    await Timer(10, units="ns")

    # Test incorrect password
    dut.ui_in.value = 0b00000001
    await Timer(10, units="ns")

    assert dut.uo_out.value[0] == 0, "Unlock should be OFF"
    assert dut.uo_out.value[1] == 1, "Error should be ON"

    # Test correct password
    dut.ui_in.value = 0b00000110
    await Timer(10, units="ns")

    assert dut.uo_out.value[0] == 1, "Unlock should be ON"
    assert dut.uo_out.value[1] == 0, "Error should be OFF"

    # Test another incorrect password
    dut.ui_in.value = 0b00001111
    await Timer(10, units="ns")

    assert dut.uo_out.value[0] == 0, "Unlock should be OFF"
    assert dut.uo_out.value[1] == 1, "Error should be ON"
```
