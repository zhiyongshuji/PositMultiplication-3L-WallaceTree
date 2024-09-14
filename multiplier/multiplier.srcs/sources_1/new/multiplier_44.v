module multiplier_44(
    input [3:0] a, b,
    output [7:0] product
);

wire [15:0] partial_products;
wire [12:0] partial_products_2;
wire [10:0] partial_products_3;

genvar i, j;

// 生成部分乘积
generate
    for (i = 0; i < 4; i = i + 1) begin
        for (j = 0; j < 4; j = j + 1) begin
            assign partial_products[4*i + j] = a[i] & b[j];
        end
    end
endgenerate

/***   第一阶段   ***/
    assign partial_products_2[0] = partial_products[0];
    assign partial_products_2[12] = partial_products[3];    
    assign partial_products_2[9] = partial_products[13];
    assign partial_products_2[11] = partial_products[15];
    full_adder fa(
        .in({partial_products[2], partial_products[5], partial_products[8]}), // 无进位输入
        .out({partial_products_2[3], partial_products_2[7]})
    );

    half_adder ha1(
        .in({partial_products[1], partial_products[4]}),
        .out({partial_products_2[2], partial_products_2[1]})
    );  
    
    half_adder ha2(
        .in({partial_products[11], partial_products[14]}),
        .out({partial_products_2[6], partial_products_2[10]})
    );
    
    counter_233 cnt233(
        .inputs({partial_products[7], partial_products[10] ,partial_products[6],partial_products[9],partial_products[12]}),
        .outputs({partial_products_2[5], partial_products_2[4], partial_products_2[8]})
    );
    
    
/***   第二阶段   ***/


    assign partial_products_3[0] = partial_products_2[0];
    assign partial_products_3[1] = partial_products_2[1]; 
    
    half_adder ha3(
        .in({partial_products_2[2], partial_products_2[7]}),
        .out({partial_products_3[3], partial_products_3[2]})
    );
    
    half_adder ha4(
        .in({partial_products_2[5], partial_products_2[10]}),
        .out({partial_products_3[6], partial_products_3[9]})
    );
 
     half_adder ha5(
        .in({partial_products_2[6], partial_products_2[11]}),
        .out({partial_products_3[7], partial_products_3[10]})
    );

    counter_233 cnt233_2(
        .inputs({partial_products_2[4], partial_products_2[9] ,partial_products_2[3],partial_products_2[8],partial_products_2[12]}),
        .outputs({partial_products_3[5], partial_products_3[4], partial_products_3[8]})
    );


/***   第三阶段   ***/


wire [7:0] reduced_products; // 压缩后的输出示例

assign {reduced_products[2], reduced_products[1], reduced_products[0]} = {partial_products_3[2], partial_products_3[1], partial_products_3[0]};
assign {reduced_products[7], reduced_products[6], reduced_products[5], reduced_products[4], reduced_products[3]} = 
{partial_products_3[7], partial_products_3[6], partial_products_3[5], partial_products_3[4], partial_products_3[3]} + 
{1'b0, partial_products_3[10], partial_products_3[9], 1'b0, partial_products_3[8]};
// 结果输出
assign product = reduced_products; // 仅示例，实际需正确处理所有层的加法器输出

endmodule
