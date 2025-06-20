`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module mostrarFPGA_tb;
    parameter DURATION = 10;

    reg clk = 0;
    reg BTN1 = 0;
    reg BTN2 = 0;
    wire [3:0] leds;

    // Instanciamos el módulo top
    mostrarFPGA uut (
        .clk(clk),
        .BTN1(BTN1),
        .BTN2(BTN2),
        .leds(leds)
    );

    // Reloj de 10ns (100 MHz)
    always #5 clk = ~clk;

    // Simulación de pulsos de botón con rebote
    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, mostrarFPGA_tb);
        BTN1 = 1;
        BTN2 = 0;

        #50
        BTN1 = 1;
        BTN2 = 1;

        #50
        BTN1 = 0;
        BTN2 = 1;

        #50
        BTN1 = 0;
        BTN2 = 0;

        #50
        #(DURATION) $display("End of simulation");
        $finish;
    end

endmodule