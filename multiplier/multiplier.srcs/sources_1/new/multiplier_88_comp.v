module multiplier_88_comp (
    input [7:0] a,  // 第一个8位乘数
    input [7:0] b,  // 第二个8位乘数
    output [15:0] product  // 16位的乘积输出
);

    // 使用Verilog的内置乘法操作符直接计算乘积
    assign product = a * b;

endmodule