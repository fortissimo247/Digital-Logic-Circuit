module execute(clk, reset, op_code, src_addr1, src_addr2, dest_addr, result);
    input clk, reset;
    input [1:0] op_code, src_addr1, src_addr2, dest_addr;
    output reg [7:0] result;

    wire [7:0] operand1, operand2, add_result;
    reg [7:0] reg_file [3:0]; // 4개의 레지스터

    Adder adder_unit(.a(operand1), .b(operand2), .sum(add_result));

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
            case(op_code)
                2'b00: reg_file[dest_addr] <= add_result; // 덧셈
                // 다른 연산에 대한 코드 추가 가능
            endcase
        end
    end
endmodule
