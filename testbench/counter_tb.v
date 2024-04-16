// This code is written with ChatGPT, Claude

// 테스트벤치
`timescale 1ns/1ns // 시간 단위 설정

module BinaryCounter_tb;
    // 테스트벤치에 필요한 신호 정의
    reg clk; // 클럭 신호
    reg rst; // 리셋 신호
    wire [3:0] count; // 카운터 값

    // 카운터 모듈 인스턴스화
    BinaryCounter Counter_inst(
        .clk(clk), // 클럭 신호 연결
        .rst(rst), // 리셋 신호 연결
        .count(count) // 카운터 값 연결
    );

    // 클럭 생성
    initial begin
        clk = 0; // 초기 클럭 값 설정
        forever #5 clk = ~clk; // 5ns 주기로 클럭 반전
    end

    // 리셋 신호 생성
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

    // 카운터 값 출력
    always @(posedge clk) begin
        $display("Current count: %d", count);
    end

    // 시뮬레이션 종료
    initial begin
        #100; // 시뮬레이션 시간
        $finish; // 시뮬레이션 종료
    end
endmodule
