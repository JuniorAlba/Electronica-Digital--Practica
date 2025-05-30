module ejercicio3c (
    input wire clk,
    input wire reset,
    output reg [2:0] salidas,  // Cambiado a entrada
    input wire [7:0] entradas
);

    // Operación lógica para la salida
    always @(*) begin
            casez (entradas)
                8'b1???????: salidas = 3'b111;
                8'b01??????: salidas = 3'b110; // 0
                8'b001?????: salidas = 3'b101; // 1
                8'b0001????: salidas = 3'b100; // 2
                8'b00001???: salidas = 3'b011; // 3
                8'b000001??: salidas = 3'b010; // 4
                8'b0000001?: salidas = 3'b001; // 5
                8'b00000001: salidas = 3'b000; // 6
                8'b00000000: salidas = 3'bxxx;
                default: salidas = 3'bxxx; // Valor por defecto
            endcase
    end

endmodule