module accmulator(in,load,clk,out);
  input [7:0]in;
  input load,clk;
  output reg[7:0] out;
  
  always@(posedge clk)
     if(load)
      out<=in;
      initial
      out=8'h00;
    endmodule
