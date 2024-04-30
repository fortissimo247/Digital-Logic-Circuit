module cpu(
    // Inputs
    input clk,
    input reset,
    // Outputs
    output reg [7:0] result
);

// Internal signals
reg [1:0] opcode;
reg [7:0] operand1, operand2;
wire [3:0] control_signal;
wire [1:0] decoded_opcode; // Add this line

// Instantiate decoder module
decoder decoder_inst(
    .opcode(opcode),
    .control_signal(control_signal),
    .decoded_opcode(decoded_opcode) // Add this line
);

// Fetch stage: Read instruction from file
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset state
        opcode <= 2'b00;
        operand1 <= 8'b0;
        operand2 <= 8'b0;
    end else begin
        // Read instruction from file
        // You can replace this with your testbench stimulus
        //$readmemh("instruction.txt", opcode, operand1, operand2);
    end
end

// Decode stage: Use decoded opcode
always @(*) begin
    // Pass decoded opcode to control the operation
    case(decoded_opcode)
        2'b00: begin
                    // Perform addition
                    // You need to modify this part accordingly
               end
        2'b01: begin
                    // Perform subtraction
                    // You need to modify this part accordingly
               end
        2'b10: begin
                    // Perform multiplication
                    // You need to modify this part accordingly
               end
        2'b11: begin
                    // Perform division
                    // You need to modify this part accordingly
               end
        default: begin
                    // Default: no operation
               end
    endcase
end

// Execute stage: Perform operation based on control signal
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset state
        result <= 8'b0;
    end else begin
        // Execute operation based on control signal
        // You need to modify this part accordingly
    end
end

endmodule
