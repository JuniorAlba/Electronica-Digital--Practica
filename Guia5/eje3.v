module eje3(
    input T,
    input clk,
    output Q=0
);
always@(posedge clk) begin
    if(T)
        Q<=~Q;
    else
        Q<=Q;
end
endmodule