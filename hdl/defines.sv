`ifndef DEFINES
`define DEFINES

// Different opcodes:
enum logic[6:0] {
    op_lui      = 7'b0110111, // U type
    op_auipc    = 7'b0010111, // U type
    op_jal      = 7'b1101111, // J type
    op_jalr     = 7'b1100111, // I type
    op_br       = 7'b1100011, // B type
    op_load     = 7'b0000011, // I type
    op_store    = 7'b0100011, // S type
    op_imm      = 7'b0010011, // I type
    op_reg      = 7'b0110011  // R type
}

typedef struct packed {
    // Raw memory from fetch:
    logic[31:0] instruction;

    /*
     * Decode-created signals
     */
    logic[6:0] opcode;
    logic[4:0] rs1_idx, rs2_idx, rd_idx;
    logic[31:0] rs1_val, rs2_val, rd_val;
    logic load_rd;

    logic[6:0] func7;
    logic[2:0] func3;

    // Fully sign extended immediate values per instruction type
    logic[31:0] i_imm, s_imm, b_imm, u_imm, j_imm;

    // Is this word valid?
    logic valid;
} controlword;

`endif // DEFINES
