`default_nettype none
`timescale 100 ns / 10 ns

module ejercicio3c_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;

input wire [2:0] salida_tb;
reg [7:0] entrada_tb;
//-- Instanciación del módulo bajo prueba
ejercicio3c UUT (
    .clk(clk),
    .reset(reset),
    .entradas(entrada_tb),
    .salidas(salida_tb)
);

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("ejercicio3c_tb.vcd");
  $dumpvars(0, ejercicio3c_tb);
  reset = 1;
  #1;
  reset = 0;
  entrada_tb = 8'b00000000; // Valor inicial de entrada
  #1;
  entrada_tb = 8'b00000001; // Cambiar entrada a 1
  #1;
  entrada_tb = 8'b00000010; // Cambiar entrada a 2
  #1;
  entrada_tb = 8'b00000100; // Cambiar entrada a 3
  #1;
  entrada_tb = 8'b00001000; // Cambiar entrada a 4
  #1;
  entrada_tb = 8'b00010000; // Cambiar entrada a 5
  #1;
  entrada_tb = 8'b00100000; // Cambiar entrada a 6
  #1;
  entrada_tb = 8'b01000000; // Cambiar entrada a 7
  #1;
  entrada_tb = 8'b10000000; // Cambiar entrada a 8
  #1;
  entrada_tb = 8'bxxxxxxxx; // Cambiar entrada a 0
  #1;
  entrada_tb = 8'b00011111; // Cambiar entrada a 0 nuevamente
  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule