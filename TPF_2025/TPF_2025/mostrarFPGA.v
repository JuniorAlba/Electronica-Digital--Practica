module mostrarFPGA(
    input wire clk,
    input wire BTN1,  // Sensor a
    input wire BTN2,  // Sensor b
    output wire [3:0] leds, // Salida a los LEDS (3 bits)
    input wire reset
);

    wire x;
    wire y;

    wire [2:0] c;
    // FSM que detecta si entra o sale un auto
    sensores fsm(
        .clk(clk),
        .reset(reset),
        .a(BTN1),
        .b(BTN2),
        .x0(x),
        .y0(y)
    );
    wire s;
    // Contador ascendente/descendente
    contador cuenta (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .s(s),
        .c(c)
    );

    // Módulo para mostrar en LEDS
    wire l0;
    wire l1;
    wire l2;
    wire l3;
    leds_out mostar_leds_out (
        .c(c),
        .s(s),
        .LED0(l0),
        .LED1(l1),
        .LED2(l2),
        .LED3(l3)
    );
    assign leds = {l3,l2,l1,l0};

endmodule

