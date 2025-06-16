module eje(
    input re,
    input clk,
    output q1,
    output q0
);

wire j1, k1, j0, k0;
assign j1 = ~re & q0;
assign j0 = ~re;
assign k1 = q0 | re;
assign k0 = 1'b1;
eje5 f1(
    .j(j1),
    .k(k1),
    .clk(clk),
    .q(q1)
);
eje5 f0(
    .j(j0),
    .k(k0),
    .clk(clk),
    .q(q0)

);

endmodule