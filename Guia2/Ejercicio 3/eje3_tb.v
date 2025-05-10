`default_nettype none
`timescale 100 ns / 10 ns

module eje3_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
reg d;  // Cambiado a reg para poder asignar valores
reg c;  // Cambiado a reg para poder asignar valores
reg b;  // Cambiado a reg para poder asignar valores
reg a;  // Cambiado a reg para poder asignar valores


//-- Instanciación del módulo bajo prueba
eje3 UUT (
    .clk(clk),
    .reset(reset),
    .A(a),
    .B(b),
    .C(c),  // Asignar un valor fijo a C
    .D(d)  // Asignar un valor fijo a D
);
integer n;

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("eje3_tb.vcd");
  $dumpvars(0, eje3_tb);
  reset = 1;
  #1;
  reset = 0;

  // Generar estímulos para las entradas
  // Cambiar los valores de a, b, c y d en cada ciclo

  for (n = 0; n < 16; n = n + 1) begin
    d = n[3]; // Cambiado a n[3] para asignar el bit correspondiente
    c = n[2]; // Cambiado a n[2] para asignar el bit correspondiente
    b = n[1]; // Cambiado a n[1] para asignar el bit correspondiente
    a = n[0]; // Cambiado a n[0] para asignar el bit correspondiente
    #1; // Esperar un ciclo de reloj
  end

  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule