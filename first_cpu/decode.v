module decode(
    input clk,
    input [15:0] inst,
    output reg [3:0] op,
    output reg [3:0] src1_addr,
    output reg [3:0] src2_addr,
    output reg [3:0] dest_addr
);

always @(posedge clk) begin
	op <= inst[15:12];
	src1_addr <= inst[11:8];
	src2_addr <= inst[7:4];
	dest_addr <= inst[3:0];
end


endmodule
