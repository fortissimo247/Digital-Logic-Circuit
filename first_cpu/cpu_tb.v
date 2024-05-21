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
    #500 $finish;
end

endmodule
