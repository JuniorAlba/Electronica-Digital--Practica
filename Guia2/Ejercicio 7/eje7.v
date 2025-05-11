module eje7 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,
    input wire D,
    output wire F2,
    output wire F2_optimizada,
    output wire y,  // Salida correcta
    output wire y_optimizada, // Salida correcta
    output wire z,
    output wire z_optimizada

);

    // Operación lógica para la salida
    assign F2 = ~A&~B&C | ~A&B&C | A&~B;
    assign F2_optimizada = ~A&C | A&~B;

    assign y = ~A&D | A&~C&D | A&~B&C | A&B&C&D;
    assign y_optimizada = D&(~A | A&(~C | B&C)) | A&~B&C;

    assign z = B&D | A&~C&D;
    assign z_optimizada = D&(B|A&~C);



endmodule