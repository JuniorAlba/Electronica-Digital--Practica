module ejercicio3b (
    input wire clk,
    input wire reset,
    output reg [9:0] salida,  // Cambiado a entrada
    input wire [3:0] entrada
);

    // Operación lógica para la salida
    always @(*) begin
        case (entrada)
            4'b0000: salida = 10'b0000000001; // 1
            4'b0001: salida = 10'b0000000010; // 2
            4'b0010: salida = 10'b0000000100; // 4
            4'b0011: salida = 10'b0000001000; // 8
            4'b0100: salida = 10'b0000010000; // 16
            4'b0101: salida = 10'b0000100000; // 32
            4'b0110: salida = 10'b0001000000; // 64
            4'b0111: salida = 10'b0010000000; // 128
            4'b1000: salida = 10'b0100000000; // 256
            4'b1001: salida = 10'b1000000000; // 512
            4'b1111: salida = 10'b0000000000; // Valor por defecto
            default: salida = 10'bxxxxxxxxxx; // Valor indefinido
        endcase
    end

endmodule