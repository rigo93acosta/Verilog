module demux_1_to_4 (
    input I,
    input [1:0] sel,
    output reg [3:0] Y
);
    always @(sel, I) begin
        case (sel)
            2'b00: Y = {3'b0, I}; // Output to Y[0]
            2'b01: Y = {2'b0, I, 1'b0}; // Output to Y[1]
            2'b10: Y = {1'b0, I, 2'b0}; // Output to Y[2]
            2'b11: Y = {I, 3'b0}; // Output to Y[3]
        endcase
    end
endmodule