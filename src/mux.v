// This code is made with Claude

// 4-to-1 멀티플렉서 모듈
module mux_4to1 (
    input [3:0] in,    // 4개의 입력 신호
    input [1:0] sel,   // 2비트 선택 신호
    output reg out     // 출력 신호
);

// 선택 신호가 변경될 때마다 출력을 계산
always @(*) begin
    case (sel)
        2'b00: out = in[0];  // 선택 신호 00일 때 in[0] 출력
        2'b01: out = in[1];  // 선택 신호 01일 때 in[1] 출력
        2'b10: out = in[2];  // 선택 신호 10일 때 in[2] 출력
        2'b11: out = in[3];  // 선택 신호 11일 때 in[3] 출력
        default: out = 1'b0; // 그 외의 경우 출력 0
    endcase
end

endmodule
