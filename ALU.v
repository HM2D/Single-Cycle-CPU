module ALU(a,b,shamt,alu_func,alu_out,zero);
input [31:0]a;
input [31:0]b;
input [4:0]shamt;
input [3:0]alu_func;
output reg [31:0]alu_out;
output zero;
always @(*)begin
	case (alu_func)
	4'b0000 : alu_out <= a+b;
	4'b0001 : alu_out <= a-b;
	4'b0010 : alu_out <= b>>shamt;
	4'b0011 : alu_out <= b<<shamt;
	4'b0100 : alu_out <= a*b;
	4'b0101 : alu_out <= a&b;
	4'b0110 : alu_out <= a^b;
	4'b0111 : alu_out <= a|b;
	4'b1000 : alu_out <= b<<<shamt;
	4'b1001 : alu_out <= b>>>shamt;
	4'b1010 : alu_out <= (a<b) ? 1:0;
	4'b1011 : alu_out <= a;
	4'b1100 : alu_out <= (a>b) ? 0:1;
	4'b1101 : alu_out <= (a<b) ? 0:1;
	4'b1110 : alu_out <= (a!=b) ? 0:1;
	4'b1111 : alu_out <= (a==0) ? 0:1;


	default : alu_out <= 1'bz;
	endcase
end
assign zero = alu_out == 0 ? 1 : 0;
endmodule
