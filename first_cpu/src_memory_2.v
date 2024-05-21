module src2_memory(
    input clk,
    input [1:0] src2_addr,
    output reg [7:0] src2_value
);

reg [7:0] memory_array [7:0];

initial begin
    memory_array[0] = 8'b11110000;
    memory_array[1] = 8'b01001110;
    memory_array[2] = 8'b10011001;
    memory_array[3] = 8'b00100101;
    memory_array[4] = 8'b11101111;
    memory_array[5] = 8'b01010010;
    memory_array[6] = 8'b10111100;
    memory_array[7] = 8'b00001011;
end

always @(posedge clk) begin
    src2_value <= memory_array[src2_addr];
end

endmodule
