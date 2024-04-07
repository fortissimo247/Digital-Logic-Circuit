// This code is made with Claude

// 멀티플렉서 테스트 벤치
module mux_4to1_tb;

reg [3:0] in;   // 입력 신호 레지스터
reg [1:0] sel;  // 선택 신호 레지스터
wire out;       // 출력 신호 와이어

// 멀티플렉서 인스턴스 생성
mux_4to1 dut (.in(in), .sel(sel), .out(out));

// 입력 및 선택 신호 변경, 출력 확인
initial begin
    in = 4'b1010; sel = 2'b00; #10;
    $display("Input: %b, Select: %b, Output: %b", in, sel, out);
    sel = 2'b01; #10;
    $display("Input: %b, Select: %b, Output: %b", in, sel, out);
    sel = 2'b10; #10;
    $display("Input: %b, Select: %b, Output: %b", in, sel, out);
    sel = 2'b11; #10;
    $display("Input: %b, Select: %b, Output: %b", in, sel, out);
    $finish;
end

endmodule
