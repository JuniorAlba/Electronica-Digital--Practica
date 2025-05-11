`default_nettype none
`timescale 100 ns / 10 ns

module eje6_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
reg A;  // Cambiado a reg para poder asignar valores
reg B;  // Cambiado a reg para poder asignar valores
reg C;
reg D;
wire f;  // Salida correcta
wire fPOS; // Salida correcta
wire fSOP; // Salida correcta

wire g;  // Salida correcta
wire gPOS; // Salida correcta
wire gSOP; // Salida correcta

wire h;  // Salida correcta
wire hPOS; // Salida correcta
wire hSOP; // Salida correcta


//-- Instanciación del módulo bajo prueba
eje6 UUT (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .f(f),  // Salida correcta
    .fPOS(fPOS), // Salida correcta
    .fSOP(fSOP), // Salida correcta

    .g(g),  // Salida correcta
    .gPOS(gPOS), // Salida correcta
    .gSOP(gSOP), // Salida correcta

    .h(h),   // Salida correcta
    .hPOS(hPOS), // Salida correcta
    .hSOP(hSOP)  // Salida correcta
);
integer n;

//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("eje6_tb.vcd");
  $dumpvars(0, eje6_tb);
  reset = 1;
  #1;
  reset = 0;
  /* para mostrar las tablas de verdad (ya vi que coinciden los resultados)
  $display("ABC | f | fPOS | fSOP");
  for (n = 0; n < 8; n = n + 1) begin
    {A,B,C}=n;
    #1; // Esperar un ciclo de reloj
    $fflush();
    $display("%b%b%b | %b | %b | %b",A, B, C, f,fPOS,fSOP);
  end

  $display("ABCD | g | gPOS | gSOP    h:| h | hPOS | hSOP");
  for (n = 0; n < 16; n = n + 1) begin
    {A,B,C,D}=n;
    #1; // Esperar un ciclo de reloj
    $fflush();
    $display("%b%b%b%b | %b | %b | %b    h:| %b | %b | %b",A, B, C, D, f,fPOS,fSOP,g,gPOS,gSOP);
  end
  */
  for (n = 0; n < 16; n = n + 1) begin
    {A,B,C,D}=n;
    #1; // Esperar un ciclo de reloj
  end


  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule