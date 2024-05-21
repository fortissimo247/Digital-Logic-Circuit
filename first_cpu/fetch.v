module fetch(
    input clk,
    output reg [7:0] inst
);

inst_memory inst_mem(
);

reg [2:0] pc;
initial pc = 0;

always @(posedge clk) begin
    inst <= inst_mem.inst;
    pc <= pc + 1;
end

endmodule
