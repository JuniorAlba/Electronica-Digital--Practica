`default_nettype none
`timescale 100 ns / 10 ns

module nombre_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
reg salida1;  // Cambiado a reg para poder asignar valores
reg salida2;  // Cambiado a reg para poder asignar valores

//-- Señales de salida del módulo
wire and1;  // Salida del módulo bajo prueba

reg [8:0] j ;
reg [8:0] i ;
//-- Instanciación del módulo bajo prueba
nombre UUT (
    .clk(clk),
    .reset(reset),
    .A(salida1),
    .B(salida2),
    .and1(and1)
);
integer n;

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("nombre_tb.vcd");
  $dumpvars(0, nombre_tb);
  reset = 1;
  #1;
  reset = 0;

  // Generar estímulos para las entradas
  i = 9'b001000100;
  j = 9'b011101110;

  for (n = 0; n < 9; n = n + 1) begin
    salida1 = j[n];
    salida2 = i[n];
    #1; // Esperar un ciclo de reloj
  end

  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule