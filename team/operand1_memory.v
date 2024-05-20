module operand1_memory(
    input clk,
    input [3:0] operand1_addr,
    output reg [15:0] operand1_value
);

// 16비트 데이터 값들 (랜덤으로 지정)
reg [15:0] memory_array [15:0];

initial begin
    memory_array[0]  = 16'b1010_1001_0011_0101;
    memory_array[1]  = 16'b0111_1110_0000_1001;
    memory_array[2]  = 16'b1100_0101_1111_0110;
    memory_array[3]  = 16'b0010_1101_1010_1111;
    memory_array[4]  = 16'b1001_0110_0101_1000;
    memory_array[5]  = 16'b0101_1011_1100_0111;
    memory_array[6]  = 16'b1110_0001_0011_1101;
    memory_array[7]  = 16'b0000_1111_1001_0010;
    memory_array[8]  = 16'b1011_0100_0110_1110;
    memory_array[9]  = 16'b0111_0010_1101_0001;
    memory_array[10] = 16'b1000_1101_0011_1100;
    memory_array[11] = 16'b0100_0111_1010_0011;
    memory_array[12] = 16'b1101_1000_0101_1001;
    memory_array[13] = 16'b0001_0110_1100_1010;
    memory_array[14] = 16'b1110_1001_1011_0110;
    memory_array[15] = 16'b0010_0011_0000_1111;
end

always @(posedge clk) begin
    operand1_value <= memory_array[operand1_addr];
end

endmodule
