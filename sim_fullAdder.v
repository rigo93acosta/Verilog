module sim_full_adder ();

    reg a,b,c;
    wire [1:0] s;

    fullAdder fa1(
        .A(a),
        .B(b),
        .Cin(c),
        .S(s[0]),
        .Cout(s[1])
    );

    initial begin
        $dumpfile("fullAdder.vcd");
        $dumpvars(0, sim_full_adder);
        {a, b, c} = 0; #5;
        {a, b, c} = 1; #5;
        {a, b, c} = 2; #5;
        {a, b, c} = 3; #5;
        {a, b, c} = 4; #5;
        {a, b, c} = 5; #5;
        {a, b, c} = 6; #5;
        {a, b, c} = 7; #5;
        $stop;
    end
    
endmodule