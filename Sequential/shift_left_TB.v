module shift_left_TB ();

    reg clk, PL;
    reg [7:0] PData;
    wire [7:0] SLData;

    always #5 clk = ~clk;
    shift_left DUT_sl (
        .Din(PData),
        .PL(PL),
        .clk(clk),
        .D(SLData)
    );

    initial begin
        // GTKWave dump setup
        $dumpfile("shift_left_TB.vcd");
        $dumpvars(0, shift_left_TB);
        
        PL = 1; #1; clk=0; PData = 8'b01100101; #1;
        PL = 0; #10; // Load data
        PL = 1; #100; // Start shifting

        $stop;    
    end
    
endmodule