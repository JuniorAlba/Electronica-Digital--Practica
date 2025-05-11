module eje6 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    output wire and1     // Salida correcta
);

    // Operación lógica para la salida
    assign and1 = A & B;

endmodule