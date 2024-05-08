module fetch(clk, reset, instruction_out);
    input clk, reset;
    output reg [7:0] instruction_out;

    always @(posedge clk or posedge reset) begin
        if (reset) instruction_out <= 8'b0;
        else instruction_out <= instruction_out + 1; // 단순 예제를 위해 명령어를 순차적으로 증가
    end
endmodule
