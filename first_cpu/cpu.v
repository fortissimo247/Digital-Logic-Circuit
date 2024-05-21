`timescale 1ns/1ps

module cpu_tb;

reg clk, reset;
wire [7:0] inst;
wire [1:0] op, src1_addr, src2_addr, dest_addr;
wire [7:0] src1_value, src2_value, result;

cpu dut(
    .clk(clk),
    .reset(reset),
    .inst(inst),
    .op(op),
    .src1_addr(src1_addr),
    .src2_addr(src2_addr),
    .dest_addr(dest_addr),
    .src1_value(src1_value),
    .src2_value(src2_value),
    .result(result)
);

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #10 reset = 1;
    #100 $finish;
end

always #50 clk = ~clk;

endmodule
