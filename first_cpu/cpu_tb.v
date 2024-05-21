`timescale 1ns/1ps

module cpu_tb;

reg clk, reset;
reg [7:0] inst_out, result_out;

cpu dut(
    .clk(clk),
    .reset(reset),
    .inst_out(inst_out),
    .result_out(result_out)
);

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #10 reset = 1;
    #100 $finish;
end

always #5 clk = ~clk;

endmodule
