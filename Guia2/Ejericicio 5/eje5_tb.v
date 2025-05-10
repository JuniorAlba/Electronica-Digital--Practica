`default_nettype none
`timescale 100 ns / 10 ns

module eje5_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 1000; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk ;
reg reset;
reg a;
reg b;
reg c;
//-- Señales de salida del módulo
//-- Instanciación del módulo bajo prueba
eje5 UUT (
    .clk(clk),
    .reset(reset),
    .A(a),
    .B(b),
    .C(c)
);
integer n;

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  clk= 0;
  $dumpfile("eje5_tb.vcd");
  $dumpvars(0, eje5_tb);
  reset = 1;
  #1;
  reset = 0;

  // Generar estímulos para las entradas
  for (n = 0; n < 8; n = n + 1) begin
    if(n<4) begin
      {a, b} = n; // Asignar valores a las entradas, transforma n en binario y asigna a las entradas
    end
    if(n<8)begin
      {a, b, c} = n; // Asignar valores a las entradas, transforma n en binario y asigna a las entradas
    end
    #1;
  end
  a=0;
  b=0;
  c=0;
  // Finalizar simulación
  #(DURATION) $strobe("Fin de la simulación");

  #2
  $finish;
end

endmodule