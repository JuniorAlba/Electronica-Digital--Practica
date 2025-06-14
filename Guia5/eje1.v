module eje1(
    input J,
    input K,
    input Clk,
    output reg Q=0
);
    always@(posedge Clk) begin
        case({J,K})
            2'b11: Q<= ~Q;
            2'b10: Q<= 1'b1;
            2'b01: Q<= 1'b0;
            2'b00: Q<= Q;
        endcase
    end
endmodule