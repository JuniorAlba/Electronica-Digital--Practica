module latch(
    input d,
    input enable,
    output reg q=0
);
always @(*)begin //logicamente solo deberia tener en cuenta d pero por algunas cuestiones de verilog es conveniente tener en cuenta enable tambien
    if(enable)
        q=d;
end

endmodule