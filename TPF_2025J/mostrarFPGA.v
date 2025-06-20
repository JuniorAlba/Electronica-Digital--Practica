module mostrarFPGA(
    input CLK,
    input RST,
    input wire BTN1,
    input wire BTN2,
    output wire LED0,
    output wire LED1,
    output wire LED2,
    output wire LED3
);


antirrebote rebote(
    .clk(CLK),
    .boton1(BTN1),
    .boton2(BTN2),
    .boton1_clean(BTN1_clean),
    .boton2_clean(BTN2_clean)
);

wire [2:0]estado;
wire [1:0]salida;
entrada_salida gestion(
    .clk(CLK),
    .A(BTN1),
    .B(BTN2),
    .estado(estado),
    .salida(salida)
);

wire [2:0] num;
wire lleno;
contador2 cuenta(
    .clk(CLK),
    .reset(RST),
    .z1(salida[0]),
    .z2(salida[1]),
    .c(num),
    .lleno(lleno)
);
assign LED0 = num[0];
assign LED1 = num[1];
assign LED2 = num[2];
assign LED3 = lleno;



endmodule