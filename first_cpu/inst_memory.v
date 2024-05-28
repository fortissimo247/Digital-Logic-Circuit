module inst_memory(
    input clk,
    input [2:0] addr,
    output reg [15:0] inst
);

reg [7:0] mem [0:7]; // 8개의 8비트 instruction 메모리

initial begin
    mem[0] = 8'b00000000;
    mem[1] = 8'b01000001;
    mem[2] = 8'b10000010;
    mem[3] = 8'b11000011;
    mem[4] = 8'b00111111;
    mem[5] = 8'b01111110;
    mem[6] = 8'b10111101;
    mem[7] = 8'b11111100;
    mem[8] = 8'b00000000;
    mem[9] = 8'b01000001;
    mem[10] = 8'b10000010;
    mem[11] = 8'b11000011;
    mem[12] = 8'b00111111;
    mem[13] = 8'b01111110;
    mem[14] = 8'b10111101;
    mem[15] = 8'b11111100;
end

always @(posedge clk) begin
    inst <= mem[addr];
end

endmodule
