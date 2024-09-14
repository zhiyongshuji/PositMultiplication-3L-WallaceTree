`timescale 1ns / 1ps

module multiplier_88_tb;
    
    reg [31:0] a, b;
    wire [63:0] product;
    integer i, j;

    // ʵ�����˷���ģ��
    multiplier_3232 uut(
        .a(a), 
        .b(b), 
        .product(product)
    );

    initial begin
        // ��ʼ������
        a = 0; b = 0;
        
        // ���������������
        for (i = 4294967100; i < 4294967200; i = i + 1) begin
            for (j = 4000000100; j < 4000000200; j = j + 1) begin
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
