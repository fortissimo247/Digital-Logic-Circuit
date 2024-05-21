module cpu(
    input clk,
    input reset,
    output reg [7:0] inst_out, // reg 타입으로 선언
    output reg [7:0] result_out // reg 타입으로 선언
);

wire [7:0] inst, result;
wire [1:0] op, src1_addr, src2_addr, dest_addr;
wire [7:0] src1_value, src2_value;

inst_memory fetch_unit(
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

assign inst_out = inst; // 프로시저 할당문 대신 연속 할당문 사용
assign result_out = result; // 프로시저 할당문 대신 연속 할당문 사용

endmodule
