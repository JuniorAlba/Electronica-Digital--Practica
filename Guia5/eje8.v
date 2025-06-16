module eje8(
    input d,
    input clk,
    input R_L,
    output wire q3,
    output wire q2,
    output wire q1,
    output wire q0
);


    wire d3,d2,d1,d0;
    assign d3 = R_L? d:q2;
    assign d2 = R_L? q3:q1;
    assign d1 = R_L? q2:q0;
    assign d0 = R_L? q1:d;
    eje2 ffd3(
        D.(d3),
        Q(q3),
        clk(clk)
    );
    eje2 ffd2(
        D.(d2),
        Q(q2),
        clk(clk)
    );
    eje2 ffd1(
        D.(d1),
        Q(q1),
        clk(clk)
    );
    eje2 ffd0(
        D.(d0),
        Q(q0),
        clk(clk)
    );

endmodule