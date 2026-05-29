```verilog id="54bjxg"
`default_nettype none
`timescale 1ns / 1ps

module tb ();

    // Dump waves
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);
        #1;
    end

    // Inputs
    reg clk;
    reg rst_n;
    reg ena;
    reg [7:0] ui_in;
    reg [7:0] uio_in;

    // Outputs
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // Instantiate the DUT
    tt_um_password_lock dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initialize signals
        clk = 0;
        rst_n = 0;
        ena = 1;
        ui_in = 8'b00000000;
        uio_in = 8'b00000000;

        // Reset
        #10;
        rst_n = 1;

        // Test incorrect password
        ui_in[3:0] = 4'b0001;
        #10;

        // Test correct password
        ui_in[3:0] = 4'b0110;
        #10;

        // Test another incorrect password
        ui_in[3:0] = 4'b1111;
        #10;

        $finish;
    end

endmodule
```
