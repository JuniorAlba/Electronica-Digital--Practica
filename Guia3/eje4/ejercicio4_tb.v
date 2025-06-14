`default_nettype none
`timescale 100 ns / 10 ns

module ejercicio4_tb();

//-- Parámetro para definir cuánto dura la simulación
parameter DURATION = 100; // Cambiá esto según lo que necesites

//-- Señales de entrada del módulo
reg clk = 0;
reg reset;
output reg [3:0]bin_nat_tb;
input wire [3:0]BCD_tb;
input wire [3:0]Gray_tb;
input wire [6:0]hamming_code_tb;
//-- Instanciación del módulo bajo prueba
ejercicio4a UUT (
    .clk(clk),
    .reset(reset),
    .bin_nat(bin_nat_tb),
    .BCD(BCD_tb)
);

ejercicio4b UUT2 (
    .clk(clk),
    .reset(reset),
    .bin_nat(bin_nat_tb),
    .Gray(Gray_tb)
);
ejercicio4c UUT3 (
    .clk(clk),
    .reset(reset),
    .bin_nat(bin_nat_tb),
    .hamming_code(hamming_code_tb)
);

integer i;
//-- Bloque inicial: estímulos y configuración
initial begin
  // Archivo para almacenar la traza
  $dumpfile("ejercicio4_tb.vcd");
  $dumpvars(0, ejercicio4_tb);
  reset = 1;
  #1;
  reset = 0;
  for( i = 0; i < 16; i = i + 1) begin
    #1;
    bin_nat_tb = i[3:0];
  end

  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  $finish;
end

endmodule