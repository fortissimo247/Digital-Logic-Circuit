module execute(clk, reset, op_code, src_addr1, src_addr2, dest_addr, result);

input clk, reset;
input [1:0] op_code, src_addr1, src_addr2, dest_addr;
output reg [7:0] result;

reg [7:0] operand1, operand2;
reg [7:0] reg_file [3:0]; // 4개의 레지스터

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // 레지스터 파일 초기화
        reg_file[0] <= 0;
        reg_file[1] <= 0;
        reg_file[2] <= 0;
        reg_file[3] <= 0;
    end else begin
        operand1 <= reg_file[src_addr1];
        operand2 <= reg_file[src_addr2];

        case (op_code)
            2'b00: result <= operand1 + operand2; // 덧셈
            2'b01: result <= operand1 - operand2; // 뺄셈
            2'b10: result <= operand1 * operand2; // 곱셈
            2'b11: result <= operand1 / operand2; // 나눗셈
        endcase

        reg_file[dest_addr] <= result;
    end
end

endmodule
