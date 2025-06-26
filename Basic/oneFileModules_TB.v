// Test bench for the operations module in oneFileModules.v
`timescale 1ns / 1ps

module operations_TB;

    // Inputs
    reg A;
    reg B;
    reg C;
    
    // Outputs
    wire S;
    
    // Instantiate the Unit Under Test (UUT)
    operations uut (
        .A(A),
        .B(B),
        .C(C),
        .S(S)
    );
    
    // Test procedure
    initial begin
        // Initialize inputs
        A = 0;
        B = 0;
        C = 0;
        
        // Display header
        $display("Time\tA\tB\tC\tS");
        $display("----\t-\t-\t-\t-");
        
        // Monitor changes
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, S);
        
        // Test all possible input combinations
        #10 A = 0; B = 0; C = 0;  // Expected S = 0 (since A=0, ~A=1, but B=0)
        #10 A = 0; B = 0; C = 1;  // Expected S = 0 (since B=0)
        #10 A = 0; B = 1; C = 0;  // Expected S = 0 (since C=0)
        #10 A = 0; B = 1; C = 1;  // Expected S = 1 (since ~A=1, B=1, C=1)
        #10 A = 1; B = 0; C = 0;  // Expected S = 0 (since ~A=0)
        #10 A = 1; B = 0; C = 1;  // Expected S = 0 (since ~A=0)
        #10 A = 1; B = 1; C = 0;  // Expected S = 0 (since ~A=0)
        #10 A = 1; B = 1; C = 1;  // Expected S = 0 (since ~A=0)
        
        // Additional test with delays to verify behavior
        #10 $display("\nAdditional verification tests:");
        #10 A = 0; B = 1; C = 1;  // This should produce S = 1
        #5  $display("Expected: S=1, Actual: S=%b", S);
        
        #10 A = 1; B = 1; C = 1;  // This should produce S = 0
        #5  $display("Expected: S=0, Actual: S=%b", S);
        
        #10 $display("\nTest completed!");
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("oneFileModules_TB.vcd");
        $dumpvars(0, operations_TB);
    end

endmodule


