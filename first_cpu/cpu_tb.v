`timescale 1ns/1ps

module cpu_tb;

reg clk, reset;
wire [7:0] inst_out, mem_data_out;

cpu dut(
    .clk(clk),
    .reset(reset),
    .inst_out(inst_out),
    .mem_data_out(mem_data_out)
);

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 $finish;
end

always #5 clk = ~clk;

endmodule
