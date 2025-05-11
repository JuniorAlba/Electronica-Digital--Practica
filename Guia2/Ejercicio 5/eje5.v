module eje5 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,
    output wire A1,   // Salida correcta
    output wire A2,   // Salida correcta
    output wire B1,
    output wire B2,
    output wire C1,
    output wire C2,
    output wire D1,
    output wire D2
);

    // Operación lógica para la salida
    assign A1 = A&((~A) | (A&B));
    assign A2 = A&B;
    assign B1 = (A&B) | (~A&B);
    assign B2 = B;
    assign C1 = A&B | A&(B|C) | B&(B|C);
    assign C2 = B | A&C;
    assign D1 = (A | ~A)&(A&B | A&B&C);
    assign D2 = A&B;


endmodule