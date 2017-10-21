module mux2_1 (in0,in1,select,out);
input [31:0] in0,in1;
input select;
output [31:0] out;
reg [31:0] out;
always @ (in0 or in1 or select)
begin
//$monitor("Mux2_1: in0: $b ,in1: %b, select:%b,out:%b",in0,in1,select,out);
if (select) out=in1;
else out=in0;
end
endmodule