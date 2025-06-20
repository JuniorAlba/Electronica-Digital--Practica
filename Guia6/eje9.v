module eje9(
    input w,
    input clk,
    output q1,
    output q0,
    output z_salida
);
wire d1,d0;
assign d0 = (w&~q0) | (w&q1) | q1&~q0;
assign d1 = w&q0, q1&~q0;

eje5 ff1(
    .D(d1),
    .Q(q1),
    .Clk(clk)
);
eje5 ff2(
    .D(d0),
    .Q(q0),
    .Clk(clk)
);
assign z_salida= q0&q1;


endmodule