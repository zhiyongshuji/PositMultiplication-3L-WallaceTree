`timescale 1ns / 1ps

module tb_concat_partial_product;

parameter N = 32; // 可以根据需要调整参数大小

// 输入和输出信号
reg [N-1:0] a, b, c;
wire [N-1:0] sum, cout;

// 实例化被测试模块
concat_partial_product #(.N(N)) DUT (
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .cout(cout)
);

// 初始化过程，用于模拟输入
initial begin
    // 初始化输入
    a = 0; b = 0; c = 0;

    // 模拟不同的输入条件
    #10 a = 32'hFFFF0000; b = 32'h0000FFFF; c = 32'hFFFFFFFF;
    #10 a = 32'hAAAA5555; b = 32'h5555AAAA; c = 32'h0F0F0F0F;
    #10 a = 32'h12345678; b = 32'h87654321; c = 32'hFFFFFFFF;
    #10 a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; c = 32'hF0F0F0F0;

    // 生成额外的时间点，用于观察最后一个条件的输出
    #10;

    // 结束测试
    $finish;
end

// 可选：将结果打印到控制台
initial begin
    $monitor("Time = %t, a = %h, b = %h, c = %h, sum = %h, cout = %h", $time, a, b, c, sum, cout);
end

endmodule
