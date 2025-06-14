module eje5(
    input [3:0] datos,
    input [2:0] op,
    output reg [3:0] datosMod

);

always @(*)begin
    case(op)
        3'b000: datosMod = datos;
        3'b001: datosMod = {1'b0,datos[3],datos[2],datos[1]};
        3'b010: datosMod = {datos[2],datos[1],datos[0],1'b0};
        3'b101: datosMod = {datos[3],datos[3],datos[2],datos[1]};
        3'b110: datosMod = {datos[2],datos[1],datos[0],1'b0};
        3'b011: datosMod = {datos[0],datos[3],datos[2],datos[1]};
        3'b111: datosMod = {datos[2],datos[1],datos[0],datos[3]};
        default: datosMod = 4'b0000;
        endcase
end
endmodule
