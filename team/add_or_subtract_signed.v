module AddSub(
    input signed [7:0] a,
    input signed [7:0] b,
    input op, // 0: addition, 1: subtraction
    output reg signed [7:0] result,
    output reg overflow
);
    // 임시 결과를 저장할 9비트 변수 (오버플로 체크를 위해)
    reg signed [8:0] temp_result;

    always @(a, b, op) begin
        if (op == 0) begin
            // 덧셈
            temp_result = {a[7], a} + {b[7], b};
            result = temp_result[7:0];
        end else begin
            // 뺄셈
            temp_result = {a[7], a} - {b[7], b};
            result = temp_result[7:0];
        end
        // 오버플로 체크
        overflow = (temp_result[8] != temp_result[7]);
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
    .result(result),
    .overflow(overflow)
  );

  initial begin
    $monitor("Time = %d, a = %d, b = %d, op = %b, result = %d, overflow = %b", $time, a, b, op, result, overflow);

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
    
    a = 8'd100; b = 8'd30; op = 1'b0;
    #10;
    
    a = -8'd100; b = -8'd30; op = 1'b0;
    #10;

    $finish;
  end
endmodule
