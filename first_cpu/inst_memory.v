module inst_memory(
    output reg [7:0] inst
);

reg [7:0] mem [7:0];

initial begin
    mem[0] = 8'b00000000; // 임의의 instruction 값 설정
    mem[1] = 8'b01010101;
    mem[2] = 8'b10101010;
    mem[3] = 8'b11111111;
    mem[4] = 8'b00001111;
    mem[5] = 8'b01011010;
    mem[6] = 8'b10100101;
    mem[7] = 8'b11110000;
end

always @(*) begin
    inst = mem[pc];
end

reg [2:0] pc;
initial pc = 0;

endmodule
