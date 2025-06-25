module mux_demux_TB ();

    reg clk_1MHz, clk_4MHz;
    reg sel1;
    reg [1:0] sel2;
    wire mux_out;
    wire [3:0] demux_out;

    // Instantiate the mux_2_to_1 module
    mux_2_to_1 mux_inst (
        .I({clk_1MHz, clk_4MHz}),
        .sel(sel1),
        .Y(mux_out)
    );

    // Instantiate the demux_1_to_4 module
    demux_1_to_4 demux_inst (
        .I(mux_out),
        .sel(sel2),
        .Y(demux_out)
    );  

    // Clock generation
    always #500 clk_1MHz = ~clk_1MHz; // 1 MHz clock
    always #125 clk_4MHz = ~clk_4MHz; // 4 MHz clock

    initial begin
        // save to Gtkwave
        $dumpfile("mux_demux_TB.vcd");
        $dumpvars(0, mux_demux_TB);
        
        clk_1MHz=0;
        clk_4MHz=0;
        sel1=0;
        sel2=0;
        #10_000;
        sel2=1;
        #10_000;
        sel1=1;
        sel2=2;
        #10_000;
        sel2=3;
        #10_000;
        $stop;
    end    
endmodule