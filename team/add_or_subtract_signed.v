module AddSub(
    input signed [7:0] a, // 8-bit signed input a
    input signed [7:0] b, // 8-bit signed input b
    input op, // Operation: 0 for addition, 1 for subtraction
    output reg signed [7:0] result // 8-bit signed result
);

    always @(a, b, op) begin
        if (op == 0) begin
            result = a + b;
        end else begin
            result = a - b;
        end
    end

endmodule



`timescale 1ns / 1ps

module testbench;

  reg [7:0] a;
  reg [7:0] b;
  reg op;
  wire [7:0] result;

  AddSub uut (
    .a(a), 
    .b(b), 
    .op(op), 
    .result(result)
  );

  initial begin
    $monitor("Time = %d, a = %d, b = %d, op = %b, result = %d", $time, a, b, op, result);

    // 테스트 케이스 1: 덧셈
    a = 8'd15; b = 8'd20; op = 1'b0; // 15 + 20
    #10; // 10ns 대기

    // 테스트 케이스 2: 뺄셈
    a = 8'd50; b = 8'd25; op = 1'b1; // 50 - 25
    #10;

    // 테스트 케이스 3: 음수와의 덧셈
    a = -8'd10; b = 8'd20; op = 1'b0; // -10 + 20
    #10;
    
    // 테스트 케이스 4: 음수와의 뺄셈
    a = 8'd10; b = -8'd20; op = 1'b1; // 10 - (-20)
    #10;

    $finish;
  end
endmodule
