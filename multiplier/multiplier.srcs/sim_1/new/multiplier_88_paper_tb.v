`timescale 1ns / 1ps

module multiplier_88_paper_tb;
    
    reg [7:0] a, b;
    wire [15:0] product;
    integer i, j;

    // 实例化乘法器模块
    multiplier_88_paper uut(
        .a(a), 
        .b(b), 
        .product(product)
    );

    initial begin
        // 初始化输入
        a = 0; b = 0;
        
        // 遍历所有输入组合
        for (i = 245; i < 255; i = i + 1) begin
            for (j = 230; j < 240; j = j + 1) begin
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
