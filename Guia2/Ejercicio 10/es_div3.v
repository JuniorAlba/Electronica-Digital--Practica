module es_div3 (
  input  [4:0] n,    // Entrada de 5 bits: puede representar 0 a 31
  output reg div3  // Salida: 1 si es primo, 0 si no
);
  always @(*) begin
    // Por defecto no es primo
    if (n % 3 ==0)
        div3 = 1;
    else
        div3 = 0;
  end
endmodule