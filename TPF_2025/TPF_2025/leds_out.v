module leds_out(
    input wire [2:0]c,
    input wire s,
    output wire LED0,
    output wire LED1,
    output wire LED2,
    output wire LED3
);
assign LED0 = c[0];
assign LED1 = c[1];
assign LED2 = c[2];
assign LED3 = s;

endmodule