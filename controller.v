module controlUnit (ALUOp, RegDst, RegWrite, ALUSrc, MemWrite,MemToReg, Branch, Jump, Op,FuncCode);
   input  [5:0] Op,FuncCode;
   output [3:0] ALUOp;
   output  RegWrite, ALUSrc, MemWrite,Branch, Jump;
   output [1:0] RegDst,MemToReg;
   reg [3:0]  ALUOp;
   reg RegDst, RegWrite, ALUSrc, MemRead, MemWrite, MemToReg, Branch,Jump;

   always@(Op)
    begin
      case(Op)
         6'd0: begin //R-Type
            RegDst <= 2'b01;
         if(FuncCode==1) //JR
            RegWrite <= 1'b0;
            else RegWrite <= 1'b1;
            ALUSrc <= 1'b0;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0010;
          end
         6'b100011:begin //ADD Imm
            RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0000;
          end
          6'b001111:begin //AND Imm
            RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0011;
          end
          6'b110001:begin //SUB Imm
            RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0001;
            
            end

          6'b111000:begin //Mul Imm
            RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0100;
              
          end
         6'b001110:begin //OR Imm
            RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0101;
           
         end 
         6'b001100:begin //XOR Imm
           RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0110;
           
         end
         6'b001000:begin //Set Less Than
            RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b00;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0111;
           
         end
        6'b100000:begin //BEQ
         RegDst <= 2'b00;
            RegWrite <= 1'b0;
            ALUSrc <= 1'b0;
            MemWrite <= 1'bz;
            MemToReg <= 2'b00;
            Branch <= 1'b1;
            Jump <= 1'b0;
            ALUOp <= 4'b0001; 
        end
        6'b100010: begin //BRG
         RegDst <= 2'b00;
            RegWrite <= 1'b0;
            ALUSrc <= 1'b0;
            MemWrite <= 1'bz;
            MemToReg <= 2'b00;
            Branch <= 1'b1;
            Jump <= 1'b0;
            ALUOp <= 4'b1000; 
        end
        6'b100101:begin //BRL
            RegDst <= 2'b00;
            RegWrite <= 1'b0;
            ALUSrc <= 1'b0;
            MemWrite <= 1'bz;
            MemToReg <= 2'b00;
            Branch <= 1'b1;
            Jump <= 1'b0;
            ALUOp <= 4'b1001; 
          
        end
        6'b000111:begin //BNE
          
            RegDst <= 2'b00;
            RegWrite <= 1'b0;
            ALUSrc <= 1'b0;
            MemWrite <= 1'bz;
            MemToReg <= 2'b00;
            Branch <= 1'b1;
            Jump <= 1'b0;
            ALUOp <= 4'b1010; 
          
        end
        6'b000110:begin //BRZ
            RegDst <= 2'b00;
            RegWrite <= 1'b0;
            ALUSrc <= 1'b0;
            MemWrite <= 1'bz;
            MemToReg <= 2'b00;
            Branch <= 1'b1;
            Jump <= 1'b0;
            ALUOp <= 4'b1011; 
        

        end

        6'b110100:begin //JA
            RegDst <= 2'bzz;
            RegWrite <= 1'bz;
            ALUSrc <= 1'bz;
            MemWrite <= 1'bz;
            MemToReg <= 2'bzz;
            Branch <= 1'b0;
            Jump <= 1'b1;
            ALUOp <= 4'bzzzz;
          end
          6'b111110:begin //JAL
            RegDst <= 2'b10;
            RegWrite <= 1'b1;
            ALUSrc <= 1'bz;
            MemWrite <= 1'bz;
            MemToReg <= 2'b10;
            Branch <= 1'b0;
            Jump <= 1'b1;
            ALUOp <= 4'b1100;
          end

        6'b010001: begin //Load Word
            RegDst <= 2'b00;
            RegWrite <= 1'b1;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b0;
            MemToReg <= 2'b01;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0000;
          end
          6'b011001:begin //Save Word
            RegDst <= 2'b00;
            RegWrite <= 1'b0;
            ALUSrc <= 1'b1;
            MemWrite <= 1'b1;
            MemToReg <= 2'bzz;
            Branch <= 1'b0;
            Jump <= 1'b0;
            ALUOp <= 4'b0000;
        end  
        endcase
       end
         
      endmodule