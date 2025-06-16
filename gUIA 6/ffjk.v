module eje5(
    input clk,
    input j,
    input k,
    output reg q
);
always @(posedge clk or posedge s or posedge r)begin
    if(r)
        q<=1'b0;
    else if(s)
        q<=1'b1;
    else begin
    case ({j,k})
        2'b10: q<=1;
        2'b01: q<=0;
        2'b00: q<=q;
        2'b11: q<=~q;
    endcase
    end
end
endmodule