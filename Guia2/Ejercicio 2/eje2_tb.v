`default_nettype none
`timescale 100 ns / 10 ns

module eje2_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
reg val1;  // Cambiado a reg para poder asignar valores
reg val2;  // Cambiado a reg para poder asignar valores
reg val3;  // Cambiado a reg para poder asignar valores

//-- Señales de salida del módulo
wire nor1;  // Salida del módulo bajo prueba

reg [18:0] j ;
reg [18:0] i ;
reg [18:0] z ;

//-- Instanciación del módulo bajo prueba
eje2 UUT (
    .clk(clk),
    .reset(reset),
    .A(val1),
    .B(val2),
    .C(val3),
    .nor1(nor1)
);
integer n;

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("eje2_tb.vcd");
  $dumpvars(0, eje2_tb);
  reset = 1;
  #1;
  reset = 0;

  // Generar estímulos para las entradas
  i = 19'b0111111000011110000;
  j = 19'b0000111100001111000;
  z = 19'b0010010001000100010;

  for (n = 0; n < 19 ; n = n + 1) begin
    val1 = i[18-n];
    val2 = j[18-n];
    val3 = z[18-n];
    #1; // Esperar un ciclo de reloj
  end

  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule