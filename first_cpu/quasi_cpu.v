module cpu(clk, reset);
    input clk, reset;

    wire [7:0] instruction;
    wire [1:0] op_code;
    wire [1:0] src_addr1, src_addr2, dest_addr;
    wire [7:0] result;

    fetch fetch_unit(
        .clk(clk),
        .reset(reset),
        .instruction_out(instruction)
    );

    decode decode_unit(
        .instruction(instruction),
        .op_code(op_code),
        .src_addr1(src_addr1),
        .src_addr2(src_addr2),
        .dest_addr(dest_addr)
    );

    execute execute_unit(
        .clk(clk),
        .reset(reset),
        .op_code(op_code),
        .src_addr1(src_addr1),
        .src_addr2(src_addr2),
        .dest_addr(dest_addr),
        .result(result)
    );

endmodule
