module multiplier_88(
    input [7:0] a, b,
    output [15:0] product
    );

wire [63:0] partial_products;
wire [40:0] partial_products_2;
    
genvar i, j;
// 生成部分乘积
generate
    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            assign partial_products[8*i + j] = a[i] & b[j];
        end
    end
endgenerate    
    
    counter_233 cnt_233(
        .inputs({partial_products[54], partial_products[47], partial_products[53], partial_products[46], partial_products[39]}),
        .outputs({partial_products_2[13], partial_products_2[25], partial_products_2[33]})
    );
    
    counter_233 cnt_233_2(
        .inputs({partial_products[3], partial_products[10], partial_products[2], partial_products[9], partial_products[16]}),
        .outputs({partial_products_2[4], partial_products_2[3], partial_products_2[2]})
    );
    
    counter_63 cnt_63(
        .inputs({partial_products[58], partial_products[51], partial_products[44], partial_products[37], partial_products[30], partial_products[23]}),
        .outputs({partial_products_2[11], partial_products_2[23], partial_products_2[31]})
    ); 
    
    counter_63 cnt_63_2(
        .inputs({partial_products[50], partial_products[43], partial_products[36], partial_products[29], partial_products[22], partial_products[15]}),
        .outputs({partial_products_2[10], partial_products_2[22], partial_products_2[30]})
    ); 

    counter_63 cnt_63_3(
        .inputs({partial_products[7], partial_products[14], partial_products[21], partial_products[28], partial_products[35], partial_products[42]}),
        .outputs({partial_products_2[9], partial_products_2[21], partial_products_2[29]})
    );
    
    counter_63 cnt_63_4(
        .inputs({partial_products[6], partial_products[13], partial_products[20], partial_products[27], partial_products[34], partial_products[41]}),
        .outputs({partial_products_2[8], partial_products_2[20], partial_products_2[28]})
    );        
    
    counter_63 cnt_63_5(
        .inputs({partial_products[5], partial_products[12], partial_products[19], partial_products[26], partial_products[33], partial_products[40]}),
        .outputs({partial_products_2[7], partial_products_2[19], partial_products_2[18]})
    );
    
    counter_53 cnt_53(
        .inputs({partial_products[59], partial_products[52], partial_products[45], partial_products[38], partial_products[31]}),
        .outputs({partial_products_2[12], partial_products_2[24], partial_products_2[32]})
    );
    
    counter_53 cnt_53_2(
        .inputs({partial_products[4], partial_products[11], partial_products[18], partial_products[25], partial_products[32]}),
        .outputs({partial_products_2[6], partial_products_2[5], partial_products_2[17]})
    );
assign {partial_products_2[36], partial_products_2[27], partial_products_2[16], partial_products_2[15], partial_products_2[1], partial_products_2[0]}=
        {partial_products[48], partial_products[24], partial_products[17], partial_products[8], partial_products[1], partial_products[0]};  

assign {partial_products_2[37], partial_products_2[40], partial_products_2[38], partial_products_2[39], partial_products_2[34], partial_products_2[35]}=
        {partial_products[49], partial_products[56], partial_products[57], partial_products[60], partial_products[61], partial_products[62]};    

assign {partial_products_2[14], partial_products_2[26]} = {partial_products[63], partial_products[55]};

/***   第二部分   ***/
wire [30:0] partial_products_3;

      full_adder fa(
        .in({partial_products_2[13], partial_products_2[26], partial_products_2[35]}),
        .out({partial_products_3[14], partial_products_3[25]}) 
      );
      
      full_adder fa1(
        .in({partial_products_2[12], partial_products_2[25], partial_products_2[34]}),
        .out({partial_products_3[13], partial_products_3[24]}) 
      );
      
      full_adder fa2(
        .in({partial_products_2[11], partial_products_2[24], partial_products_2[33]}),
        .out({partial_products_3[12], partial_products_3[23]}) 
      );
      
      full_adder fa3(
        .in({partial_products_2[10], partial_products_2[23], partial_products_2[32]}),
        .out({partial_products_3[11], partial_products_3[22]}) 
      );

      full_adder fa4(
        .in({partial_products_2[9], partial_products_2[22], partial_products_2[31]}),
        .out({partial_products_3[10], partial_products_3[29]}) 
      );
      
      full_adder fa5(
        .in({partial_products_2[8], partial_products_2[21], partial_products_2[30]}),
        .out({partial_products_3[21], partial_products_3[20]}) 
      );
      
      full_adder fa6(
        .in({partial_products_2[6], partial_products_2[19], partial_products_2[28]}),
        .out({partial_products_3[7], partial_products_3[6]}) 
      );

      full_adder fa7(
        .in({partial_products_2[3], partial_products_2[16], partial_products_2[27]}),
        .out({partial_products_3[4], partial_products_3[3]}) 
      );
      
      counter_53 cnt_53_3(
        .inputs({partial_products_2[7], partial_products_2[20], partial_products_2[29],partial_products_2[37], partial_products_2[40]}),
        .outputs({partial_products_3[9], partial_products_3[8], partial_products_3[19]})
      );    
      
//assign product = partial_products_3[14:0] + {partial_products_3[26:16],{2{1'b0}},partial_products_3[15],{1{1'b0}}} 
//                + {{3{1'b0}},partial_products_3[30],{1{1'b0}},partial_products_3[29:28],{3{1'b0}},partial_products_3[27],{4{1'b0}}};
assign {partial_products_3[26],partial_products_3[30],partial_products_3[28],partial_products_3[18],partial_products_3[17],partial_products_3[5],partial_products_3[16],partial_products_3[27],partial_products_3[2:0],partial_products_3[15]} = 
       {partial_products_2[14],partial_products_2[39],partial_products_2[38],partial_products_2[36],partial_products_2[18],partial_products_2[5],partial_products_2[4],partial_products_2[17],partial_products_2[2:0],partial_products_2[15]};


/***   第三阶段   ***/
wire [31:0] partial_products_4; 
assign {partial_products_4[31], partial_products_4[16], partial_products_4[19:18], partial_products_4[4]} = {5{1'b0}};
assign {partial_products_4[3:0], partial_products_4[17]} = {partial_products_3[3:0], partial_products_3[15]};
      full_adder fa8(
        .in({partial_products_3[11], partial_products_3[23], partial_products_3[30]}),
        .out({partial_products_4[12], partial_products_4[27]}) 
      );
      
      full_adder fa9(
        .in({partial_products_3[9], partial_products_3[21], partial_products_3[29]}),
        .out({partial_products_4[10], partial_products_4[25]}) 
      );
      
      full_adder fa10(
        .in({partial_products_3[8], partial_products_3[20], partial_products_3[28]}),
        .out({partial_products_4[9], partial_products_4[24]}) 
      );
      
      full_adder fa11(
        .in({partial_products_3[4], partial_products_3[16], partial_products_3[27]}),
        .out({partial_products_4[5], partial_products_4[20]}) 
      );
      
      
      half_adder ha(
        .in({partial_products_3[14], partial_products_3[26]}),
        .out({partial_products_4[15], partial_products_4[30]})
      );
      
      half_adder ha2(
        .in({partial_products_3[13], partial_products_3[25]}),
        .out({partial_products_4[14], partial_products_4[29]})
      );
      
      half_adder ha3(
        .in({partial_products_3[12], partial_products_3[24]}),
        .out({partial_products_4[13], partial_products_4[28]})
      );

      half_adder ha4(
        .in({partial_products_3[10], partial_products_3[22]}),
        .out({partial_products_4[11], partial_products_4[26]})
      );
      
      half_adder ha5(
        .in({partial_products_3[7], partial_products_3[19]}),
        .out({partial_products_4[8], partial_products_4[23]})
      );
      
      half_adder ha6(
        .in({partial_products_3[6], partial_products_3[18]}),
        .out({partial_products_4[7], partial_products_4[22]})
      );

      half_adder ha7(
        .in({partial_products_3[5], partial_products_3[17]}),
        .out({partial_products_4[6], partial_products_4[21]})
      );
      
assign product = partial_products_4[15:0] + partial_products_4[31:16];
//assign product = {16{1'b1}};
endmodule
