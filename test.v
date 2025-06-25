module is_prime_TB ();
  reg [2:0] cba;
  wire prime;
  reg pass;

  // circuit DUT_IP(cba[2],cba[1],cba[0],prime);
  circuit2 DUT_IP (cba[2],cba[1],cba[0],prime);
  // circuit3 DUT_IP (cba[2],cba[1],cba[0],prime);
  //  is_prime_procedural DUT_IP(cba[2],cba[1],cba[0],prime);

  initial begin
    $dumpfile("is_prime.vcd");
    $dumpvars(0, is_prime_TB);
    cba  = 0;
    pass = 1;
    #10;
    pass = (prime == 1) ? 0 : pass;
    cba  = 1;
    #10;
    pass = (prime == 1) ? 0 : pass;
    cba  = 2;
    #10;
    pass = (prime == 0) ? 0 : pass;
    cba  = 3;
    #10;
    pass = (prime == 0) ? 0 : pass;
    cba  = 4;
    #10;
    pass = (prime == 1) ? 0 : pass;
    cba  = 5;
    #10;
    pass = (prime == 0) ? 0 : pass;
    cba  = 6;
    #10;
    pass = (prime == 1) ? 0 : pass;
    cba  = 7;
    #10;
    pass = (prime == 0) ? 0 : pass;
    if (pass) $display("\n\nNice job, you aced the Challenge! Pat yourself on the back!\n\n");
    else $display("\n\nThere's something wrong with your module. Don't give up!\n\n");
    $stop;
  end
endmodule
