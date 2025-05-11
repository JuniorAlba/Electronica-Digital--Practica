module es_par (
  input  [4:0] n,    // Entrada de 5 bits: puede representar 0 a 31
  output reg par  // Salida: 1 si es primo, 0 si no
);
  always @(*) begin
    // Por defecto no es primo
    if (n % 2 ==0)
        par = 1;
    else
        par = 0;
  end
endmodule