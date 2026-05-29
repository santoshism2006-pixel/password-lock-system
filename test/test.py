import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test_password_lock(dut):

    dut.ui_in.value = 0b0000
    await Timer(1, units="us")

    assert (dut.uo_out.value.integer & 1) == 0

    dut.ui_in.value = 0b0110
    await Timer(1, units="us")

    assert (dut.uo_out.value.integer & 1) == 1
