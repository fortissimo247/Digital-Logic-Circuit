module inst_memory(
    input clk,
    input [2:0] addr,
    output reg [7:0] inst
);

reg [7:0] mem [0:7]; // 8개의 8비트 instruction 메모리

initial begin
    mem[0] = 8'b00000000;
    mem[1] = 8'b01010101;
    mem[2] = 8'b10101010;
    mem[3] = 8'b11111111;
    mem[4] = 8'b00001111;
    mem[5] = 8'b01011010;
    mem[6] = 8'b10100101;
    mem[7] = 8'b11110000;
end

always @(posedge clk) begin
    inst <= mem[addr];
end

endmodule
