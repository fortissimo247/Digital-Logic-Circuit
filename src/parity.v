module parity (
  input a,
  input b,
  input c,
  output p
);

  assign p = a ^ b ^ c;

endmodule
