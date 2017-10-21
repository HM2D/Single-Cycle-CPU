module memory(clock,WE,A,WD,RD);
input clock;
input WE;
input [31:0] WD;
input [31:0] A;
output [31:0] RD;
reg [31:0] memory [255:0];
initial 
$readmemb("Memory.txt",memory);

assign RD= (WE) ?  z:memory[A] ;

always @(negedge clock)
begin 
 if (WE)begin
 memory[A]=WD;
 end
end
endmodule