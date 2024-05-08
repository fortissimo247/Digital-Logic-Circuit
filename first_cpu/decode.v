module decode(instruction, op_code, src_addr1, src_addr2, dest_addr);
    input [7:0] instruction;
    output [1:0] op_code, src_addr1, src_addr2, dest_addr;

    assign op_code = instruction[7:6];
    assign src_addr1 = instruction[5:4];
    assign src_addr2 = instruction[3:2];
    assign dest_addr = instruction[1:0];
endmodule
