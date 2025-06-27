module shift_left (
    input [7:0] Din,
    input PL,
    input clk,
    output reg [7:0] D
);
    always @(negedge clk, negedge PL) begin
        if (PL == 0)
            D <= Din;
        else begin
            D[0] <= 0;
            D[7:1] <= D[6:0];
        end
    end
endmodule