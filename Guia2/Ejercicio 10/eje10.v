module eje10 (
    input wire clk,
    input wire reset,
    input wire A,  // Cambiado a entrada
    input wire B,  // Cambiado a entrada
    input wire C,
    input wire D,
    input wire E,
    output wire P,
    output wire T,
    output wire Df


);
    assign Dpar= ~E;
    assign T = ~A&~B&~C&~D&~E | ~A&B&C&~D&~E | A&B&~C&~D&~E | ~A&~B&~C&D&E  |  ~A&B&C&D&E| A&B&~C&D& E| A&B&C&D&~E | ~A&~B&C&D&~E  | A&~B&~C&D&~E | A&~B&C&~D&E     | ~A&B&~C&~D&E;
    /*ssign Df = A&B&~C&E | A&B&C&E | A&~B&~C&E | ~A&~B&~C&D | A&~B&D&E | ~A&C&~D&E | ~A&B&~C&D&E;*/
    assign P = ~A&B&~C&D&E | ~A&C&~D&E  | ~A&~B&C&E | ~A&~B&~C&D | A&B&C&E | A&~B&D&E | A&~B&~C&E;

    // Operación lógica para la salida




endmodule