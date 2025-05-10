module eje2 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,  // Cambiado a entrada
    output wire nor1    // Salida correcta
);

    // Operación lógica para la salida
    assign nor1 = ~(A | B | C);

endmodule