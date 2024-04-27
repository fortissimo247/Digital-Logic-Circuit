`timescale 1ns/1ps

module cpu_tb();

  reg clk, reset;

  cpu dut (
    .clk(clk),
    .reset(reset)
  );

  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
  end

  always #5 clk = ~clk;

  initial begin
    #1000 $finish;
  end

endmodule
