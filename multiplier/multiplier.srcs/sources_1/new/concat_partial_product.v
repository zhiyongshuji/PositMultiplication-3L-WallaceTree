
module concat_partial_product #(parameter N=32)(
    input [N-1:0] a, b, c,
    output [N-1:0] sum, cout
    );    
	genvar i;
	generate
		for (i = 0; i < N; i = i + 1) begin
          full_adder fa ({a[i], b[i], c[i]}, {cout[i], sum[i]});
		end
	endgenerate
endmodule
