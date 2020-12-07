`ifndef DEFINES
`define DEFINES

typedef struct packed {
    logic[31:0] instruction;

    logic[4:0] rs1_idx, rs2_idx, rd_idx;
    logic[31:0] rs1_val, rs2_val, rd_val;
    logic load_rd;

    logic valid;
} controlword;

`endif // DEFINES
