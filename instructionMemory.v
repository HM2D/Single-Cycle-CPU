module InsMem( clock,RD_Address,out );
input clock;
input [31:0] RD_Address;
output reg[31:0] out ;
 reg [31:0] tmp;

reg [31:0]mem[13:0];
initial begin
  $readmemb("Instructions.txt",mem);
end
  always@(posedge clock)
  begin
   //$monitor("Insmemory PC: %b", RD_Address);
   out <=mem[RD_Address];
  end
endmodule