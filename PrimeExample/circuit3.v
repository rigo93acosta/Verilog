module circuit3 (
    input c,
    input b,
    input a,
    output reg P
);
    
    wire [2:0] cba;
    assign cba = {c, b, a};
    always @(cba) begin
        if (cba == 3'd2 || cba == 3'd3 || cba==3'd5 || cba==3'd7) begin
            P = 1'b1; // prime
        end else begin
            P = 1'b0; // not prime
        end
    end
endmodule