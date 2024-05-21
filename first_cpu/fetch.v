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
    if (pc == 7) pc <= 0; // 마지막 instruction 이후에는 pc를 0으로 리셋
    else pc <= pc + 1;
end

endmodule
