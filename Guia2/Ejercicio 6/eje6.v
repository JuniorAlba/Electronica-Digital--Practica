module eje6 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,
    input wire D,
    output wire f,    // Salida correcta
    output wire g,  // Salida correcta
    output wire h,   // Salida correcta
    output wire fPOS, // Salida correcta
    output wire fSOP, // Salida correcta
    output wire gPOS, // Salida correcta
    output wire gSOP, // Salida correcta
    output wire hPOS, // Salida correcta
    output wire hSOP  // Salida correcta
);

    // Operación lógica para la salida
    assign f = (A | ~B&C)&C;
    assign fPOS = (A | B | C)&(A | ~B | ~C)&(~A | B | C)&(~A | ~B | C)&(A | ~B | C);
    assign fSOP = (~A & ~B & C) | (A & ~B & C) | (A & B & C);

    assign g = A&~B&C | ~A&~B | A&B&~C&D;
    assign gPOS = (A | ~B | C | D)&(A | ~B | C | ~D)&(A | ~B | ~C | D)&(A | ~B | ~C | ~D)&(~A | B | C | D)&(~A | B | C | ~D)&(~A | ~B | C | D)&(~A | ~B | ~C | D)&(~A | ~B | ~C | ~D);
    assign gSOP = (~A & ~B & ~C & ~D)|(~A & ~B & ~C & D)|(~A & ~B & C & ~D)|(~A & ~B & C & D)|(A & ~B & C & ~D)|(A & ~B & C & D)|(A & B & ~C & D);

    assign h = A&B |C&D&(A&~B | C&D);
    assign hPOS = (A | B | C | D)&(A | B | C | ~D)&(A | B | ~C | D)&(A | ~B | C | D)&(A | ~B | C | ~D)&(A | ~B | ~C | D)&(~A | B | C | D)&(~A | B | C | ~D)&(~A | B | ~C | D);
    assign hSOP = (~A & ~B & C & D) | (~A & B & C & D)| (A & ~B & C & D)| (A & B & ~C & ~D)| (A & B & ~C & D)| (A & B & C & ~D)| (A & B & C & D);

endmodule