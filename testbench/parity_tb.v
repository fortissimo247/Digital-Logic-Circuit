`timescale 1ns / 1ps

module parity_tb;


reg a;
reg b;
reg c;
wire p;


parity instance_parity (
    .a(a), 
    .b(b), 
    .c(c),
    .p(p)
);

initial begin
    
    a = 0; b = 0; c = 0;
    #10; 
    
    a = 0; b = 0; c = 1;
    #10; 
    
    a = 0; b = 1; c = 0;
    #10; 
    
    a = 0; b = 1; c = 1;
    #10; 
    
    a = 1; b = 0; c = 0;
    #10; 
    
    a = 1; b = 0; c = 1;
    #10; 
    
    a = 1; b = 1; c = 0;
    #10; 
    
    a = 1; b = 1; c = 1;
    #10; 
    

    $finish;
end


initial begin
    $monitor("시간=%t, 입력 a=%b, 입력 b=%b, 입력 c=%b, 출력 y=%b", $time, a, b, c, p);
end

endmodule
