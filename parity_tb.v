`timescale 1ns / 1ps

module parity_tb;

// 입력 및 출력 신호 선언
reg a;
reg b;
reg c;
wire p;

// 테스트 대상 모듈 인스턴스화
parity instance_and (
    .a(a), 
    .b(b), 
    .c(c),
    .p(p)
);

initial begin
    // 초기 입력 값 설정
    a = 0; b = 0; c = 0;
    #10; // 10ns 대기
    
    a = 0; b = 0; c = 1;
    #10; // 10ns 대기
    
    a = 0; b = 1; c = 0;
    #10; // 10ns 대기
    
    a = 0; b = 1; c = 1;
    #10; // 10ns 대기
    
    a = 1; b = 0; c = 0;
    #10; // 10ns 대기
    
    a = 1; b = 0; c = 1;
    #10; // 10ns 대기
    
    a = 1; b = 1; c = 0;
    #10; // 10ns 대기
    
    a = 1; b = 1; c = 1;
    #10; // 10ns 대기
    
    // 시뮬레이션 종료
    $finish;
end

// 결과 모니터링
initial begin
    $monitor("시간=%t, 입력 a=%b, 입력 b=%b, 입력 c=%b, 출력 y=%b", $time, a, b, c, p);
end

endmodule
