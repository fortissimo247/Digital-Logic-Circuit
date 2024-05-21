module cpu(
    input clk,
    input reset
);

wire [7:0] inst;
wire [1:0] op, src1_addr, src2_addr, dest_addr;
wire [7:0] src1_value, src2_value, result;

fetch fetch_unit(
    .clk(clk),
    .inst(inst)
);

decode decode_unit(
    .inst(inst),
    .op(op),
    .src1_addr(src1_addr),
    .src2_addr(src2_addr),
    .dest_addr(dest_addr)
);

src1_memory src1_mem(
    .clk(clk),
    .src1_addr(src1_addr),
    .src1_value(src1_value)
);

src2_memory src2_mem(
    .clk(clk),
    .src2_addr(src2_addr),
    .src2_value(src2_value)
);

execute execute_unit(
    .clk(clk),
    .reset(reset),
    .op(op),
    .src1_value(src1_value),
    .src2_value(src2_value),
    .result(result)
);

result_memory result_mem(
    .clk(clk),
    .dest_addr(dest_addr),
    .result(result)
);

endmodule
