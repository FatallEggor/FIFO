//////////////////////////////////////////////////////////////////////////////////
// Company:FEIncorporated 
// Engineer: FatallEggor
// 
/* Description: 
Just a test evironment for FIFO buffer.
*//////////////////////////////////////////////////////////////////////////////////


module test_fifo
(
	input wire clk,
	input wire reset,
	input wire sw0,
	input wire sw1,
	input wire sw2,
	input wire sw3,
	output wire led0,
	output wire led1,
	output wire led2,
	output wire led3,
	output wire led4,
	output wire led5,
	output wire led6,
	output wire led7,
	output wire db_sw0,
	output wire db_sw1,
	output reg sw0_tick,
	output reg sw1_tick
);



//wire db_sw0, db_sw1;
reg sw0_reg, sw0_next; //sw0_tick;
reg sw1_reg, sw1_next; //sw1_tick;

//debounce the control switchs
db_fsm db_fsm_ex1(.clk(clk), .sw(sw0), .db(db_sw0));
db_fsm db_fsm_ex2(.clk(clk), .sw(sw1), .db(db_sw1));

//register file for previous switch state
always @(posedge clk, posedge reset)
	begin
	if (reset)
		begin
		sw0_reg = 0;
		sw1_reg = 0;
		end
	else 
		begin
		sw0_reg = sw0_next;
		sw1_reg = sw1_next;
		end
	end


//to generate a 1 clock-long sw0_tick only when controll switch has a new state
always @(posedge clk)
	begin
	sw0_next = db_sw0;
	sw0_tick = 0;
	if (!sw0_reg & db_sw0)
		sw0_tick = 1;
	end

always @(posedge clk)
	begin
	sw1_next = db_sw1;
	sw1_tick = 0;
	if (!sw1_reg & db_sw1)
		sw1_tick = 1;
	end


fifo #(.B(6), .W(3)) fifo_ex(.clk(clk), .reset(reset), .rd(sw0_tick), .wr(sw1_tick), .w_data({2'b00, sw3, sw2, 2'b00}), .r_data({led5, led4, led3, led2, led1, led0}), .empty(led6), .full(led7));

endmodule
