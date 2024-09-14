module multiplier_1616(
    input [15:0] a, b,
    output [31:0] product
    );
    
wire [32:0] partial_products;
wire [15:0] LL_products;
wire [15:0] HL_products;
wire [15:0] LH_products;
wire [15:0] HH_products;

/***   第一阶段   ***/
    multiplier_88 mul88_LL(
        .a(a[7:0]),
        .b(b[7:0]),
        .product(LL_products)
    );
    
    multiplier_88 mul88_HL(
        .a(a[15:8]),
        .b(b[7:0]),
        .product(HL_products)
    );

    multiplier_88 mul88_LH(
        .a(a[7:0]),
        .b(b[15:8]),
    .product(LH_products)
    );

    multiplier_88 mul88_HH(
        .a(a[15:8]),
        .b(b[15:8]),
    .product(HH_products)
    );
    
/***   第二阶段   ***/
//assign partial_products[15:12] = HH_products[7:4];
//assign partial_products[3:0] = LL_products[3:0];

    full_adder fa0(
        .in({HL_products[0], LL_products[8], LH_products[0]}),
        .out({partial_products[1], partial_products[0]})
    );
    
    full_adder fa1(
        .in({HL_products[1], LL_products[9], LH_products[1]}),
        .out({partial_products[2], partial_products[17]})
    );
    full_adder fa2(
        .in({HL_products[2], LL_products[10], LH_products[2]}),
        .out({partial_products[3], partial_products[18]})
    );
    full_adder fa3(
        .in({HL_products[3], LL_products[11], LH_products[3]}),
        .out({partial_products[4], partial_products[19]})
    );
    full_adder fa4(
        .in({HL_products[4], LL_products[12], LH_products[4]}),
        .out({partial_products[5], partial_products[20]})
    );
    full_adder fa5(
        .in({HL_products[5], LL_products[13], LH_products[5]}),
        .out({partial_products[6], partial_products[21]})
    );
    full_adder fa6(
        .in({HL_products[6], LL_products[14], LH_products[6]}),
        .out({partial_products[7], partial_products[22]})
    );
    full_adder fa7(
        .in({HL_products[7], LL_products[15], LH_products[7]}),
        .out({partial_products[8], partial_products[23]})
    );
    full_adder fa8(
        .in({HL_products[8], HH_products[0], LH_products[8]}),
        .out({partial_products[9], partial_products[24]})
    );
    full_adder fa9(
        .in({HL_products[9], HH_products[1], LH_products[9]}),
        .out({partial_products[10], partial_products[25]})
    );
    full_adder fa10(
        .in({HL_products[10], HH_products[2], LH_products[10]}),
        .out({partial_products[11], partial_products[26]})
    );
    full_adder fa11(
        .in({HL_products[11], HH_products[3], LH_products[11]}),
        .out({partial_products[12], partial_products[27]})
    );
    full_adder fa12(
        .in({HL_products[12], HH_products[4], LH_products[12]}),
        .out({partial_products[13], partial_products[28]})
    );
    full_adder fa13(
        .in({HL_products[13], HH_products[5], LH_products[13]}),
        .out({partial_products[14], partial_products[29]})
    );
    full_adder fa14(
        .in({HL_products[14], HH_products[6], LH_products[14]}),
        .out({partial_products[15], partial_products[30]})
    );
    full_adder fa15(
        .in({HL_products[15], HH_products[7], LH_products[15]}),
        .out({partial_products[16], partial_products[31]})
    );
assign partial_products[32] = HH_products[8];

/***   第三阶段   ***/
assign product[8:0] = {partial_products[0], LL_products[7:0]};
assign product[31:9] = {HH_products[15:9], partial_products[16:1]} + {{7{1'b0}}, partial_products[32:17]};
endmodule
