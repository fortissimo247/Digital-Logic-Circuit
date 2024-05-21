module execute(
    input clk,
    input reset,
    input [1:0] op,
    input [7:0] src1_value,
    input [7:0] src2_value,
    output reg [7:0] result
);

always @(posedge clk) begin
    if (reset) begin
        result <= 0;
    end else begin
        case (op)
            2'b00: result <= src1_value + src2_value; // Addition
            2'b01: result <= src1_value - src2_value; // Subtraction
            2'b10: result <= src1_value * src2_value; // Multiplication
            2'b11: result <= src1_value / src2_value; // Division
        endcase
    end
end

endmodule
