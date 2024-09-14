module full_adder_temp(
    input wire a, b, cin,
    output wire sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

module half_adder_temp(
    input wire a, b,
    output wire sum, cout
);
    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module counter_63_2 (
    input wire [5:0] inputs,  // ʹ��һ��6λ���������Ϊ����
    output wire [2:0] sum     // ��λ���
);
    // �м����������ȫ�����Ͱ���������
    wire [1:0] sum1, sum2;
    wire carry1, carry2, carry3;

    // ��һ��ȫ����
    full_adder_temp fa1(
        .a(inputs[0]),
        .b(inputs[1]),
        .cin(inputs[2]),
        .sum(sum1[0]),
        .cout(carry1)
    );

    // �ڶ���ȫ����
    full_adder_temp fa2(
        .a(inputs[3]),
        .b(inputs[4]),
        .cin(inputs[5]),
        .sum(sum2[0]),
        .cout(carry2)
    );

    // ��������ڻ�������ȫ�����������
    half_adder_temp ha1(
        .a(sum1[0]),
        .b(sum2[0]),
        .sum(sum[0]),
        .cout(carry3)
    );

    // ������ȫ�������ڻ������еĽ�λ
    full_adder_temp fa3(
        .a(carry1),
        .b(carry2),
        .cin(carry3),
        .sum(sum[1]),
        .cout(sum[2])
    );
endmodule
