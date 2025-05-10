module eje4 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,
    input wire D,
    input wire E,
    input wire F,
    output wire expresion1,   // Salida correcta
    output wire expresion2,   // Salida correcta
    output wire expresion3   // Salida correcta
);

    // Operación lógica para la salida
    assign expresion1 = ~((A & ~B) | (~C & D) | (E & F));
    assign expresion2 = ~(~(A | B&~C) | (D&~(E | ~F)));
    assign expresion3 = ~(~(A&B) & (C&D | ~E&F) & (~(A&B) | ~(C&D)));

endmodule