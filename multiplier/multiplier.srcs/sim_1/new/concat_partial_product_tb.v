`timescale 1ns / 1ps

module tb_concat_partial_product;

parameter N = 32; // ���Ը�����Ҫ����������С

// ���������ź�
reg [N-1:0] a, b, c;
wire [N-1:0] sum, cout;

// ʵ����������ģ��
concat_partial_product #(.N(N)) DUT (
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .cout(cout)
);

// ��ʼ�����̣�����ģ������
initial begin
    // ��ʼ������
    a = 0; b = 0; c = 0;

    // ģ�ⲻͬ����������
    #10 a = 32'hFFFF0000; b = 32'h0000FFFF; c = 32'hFFFFFFFF;
    #10 a = 32'hAAAA5555; b = 32'h5555AAAA; c = 32'h0F0F0F0F;
    #10 a = 32'h12345678; b = 32'h87654321; c = 32'hFFFFFFFF;
    #10 a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; c = 32'hF0F0F0F0;

    // ���ɶ����ʱ��㣬���ڹ۲����һ�����������
    #10;

    // ��������
    $finish;
end

// ��ѡ���������ӡ������̨
initial begin
    $monitor("Time = %t, a = %h, b = %h, c = %h, sum = %h, cout = %h", $time, a, b, c, sum, cout);
end

endmodule
