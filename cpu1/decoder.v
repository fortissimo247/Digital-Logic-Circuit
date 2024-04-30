module decoder(
    input [1:0] opcode,
    output reg [3:0] control_signal,
    output reg [1:0] decoded_opcode // Add this line
);

always @(*) begin
    case(opcode)
        2'b00: begin
                    control_signal = 4'b0001; // Addition
                    decoded_opcode = 2'b00; // Set decoded opcode
               end
        2'b01: begin
                    control_signal = 4'b0010; // Subtraction
                    decoded_opcode = 2'b01; // Set decoded opcode
               end
        2'b10: begin
                    control_signal = 4'b0100; // Multiplication
                    decoded_opcode = 2'b10; // Set decoded opcode
               end
        2'b11: begin
                    control_signal = 4'b1000; // Division
                    decoded_opcode = 2'b11; // Set decoded opcode
               end
        default: begin
                    control_signal = 4'b0000; // Default control signal
                    decoded_opcode = 2'b00; // Default decoded opcode
                 end
    endcase
end

endmodule
