module multiplier_44_comp (
    input [3:0] a,  // ��һ��4λ����
    input [3:0] b,  // �ڶ���4λ����
    output [7:0] product  // 8λ�ĳ˻����
);

    // ʹ��Verilog�����ó˷�������ֱ�Ӽ���˻�
    assign product = a * b;

endmodule
