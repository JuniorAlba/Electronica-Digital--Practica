`default_nettype none
`timescale 100 ns / 10 ns
module eje10_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
reg A, B, C, D, E;
reg [4:0] n_tb;
wire is_prime;
wire is_par;
wire is_div3;
integer n;

//-- Instanciar el módulo es_primo
es_primo prime_checker (
  .n(n_tb),
  .primo(is_prime)
);
es_par par_checker (
  .n(n_tb),
  .par(is_par)
);
es_div3 div3_checker (
  .n(n_tb),
  .div3(is_div3)
);

eje10 UUT (
  .clk(clk),
  .reset(reset),
  .A(A),
  .B(B),
  .C(C),
  .D(D),
  .E(E)
);


//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("eje10_tb.vcd");
  $dumpvars(0, eje10_tb);
  reset = 1;
  #1;
  reset = 0;
  for (n = 0; n < 32; n = n + 1) begin
    {A,B,C,D,E}=n;
    n_tb = n;
    #1; // Esperar un ciclo de reloj
    $fflush();
    $display("%d | %b%b%b%b%b | %b | %b | %b", n, A, B, C, D, E, is_prime,is_par,is_div3);
  end
  n_tb=32;
  A =0;
  B =0;
  C=0;
  D=0;
  E=0;


  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule