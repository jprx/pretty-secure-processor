/*
 * memory
 * Dual-port BRAM backed main memory for instructions & data
 *
 * Parameters:
 * MEM_SIZE- number of bytes in RAM
 * MEM_WIDTH- width of data interface
 *
 * Addresses are log base 2 of MEM_SIZE bytes wide. The lower 2 bits
 * are NOT ignored by this module. The data enable signals are respected
 * and are relative to the lower 2 bits of the address.
 *
 * So if you read from address 6 for example, with a width of 32 bits
 * you will receive [byte 6, byte 7, byte 8, byte 9] and data enable pins
 * will operate on those bytes. 
 *
 * (You will NOT get something like [byte 4, byte 5, byte 6, byte 7] and 
 * be expected to know that byte 6 is in the 10 position).
 */
module memory
    #(
        parameter MEM_SIZE=8192,
        parameter MEM_WIDTH=32
    )
    (
        // Port A
        input logic[$clog2(MEM_SIZE)-1:0] addr_a,
        input logic[MEM_WIDTH-1:0] data_i_a,
        output logic[MEM_WIDTH-1:0] data_o_a,
        input logic[(MEM_WIDTH >> 2)-1:0] data_en_a,
        input logic write_en_a,

        // Port B
        input logic[$clog2(MEM_SIZE)-1:0] addr_b,
        input logic[MEM_WIDTH-1:0] data_i_b,
        output logic[MEM_WIDTH-1:0] data_o_b,
        input logic[(MEM_WIDTH >> 2)-1:0] data_en_b,
        input logic write_en_b,

        input logic clk
    );

    logic [MEM_WIDTH-1:0] ram [MEM_SIZE-1:0];

    always_ff @ (posedge clk) begin
        ram[0] <= 0;
    end

endmodule
