module multiplier_88_comp (
    input [7:0] a,  // ��һ��8λ����
    input [7:0] b,  // �ڶ���8λ����
    output [15:0] product  // 16λ�ĳ˻����
);

    // ʹ��Verilog�����ó˷�������ֱ�Ӽ���˻�
    assign product = a * b;

endmodule