module Main;
  reg  [31:0] In [31:0];
  reg clk;
  wire [31:0] PC;
  wire [31:0] InsMemOut;
  wire [3:0] ALUOp;
  wire  RegWrite, ALUSrc, MemRead, MemWrite,Branch, Jump,zero;
  wire [1:0] RegDst,MemToReg;
  wire [31:0]RD1;
  wire [31:0]RD2;
  wire [31:0] WD3;
  wire [4:0] A3;
  wire [31:0] SignImm;
  wire [31:0] SrcB;
  wire [3:0] ALUCtl;
  wire [31:0] ALUResult;
  wire [31:0] ReadData;
  wire [31:0] PCPlus4;
  wire [31:0] Shift2;
  wire [31:0] PCBranch;
  wire [27:0] ShiftForJump;
  wire PCSrc;
  wire [31:0] AddressOut;
  wire [31:0]PCPrime;
  wire [31:0] PCTwinPrime;
  wire JR;

  integer i = 0;
  


initial

begin  

clk=1'b0;
for(i=0;i<28;i = i+1)begin
     #50 clk=~clk;
end
end

InsMem H1(clk,PC,InsMemOut);
controlUnit H2(ALUOp, RegDst, RegWrite, ALUSrc, MemWrite,MemToReg, Branch, Jump,InsMemOut[31:26],InsMemOut[5:0]);
RegFile H3(InsMemOut[25:21], RD1 , InsMemOut[20:16] , RD2 , clk , RegWrite , A3 ,WD3 );
sign_extend H4(InsMemOut[15:0],SignImm);
mux2_1 H5(RD2,SignImm,ALUSrc,SrcB);
ALUControl H6(ALUOp, InsMemOut[5:0], ALUCtl,JR);
ALU H7(RD1,SrcB,InsMemOut[10:6],ALUCtl,ALUResult,zero);
memory H8(clk,MemWrite,ALUResult,RD2,ReadData);
mux3_1_32 H9(ALUResult,ReadData,PCPlus4,MemToReg,WD3);
mux3_1_5 H10(InsMemOut[20:16],InsMemOut[15:11],31,RegDst,A3);
adder H11(PCPlus4,1,PC);
leftShift2 H12(SignImm,Shift2);
adder H13(PCBranch,Shift2,PCPlus4);
leftShift2_26 H14(InsMemOut[25:0],ShiftForJump);
and H15(PCSrc,zero,Branch);
mux2_1 H16(PCPlus4,PCBranch,PCSrc,AddressOut);
mux2_1 H17(AddressOut,{PC[31:28],ShiftForJump},Jump,PCPrime);
mux2_1 H18(PCPrime,RD1,JR,PCTwinPrime);
pc H19(clk , PCTwinPrime , PC);


always @(posedge clk)

begin
  $monitor("-----------------------------------------------------------------------------------\n\ni=%d \tclk === %d \t pc ===%b \n\n ControlUnit: InsMemOut ==%b, RegDst==%b ,RegWrite==%b, ALUSrc==%b, MemRead==%b, MemWrite==%b, MemToReg==%b,Branch==%b, Jump==%b,zero==%b\n Register File: RD1: %d,SrcB:%d \n  ALUOp:%d ALUResult==%d\n JR:%d",i,clk,PC,InsMemOut,RegDst, RegWrite, ALUSrc, MemRead, MemWrite, MemToReg,Branch, Jump,zero,RD1,SrcB,ALUOp, ALUResult,JR);

  $dumpfile("Simulation.vcd");
  $dumpvars(1,RegDst, RegWrite, ALUSrc, MemRead, MemWrite, MemToReg,Branch, Jump,zero,ALUResult,clk,PC,WD3); 


end

  
  
endmodule
