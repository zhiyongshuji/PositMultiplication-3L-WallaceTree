`timescale 1ns / 1ps

module multiplier_88_paper_tb;
    
    reg [7:0] a, b;
    wire [15:0] product;
    integer i, j;

    // ʵ�����˷���ģ��
    multiplier_88_paper uut(
        .a(a), 
        .b(b), 
        .product(product)
    );

    initial begin
        // ��ʼ������
        a = 0; b = 0;
        
        // ���������������
        for (i = 245; i < 255; i = i + 1) begin
            for (j = 230; j < 240; j = j + 1) begin
                a = i;
                b = j;
                #10; // ��ʱ10ns�Ա�۲첨��
                
                // ��ӡ������Ա��ֶ����Զ���֤
                $display("At time %t, a = %d, b = %d, product = %d",
                         $time, a, b, product);
                         
            end
        end
        
        // �������
        $finish;
    end


endmodule
