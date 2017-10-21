module mux3_1_32 (in0,in1,in2,select,out);
input [31:0] in0,in1,in2;
input [1:0]select;
output [31:0] out;
reg [31:0] out;
always @ (in0 or in1 or select)
begin
//$monitor("Mux2_1: in0: $b ,in1: %b, select:%b,out:%b",in0,in1,select,out);
case(select)
	2'b00: out<= in0;
	2'b01: out<= in1;
	2'b10: out<= in2;
endcase
end
endmodule