module Adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output CarryOut
    );
    
    assign {CarryOut, Sum} = A + B;
endmodule

module Subtractor(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Difference,
    output Borrow
    );
    
    assign {Borrow, Difference} = A - B; 
endmodule

module ArithmeticUnit(
    input [3:0] A,
    input [3:0] B,
    input Sel,  // 0일때 덧셈, 1일때 뺄셈
    output [3:0] Result,
    output CarryOut,
    output Overflow
    );

    wire [3:0] Sum, Difference;
    wire CarryOutAdd, BorrowSub;

    // 모듈 인스턴스
    Adder add(
        .A(A), 
        .B(B), 
        .Sum(Sum), 
        .CarryOut(CarryOutAdd)
    );
    Subtractor sub(
        .A(A), 
        .B(B), 
        .Difference(Difference), 
        .Borrow(BorrowSub)
    );

    //먹스
    assign Result = Sel ? Difference : Sum;
    assign CarryOut = Sel ? BorrowSub : CarryOutAdd;

endmodule









/////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////테스트벤치////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ArithmeticUnit_tb;

reg [3:0] A_tb, B_tb;
reg Sel_tb;
wire [3:0] Result_tb;
wire Carry_tb;

ArithmeticUnit uut (
    .A(A_tb), 
    .B(B_tb), 
    .Sel(Sel_tb), 
    .Result(Result_tb), 
    .CarryOut(Carry_tb)
);

initial begin
    A_tb = 0; B_tb = 0; Sel_tb = 0;
    #10 $display("Sel=0 for add, Sel=1 for substract");
    
    // Test Case 1: Addition 3 + 2
    A_tb = 4'd3; B_tb = 4'd2; Sel_tb = 1'b0;  // Sel 0 for addition
    #10 $display("Time: %t, A=%b(%d), B=%b(%d), Sel=%b, Result=%b(%d), Carry(orBorrow)=%b", $time, A_tb, A_tb, B_tb, B_tb, Sel_tb, Result_tb, Result_tb, Carry_tb);
    #10;  // Wait 10 ns
    
    // Test Case 2: Subtraction 3 - 2
    A_tb = 4'd3; B_tb = 4'd2; Sel_tb = 1'b1;  // Sel 1 for subtraction
    #10 $display("Time: %t, A=%b(%d), B=%b(%d), Sel=%b, Result=%b(%d), Carry(orBorrow)=%b", $time, A_tb, A_tb, B_tb, B_tb, Sel_tb, Result_tb, Result_tb, Carry_tb);
    #10;  // Wait 10 ns
    
    // Test Case 3: Addition 7 + 5
    A_tb = 4'd7; B_tb = 4'd5; Sel_tb = 1'b0;
    #10 $display("Time: %t, A=%b(%d), B=%b(%d), Sel=%b, Result=%b(%d), Carry(orBorrow)=%b", $time, A_tb, A_tb, B_tb, B_tb, Sel_tb, Result_tb, Result_tb, Carry_tb);
    #10;
    
    // Test Case 4: Subtraction 10 - 8
    A_tb = 4'd10; B_tb = 4'd8; Sel_tb = 1'b1;
    #10 $display("Time: %t, A=%b(%d), B=%b(%d), Sel=%b, Result=%b(%d), Carry(orBorrow)=%b", $time, A_tb, A_tb, B_tb, B_tb, Sel_tb, Result_tb, Result_tb, Carry_tb);
    #10;
    
    // Test Case 5
    A_tb = 4'd8; B_tb = 4'd9; Sel_tb = 1'b0;
    #10 $display("Time: %t, A=%b(%d), B=%b(%d), Sel=%b, Result=%b(%d), Carry(orBorrow)=%b", $time, A_tb, A_tb, B_tb, B_tb, Sel_tb, Result_tb, Result_tb, Carry_tb);
    #10;
    
    // Test Case 6
    A_tb = 4'd5; B_tb = 4'd6; Sel_tb = 1'b1;
    #10 $display("Time: %t, A=%b(%d), B=%b(%d), Sel=%b, Result=%b(%d), Carry(orBorrow)=%b", $time, A_tb, A_tb, B_tb, B_tb, Sel_tb, Result_tb, Result_tb, Carry_tb);
    #10;
  
    $finish;
end

endmodule
