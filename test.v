`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:43 10/20/2015
// Design Name:   MainExperiment2
// Module Name:   Y:/Documents/Xilinx/TestExp2.v
// Project Name:  Archlab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MainExperiment2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestExp2;

	// Inputs
	reg clk;
	reg [0:31] Ins;

reg [0:4] WR;
reg [0:31] WD;
reg RW;
	// Instantiate the Unit Under Test (UUT)
	MainExperiment2 uut (
		.clk(clk), 
		.Ins(Ins),.WR(WR),.WD(WD),.RW(RW)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Ins = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always
	begin
	# 100 begin clk = ~clk;
	         Ins = 32'b0000000000000000 01000 00000 000000; 
	         WR = 0;
	         WD = 0;
	         RW = 0;
	end
	# 100 begin clk = ~clk;
	         Ins = 32'b0000000000000000 00010 00001 000000; 
	         WR = 5'b00001;
	         WD = 32'd5;
	         RW = 1;
	end
	# 100 begin clk = ~clk;
	         Ins = 32'b0000000000000000 00100 00011 000000; 
	         WR = 0;
	         WD = 0;
	         RW = 0;
	end
	# 100 begin clk = ~clk;
	         Ins = 32'b0000000000000000 00110 00101 000000; 
	         WR = 0;
	         WD = 0;
	         RW = 0;
	end
	
	end
      
endmodule

