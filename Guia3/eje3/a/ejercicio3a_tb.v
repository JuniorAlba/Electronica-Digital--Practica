`default_nettype none
`timescale 100 ns / 10 ns

module ejercicio3a_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;

reg [9:0] i ;
input wire [9:0] salida_tb;
//-- Instanciación del módulo bajo prueba
ejercicio3a UUT (
    .clk(clk),
    .reset(reset),
    .dec(i),
    .salida(salida_tb)
);

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("ejercicio3a_tb.vcd");
  $dumpvars(0, ejercicio3a_tb);
  reset = 1;
  #1;
  reset = 0;
  i = 10'b0000000000; // Inicializar entrada
    #1;
  i = 10'b0000000001; // Iniciar con el primer valor
    #1;
  i = 10'b0000000010;
    #1;
  i = 10'b0000000100;
    #1;
  i = 10'b0000001000;
    #1;
  i = 10'b0000010000;
    #1;
  i = 10'b0000100000;
    #1;
  i = 10'b0001000000;
    #1;
  i = 10'b0010000000;
    #1;
  i = 10'b0100000000;
    #1;
  i = 10'b1000000000;
    #1;
  i = 10'b0111111111;
    #1;
  i = 10'b1111111111;
  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule