module fetch(
    input clk,
    output reg [7:0] inst
);

reg [7:0] mem [7:0];
reg [2:0] pc;

initial begin
    $readmemb("inst_memory.mem", mem);
    pc = 0;
end

always @(posedge clk) begin
    inst <= mem[pc];
    pc <= pc + 1;
end

endmodule
