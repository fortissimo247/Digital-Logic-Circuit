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

// Decode stage: Decode opcode
always @(*) begin
    // Pass opcode to decoder module
    decoder_inst.opcode = opcode;
end

// Execute stage: Perform operation based on control signal
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset state
        result <= 8'b0;
    end else begin
        // Execute operation based on control signal
        case(control_signal)
            4'b0001: result <= operand1 + operand2; // Addition
            4'b0010: result <= operand1 - operand2; // Subtraction
            4'b0100: result <= operand1 * operand2; // Multiplication
            4'b1000: result <= operand1 / operand2; // Division
            default: result <= 8'b0; // Default: no operation
        endcase
    end
end

endmodule
