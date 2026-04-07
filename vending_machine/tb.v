`timescale 1ns/1ps

module vending_tb;

reg clk;
reg [1:0] in;
reg rst;

wire out;
wire [1:0] change;

vending_machine uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
);

initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(0, vending_tb);

    rst = 1;
    clk = 0;
    in  = 2'b00;

    #6  rst = 0; in = 2'b01;
    #11 in = 2'b01;
    #16 in = 2'b01;
    #25 $finish;
end

always #5 clk = ~clk;

endmodule
