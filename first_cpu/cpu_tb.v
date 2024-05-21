`timescale 1ns/1ps

module cpu_tb;

// DUT (Design Under Test) 인스턴스 생성
reg clk, reset;
cpu dut (.clk(clk), .reset(reset));

// 클록 신호 생성
always #5 clk = ~clk; // 10ns 주기

// 리셋 신호 생성
initial begin
    clk = 0;
    reset = 1; // 초기 리셋 신호 활성화
    #10 reset = 0; // 10ns 후 리셋 신호 비활성화
end

// 모니터링 태스크
task monitor;
    $display("Time: %0t, Instruction: %h, Op_code: %b, Src1: %b, Src2: %b, Dest: %b, Result: %h", $time, dut.fetch_unit.instruction_out, dut.decode_unit.op_code, dut.decode_unit.src_addr1, dut.decode_unit.src_addr2, dut.decode_unit.dest_addr, dut.execute_unit.result);
endtask

// 테스트 시퀀스
initial begin
    #20 monitor; // 초기 상태 모니터링
    #100 $finish; // 100ns 후 시뮬레이션 종료
end

endmodule
