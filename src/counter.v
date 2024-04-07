// This code is written with ChatGPT, Claude

module BinaryCounter(
    input clk,     // 클럭 신호
    input rst,     // 리셋 신호
    output reg [3:0] count // 4비트 카운터
);

always @(posedge clk or negedge rst) begin
    if (!rst)      // 리셋 신호가 비활성화되면
        count <= 4'b0000; // 카운터를 초기화합니다.
    else           // 그렇지 않으면
        count <= count + 1; // 카운터를 1 증가시킵니다.
end

endmodule
