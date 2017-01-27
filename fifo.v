module fifo
	#(
	parameter 
		B = 8,
		W = 4
	)
	(
	input wire clk, reset,
	input wire rd, wr,
	input wire [B-1 : 0] w_data,
	output wire empty, full,
	output wire [B-1 : 0] r_data
	);

	reg [B-1:0] array_reg [2**W-1:0]; // register array
	reg [W-1:0] w_ptr_reg, w_ptr_next, w_ptr_succ;
	reg [W-1:0] r_ptr_reg, r_ptr_next, r_ptr_succ;
	reg full_reg = 0, empty_reg = 0, full_next = 0, empty_next = 0;
	wire wr_en;

	//register file write operation
	always @(posedge clk)
		if (wr_en)
			array_reg[w_ptr_reg] <= w_data;
	// register file read operation
	assign r_data = array_reg[r_ptr_reg];
	//write enabled only when fifo isn't full
	assign wr_en = wr & ~full_reg;

	// registers for pointers
	always @(posedge clk, posedge reset)
		begin
		if (reset)
			begin
			w_ptr_reg <= 0;
			r_ptr_reg <= 0;
			full_reg <= 1'b0;
			empty_reg <= 1'b1;
			end
		else
			begin
			w_ptr_reg <= w_ptr_next;
			r_ptr_reg <= r_ptr_next;
			full_reg <= full_next;
			empty_reg <= empty_next;
			end
		end
	
	always @*
		begin
		//successive values
		w_ptr_succ = w_ptr_reg + 1;
		r_ptr_succ = r_ptr_reg + 1;
		//default : keep old values
		w_ptr_next = w_ptr_reg;
		r_ptr_next = r_ptr_reg;
		full_next = full_reg;
		empty_next = empty_reg;
		
		case ({wr, rd})
		//2'b00 : no op
		2'b01: //read
			begin
			if (~empty_reg)
				begin
				r_ptr_next = r_ptr_succ;
				full_next = 1'b0;
				if (r_ptr_succ == w_ptr_reg)
					empty_next = 1'b1;
				end
			end
		2'b10: //write
			begin
			if (~full_reg)
				begin
				w_ptr_next = w_ptr_succ;
				empty_next = 1'b0;
				if (w_ptr_succ == r_ptr_reg)
					full_next = 1'b1;
				end
			end
		2'b11: //read and write
			begin
			w_ptr_next = w_ptr_succ;
			r_ptr_next = r_ptr_succ;
			end
		endcase
	end

	assign full = full_reg;
	assign empty = empty_reg;

endmodule
