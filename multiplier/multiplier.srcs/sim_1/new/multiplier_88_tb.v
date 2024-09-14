`timescale 1ns / 1ps

module multiplier_88_tb;
    
    reg [31:0] a, b;
    wire [63:0] product;
    integer i, j;

    // 实例化乘法器模块
    multiplier_3232 uut(
        .a(a), 
        .b(b), 
        .product(product)
    );

    initial begin
        // 初始化输入
        a = 0; b = 0;
        
        // 遍历所有输入组合
        for (i = 4294967100; i < 4294967200; i = i + 1) begin
            for (j = 4000000100; j < 4000000200; j = j + 1) begin
                a = i;
                b = j;
                #10; // 延时10ns以便观察波形
                
                // 打印结果，以便手动或自动验证
                $display("At time %t, a = %d, b = %d, product = %d",
                         $time, a, b, product);
            end
        end
        
        // 测试完成
        $finish;
    end

endmodule
