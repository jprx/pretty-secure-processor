`ifndef RVFI_IF
`define RVFI_IF

/*
 * rvfi_if
 *
 * An interface connecting important RVFI signals.
 */
typedef struct packed {
    logic [0:0] valid;
    logic [31:0] insn;
    logic [4:0] rs1_addr;
    logic [4:0] rs2_addr;
    logic [31:0] rs1_rdata;
    logic [31:0] rs2_rdata;
    logic [4:0] rd_addr;
    logic [31:0] rd_wdata;
    logic [31:0] pc_rdata;
    logic [31:0] pc_wdata;
    logic [31:0] mem_addr;
    logic [3:0] mem_rmask;
    logic [3:0] mem_wmask;
    logic [31:0] mem_rdata;
    logic [31:0] mem_wdata;
} rvfi_if;

`endif // RVFI_IF
