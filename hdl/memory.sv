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
        parameter MEM_SIZE=8192
        // 8192 has max aligned address of 2048
    )
    (
        // Port A
        input logic[$clog2(MEM_SIZE)-1:0] addr_a,
        input logic[31:0] data_i_a,
        output logic[31:0] data_o_a,
        input logic[3:0] data_en_a,
        input logic write_en_a,

        // Port B
        input logic[$clog2(MEM_SIZE)-1:0] addr_b,
        input logic[31:0] data_i_b,
        output logic[31:0] data_o_b,
        input logic[3:0] data_en_b,
        input logic write_en_b,

        input logic clk
    );

    // @TODO: Support arbitrary MEM_WIDTH
    // 4 separate per-byte RAMs to support per-byte assignment with 2 ports:
    logic [7:0] ram[4][(MEM_SIZE/4)-1:0];

    // Strip off 2 lower bits from input addresses:
    logic [$clog2(MEM_SIZE)-3:0] addr_a_aligned, addr_b_aligned;
    assign addr_a_aligned = addr_a >> 2;
    assign addr_b_aligned = addr_b >> 2;

    // I wonder what happens if both ports try to write to the same address at the same time... Hmm

    integer i, j;

    always_ff @ (posedge clk) begin
        // Port A
        if (write_en_a) begin
            // Wanted to use a single for loop here but Vivado can't handle for loops + range slicing at the same time.
            for (i = 0 ; i < 4 ; i++) begin
                for (j = 0 ; j < 8 ; j++) begin
                    if (data_en_a[i]) ram[i][addr_a_aligned][j] <= data_i_a[(8*i)+j];
                end
            end
        end
        else begin
            for (i = 0 ; i < 4 ; i++) begin
                for (j = 0 ; j < 8 ; j++) begin
                    data_o_a[(8*i) + j] <= ram[i][addr_a_aligned][j];
                end
            end
        end // write_en_a

        // Port A
        if (write_en_b) begin
            // Wanted to use a single for loop here but Vivado can't handle for loops + range slicing at the same time.
            for (i = 0 ; i < 4 ; i++) begin
                for (j = 0 ; j < 8 ; j++) begin
                    if (data_en_b[i]) ram[i][addr_b_aligned][j] <= data_i_b[(8*i)+j];
                end
            end
        end
        else begin
            for (i = 0 ; i < 4 ; i++) begin
                for (j = 0 ; j < 8 ; j++) begin
                    data_o_b[(8*i) + j] <= ram[i][addr_b_aligned][j];
                end
            end
        end // write_en_b

        // Port B
        /*
        if (write_en_b) begin
            for (i = 0; i < 4; i++) begin
                if (data_en_b[i]) ram[i][addr_b_aligned] <= data_i_b[(8*i) :+ 8];
            end
        end
        else begin
            for (i = 0; i < 4; i++) begin
                data_o_b[(8*i) :+ 8] <= ram[i][addr_b_aligned];
            end
        end // write_en_b
        */
    end

endmodule
