module ALU_TB();

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg [1:0] op;

    // Outputs
    wire [7:0] result;

    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    // Test procedure
    initial begin
        // Initialize inputs
        a = 4'b0000;
        b = 4'b0000;
        op = 2'b00;

        // Display header
        $display("Time\tA\tB\tOp\tResult");
        $display("----\t-\t-\t--\t------");

        // Monitor changes
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, a, b, op, result);

        // Test 4 operation for all operations 
        #10 $display("Operacion 1: Addition");
        #10 a = 4'b0000; b = 4'b0000; op = 2'b00;  // Expected Result = 4'b0000 (0 + 0)
        #10 a = 4'b0001; b = 4'b0010; op = 2'b00;  // Expected Result = 4'b0011 (1 + 2)
        #10 a = 4'b0000; b = 4'b0001; op = 2'b00;  // Expected Result = 4'b0001 (0 + 1)
        #10 a = 4'b0011; b = 4'b0001; op = 2'b00;  // Expected Result = 4'b0100 (3 + 1)

        #10 $display("Operacion 2: Multiplication");
        #10 a = 4'b0001; b = 4'b0001; op = 2'b01;  // Expected Result = 4'b0001 (1 * 1)
        #10 a = 4'b0010; b = 4'b0001; op = 2'b01;  // Expected Result = 4'b0010 (2 * 1)
        #10 a = 4'b0001; b = 4'b0000; op = 2'b01;  // Expected Result = 4'b0000 (1 * 0)
        #10 a = 4'd14; b = 4'd10; op = 2'b01;      // Expected Result = 4'd140 (10 * 14)

        #10 $display("Operacion 3: Modulo");
        #10 a = 4'b0010; b = 4'b0001; op = 2'b10;  // Expected Result = 4'b0000 (2 % 1)
        #10 a = 4'b0100; b = 4'b0010; op = 2'b10;  // Expected Result = 4'b0000 (4 % 2)
        #10 a = 4'b0011; b = 4'b0010; op = 2'b10;  // Expected Result = 4'b0001 (3 % 2)
        #10 a = 4'b1100; b = 4'b0011; op = 2'b10;  // Expected Result = 4'b0000 (12 % 3)

        #10 $display("Operacion 4: AND");
        #10 a = 4'b0011; b = 4'b0011; op = 2'b11;  // Expected Result = 4'b0011 (3 & 3)
        #10 a = 4'b0100; b = 4'b0011; op = 2'b11;  // Expected Result = 4'b0000 (4 & 3)
        #10 a = 4'b0010; b = 4'b0001; op = 2'b11;  // Expected Result = 4'b0000 (2 & 1)
        #10 a = 4'b1100; b = 4'b1010; op = 2'b11;  // Expected Result = 4'b1000 (12 & 10)

        #10 $display("\nTest completed!");
        $finish;
    end

    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("ALU_TB.vcd");
        $dumpvars(0, ALU_TB);
    end
endmodule