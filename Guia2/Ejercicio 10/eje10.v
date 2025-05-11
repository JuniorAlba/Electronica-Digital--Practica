module eje10 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,
    input wire D,
    input wire E,
    output wire a1,
    output wire a2,
    output wire b1,
    output wire b2,
    output wire c1,
    output wire c2,
    output wire d1,
    output wire d2


);
    assign a1 = A&~B&C | ~A&B&~C | A&B&C;
    assign a2 = ~A&B&~C | A&C;
    assign b1 = (A | ~B)&(A | ~B | ~C)&(B | C | ~D)&(~A | B | ~C | D);
    assign b2 = ~B&~C&~D | A&C&D | ~A&~B&C | A&B;
    assign c1 = (A | B | C)&(~A | ~B | ~C)&(A | ~B | C);
    assign c2 =  A&~C | ~A&C | A&~B&C;
    assign d1 = ~A&B&~C&D&~E | ~A&~B&~C&D&E | A&~B&~C&D&E | A&B&~C&~D&~E | ~A&B&C&D&~E | ~A&B&C&~D&E | ~A&~B&~C&~D&~E | ~A&~B&C&D&E | A&B&~C&D&~E | A&B&~C&D&E;
    assign d2 = ~A&~B&~C&~D&~E | ~A&B&C&~D&E | A&B&~C&~E | A&B&~C&D | ~A&B&D&~E | ~B&~C&D&E | ~A&~B&D&E;
    // Operación lógica para la salida




endmodule