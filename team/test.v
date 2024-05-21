module alu (
  input  [2:0] opcode,
  input  [7:0] operand1,
  input  [7:0] operand2,
  output reg [7:0] result
);

  // 3-to-8 decoder
  reg [7:0] decoder_out;
  always @(*) begin
    case (opcode)
      3'b000: decoder_out = 8'b00000001; // add
      3'b001: decoder_out = 8'b00000010; // sub
      3'b010: decoder_out = 8'b00000100; // not
      3'b011: decoder_out = 8'b00001000; // and
      3'b100: decoder_out = 8'b00010000; // or
      3'b101: decoder_out = 8'b00100000; // xor
      3'b110: decoder_out = 8'b01000000; // shift left
      3'b111: decoder_out = 8'b10000000; // shift right
      default: decoder_out = 8'b00000000; 
    endcase
  end

  // ALU operation selection and execution
  always @(*) begin
    case (1'b1)
      decoder_out[0]: result = operand1 + operand2;    // add
      decoder_out[1]: result = operand1 - operand2;    // sub
      decoder_out[2]: result = ~operand1;            // not
      decoder_out[3]: result = operand1 & operand2;    // and
      decoder_out[4]: result = operand1 | operand2;    // or
      decoder_out[5]: result = operand1 ^ operand2;    // xor
      decoder_out[6]: result = operand1 << 1;        // shift left
      decoder_out[7]: result = operand1 >> 1;        // shift right
      default: result = 8'b00000000;
    endcase
  end

endmodule






module result_memory(
    input clk,               // 클럭 신호
    input [3:0] addr,        // 4비트 주소 입력
    input [15:0] data_in,    // 16비트 데이터 입력
    input write_en,          // 쓰기 신호
    output reg [15:0] data_out // 16비트 데이터 출력
);

    reg [15:0] memory_array [15:0];   // 16개의 16비트 메모리 공간 선언

    // 메모리 쓰기 동작
    always @(posedge clk) begin
        if (write_en)
            memory_array[addr] <= data_in;
    end

    // 메모리 읽기 동작
    always @(posedge clk) begin
        data_out <= memory_array[addr];
    end

endmodule






module testbench;
  reg clk;
  reg [2:0] opcode;
  reg [7:0] operand1;
  reg [7:0] operand2;
  wire [7:0] alu_result;
  reg [3:0] addr;
  reg [15:0] data_in;
  reg write_en;
  wire [15:0] data_out;

  // ALU instance
  alu my_alu (
    .opcode(opcode),
    .operand1(operand1),
    .operand2(operand2),
    .result(alu_result)
  );

  // result_memory instance
  result_memory my_memory (
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .write_en(write_en),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  initial begin
    // Initialization
    write_en = 0;
    addr = 0;
    data_in = 0;
    opcode = 0;
    operand1 = 0;
    operand2 = 0;

    // 1. Set initial memory values
    #10;
    write_en = 1;
    addr = 4'b0000;
    #10;
    data_in = 16'h0010; // Store 16'h0010 at memory address 0
    $display("시간 %t: 메모리 주소 %h에 %h 저장", $time, addr, data_in);
    
    #10;
    addr = 4'b0001;
    #10;
    data_in = 16'h0020; // Store 16'h0020 at memory address 1
    $display("시간 %t: 메모리 주소 %h에 %h 저장", $time, addr, data_in);
    
    #10;
    addr = 4'b0010;
    #10;
    data_in = 16'h0030; // Store 16'h0030 at memory address 2
    $display("시간 %t: 메모리 주소 %h에 %h 저장", $time, addr, data_in);
    #10;
    write_en = 0;

    // 2. Read and operate
    #10;
    addr = 4'b0000;
    #10;
    operand1 = data_out[7:0];
    $display("시간 %t: 메모리 주소 %h에서 %h 읽음", $time, addr, data_out);

    #10;
    addr = 4'b0001;
    #10;
    operand2 = data_out[7:0];
    $display("시간 %t: 메모리 주소 %h에서 %h 읽음", $time, addr, data_out);

    // 3. Perform operation (e.g., ADD)
    #10;
    opcode = 3'b000; // ADD operation
    #10;
    $display("시간 %t: 연산 결과 (ADD): %h", $time, alu_result);

    // 4. Store the operation result in memory
    #10;
    write_en = 1;
    addr = 4'b0011; data_in = {8'b0, alu_result}; // Store the operation result at memory address 3
    #10;
    $display("시간 %t: 연산 결과 %h를 메모리 주소 %d에 저장", $time, data_in, addr);
    write_en = 0;

    // 5. Read the stored value for another operation
    #10;
    addr = 4'b0011;
    #10;
    operand1 = data_out[7:0];
    $display("시간 %t: 메모리 주소 %d에서 %h 읽음", $time, addr, data_out);

    #10;
    addr = 4'b0010;
    #10;
    operand2 = data_out[7:0];
    $display("시간 %t: 메모리 주소 %d에서 %h 읽음", $time, addr, data_out);

    // 6. Perform another operation (e.g., SUB)
    #10;
    opcode = 3'b001; // SUB operation
    #10;
    $display("시간 %t: 연산 결과 (SUB): %h", $time, alu_result);

    // 7. Store the final operation result in memory
    #10;
    write_en = 1;
    addr = 4'b0100; data_in = {8'b0, alu_result}; // Store the final operation result at memory address 4
    #10;
    write_en = 0;
    $display("시간 %t: 최종 연산 결과 %h를 메모리 주소 %d에 저장", $time, data_in, addr);

    // End of test
    #10;
    $finish;
  end
endmodule
