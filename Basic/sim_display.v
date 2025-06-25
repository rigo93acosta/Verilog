module display ();
    reg [7:0] a;
    reg [7:0] b;

    initial begin
        $monitor ("El valor de a es %d", a);
        a=10; b=1; #10;
        $display ("El valor de b es %d", b);
        a=20; b=2; #10;
        $display ("El valor de b es %d", b);
        a=30; b=3; #10;
        a=40; b=4; #10;
        $display ("El valor de b es %d", b);
        a=50; b=5; #10;
        $stop;
        $finish;
    end
endmodule