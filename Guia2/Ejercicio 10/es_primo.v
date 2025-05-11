module es_primo (
  input  [4:0] n,    // Entrada de 5 bits: puede representar 0 a 31
  output reg primo  // Salida: 1 si es primo, 0 si no
);
  integer i;
  always @(*) begin
    // Por defecto no es primo
    if (n < 2)
      primo = 0;
    else begin
      primo = 1; // Asumimos que es primo
      for (i = 2; i <= n / 2; i = i + 1) begin
        if (n % i == 0) begin
          primo = 0; // Tiene un divisor: no es primo
        end
      end
    end
  end
endmodule


