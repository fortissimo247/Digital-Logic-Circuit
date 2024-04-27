// This code is made with Claude

// 프로그램 메모리
module prog_mem(
  input [5:0] addr,
  output [15:0] inst
);
  reg [15:0] mem [0:63];
  initial $readmemh("prog.mem", mem);
  assign inst = mem[addr];
endmodule

// 레지스터 파일
module reg_file(
  input clk,
  input [2:0] rs1, rs2, rd,
  input [15:0] rd_data,
  input reg_write,
  output [15:0] rs1_data, rs2_data
);
  reg [15:0] registers [0:7];
  assign rs1_data = registers[rs1];
  assign rs2_data = registers[rs2];
  always @(posedge clk) begin
    if (reg_write) registers[rd] <= rd_data;
  end
endmodule

// ALU
module alu(
  input [15:0] a, b,
  input [2:0] alu_op,
  output reg [15:0] result
);
  always @(*) begin
    case (alu_op)
      3'b000: result = a + b;
      3'b001: result = a - b;
      3'b010: result = a & b;
      3'b011: result = a | b;
      3'b100: result = ~a;
      default: result = 16'bx;
    endcase
  end
endmodule

// 제어 유닛
module control_unit(
  input [3:0] opcode,
  output reg [2:0] alu_op,
  output reg reg_write, mem_read, mem_write, branch
);
  always @(*) begin
    case (opcode)
      4'b0000: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b000_1_0_0_0; // add
      4'b0001: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b001_1_0_0_0; // sub
      4'b0010: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b010_1_0_0_0; // and
      4'b0011: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b011_1_0_0_0; // or
      4'b0100: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b100_1_0_0_0; // not
      4'b0101: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b000_0_1_0_0; // lw
      4'b0110: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b000_0_0_1_0; // sw
      4'b0111: {alu_op, reg_write, mem_read, mem_write, branch} = 8'b000_0_0_0_1; // beq
      default: {alu_op, reg_write, mem_read, mem_write, branch} = 8'bxxxxxxx;
    endcase
  end
endmodule

// 데이터 메모리
module data_mem(
  input clk, mem_read, mem_write,
  input [15:0] addr, wr_data,
  output [15:0] rd_data
);
  reg [15:0] mem [0:63];
  assign rd_data = mem_read ? mem[addr] : 16'bz;
  always @(posedge clk) begin
    if (mem_write) mem[addr] <= wr_data;
  end
endmodule

// CPU 최상위 모듈
module cpu(
  input clk, reset
);
  wire [15:0] inst;
  wire [2:0] alu_op;
  wire reg_write, mem_read, mem_write, branch;
  wire [15:0] rs1_data, rs2_data, alu_result, rd_data;
  reg [5:0] pc;
  reg [15:0] imm;

  prog_mem prog_mem (.addr(pc), .inst(inst));
  control_unit cu (.opcode(inst[15:12]), .alu_op(alu_op), .reg_write(reg_write), .mem_read(mem_read), .mem_write(mem_write), .branch(branch));
  reg_file rf (.clk(clk), .rs1(inst[11:9]), .rs2(inst[8:6]), .rd(inst[5:3]), .rd_data(alu_result), .reg_write(reg_write), .rs1_data(rs1_data), .rs2_data(rs2_data));
  alu alu (.a(rs1_data), .b(imm), .alu_op(alu_op), .result(alu_result));
  data_mem dm (.clk(clk), .mem_read(mem_read), .mem_write(mem_write), .addr(alu_result), .wr_data(rs2_data), .rd_data(rd_data));

  always @(posedge clk) begin
    if (reset) pc <= 0;
    else if (branch && rs1_data == rs2_data) pc <= pc + imm;
    else pc <= pc + 1;
  end

  always @(*) begin
    case (inst[11:9])
      3'b000: imm = {13'b0, inst[2:0]};
      3'b001: imm = {10'b0, inst[5:0]};
      3'b010: imm = {6'b0, inst[9:0]};
      3'b011: imm = {{3{inst[9]}}, inst[9:0]};
      3'b100: imm = {{8{inst[7]}}, inst[7:0]};
      default:
