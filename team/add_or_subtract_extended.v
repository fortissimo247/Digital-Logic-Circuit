module AddSub(
    input [7:0] a,
    input [7:0] b,
    input add_sub, // 0일 때 덧셈
    output reg [7:0] result,
    output reg carry_out,
    output reg overflow
);

always @(a, b, add_sub) begin
    if (add_sub == 1'b1) begin
        {carry_out, result} = a + (~b + 1'b1); // 2의 보수를 통한 뺄셈
        overflow = (a[7] != b[7]) && (result[7] != a[7]);
        // overflow = (a[7] == b[7]) && (result[7] != a[7]); ??
    end else begin
        {carry_out, result} = a + b;
        overflow = (a[7] == b[7]) && (result[7] != a[7]);
    end
end

endmodule




module tb();

reg [7:0] a;
reg [7:0] b;
reg add_sub;
wire [7:0] result;
wire carry_out;
wire overflow;

AddSub add_sub_inst(
    .a(a),
    .b(b),
    .add_sub(add_sub),
    .result(result),
    .carry_out(carry_out),
    .overflow(overflow)
);

initial begin
    a = 8'd50;
    b = 8'd70;
    add_sub = 0;
    #10;
    
    a = 8'd130;
    b = 8'd130;
    add_sub = 0;
    #10;
    
    a = 8'd100;
    b = 8'd50;
    add_sub = 1;
    #10;
    
    a = 8'd50;
    b = 8'd100;
    add_sub = 1;
    #10;
    
    a = 8'b11111111; // -1
    b = 8'b00000001; // 1
    add_sub = 0;
    #10;
    
    a = 8'b10000001; // -127
    b = 8'b11111111; // -1
    add_sub = 0;
    #10;
    
    a = 8'b10000000;
    b = 8'b00000001; // 1
    add_sub = 1;
    #10;
    
    a = 8'b11111111; // -1
    b = 8'b01111111; // 127
    add_sub = 1;
    #10;

    a = 8'b00000001;
    b = 8'b10000000; // -128
    add_sub = 1;
    #10;
    
    $finish;
end

initial begin
    $monitor("Time: %t, A: %d, B: %d, Add/Sub: %b, Result: %d, Carry Out: %b, Overflow: %b", $time, a, b, add_sub, result, carry_out, overflow);
end

endmodule
