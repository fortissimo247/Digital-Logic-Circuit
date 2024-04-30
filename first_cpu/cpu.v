module cpu(
    // Inputs
    input clk,
    input reset,
    input [1:0] opcode,
    input [7:0] operand1,
    input [7:0] operand2,
    // Outputs
    output reg [7:0] result
);

// Internal signals
reg [7:0] temp_result;

// Fetch stage: Read instruction from file
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset state
        result <= 8'b0;
    end else begin
        // Execute operation based on opcode
        case(opcode)
            2'b00: begin
                        // Addition
                        temp_result <= operand1 + operand2;
                   end
            2'b01: begin
                        // Subtraction
                        temp_result <= operand1 - operand2;
                   end
            2'b10: begin
                        // Multiplication
                        temp_result <= operand1 * operand2;
                   end
            2'b11: begin
                        // Division
                        temp_result <= operand1 / operand2;
                   end
            default: begin
                        // Default: no operation
                   end
        endcase
    end
end

// Output the result
always @(posedge clk) begin
    result <= temp_result;
end

endmodule
