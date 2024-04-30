`timescale 1ns / 1ps

module cpu_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Inputs
reg clk = 0;
reg reset = 0;
reg [1:0] opcode;
reg [7:0] operand1;
reg [7:0] operand2;

// Outputs
wire [7:0] result;

// Instantiate CPU module
cpu dut (
    .clk(clk),
    .reset(reset),
    .result(result)
);

// Clock generation
always #((CLK_PERIOD)/2) clk = ~clk;

// Initial stimulus
initial begin
    // Reset
    reset = 1;
    #20;
    reset = 0;

    // Test case 1: Addition (opcode = 00)
    #10;
    opcode = 2'b00; // Set opcode
    operand1 = 8'b00101000; // Set operand1 (10진수: 40)
    operand2 = 8'b00000101; // Set operand2 (10진수: 5)
    $display("Test case 1: Addition");
    $display("Input: operand1 = %d, operand2 = %d (binary)", operand1, operand2);
    // Provide operand values directly to dut
    dut.opcode = opcode;
    dut.operand1 = operand1;
    dut.operand2 = operand2;
    // Display result
    $display("Output: result = %d (decimal)", result);

    // Test case 2: Subtraction (opcode = 01)
    #10;
    opcode = 2'b01; // Set opcode
    operand1 = 8'b00001111; // Set operand1 (10진수: 15)
    operand2 = 8'b00000010; // Set operand2 (10진수: 2)
    $display("Test case 2: Subtraction");
    $display("Input: operand1 = %d, operand2 = %d (binary)", operand1, operand2);
    // Provide operand values directly to dut
    dut.opcode = opcode;
    dut.operand1 = operand1;
    dut.operand2 = operand2;
    // Display result
    $display("Output: result = %d (decimal)", result);

    // Test case 3: Multiplication (opcode = 10)
    #10;
    opcode = 2'b10; // Set opcode
    operand1 = 8'b00000100; // Set operand1 (10진수: 4)
    operand2 = 8'b00000101; // Set operand2 (10진수: 5)
    $display("Test case 3: Multiplication");
    $display("Input: operand1 = %d, operand2 = %d (binary)", operand1, operand2);
    // Provide operand values directly to dut
    dut.opcode = opcode;
    dut.operand1 = operand1;
    dut.operand2 = operand2;
    // Display result
    $display("Output: result = %d (decimal)", result);

    // Test case 4: Division (opcode = 11)
    #10;
    opcode = 2'b11; // Set opcode
    operand1 = 8'b00010000; // Set operand1 (10진수: 16)
    operand2 = 8'b00000010; // Set operand2 (10진수: 2)
    $display("Test case 4: Division");
    $display("Input: operand1 = %d, operand2 = %d (binary)", operand1, operand2);
    // Provide operand values directly to dut
    dut.opcode = opcode;
    dut.operand1 = operand1;
    dut.operand2 = operand2;
    // Display result
    $display("Output: result = %d (decimal)", result);

    #10;
    $stop;
end

endmodule
