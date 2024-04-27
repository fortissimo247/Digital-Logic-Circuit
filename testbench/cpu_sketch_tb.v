`timescale 1ns/1ps

module cpu_tb();

  reg clk, reset;
  wire [15:0] r0, r1, r2, r3;

  cpu dut (
    .clk(clk),
    .reset(reset)
  );

  reg_file rf (
    .clk(clk),
    .rs1(3'b000), .rs2(3'b001), .rd(3'b010), .rd_data(dut.alu_result),
    .reg_write(dut.reg_write),
    .rs1_data(r0), .rs2_data(r1)
  );

  assign r2 = dut.rf.registers[2];
  assign r3 = dut.rf.registers[3];

  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
  end

  always #5 clk = ~clk;

  initial begin
    #100 $display("r0=%d, r1=%d, r2=%d, r3=%d", r0, r1, r2, r3);
    #1000 $finish;
  end

  initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, cpu_tb);
  end

endmodule
