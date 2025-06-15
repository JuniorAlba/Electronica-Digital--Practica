module eje7(
    input wire d0,
    input wire clk,
    output q3,
    output q2,
    output q1,
    output q0
);
integer d3,d2,d1;
eje2 ffd1(
    .D(d0),
    .Q(q3),
    .clk(clk)
);

eje2 ffd2(
    .D(q3),
    .Q(q2),
    .clk(clk)
);

eje2 ffd3(
    .D(q2),
    .Q(q1),
    .clk(clk)
);

eje2 ffd4(
    .D(q1),
    .Q(q0),
    .clk(clk)
);

endmodule