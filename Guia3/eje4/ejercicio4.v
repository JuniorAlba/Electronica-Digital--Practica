module ejercicio4a (
    input wire clk,
    input wire reset,
    input wire [3:0]bin_nat,
    output reg [3:0]BCD
);
always @(*) begin
    if (bin_nat<=4'd9)
        BCD = bin_nat;
    else
        BCD = 4'bXXXX;
end

endmodule


module ejercicio4b (
    input wire clk,
    input wire reset,
    input wire [3:0]bin_nat,
    output reg [3:0]Gray
);

always @(*) begin
    if (bin_nat <= 4'd9) begin
        Gray[3] = bin_nat[3];
        Gray[2] = bin_nat[3] ^ bin_nat[2];
        Gray[1] = bin_nat[2] ^ bin_nat[1];
        Gray[0] = bin_nat[1] ^ bin_nat[0];
    end else begin
        Gray = 4'bXXXX; // Valor no válido
    end
end

endmodule

module ejercicio4c (
    input wire clk,
    input wire reset,
    input wire [3:0]bin_nat,
    output wire [6:0]hamming_code
);
    assign hamming_code[6] = bin_nat[3] ^ bin_nat[2] ^ bin_nat[0]; //p1 = d1 ^ d2 ^ d4
    assign hamming_code[5] = bin_nat[3] ^ bin_nat[1] ^ bin_nat[0]; // p2 = d1 ^ d3 ^ d4
    assign hamming_code[3] = bin_nat[2] ^ bin_nat[1] ^ bin_nat[0]; // p3 = d2 ^ d3 ^ d4
    assign hamming_code[0] = bin_nat[0]; // d1 = b0
    assign hamming_code[1] = bin_nat[1]; // d2 = b1
    assign hamming_code[2] = bin_nat[2]; // d3 = b2
    assign hamming_code[4] = bin_nat[3]; // d4 = b3
    //p1 p2 d1 p3 d2 d3 d4   =  hamming_code[6:0]

endmodule