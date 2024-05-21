module src1_memory(
    input clk,
    input [1:0] src1_addr,
    output reg [7:0] src1_value
);

reg [7:0] memory_array [7:0];

initial begin
    memory_array1[0] = 8'b10101011;
    memory_array1[1] = 8'b01101001;
    memory_array1[2] = 8'b11000110;
    memory_array1[3] = 8'b00111100;
    memory_array1[4] = 8'b10010001;
    memory_array1[5] = 8'b01100111;
    memory_array1[6] = 8'b11001010;
    memory_array1[7] = 8'b00011101;
end

always @(posedge clk) begin
    src1_value <= memory_array[src1_addr];
end

endmodule
