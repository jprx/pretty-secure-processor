`ifndef DEFINES
`define DEFINES

// Different opcodes:
typedef enum logic[6:0] {
    op_lui      = 7'b0110111, // U type
    op_auipc    = 7'b0010111, // U type
    op_jal      = 7'b1101111, // J type
    op_jalr     = 7'b1100111, // I type
    op_br       = 7'b1100011, // B type
    op_load     = 7'b0000011, // I type
    op_store    = 7'b0100011, // S type
    op_imm      = 7'b0010011, // I type
    op_reg      = 7'b0110011, // R type
    op_scall    = 7'b1010011, // J type
    op_sret     = 7'b1010110  // I type
} rv_opcode;

// Different func3 values for ALU operations
typedef enum logic[2:0] {
    func3_add   = 3'b000, // If func7[6] is 1 this becomes sub
    func3_sll   = 3'b001,
    func3_slt   = 3'b010,
    func3_sltu  = 3'b011,
    func3_xor   = 3'b100,
    func3_srl   = 3'b101, // If func7[6] is 1 this becomes sra
    func3_or    = 3'b110,
    func3_and   = 3'b111
} func3_alu;

// Different func3 values for load / store ops
typedef enum logic[2:0] {
    func3_byte  = 3'b000,
    func3_half  = 3'b001,
    func3_word  = 3'b010,

    // Only load uses unsigned
    func3_ubyte = 3'b100,
    func3_uhalf = 3'b101
} func3_mem;

// ALU commands
// The compare commands run on the compare unit instead of ALU
// ALU has dedicated add and sub modes- could combine into 1 adder, but
// would need extra hardware in decode stage to negate rs2, which is the same
// cost as just adding a sub function to the ALU
typedef enum logic[2:0] {
    alu_add     = 3'b000,
    alu_sll     = 3'b001,
    alu_sra     = 3'b010,
    alu_sub     = 3'b011,
    alu_xor     = 3'b100,
    alu_srl     = 3'b101,
    alu_or      = 3'b110,
    alu_and     = 3'b111
} alu_cmd;

// Comparison commands
// Used by conditional branch instructions and SLT / SLTU (register and imm modes)
typedef enum logic[2:0] {
    // ==
    cmp_eq      = 3'b000,
    cmp_neq     = 3'b001,

    // <
    cmp_lt      = 3'b100,
    cmp_ltu     = 3'b110,

    // >=
    cmp_ge      = 3'b101,
    cmp_geu     = 3'b111
} cmp_cmd;

// What gets written back to a register?
typedef enum logic[2:0] {
    wb_alu, // Write back alu value
    wb_cmp, // Write back cmp value
    wb_mem, // Write back memory data read
    wb_ret, // Write back return address, used by JAL/ JALR
    wb_imm  // Write back immediate value only, only used by LUI
} wb_cmd;

typedef struct packed {
    // Is this word valid?
    logic valid;

    // Raw memory from fetch:
    logic[31:0] instruction;
    logic[31:0] pc; // Address of this instruction

    /*
     * Decode-created signals
     */
    rv_opcode opcode;
    logic[4:0] rs1_idx, rs2_idx, rd_idx;
    logic[31:0] rs1_val, rs2_val, rd_val;
    logic load_rd;

    // Push/ pop secure stack?
    logic secure_push, secure_pop;

    logic[6:0] func7;
    logic[2:0] func3;

    // Fully sign extended immediate values per instruction type
    logic[31:0] i_imm, s_imm, b_imm, u_imm, j_imm;
    logic[31:0] imm; // <- Which ever kind of instruction it is, this is the correct imm

    alu_cmd alu_command;

    // alu_mux1: 0 = rs1, 1 = PC
    logic alu_mux1;

    // alu_mux2: 0 = rs2, 1 = imm
    logic alu_mux2;

    cmp_cmd cmp_command;

    // cmp_mux: 0 = rs2, 1 = imm
    logic cmp_mux;

    logic[3:0] mem_mask;

    wb_cmd wb_command;

    /*
     * Execute-created signals
     */
    logic[31:0] alu_out;
    logic cmp_out;

    /*
     * Memory-created signals
     */

    // Primarily used for rvfi purposes:
    logic[3:0] dmem_mask;
    logic dmem_write_en;
    logic[31:0] dmem_wdata;

    // RVFI stuff
    logic[31:0] pc_next; // PC written by this instruction (usually PC + 4)
} controlword;

parameter TFT_MEM_BASE = 32'h40_00_00_00;

`endif // DEFINES
