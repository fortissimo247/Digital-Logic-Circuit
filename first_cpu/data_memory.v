module result_memory(
    input clk,               // 클럭 신호
    input [3:0] addr,        // 4비트 주소 입력
    input [15:0] data_in,    // 16비트 데이터 입력
    input write_en,          // 쓰기 신호
    output reg [15:0] data_out // 16비트 데이터 출력
);

    reg [15:0] memory_array [15:0];   // 16개의 16비트 메모리 공간 선언
    reg [15:0] read_data;             // 읽기 데이터를 저장할 레지스터

    // 메모리 쓰기 동작
    always @(posedge clk) begin
        if (write_en)
            memory_array[addr] <= data_in;
    end

    // 메모리 읽기 동작
    always @(posedge clk) begin
        read_data <= memory_array[addr];
    end

    // 쓰기 동작과 관련하여 출력값 설정
    always @(*) begin
        if (write_en)
            data_out = data_in; // 쓰기 동작 시, 즉시 출력에 반영
        else
            data_out = read_data; // 그렇지 않으면 읽기 데이터 출력
    end

endmodule
