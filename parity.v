module parity (
  input a,
  input b,
  input c,
  output p
);

  assign p = ~a&~b&c | ~a&b&~c | a&~b&~c | a&b&c;

endmodule
