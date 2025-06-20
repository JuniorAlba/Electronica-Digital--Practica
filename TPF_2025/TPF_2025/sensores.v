module sensores (
    input wire clk,
    input wire reset,
    input wire a,
    input wire b,
    output reg x0,
    output reg y0
);

localparam [2:0]
    S0 = 3'b000,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100,
    S5 = 3'b101,
    S6 = 3'b110;

reg [2:0] state, nextstate;

/*always@(posedge clk, posedge reset)
begin
    if(reset)
      begin
        state<=S0;
      end
    else
       begin
        state<=nextstate;
       end
end*/
reg x,y;
always @* begin
    nextstate = state;
    x = 0;
    y = 0;
    case(state)
        S0: case ({a, b})
                2'b00: begin nextstate = S0; x = 0; y = 0; end
                2'b10: begin nextstate = S1; x = 0; y = 0; end
                2'b01: begin nextstate = S2; x = 0; y = 0; end
                2'b11: begin nextstate = S0; x = 0; y = 0; end
            endcase
        S1: case ({a, b})
                2'b00: begin nextstate = S0; x = 0; y = 0; end
                2'b10: begin nextstate = S1; x = 0; y = 0; end
                2'b01: begin nextstate = S0; x = 0; y = 0; end
                2'b11: begin nextstate = S3; x = 0; y = 0; end // ejemplo: x=1 en esta transición
            endcase
        S2: case ({a, b})
                2'b00: begin nextstate = S0; x = 0; y = 0; end
                2'b10: begin nextstate = S1; x = 0; y = 0; end
                2'b01: begin nextstate = S2; x = 0; y = 0; end
                2'b11: begin nextstate = S4; x = 0; y = 0; end // ejemplo: y=1 en esta transición
            endcase
        S3: case ({a, b})
                2'b00: begin nextstate = S0; x = 0; y = 0; end
                2'b10: begin nextstate = S2; x = 0; y = 0; end
                2'b01: begin nextstate = S5; x = 0; y = 0; end
                2'b11: begin nextstate = S3; x = 0; y = 0; end
            endcase
        S4: case ({a, b})
                2'b00: begin nextstate = S0; x = 0; y = 0; end
                2'b10: begin nextstate = S1; x = 0; y = 0; end
                2'b01: begin nextstate = S6; x = 0; y = 0; end
                2'b11: begin nextstate = S4; x = 0; y = 0; end
            endcase
        S5: case ({a, b})
                2'b00: begin nextstate = S0; x = 1; y = 0; end
                2'b10: begin nextstate = S2; x = 0; y = 0; end
                2'b01: begin nextstate = S5; x = 0; y = 0; end
                2'b11: begin nextstate = S3; x = 0; y = 0; end
            endcase
        S6: case ({a, b})
                2'b00: begin nextstate = S0; x = 0; y = 1; end
                2'b10: begin nextstate = S1; x = 0; y = 0; end
                2'b01: begin nextstate = S6; x = 0; y = 0; end
                2'b11: begin nextstate = S4; x = 0; y = 0; end
            endcase
        default: begin nextstate = S0; x = 0; y = 0; end
    endcase
end
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        x0 <= 0;
        y0 <= 0;
    end else begin
        state <= nextstate;
        x0 <= x;
        y0 <= y;
    end
end
endmodule