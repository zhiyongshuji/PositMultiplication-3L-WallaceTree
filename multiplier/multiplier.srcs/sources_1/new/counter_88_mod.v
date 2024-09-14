module multiplier_88_mod(
    input [7:0] a, b,
    output [15:0] product
    );
    
wire [16:0] partial_products;
wire [7:0] LL_products;
wire [7:0] HL_products;
wire [7:0] LH_products;
wire [7:0] HH_products;

/***   第一阶段   ***/
    multiplier_44 mul44_LL(
        .a(a[3:0]),
        .b(b[3:0]),
        .product(LL_products)
    );
    
    multiplier_44 mul44_HL(
        .a(a[7:4]),
        .b(b[3:0]),
        .product(HL_products)
    );

    multiplier_44 mul44_LH(
        .a(a[3:0]),
        .b(b[7:4]),
    .product(LH_products)
    );

    multiplier_44 mul44_HH(
        .a(a[7:4]),
        .b(b[7:4]),
    .product(HH_products)
    );
    
/***   第二阶段   ***/
//assign partial_products[15:12] = HH_products[7:4];
//assign partial_products[3:0] = LL_products[3:0];

    full_adder fa0(
        .in({HL_products[0], LL_products[4], LH_products[0]}),
        .out({partial_products[1], partial_products[0]})
    );
    
    full_adder fa1(
        .in({HL_products[1], LL_products[5], LH_products[1]}),
        .out({partial_products[2], partial_products[9]})
    );
    full_adder fa2(
        .in({HL_products[2], LL_products[6], LH_products[2]}),
        .out({partial_products[3], partial_products[10]})
    );
    full_adder fa3(
        .in({HL_products[3], LL_products[7], LH_products[3]}),
        .out({partial_products[4], partial_products[11]})
    );
    full_adder fa4(
        .in({HL_products[4], HH_products[0], LH_products[4]}),
        .out({partial_products[5], partial_products[12]})
    );
    full_adder fa5(
        .in({HL_products[5], HH_products[1], LH_products[5]}),
        .out({partial_products[6], partial_products[13]})
    );
    full_adder fa6(
        .in({HL_products[6], HH_products[2], LH_products[6]}),
        .out({partial_products[7], partial_products[14]})
    );
    full_adder fa7(
        .in({HL_products[7], HH_products[3], LH_products[7]}),
        .out({partial_products[8], partial_products[15]})
    );
assign partial_products[16] = HH_products[4];

/***   第三阶段   ***/
assign product[4:0] = {partial_products[0], LL_products[3:0]};
assign product[15:5] = {HH_products[7:5], partial_products[8:1]} + {{3{1'b0}}, partial_products[16:9]};
endmodule
