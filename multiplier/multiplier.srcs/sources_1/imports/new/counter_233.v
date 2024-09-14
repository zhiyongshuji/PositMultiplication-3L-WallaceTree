module counter_233(
    input wire [4:0] inputs,  // �������飬inputs[4:3]Ϊ��λȨ��inputs[2:0]Ϊ��λȨ
    output reg [2:0] outputs  // ������飬outputs[2]Ϊ����λ��outputs[1]Ϊ�ν�λ��outputs[0]Ϊ��λ
);

wire [3:0] sum; // ��Ȩ�ͽ����4λ�㹻��ʾ��0��7��ֵ

// �����Ȩ��
assign sum = 2 * (inputs[4] + inputs[3]) + (inputs[2] + inputs[1] + inputs[0]);

// ʹ������߼�always�����������
always @* begin
    // ���ݼ�Ȩ���������
    case (sum)
        0: outputs = 3'b000;
        1: outputs = 3'b001;
        2: outputs = 3'b010;
        3: outputs = 3'b011;
        4: outputs = 3'b100;
        5: outputs = 3'b101;
        6: outputs = 3'b110;
        7: outputs = 3'b111;
        default: outputs = 3'b000; // Ĭ�����Ϊ0�������쳣��sumֵ
    endcase
end

endmodule

