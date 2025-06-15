
module eje6_flipflopD(
    input wire[3:0] d,
    output wire[3:0] q,
    input wire EI,
    input wire clk

);
    genvar i;
    generate
        for(i=0, i<4,i=i+1)begin
            eje2 ffd(
                .D(d[i]),
                .clk(clk),
                .q(q[i])
            );
        end
    endgenerate
    /*
    always@(posedge clk)begin
        q<=d;
    end
    always@(EI)begin
        if(EI)
            q<=d;
    end
    */
endmodule

module latch(
    input wire[3:0] d,
    output wire[3:0] q,
    input wire EI
);

genvar i;
generate
    for(i=0;i<4;i=i+1)begin
        latch l(

            .d(d[i]),
            .enable(enable),
            .q(q(i))
        );
    end
endgenerate
endmodule

/*

`include "../ej2/FF_D.v"

module R_4B_FFD(
    input wire [3:0] B,
    output reg [3:0] sQ,
    input wire sclk
)
    wire [3:0]ignore;
    generate
        for(integer i=0; i<4; i++)begin
            FF_D ffd(
                .D(B[i]),
                .clk(sclk),
                .Q(sQ[i]),
                .Qn(ignore[i])
            )
        end
    endgenerate
endmodule
*/