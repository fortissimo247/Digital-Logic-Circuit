module dest_memory(
    input clk,
    input [1:0] dest_addr,
    input [7:0] result,
    output [7:0] mem_data
);

reg [7:0] mem [3:0]; // 4개의 8비트 메모리 공간

assign mem_data = mem[dest_addr]; // 읽기 데이터

always @(posedge clk) begin
    mem[dest_addr] <= result; // 쓰기 동작
end

endmodule
