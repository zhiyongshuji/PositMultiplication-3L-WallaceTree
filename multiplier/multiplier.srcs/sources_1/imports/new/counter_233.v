module counter_233(
    input wire [4:0] inputs,  // 输入数组，inputs[4:3]为高位权，inputs[2:0]为低位权
    output reg [2:0] outputs  // 输出数组，outputs[2]为主进位，outputs[1]为次进位，outputs[0]为和位
);

wire [3:0] sum; // 加权和结果，4位足够表示从0到7的值

// 计算加权和
assign sum = 2 * (inputs[4] + inputs[3]) + (inputs[2] + inputs[1] + inputs[0]);

// 使用组合逻辑always块来设置输出
always @* begin
    // 根据加权和设置输出
    case (sum)
        0: outputs = 3'b000;
        1: outputs = 3'b001;
        2: outputs = 3'b010;
        3: outputs = 3'b011;
        4: outputs = 3'b100;
        5: outputs = 3'b101;
        6: outputs = 3'b110;
        7: outputs = 3'b111;
        default: outputs = 3'b000; // 默认输出为0，对于异常的sum值
    endcase
end

endmodule

