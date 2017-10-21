module control_unit(opcode,in_function,wb,memory,branch,exe,jump,alu_function);
    input [5:0] opcode;
	 input [5:0] in_function;
    output reg[1:0] wb;
    output reg[2:0] memory;
    output reg[1:0] branch;
    output reg[5:0] exe;
    output reg jump;
	 output reg [5:0]alu_function;
	 
always @(*)begin
	case (opcode)
	
	6'b000000:   	//Registertype
	begin
	exe[0]=0;
	exe[1]=0;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=0;
	jump=0;
	alu_function=in_function;
	//////////////////////////////////////////////////////
	if (in_function==6'b000100)begin
		alu_function=000100;
		exe[0]=1;
	end
	else if(in_function==6'b000111)begin
		alu_function=000111;
		exe[0]=1;
	end
	end
	6'b001000:     //addi
	begin
	exe[0]=0;
	exe[1]=1;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=0;
	alu_function=001000;
	end
	//////////////////////////////////////////////////
	6'b001100:    //andi
	begin
	exe[0]=0;
	exe[1]=1;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=0;
	alu_function=001100;
	end
	/////////////////////////////////////////
	6'b001101:    //ori
	begin
	exe[0]=0;
	exe[1]=1;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=0;
	alu_function=001101;
	end 
	/////////////////////////////////////////////////
	6'b001110:    //xori
	begin
	exe[0]=0;
	exe[1]=0;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=0;
	alu_function=001110;
	end
	////////////////////////////////////////
	6'b000100:   //beq
	begin
	exe[0]=0;   //sllv
	exe[1]=0;   //src
	exe[3:2]=1;    //opcode
	exe[4]=1'bz;     //reg_des
	exe[5]=0;    //jump
	memory[0]=0;   //memwrite
	memory[1]=0;   //memread
	memory[2]=1;  //branch
	wb[0]=1'bz;   //mem2reg
	wb[1]=0;        //regwrite       
	branch=0;    //type of branch
	end
	/////////////////////////////////////////////////////
	6'b000111:   //bgtz
	begin
	exe[0]=0;
	exe[1]=1'bz;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=1;
	end
   //////////////////////////////////////////////
	
	6'b000110:    //blez
	begin
	exe[0]=0;
	exe[1]=1'bz;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=2;
	end
	
	///////////////////////////////////////////
	6'b000101:    //bne
	begin
	exe[0]=0;
	exe[1]=0;
	exe[3:2]=2;
	exe[4]=1;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=3;
	end
	//////////////////////////////////////////////////////
	6'b000010:    //j
	begin
	exe[0]=1'bz;
	exe[1]=1'bz;
	exe[3:2]=1'bz;
	exe[4]=1'bz;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=0;              
	branch=0;
	jump=1;
	end
	///////////////////////////////////////////////////////
	6'b000011:    //jal
	begin
	exe[0]=1'bz;
	exe[1]=1'bz;
	exe[3:2]=1'bz;
	exe[4]=1'bz;
	exe[5]=1;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=0;
	end
	///////////////////////////////////////////////
	6'b001001:    //jalr
	begin
	exe[0]=1'bz;
	exe[1]=1'bz;
	exe[3:2]=2'bzz;
	exe[4]=1'bz;
	exe[5]=1;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=1;              
	branch=0;
	end
	/////////////////////////////////////////////////
	6'b001000:    //jr
	begin
	exe[0]=1'bz;
	exe[1]=1'bz;
	exe[3:2]=2'bz;
	exe[4]=1'bz;
	exe[5]=0;
	memory[0]=0;
	memory[1]=0;
	memory[2]=0;
	wb[0]=0;
	wb[1]=0;              
	branch=0;
	end
	/////////////////////////////////////////////////
	6'b100011:    //lw
	begin
	exe[0]=0;
	exe[1]=0;
	exe[3:2]=0;
	exe[4]=0;
	exe[5]=0;
	memory[0]=0;
	memory[1]=1;
	memory[2]=0;
	wb[0]=1;
	wb[1]=1;              
	branch=0;
	end
	/////////////////////////////////////////////////////
	6'b101011:    //sw
	begin
	exe[0]=0;
	exe[1]=0;
	exe[3:2]=0;
	exe[4]=1'bz;
	exe[5]=0;
	memory[0]=1;
	memory[1]=0;
	memory[2]=0;
	wb[0]=1'bz;
	wb[1]=0;              
	branch=0;
	end
	/////////////////////////////////////////////////
	endcase
end
endmodule





