module decoder(
    input [1:0] instruction,
    output reg [3:0] instruction_decoded
);
always @(*) begin
    case (instruction)
        2'b00: instruction_decoded = 4'b0001;
        2'b01: instruction_decoded = 4'b0010;
        2'b10: instruction_decoded = 4'b0100;
        2'b11: instruction_decoded = 4'b1000;
        default: instruction_decoded = 4'b0000;
    endcase
end
    
endmodule



module cpu(
    input clk,
    input rst,
    input [1:0] instruction,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] count,
    output reg [7:0] result
);
    
    wire [3:0] instruction_decoded;

    
// Decode
    decoder decoder_inst(
        .instruction(instruction),
        .instruction_decoded(instruction_decoded)
    );

    
always @(posedge clk or negedge rst) begin
    if (!rst)
        count <= 4'b0000;
    else
        count <= count + 1;
end

    
// Execute    
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        result <= 8'b0;
    end else begin
        case(instruction_decoded)
            4'b0001: result <= a + b;
            4'b0010: result <= a - b;
            4'b0100: result <= a * b;
            4'b1000: result <= a / b;
            default: result <= 8'b0; // Default: no operation
        endcase
    end
end

endmodule










//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////테스트벤치///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module testbench;

    // 테스트벤치용 입력 및 출력 신호 정의
    reg clk;
    reg rst;
    reg [1:0] instruction;
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] count;
    wire [7:0] result;

    // cpu 모듈 인스턴스화
    cpu uut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .a(a),
        .b(b),
        .count(count),
        .result(result)
    );

    // 클럭 신호 생성
    always #10 clk = ~clk;

    initial begin
        // 초기화
        clk = 0;
        rst = 0;
        instruction = 0;
        a = 0;
        b = 0;

        // 리셋 해제
        #20;
        rst = 1;
        a = 4'd10;
        b = 4'd5;

        // 각각의 연산 테스트
        #20; instruction = 2'b00; // 덧셈
        #20; instruction = 2'b01; // 뺄셈
        #20; instruction = 2'b10; // 곱셈
        #20; instruction = 2'b11; // 나눗셈

        #20;
        $finish; // 시뮬레이션 종료
    end

    // 결과 및 카운터 출력
    initial begin
        $monitor("시간=%t, 리셋=%b, 명령어=%b, a=%d, b=%d, 결과=%d, 카운트=%d",
                 $time, rst, instruction, a, b, result, count);
    end

endmodule
