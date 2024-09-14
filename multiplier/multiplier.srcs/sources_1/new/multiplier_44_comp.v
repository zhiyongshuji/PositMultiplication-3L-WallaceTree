module multiplier_44_comp (
    input [3:0] a,  // 第一个4位乘数
    input [3:0] b,  // 第二个4位乘数
    output [7:0] product  // 8位的乘积输出
);

    // 使用Verilog的内置乘法操作符直接计算乘积
    assign product = a * b;

endmodule
