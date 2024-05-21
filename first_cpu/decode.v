module decode(
    input [7:0] inst,
    output [1:0] op,
    output [1:0] src1_addr,
    output [1:0] src2_addr,
    output [1:0] dest_addr
);

assign op = inst[7:6];
assign src1_addr = inst[5:4];
assign src2_addr = inst[3:2];
assign dest_addr = inst[1:0];

endmodule
