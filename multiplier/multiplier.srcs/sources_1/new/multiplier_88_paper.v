/***
    ���������еķ���ʵ�ֵ�8��8�˷����������л�PPT���и÷�����ʾ��ͼ
***/

module multiplier_88_paper(
    input [7:0] a,  // ��һ��8λ����
    input [7:0] b,  // �ڶ���8λ����
    output [15:0] product  // 16λ�ĳ˻����
    );
wire [63:0] partial_products;
wire [51:0] partial_products_2;
wire [38:0] partial_products_3;  
wire [32:0] partial_products_4;
wire [25:0] partial_products_5;    
genvar i, j;

// ���ɲ��ֻ�
generate
    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            assign partial_products[8*i + j] = a[i] & b[j];
        end
    end
endgenerate    

/***   ������ͼ���stage0 �׶�  ***/
generate
	for (i = 2; i < 8; i = i + 1) begin
          full_adder fa1 ({partial_products[i], partial_products[i+7], partial_products[i+14]}, {partial_products_2[i+1], partial_products_2[i+8]});
	end
endgenerate

//ʵ����ȫ����ģ��
generate
	for (i = 26; i < 32; i = i + 1) begin
          full_adder fa2 ({partial_products[i], partial_products[i+7], partial_products[i+14]}, {partial_products_2[i-5], partial_products_2[i+2]});
	end
endgenerate
    
    //ʵ���������ģ��
    half_adder ha1(
        .in({partial_products[1],partial_products[8]}),
        .out({partial_products_2[2], partial_products_2[1]})
    );
    
    half_adder ha2(
        .in({partial_products[15],partial_products[22]}),
        .out({partial_products_2[9], partial_products_2[16]})
    );
    
    half_adder ha3(
        .in({partial_products[25],partial_products[32]}),
        .out({partial_products_2[20], partial_products_2[19]})
    );
    
    half_adder ha4(
        .in({partial_products[39],partial_products[46]}),
        .out({partial_products_2[27], partial_products_2[34]})
    );
    
    assign {partial_products_2[0],partial_products_2[17],partial_products_2[18],partial_products_2[51:35]} = {partial_products[0],partial_products[23],partial_products[24],partial_products[63:47]}; 

    
    /***   ������ͼ���stage1 �׶�  ***/
generate
	for (i = 3; i < 10; i = i + 1) begin
          full_adder fa3 ({partial_products_2[i], partial_products_2[i+8], partial_products_2[i+15]}, {partial_products_3[i+1], partial_products_3[i+8]});
	end
endgenerate

generate
	for (i = 30; i < 36; i = i + 1) begin
          full_adder fa4 ({partial_products_2[i], partial_products_2[i+7], partial_products_2[i+14]}, {partial_products_3[i-6], partial_products_3[i+1]});
	end
endgenerate

    half_adder ha5(
        .in({partial_products_2[2],partial_products_2[10]}),
        .out({partial_products_3[3], partial_products_3[2]})
    );
    
    half_adder ha6(
        .in({partial_products_2[29],partial_products_2[36]}),
        .out({partial_products_3[23], partial_products_3[22]})
    );
    
    half_adder ha7(
        .in({partial_products_2[43],partial_products_2[50]}),
        .out({partial_products_3[30], partial_products_3[37]})
    );
    
//�����assign����ǰѱ��׶���δʹ�õĲ����е�Ԫ�أ���ͼ������δ���������ȫ������������Ԫ�أ����ݵ���һ�׶�
//�����е�assign��䶼���������
assign partial_products_3[1:0] = partial_products_2[1:0];
assign partial_products_3[20:18] = partial_products_2[27:25];  
assign partial_products_3[21] = partial_products_2[28];
assign partial_products_3[38] = partial_products_2[51];  
   
    /***   ����ͼ���stage 2�׶�  ***/ 
generate
	for (i = 5; i < 11; i = i + 1) begin
          full_adder fa5 ({partial_products_3[i], partial_products_3[i+8], partial_products_3[i+16]}, {partial_products_4[i+1], partial_products_4[i+10]});
	end
endgenerate

    half_adder ha8(
        .in({partial_products_3[3],partial_products_3[11]}),
        .out({partial_products_4[4], partial_products_4[3]})
    );
    
    half_adder ha9(
        .in({partial_products_3[4],partial_products_3[12]}),
        .out({partial_products_4[5], partial_products_4[14]})
    );
    
    half_adder ha10(
        .in({partial_products_3[20],partial_products_3[28]}),
        .out({partial_products_4[13], partial_products_4[22]})
    );
    
    half_adder ha11(
        .in({partial_products_3[19],partial_products_3[27]}),
        .out({partial_products_4[12], partial_products_4[21]})
    );
assign partial_products_4[2:0] = partial_products_3[2:0];
assign partial_products_4[32:23] = partial_products_3[38:29];
     
    /***  ����ͼ���stage 3�׶� ***/
generate
	for (i = 7; i < 14; i = i + 1) begin
          full_adder fa6 ({partial_products_4[i], partial_products_4[i+10], partial_products_4[i+18]}, {partial_products_5[i+1], partial_products_5[i+11]});
	end
endgenerate    

    half_adder ha12(
        .in({partial_products_4[4],partial_products_4[14]}),
        .out({partial_products_5[5], partial_products_5[4]})
    );
    
    half_adder ha13(
        .in({partial_products_4[5],partial_products_4[15]}),
        .out({partial_products_5[6], partial_products_5[16]})
    );
    
    half_adder ha14(
        .in({partial_products_4[6],partial_products_4[16]}),
        .out({partial_products_5[7], partial_products_5[17]})
    );
    
    half_adder ha15(
        .in({partial_products_4[24],partial_products_4[32]}),
        .out({partial_products_5[15], partial_products_5[25]})
    );
assign  partial_products_5[3:0] = partial_products_4[3:0];

    /***   ����ͼ���Conventional Adder�׶�   ***/    
assign product[4:0] = partial_products_5[4:0];
assign product[15:5] = partial_products_5[15:5] + {1'b0,partial_products_5[25:16]};
    
endmodule
