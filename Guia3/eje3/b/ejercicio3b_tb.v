`default_nettype none
`timescale 100 ns / 10 ns

module ejercicio3b_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;

input wire [9:0] salida_tb;
reg [3:0] entrada_tb;
//-- Instanciación del módulo bajo prueba
ejercicio3b UUT (
    .clk(clk),
    .reset(reset),
    .entrada(entrada_tb),
    .salida(salida_tb)
);

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("ejercicio3b_tb.vcd");
  $dumpvars(0, ejercicio3b_tb);
  reset = 1;
  #1;
  reset = 0;
  entrada_tb = 4'b0000; // Valor inicial de entrada
  #1
  entrada_tb = 4'b0001; // Cambiar entrada a 1
  #1
  entrada_tb = 4'b0010; // Cambiar entrada a 2
  #1
  entrada_tb = 4'b0011; // Cambiar entrada a 3
  #1
  entrada_tb = 4'b0100; // Cambiar entrada a 4
  #1
  entrada_tb = 4'b0101; // Cambiar entrada a 5
  #1
  entrada_tb = 4'b0110; // Cambiar entrada a 6
  #1
  entrada_tb = 4'b0111; // Cambiar entrada a 7
  #1
  entrada_tb = 4'b1000; // Cambiar entrada a 8
  #1
  entrada_tb = 4'b1001; // Cambiar entrada a 9
  #1
  entrada_tb = 4'b1110; // Cambiar entrada a 15
  #1
  entrada_tb = 4'b1111; // Cambiar entrada a 15 (valor por defecto)
  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule