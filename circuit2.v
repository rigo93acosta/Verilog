module circuit2(
  input c,
  input b,
  input a,
  output P
);
  
  assign P = (c & a) | (~c & b);

endmodule
