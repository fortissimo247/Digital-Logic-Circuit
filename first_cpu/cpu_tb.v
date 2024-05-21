`timescale 1ns/1ps

module cpu_tb;

reg clk, reset;

cpu dut(
    .clk(clk),
    .reset(reset)
);

initial begin
    clk = 0;
    reset = 1;
    #5 reset = 0;
end

always #5 clk = ~clk;

initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, cpu_tb);
    $dumpvars(0, dut.fetch_unit.mem);
    $dumpvars(0, dut.decode_unit.op, dut.decode_unit.src1_addr, dut.decode_unit.src2_addr, dut.decode_unit.dest_addr);
    $dumpvars(0, dut.src1_mem.memory_array, dut.src2_mem.memory_array, dut.result_mem.mem);
    $dumpvars(0, dut.execute_unit.result);
    #500 $finish;
end

endmodule
