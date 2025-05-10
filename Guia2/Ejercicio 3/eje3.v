module eje3 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,
    input wire D,
    output wire fa ,
    output wire fb ,
    output wire fc
);

    // Operación lógica para la salida
    assign fa = A | B | C | D;
    assign fb = A & B & C & D;
    assign fc = (D | C | ~A | ~B) & (D | ~C | B | ~A) & (~D | C | B | ~A) & (D | ~C | ~B | A) & (~D | C | ~B | A) & (~D | ~C | B | A);

endmodule