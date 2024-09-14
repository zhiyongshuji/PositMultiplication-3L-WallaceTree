// Testbench for the (6,3) Counter
`timescale 1ns / 1ps

module counter6_3_tb;

    reg [5:0] in;  // Input to the counter
    wire [2:0] out;  // Output from the counter

    // Instantiate the Unit Under Test (UUT)
    counter_63_2 uut (
        .inputs(in), 
        .sum(out)
    );

    // Test Procedure
    initial begin
        // Test case 1: Input = 000000
        in = 6'b000000;
        #10;
        if (out != 3'b000) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b000);

        // Test case 2: Input = 000001
        in = 6'b000001;
        #10;
        if (out != 3'b001) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b001);
        
        // Test case 3: Input = 000010
        in = 6'b000010;
        #10;
        if (out != 3'b001) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b001);
        
        // Test case 4: Input = 000100
        in = 6'b000100;
        #10;
        if (out != 3'b001) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b001);
        
        // Test case 5: Input = 001000
        in = 6'b001000;
        #10;
        if (out != 3'b001) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b001);

        // Test case 6: Input = 010000
        in = 6'b010000;
        #10;
        if (out != 3'b001) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b001);

        // Test case 7: Input = 100000
        in = 6'b100000;
        #10;
        if (out != 3'b001) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b001);

        // Test case 8: Input = 000011
        in = 6'b000011;
        #10;
        if (out != 3'b010) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b010);

        // Test case 8: Input = 000101
        in = 6'b000101;
        #10;
        if (out != 3'b010) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b010);

        // Test case 8: Input = 001001
        in = 6'b001001;
        #10;
        if (out != 3'b010) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b010);

        // Test case 8: Input = 000011
        in = 6'b010011;
        #10;
        if (out != 3'b011) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b011);

        // Test case 2: Input = 111111
        in = 6'b111111;
        #10;
        if (out != 3'b110) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b110);

        // Test case 3: Input = 101010
        in = 6'b101010;
        #10;
        if (out != 3'b011) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b011);

        // Add more test cases as needed...

        // Test case 8: Input = 111100
        in = 6'b111100;
        #10;
        if (out != 3'b100) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b100);
        
        // Test case 8: Input = 111010
        in = 6'b111010;
        #10;
        if (out != 3'b100) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b100);
        
        // Test case 8: Input = 110110
        in = 6'b110110;
        #10;
        if (out != 3'b100) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b100);
        
        // Test case 8: Input = 101110
        in = 6'b101110;
        #10;
        if (out != 3'b100) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b100);
        
        // Test case 8: Input = 111101
        in = 6'b111101;
        #10;
        if (out != 3'b101) $display("Error at input %b: Output %b, Expected %b", in, out, 3'b101);

        $display("Test completed. All cases checked.");
        $finish; // End simulation
    end

endmodule
