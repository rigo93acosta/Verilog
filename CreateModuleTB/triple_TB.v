module triple_TB ();

    reg [3:0] a;
    wire [5:0] result;

    // Instantiation of the triple module
    triple uut (
        .a(a),
        .result(result)
    );

    initial begin
        //Add gtkwave
        $dumpfile("triple_TB.vcd");
        $dumpvars(0, triple_TB);
        
        $monitor("Input a = %d", a);
        // Test cases
        a = 4'd0; #10;
        $display("Result = %d", result);
        a = 4'd1; #10;
        $display("Result = %d", result);
        a = 4'd3; #10;
        $display("Result = %d", result);
        a = 4'd5; #10;
        $display("Result = %d", result);
        a = 4'd10; #10;
        $display("Result = %d", result);
        a = 4'd10; #15;
        
        $stop; // Stop the simulation
    end
    
endmodule