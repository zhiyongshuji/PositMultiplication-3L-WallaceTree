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
    input wire [5:0] inputs,  // 使用一个6位宽的数组作为输入
    output wire [2:0] sum     // 三位输出
);
    // 中间变量，用于全加器和半加器的输出
    wire [1:0] sum1, sum2;
    wire carry1, carry2, carry3;

    // 第一个全加器
    full_adder_temp fa1(
        .a(inputs[0]),
        .b(inputs[1]),
        .cin(inputs[2]),
        .sum(sum1[0]),
        .cout(carry1)
    );

    // 第二个全加器
    full_adder_temp fa2(
        .a(inputs[3]),
        .b(inputs[4]),
        .cin(inputs[5]),
        .sum(sum2[0]),
        .cout(carry2)
    );

    // 半加器用于汇总两个全加器的主输出
    half_adder_temp ha1(
        .a(sum1[0]),
        .b(sum2[0]),
        .sum(sum[0]),
        .cout(carry3)
    );

    // 第三个全加器用于汇总所有的进位
    full_adder_temp fa3(
        .a(carry1),
        .b(carry2),
        .cin(carry3),
        .sum(sum[1]),
        .cout(sum[2])
    );
endmodule
