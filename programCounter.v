module pc(  clock , pcin , pcout);
input clock;
input [31:0] pcin ;
output reg [31:0]  pcout;
initial 
begin pcout=0; end
always @(posedge clock)
begin
  //$monitor("PCin in ProgramCounter Module: %b, clock:", pcin, clock);
    pcout <= pcin ;
end
endmodule