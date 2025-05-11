`default_nettype none
`timescale 100 ns / 10 ns

module eje7_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
reg A;  // Cambiado a reg para poder asignar valores
reg B;  // Cambiado a reg para poder asignar valores
reg C;
reg D;

wire y;  // Salida correcta
wire y_optimizada; // Salida correcta

wire z;
wire z_optimizada;

wire F2;
wire F2_optimizada;

//-- Instanciación del módulo bajo prueba
eje7 UUT (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .C(C),
    .D(D)
);
integer n;

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("eje7_tb.vcd");
  $dumpvars(0, eje7_tb);
  reset = 1;
  #1;
  reset = 0;
  for (n = 0; n < 16; n = n + 1) begin
    {A,B,C,D}=n;
    #1; // Esperar un ciclo de reloj
  end


  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule