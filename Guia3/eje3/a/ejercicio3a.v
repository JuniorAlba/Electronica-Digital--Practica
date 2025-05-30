module ejercicio3a (
    input wire clk,
    input wire reset,
    input wire [9:0] dec,  // Cambiado a entrada
    output reg [3:0] salida
);

    // Operación lógica para la salida
    always @(*) begin
        case (dec)
            10'b0000000001: salida = 4'b0000;
            10'b0000000010: salida = 4'b0001;
            10'b0000000100: salida = 4'b0010;
            10'b0000001000: salida = 4'b0011;
            10'b0000010000: salida = 4'b0100;
            10'b0000100000: salida = 4'b0101;
            10'b0001000000: salida = 4'b0110;
            10'b0010000000: salida = 4'b0111;
            10'b0100000000: salida = 4'b1000;
            10'b1000000000: salida = 4'b1001;
            10'b0000000000: salida = 4'b1111; // Valor por defecto
            default: salida = 4'bxxxx;
        endcase
    end

endmodule