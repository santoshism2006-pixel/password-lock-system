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
