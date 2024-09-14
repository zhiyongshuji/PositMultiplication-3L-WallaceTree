module counter_53(
    input wire [4:0] inputs,  // 5-bit input
    output reg [2:0] outputs  // 3-bit output: C2 (carry), S1 (sub-carry), S0 (sum)
);

// ����������1������
integer i, count;

always @(*) begin
    count = 0;
    // ����ѭ��
    for (i = 0; i < 5; i = i + 1) begin
        count = count + inputs[i];
    end

    // ����1�������������
    case (count)
        0: outputs = 3'b000;
        1: outputs = 3'b001;
        2: outputs = 3'b010;
        3: outputs = 3'b011;
        4: outputs = 3'b100;
        5: outputs = 3'b101;
        default: outputs = 3'b000; // �������Ӧ����
    endcase
end

endmodule
