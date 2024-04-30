// This code is made with Claude

// 디코더 테스트 벤치
module decoder_2to4_tb;

reg [1:0] in;   // 입력 신호 레지스터
wire [3:0] out; // 출력 신호 와이어

// 디코더 인스턴스 생성
decoder_2to4 dut (.in(in), .out(out));

// 입력 신호 변경 및 출력 확인
initial begin
    in = 2'b00; #10;
    $display("Input: %b, Output: %b", in, out);
    in = 2'b01; #10;
    $display("Input: %b, Output: %b", in, out);
    in = 2'b10; #10;
    $display("Input: %b, Output: %b", in, out);
    in = 2'b11; #10;
    $display("Input: %b, Output: %b", in, out);
    $finish;
end

endmodule
