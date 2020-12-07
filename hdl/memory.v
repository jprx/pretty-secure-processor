/*
 * memory
 * Dual-port BRAM backed main memory for instructions & data
 *
 * Parameters:
 * MEM_SIZE- number of bytes in RAM
 * MEM_WIDTH- width of data interface
 *
 * Addresses are log base 2 of MEM_SIZE bytes wide. The lower 2 bits
 * are ignored by this module. The data enable signals are respected
 * and are relative to the address modulo 4.
 *
 * So if you read from address 6 for example, with a width of 32 bits
 * you will receive [byte 4, byte 5, byte 6, byte 7] and data enable pins
 * will operate on those bytes. 
 *
 * (You will NOT get something like [byte 6, byte 7, byte 8, byte 9]).
 */
module memory
	#(
		// Max aligned address will be 1/4 this:
		parameter MEM_SIZE=8192,
		parameter NUM_COL = 4,
		parameter COL_WIDTH = 8
		// 8192 has max aligned address of 2048
	)
	(
		// Port A
		input [13:0] addr_a,
		input [31:0] data_i_a,
		output reg [31:0] data_o_a,
		input [3:0] data_en_a,
		input  write_en_a,

		// Port B
		input [13:0] addr_b,
		input [31:0] data_i_b,
		output reg [31:0] data_o_b,
		input [3:0] data_en_b,
		input write_en_b,

		input clk
	);

	// @TODO: Support arbitrary MEM_WIDTH
	// Use BRAM supported byte enable signals
	reg [31:0] ram [8191:0];

	// Strip off 2 lower bits from input addresses:
	wire [11:0] addr_a_aligned, addr_b_aligned;
	assign addr_a_aligned = addr_a >> 2;
	assign addr_b_aligned = addr_b >> 2;

	// I wonder what happens if both ports try to write to the same address at the same time... Hmm

	always @ (posedge clk) begin
		// Port A
		if (write_en_a) begin
			if(data_en_a[0]) ram[addr_a_aligned][7:0] <= data_i_a[7:0];
			if(data_en_a[1]) ram[addr_a_aligned][15:8] <= data_i_a[15:8];
			if(data_en_a[2]) ram[addr_a_aligned][23:16] <= data_i_a[23:16];
			if(data_en_a[3]) ram[addr_a_aligned][31:24] <= data_i_a[31:24];
		end
		data_o_a <= ram[addr_a_aligned];
	end

	always @ (posedge clk) begin
		// Port B
		if (write_en_b) begin
			if(data_en_b[0]) ram[addr_b_aligned][7:0] <= data_i_b[7:0];
			if(data_en_b[1]) ram[addr_b_aligned][15:8] <= data_i_b[15:8];
			if(data_en_b[2]) ram[addr_b_aligned][23:16] <= data_i_b[23:16];
			if(data_en_b[3]) ram[addr_b_aligned][31:24] <= data_i_b[31:24];
		end
		data_o_b <= ram[addr_b_aligned];
	end

endmodule
