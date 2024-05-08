`timescale 1ns/1ps

module ripple_carry_adder_tb();

  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  ripple_carry_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // 테스트 벡터 적용
    a = 4'b0000; b = 4'b0000; cin = 1'b0; #10;
    a = 4'b0101; b = 4'b1010; cin = 1'b0; #10;
    a = 4'b1111; b = 4'b1111; cin = 1'b1; #10;
    $finish;
  end

  initial begin
    $monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
  end

endmodule
