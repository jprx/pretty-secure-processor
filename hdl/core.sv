/*
 * core
 *
 * The main PSP processor core.
 */
`include "memory_if.sv"
`include "defines.sv"

module core
    (
        // Instruction & data memory
        mem_if.driver imem,
        mem_if.driver dmem,

        input logic reset,
        input logic clk
    );

    // Control words
    controlword decode, execute, mem, wb;

    // Registers
    logic [31:0] regs[32];
    logic [31:0] pc;

    /*
     * Fetch
     *
     * Requests next instruction from memory- this instruction
     * will be available in decode stage as "imem.data_o".
     *
     * Also calculates next PC and assigns PC to new value.
     */
    assign imem.addr = pc;
    assign imem.write_en = 0;
    assign imem.data_en = 4'b1111;
    assign imem.data_i = 0;

    always_ff @ (posedge clk) begin
        if (reset) begin
            // Clear fetch internal state and control word for decode
            pc <= 0;
            decode.valid <= 0;
        end
        else begin
            // Update fetch internal state and control word for decode
            decode.valid <= 1;
            pc <= pc + 4;
        end
    end

    /*
     * Decode
     *
     * Load rs1 and rs2 from regfile, handle forwarding,
     * and get control word ready for execute.
     *
     * (Instruction is in imem.data_o)
     */
    always_comb begin
        decode.instruction = imem.data_o;
        decode.rs1_idx = decode.instruction[24:20];
        decode.rs2_idx = decode.instruction[19:15];
        decode.rd_idx = decode.instruction[11:7];
    end

    always_ff @ (posedge clk) begin
        if (reset) begin
            // Clear decode internal state

            // Clear control word for execute
            execute.valid <= 0;
        end
        else begin
            // Update decode internal state

            // Setup the control word for execute
            execute <= decode; 
            execute.rs1_val <= regs[decode.rs1_idx];
            execute.rs2_val <= regs[decode.rs2_idx];
            execute.load_rd <= 0;
        end
    end

    /*
     * Execute
     *
     * Do some math on rs1 and rs2, or maybe
     * calculate an address to be used in Memory stage.
     */
    

    /*
     * Memory
     *
     * Read / write to data memory
     */

    /*
     * Writeback
     *
     * Commit result to destination register.
     */
    integer i;
    always_ff @ (posedge clk) begin
        for (i = 0 ; i < 32 ; i++) begin
            if (reset) regs[i] <= 32'h0;
            else if (i == wb.rd_idx && wb.load_rd && wb.valid) regs[i] <= wb.rd_val;
        end
    end

endmodule


















