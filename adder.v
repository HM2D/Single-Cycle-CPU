module adder (S,A,B);
input [31:0] A,B;
output [31:0] S;
reg [31:0] S;
always @ (A or B)
S = A + B;
endmodule