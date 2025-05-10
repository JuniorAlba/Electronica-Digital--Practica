`default_nettype none
`timescale 100 ns / 10 ns

module eje4_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
reg a;
reg b;
reg c;
reg d;
reg e;
reg f;
wire expresion1;
wire expresion2;
wire expresion3;
//-- Señales de salida del módulo
//-- Instanciación del módulo bajo prueba
eje4 UUT (
    .clk(clk),
    .reset(reset),
    .A(a),
    .B(b),
    .C(c),
    .D(d),
    .E(e),
    .F(f),
    .expresion1(expresion1),
    .expresion2(expresion2),
    .expresion3(expresion3)
);
integer n;

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("eje4_tb.vcd");
  $dumpvars(0, eje4_tb);
  reset = 1;
  #1;
  reset = 0;

  // Generar estímulos para las entradas
  $display("ABCDEF | expresion1 | expresion2 | expresion3 \n");
  for (n = 0; n < 64; n = n + 1) begin
    {a, b, c, d, e, f} = n; // Asignar valores a las entradas, transforma n en binario y asigna a las entradas
    $display("%b%b%b%b%b%b | %b | %b | %b", a, b, c, d, e, f, expresion1, expresion2, expresion3);
    #1; // Esperar un ciclo de reloj
  end

  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule