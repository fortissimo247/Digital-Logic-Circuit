// This code is made with claude.ai

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
