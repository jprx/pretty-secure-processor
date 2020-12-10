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
            decode.this_addr <= 0;
            decode.valid <= 0;
        end
        else begin
            // Update fetch internal state and control word for decode
            decode.valid <= 1;
            decode.pc <= pc;
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

    // Current instruction in decode (just makes code easier to read):
    logic[31:0] d_instr;

    always_comb begin
        decode.instruction = imem.data_o;
        d_instr = decode.instruction;

        // Decode opcode:
        decode.rs1_idx = d_instr[24:20];
        decode.rs2_idx = d_instr[19:15];
        decode.rd_idx = d_instr[11:7];
        decode.opcode = d_instr[6:0];
        decode.func7 = d_instr[31:25];
        decode.func3 = d_instr[14:12];
        decode.i_imm = { {20{d_instr[11]}}, d_instr[11:0]};
        decode.s_imm = { {20{d_instr[31]}}, d_instr[31:25], d_instr[11:7]};
        decode.b_imm = { {19{d_instr[31]}}, d_instr[31], d_instr[7], d_instr[30:25], d_instr[11:8], 1'b0};
        decode.u_imm = { d_instr[31:12], {12{1'b0}}};
        decode.j_imm = { {11{d_instr[31]}}, d_instr[31], d_instr[19:12], d_instr[20], d_instr[30:21], 1'b0};

        case (d_instr.opcode)
            op_lui      :   decode.imm = decode.u_imm;
            op_auipc    :   decode.imm = decode.u_imm;
            op_jal      :   decode.imm = decode.i_imm;
            op_jalr     :   decode.imm = decode.j_imm;
            op_br       :   decode.imm = decode.b_imm;
            op_load     :   decode.imm = decode.i_imm;
            op_store    :   decode.imm = decode.s_imm;
            op_imm      :   decode.imm = decode.i_imm;

            default     :   decode.imm = decode.i_imm; // Don't really care
        endcase

        // Setup ALU stuff:
        case (func3_alu'(decode.func3))
            func3_add   :   decode.alu_command = decode.func7[6] == 0 ? alu_add : alu_sub;
            func3_sll   :   decode.alu_command = alu_sll;
            func3_xor   :   decode.alu_command = alu_xor;
            func3_srl   :   decode.alu_command = decode.func7[6] == 0 ? alu_srl : alu_sra;
            func3_or    :   decode.alu_command = alu_or;
            func3_and   :   decode.alu_command = alu_and;

            default     :   decode.alu_command = alu_and; // Don't care (could optimize with gating ALU)
        endcase

        // alu_mux1 is 0 for rs1, 1 for pc
        decode.alu_mux1 = // @TODO;

        // alu_mux2 is 0 for rs2, 1 for imm
        decode.alu_mux2 = // @TODO;

        // Setup CMP stuff:
        case (decode.opcode) begin
            op_br       :   decode.cmp_command = func3_cmp'(decode.func3);

            op_imm, op_reg : begin
                decode.cmp_command = decode.func3[0] == 0 ? cmp_lt : cmp_ltu;
            end

            default     :   decode.cmp_command = cmp_eq; // Don't care (could optimize with gating CMP)
        end
        decode.cmp_mux = decode.opcode == op_imm ? 1 : 0; // rs2 if not op_imm, otherwise imm
        
        // Setup MEM stuff (do we read/ write?):

        // Setup WB stuff (do we writeback memory out? Or alu out? etc.)
        decode.load_rd = 0;
        decode.wb_command = // @TODO;
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
        end
    end

    // Register file:
    // Write into here only in wb stage
    integer i;
    always_ff @ (posedge clk) begin
        for (i = 1; i < 32 ; i++) begin
            if (reset) regs[i] <= 32'h0;
            else begin
                if (i == wb.rd_idx && wb.load_rd && wb.valid) regs[i] <= wb_val;
            end
        end
    end
    assign regs[0] = 32'h0;

    /*
     * Execute
     *
     * Do some math on rs1 and rs2, or maybe
     * calculate an address to be used in Memory stage.
     */

    logic[31:0] alu_in1, alu_in2, alu_out;
    alu alu(
        .in1(alu_in1),
        .in2(alu_in2),
        .command(execute.alu_command),
        .alu_out(alu_out)
    );

    // Setup alu_in1 and alu_in2 based on control word
    always_comb begin
        case (execute.alu_mux1)
            0: alu_in1 = execute.rs1_val;
            1: alu_in1 = execute.pc;
        endcase

        case (execute.alu_mux2)
            0: alu_in2 = execute.rs2_val;
            1: alu_in2 = execute.imm;
        endcase
    end

    // Comparison unit
    logic cmp_out;
    cmp cmp (
        .in1(rs1),
        .in2(execute.cmp_mux == 1'b1 ? execute.imm : execute.rs2),
        .command(execute.cmp_command),
        .cmp_out(cmp_out)
    );
    
    always_ff @ (posedge clk) begin
        if (reset) begin
            // Clear execute internal state

            // Clear control word for mem
            mem.valid <= 0;
        end
        else begin
            // Update execute internal state

            // Setup control word for mem
            mem <= execute;
            mem.cmp_out <= cmp_out;
            mem.alu_out <= alu_out;
        end
    end

    /*
     * Memory
     *
     * Read / write to data memory
     */

    always_comb begin
        // @TODO: Connect dmem signals here
    end

    always_ff @ (posedge clk) begin
        if (reset) begin
            // Clear mem internal state

            // Clear control word for wb
            wb.valid <= 0;
        end
        else begin
            // Update mem internal state

            // Setup control word for wb
            wb <= mem;
            wb.mem_out <= dmem.data_o;
        end
    end

    /*
     * Writeback
     *
     * Commit result to destination register.
     */

    // Value written back to register file:
    logic[31:0] wb_val;

    always_comb begin
        case (wb.wb_command)
            wb_alu : wb_val = wb.alu_out;
            wb_cmp : wb_val = wb.cmp_out;
            wb_mem : wb_val = wb.mem_out;
            wb_ret : wb_val = wb.pc + 4;
            wb_imm : wb_val = wb.imm;
        endcase
    end

endmodule


















