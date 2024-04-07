// This code is made with claude.ai

// 2-to-4 디코더 모듈
module decoder_2to4 (
    input [1:0] in,    // 2비트 입력 신호
    output reg [3:0] out   // 4비트 출력 신호
);

// 입력 신호가 변경될 때마다 출력을 계산
always @(*) begin
    case (in)
        2'b00: out = 4'b0001;  // 입력 00일 때 출력 0001
        2'b01: out = 4'b0010;  // 입력 01일 때 출력 0010
        2'b10: out = 4'b0100;  // 입력 10일 때 출력 0100
        2'b11: out = 4'b1000;  // 입력 11일 때 출력 1000
        default: out = 4'b0000; // 그 외의 경우 출력 0000
    endcase
end

endmodule
