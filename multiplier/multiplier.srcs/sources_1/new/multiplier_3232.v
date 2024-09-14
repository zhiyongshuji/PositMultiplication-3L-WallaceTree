module multiplier_3232(
    input [31:0] a, b,
    output [63:0] product
    );
    
wire [63:0] partial_products;
wire [31:0] LL_products;
wire [31:0] HL_products;
wire [31:0] LH_products;
wire [31:0] HH_products;

/***   第一阶段
       32×32位乘法器由四个16×16位乘法器组成
   ***/
    multiplier_1616 mul1616_LL(
        .a(a[15:0]),
        .b(b[15:0]),
        .product(LL_products)
    );
    
    multiplier_1616 mul1616_HL(
        .a(a[31:16]),
        .b(b[15:0]),
        .product(HL_products)
    );

    multiplier_1616 mul1616_LH(
        .a(a[15:0]),
        .b(b[31:16]),
    .product(LH_products)
    );

    multiplier_1616 mul1616_HH(
        .a(a[31:16]),
        .b(b[31:16]),
    .product(HH_products)
    );
    
/***   第二阶段   ***/
//assign partial_products[15:12] = HH_products[7:4];
//assign partial_products[3:0] = LL_products[3:0];

     concat_partial_product #(32) CONCAT(
        .a(HL_products),
        .b(LH_products),
        .c({HH_products[15:0], LL_products[31:16]}),
        .sum(partial_products[31:0]),
        .cout(partial_products[63:32])
     );


/***   第三阶段  
       Conventional Adder阶段
 ***/
assign product[16:0] = {partial_products[0], LL_products[15:0]};
assign product[63:17] = {HH_products[31:16], partial_products[31:1]} + {{15{1'b0}}, partial_products[63:32]};
endmodule
