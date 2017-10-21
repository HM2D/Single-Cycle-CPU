module ALUControl(ALUOp, FuncCode, ALUCtl,JR);
input [3:0] ALUOp;
input [5:0] FuncCode;
output reg JR;
output reg [3:0] ALUCtl;
always @(ALUOp, FuncCode) begin
    if ( ALUOp == 2 )
       begin
        if(FuncCode==6'b000001)
        JR =1;
        else JR=0;

        case (FuncCode)
            32: ALUCtl<=0; // add
            34: ALUCtl<=1; //subtract
            56: ALUCtl<=5; // and
            57: ALUCtl<=7; //OR
            58: ALUCtl<=6; //XOR
            37: ALUCtl<=4; //mul
            7:  ALUCtl<=3; //Shift Left
            6:  ALUCtl<=2; //Shift Right
            52: ALUCtl<=8; //Shift Left Arithmathic
            54: ALUCtl<=9; //Shift Right Arithmatich
            51: ALUCtl<=10; //Set Less Than
            3: ALUCtl<=11; //MOV
            1: ALUCtl<=20; //JR
           // default: ALUCtl<=10; // should not happen
        endcase
       end
    else
        case (ALUOp)
            0:  ALUCtl<=0; //ADD
            1: ALUCtl<=1; //SUB
            3: ALUCtl<=5; //AND
            4: ALUCtl<=4; //MUL
            5: ALUCtl<=7; //OR
            6: ALUCtl<=6; //XOR
            7: ALUCtl<=10; //Set Less Than
            8: ALUCtl<=12; //reset Greater
            9: ALUCtl<=13; // reset Less
            10:ALUCtl<=14; //Not equal
            11:ALUCtl<=15; //Zero
            12:ALUCtl<=11; //JAL
            //default: ALUCtl<=10; // should not happen
        endcase
end
endmodule