module ALU(
	input [3:0] a,
	input [3:0] b,
	input [1:0] op,
	output reg [7:0] result
);

    always @(a, b, op) begin
        case (op)
            2'b00: result = a + b;          // Addition: 
            2'b01: result = a * b;          // Addition: 
            2'b10: result = a % b;          // Addition: 
            2'b11: result = a & b;          // Addition: 
        endcase       
    end
endmodule