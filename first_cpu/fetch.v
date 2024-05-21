module fetch(
    input clk,
    output reg [7:0] inst
);

inst_memory inst_mem(
    .inst(inst)
);

endmodule
