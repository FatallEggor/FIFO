`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:54:28 04/28/2016
// Design Name:   test_fifo
// Module Name:   /home/egor/Projects/verilog/fifo/test/testbench.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test_fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

localparam T = 20;

	// Inputs
	reg clk;
	reg reset;
	reg sw0;
	reg sw1;
	reg sw2;
	reg sw3;


	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;
	wire db_sw0;
	wire db_sw1, sw0_tick, sw1_tick;

	// Instantiate the Unit Under Test (UUT)
	test_fifo uut (
		.clk(clk), 
		.reset(reset), 
		.sw0(sw0), 
		.sw1(sw1), 
		.sw2(sw2), 
		.sw3(sw3), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7),
		.db_sw0(db_sw0),
		.db_sw1(db_sw1),
		.sw0_tick(sw0_tick),
		.sw1_tick(sw1_tick)
	);
	
	always
	begin
	clk = 1'b1;
	#(T/2);
	clk = 1'b0;
	#(T/2);
	end	
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;


		// Wait 100 ns for global reset to finish
		#2000;
        
		// Add stimulus here
		reset = 0;
		sw0 = 0;
		sw1 = 1;
		sw2 = 0;
		sw3 = 0;


		// Wait 100 ns for global reset to finish
		#300;
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 1;
		sw3 = 1;


		// Wait 100 ns for global reset to finish
		#300;		
		reset = 0;
		sw0 = 0;
		sw1 = 1;
		sw2 = 1;
		sw3 = 0;


		// Wait 100 ns for global reset to finish
		#300;	
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;


		// Wait 100 ns for global reset to finish
		#300;		
		reset = 0;
		sw0 = 0;
		sw1 = 1;
		sw2 = 0;
		sw3 = 1;
		
		// Wait 100 ns for global reset to finish
		#300;		
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;
		
		// Wait 100 ns for global reset to finish
		#300;		
		reset = 0;
		sw0 = 0;
		sw1 = 1;
		sw2 = 1;
		sw3 = 1;

		// Wait 100 ns for global reset to finish
		#300;		
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;
		
		// Wait 100 ns for global reset to finish
		#300;		
		reset = 0;
		sw0 = 0;
		sw1 = 1;
		sw2 = 1;
		sw3 = 1;


		// Wait 100 ns for global reset to finish
		#300;	
		
		reset = 0;
		sw0 = 1;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
		
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
		
		reset = 0;
		sw0 = 1;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
		
		reset = 0;
		sw0 = 1;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
				
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
				
		reset = 0;
		sw0 = 1;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
				
		reset = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;

		// Wait 100 ns for global reset to finish
		#300;
	end
      
endmodule

