module operand2_memory(
    input [3:0] operand2_addr,
    output reg [15:0] operand2_value
);

    // 16비트 데이터 값들 (랜덤으로 지정)
    reg [15:0] memory_array [15:0];

    initial begin
        memory_array[0] = 16'b0100_1101_1010_0011;
        memory_array[1] = 16'b1011_0010_0101_1100;
        memory_array[2] = 16'b0001_1111_1001_0110;
        memory_array[3] = 16'b1110_0000_0110_1001;
        memory_array[4] = 16'b0011_1001_1100_1010;
        memory_array[5] = 16'b1101_0110_0011_0101;
        memory_array[6] = 16'b0010_1011_1111_1000;
        memory_array[7] = 16'b1000_1100_0000_0111;
        memory_array[8] = 16'b0111_0001_1010_1101;
        memory_array[9] = 16'b1001_1110_0101_0010;
        memory_array[10] = 16'b0110_0011_1001_1111;
        memory_array[11] = 16'b1000_1010_0110_0100;
        memory_array[12] = 16'b0101_0101_1011_1011;
        memory_array[13] = 16'b1111_1000_0100_0001;
        memory_array[14] = 16'b0010_0111_1110_0110;
        memory_array[15] = 16'b1101_1001_0001_1001;
    end

    always @(operand2_addr) begin
        operand2_value = memory_array[operand2_addr];
    end

endmodule
