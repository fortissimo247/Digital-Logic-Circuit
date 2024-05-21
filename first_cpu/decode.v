module decode(
    input clk,
    input [7:0] inst,
    output reg [1:0] op,
    output reg [1:0] src1_addr,
    output reg [1:0] src2_addr,
    output reg [1:0] dest_addr
);

always @(posedge clk) begin
	op <= inst[7:6];
	src1_addr <= inst[5:4];
	src2_addr <= inst[3:2];
	dest_addr <= inst[1:0];
end


endmodule
