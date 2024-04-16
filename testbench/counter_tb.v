// This code is written with ChatGPT, Claude

`timescale 1ns/1ns

module BinaryCounter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

 
    BinaryCounter Counter_inst(
        .clk(clk),
        .rst(rst),
        .count(count)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
        rst = 0;
        #10;
        rst = 1;
        #30;
        rst = 0;
        #10;
        rst = 1;
        #30;
        rst = 0;
    end


    always @(posedge clk) begin
        $display("Current count: %d", count);
    end


    initial begin
        #100;
        $finish;
    end
endmodule
