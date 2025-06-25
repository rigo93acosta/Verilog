module mux_2_to_1 (
    input [1:0] I,
    input sel,
    output reg Y
);
    always @(sel, I) begin
        if (sel == 0) begin
            Y = I[0];
        end else begin
            Y = I[1];
        end
    end
endmodule