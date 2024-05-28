module fetch(
    input clk,
    output reg [15:0] inst
);

reg [2:0] pc;
initial pc = 0;

wire [15:0] inst_mem_out;

inst_memory inst_mem(
	.clk(clk),
	.addr(pc),
	.inst(inst_mem_out)
);

always @(posedge clk) begin
    inst <= inst_mem_out;
    if (pc == 7)
		pc <= 0;
    else
		pc <= pc + 1;
end

endmodule
