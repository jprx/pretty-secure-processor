// DO NOT EDIT -- auto-generated from riscv-formal/monitor/generate.py
//
// Command line options: -i rv32i -c 1 -a -p psp_rvfimon -V

module psp_rvfimon (
  input clock,
  input reset,
  input [0:0] rvfi_valid,
  input [63:0] rvfi_order,
  input [31:0] rvfi_insn,
  input [0:0] rvfi_trap,
  input [0:0] rvfi_halt,
  input [0:0] rvfi_intr,
  input [1:0] rvfi_mode,
  input [4:0] rvfi_rs1_addr,
  input [4:0] rvfi_rs2_addr,
  input [31:0] rvfi_rs1_rdata,
  input [31:0] rvfi_rs2_rdata,
  input [4:0] rvfi_rd_addr,
  input [31:0] rvfi_rd_wdata,
  input [31:0] rvfi_pc_rdata,
  input [31:0] rvfi_pc_wdata,
  input [31:0] rvfi_mem_addr,
  input [3:0] rvfi_mem_rmask,
  input [3:0] rvfi_mem_wmask,
  input [31:0] rvfi_mem_rdata,
  input [31:0] rvfi_mem_wdata,
  input [0:0] rvfi_mem_extamo,
  output reg [15:0] errcode
);
  wire ch0_rvfi_valid = rvfi_valid[0];
  wire [63:0] ch0_rvfi_order = rvfi_order[63:0];
  wire [31:0] ch0_rvfi_insn = rvfi_insn[31:0];
  wire ch0_rvfi_trap = rvfi_trap[0];
  wire ch0_rvfi_halt = rvfi_halt[0];
  wire ch0_rvfi_intr = rvfi_intr[0];
  wire [4:0] ch0_rvfi_rs1_addr = rvfi_rs1_addr[4:0];
  wire [4:0] ch0_rvfi_rs2_addr = rvfi_rs2_addr[4:0];
  wire [31:0] ch0_rvfi_rs1_rdata = rvfi_rs1_rdata[31:0];
  wire [31:0] ch0_rvfi_rs2_rdata = rvfi_rs2_rdata[31:0];
  wire [4:0] ch0_rvfi_rd_addr = rvfi_rd_addr[4:0];
  wire [31:0] ch0_rvfi_rd_wdata = rvfi_rd_wdata[31:0];
  wire [31:0] ch0_rvfi_pc_rdata = rvfi_pc_rdata[31:0];
  wire [31:0] ch0_rvfi_pc_wdata = rvfi_pc_wdata[31:0];
  wire [31:0] ch0_rvfi_mem_addr = rvfi_mem_addr[31:0];
  wire [3:0] ch0_rvfi_mem_rmask = rvfi_mem_rmask[3:0];
  wire [3:0] ch0_rvfi_mem_wmask = rvfi_mem_wmask[3:0];
  wire [31:0] ch0_rvfi_mem_rdata = rvfi_mem_rdata[31:0];
  wire [31:0] ch0_rvfi_mem_wdata = rvfi_mem_wdata[31:0];
  wire ch0_rvfi_mem_extamo = rvfi_mem_extamo[0];

  wire ch0_spec_valid;
  wire ch0_spec_trap;
  wire [4:0] ch0_spec_rs1_addr;
  wire [4:0] ch0_spec_rs2_addr;
  wire [4:0] ch0_spec_rd_addr;
  wire [31:0] ch0_spec_rd_wdata;
  wire [31:0] ch0_spec_pc_wdata;
  wire [31:0] ch0_spec_mem_addr;
  wire [3:0] ch0_spec_mem_rmask;
  wire [3:0] ch0_spec_mem_wmask;
  wire [31:0] ch0_spec_mem_wdata;

  psp_rvfimon_isa_spec ch0_isa_spec (
    .rvfi_valid(ch0_rvfi_valid),
    .rvfi_insn(ch0_rvfi_insn),
    .rvfi_pc_rdata(ch0_rvfi_pc_rdata),
    .rvfi_rs1_rdata(ch0_rvfi_rs1_rdata),
    .rvfi_rs2_rdata(ch0_rvfi_rs2_rdata),
    .rvfi_mem_rdata(ch0_rvfi_mem_rdata),
    .spec_valid(ch0_spec_valid),
    .spec_trap(ch0_spec_trap),
    .spec_rs1_addr(ch0_spec_rs1_addr),
    .spec_rs2_addr(ch0_spec_rs2_addr),
    .spec_rd_addr(ch0_spec_rd_addr),
    .spec_rd_wdata(ch0_spec_rd_wdata),
    .spec_pc_wdata(ch0_spec_pc_wdata),
    .spec_mem_addr(ch0_spec_mem_addr),
    .spec_mem_rmask(ch0_spec_mem_rmask),
    .spec_mem_wmask(ch0_spec_mem_wmask),
    .spec_mem_wdata(ch0_spec_mem_wdata)
  );

  reg [15:0] ch0_errcode;

  task ch0_handle_error;
    input [15:0] code;
    input [511:0] msg;
    begin
      $display("-------- RVFI Monitor error %0d in channel 0: %m at time %0t --------", code, $time);
      $display("Error message: %0s", msg);
      $display("rvfi_valid = %x", ch0_rvfi_valid);
      $display("rvfi_order = %x", ch0_rvfi_order);
      $display("rvfi_insn = %x", ch0_rvfi_insn);
      $display("rvfi_trap = %x", ch0_rvfi_trap);
      $display("rvfi_halt = %x", ch0_rvfi_halt);
      $display("rvfi_intr = %x", ch0_rvfi_intr);
      $display("rvfi_rs1_addr = %x", ch0_rvfi_rs1_addr);
      $display("rvfi_rs2_addr = %x", ch0_rvfi_rs2_addr);
      $display("rvfi_rs1_rdata = %x", ch0_rvfi_rs1_rdata);
      $display("rvfi_rs2_rdata = %x", ch0_rvfi_rs2_rdata);
      $display("rvfi_rd_addr = %x", ch0_rvfi_rd_addr);
      $display("rvfi_rd_wdata = %x", ch0_rvfi_rd_wdata);
      $display("rvfi_pc_rdata = %x", ch0_rvfi_pc_rdata);
      $display("rvfi_pc_wdata = %x", ch0_rvfi_pc_wdata);
      $display("rvfi_mem_addr = %x", ch0_rvfi_mem_addr);
      $display("rvfi_mem_rmask = %x", ch0_rvfi_mem_rmask);
      $display("rvfi_mem_wmask = %x", ch0_rvfi_mem_wmask);
      $display("rvfi_mem_rdata = %x", ch0_rvfi_mem_rdata);
      $display("rvfi_mem_wdata = %x", ch0_rvfi_mem_wdata);
      $display("spec_valid = %x", ch0_spec_valid);
      $display("spec_trap = %x", ch0_spec_trap);
      $display("spec_rs1_addr = %x", ch0_spec_rs1_addr);
      $display("spec_rs2_addr = %x", ch0_spec_rs2_addr);
      $display("spec_rd_addr = %x", ch0_spec_rd_addr);
      $display("spec_rd_wdata = %x", ch0_spec_rd_wdata);
      $display("spec_pc_wdata = %x", ch0_spec_pc_wdata);
      $display("spec_mem_addr = %x", ch0_spec_mem_addr);
      $display("spec_mem_rmask = %x", ch0_spec_mem_rmask);
      $display("spec_mem_wmask = %x", ch0_spec_mem_wmask);
      $display("spec_mem_wdata = %x", ch0_spec_mem_wdata);
      ch0_errcode <= code;
    end
  endtask

  always @(posedge clock) begin
    ch0_errcode <= 0;
    if (!reset && ch0_rvfi_valid) begin
      $display("-------- RVFI Monitor insn in channel 0: %m at time %0t --------", $time);
      $display("rvfi_valid = %x", ch0_rvfi_valid);
      $display("rvfi_order = %x", ch0_rvfi_order);
      $display("rvfi_insn = %x", ch0_rvfi_insn);
      $display("rvfi_trap = %x", ch0_rvfi_trap);
      $display("rvfi_halt = %x", ch0_rvfi_halt);
      $display("rvfi_intr = %x", ch0_rvfi_intr);
      $display("rvfi_rs1_addr = %x", ch0_rvfi_rs1_addr);
      $display("rvfi_rs2_addr = %x", ch0_rvfi_rs2_addr);
      $display("rvfi_rs1_rdata = %x", ch0_rvfi_rs1_rdata);
      $display("rvfi_rs2_rdata = %x", ch0_rvfi_rs2_rdata);
      $display("rvfi_rd_addr = %x", ch0_rvfi_rd_addr);
      $display("rvfi_rd_wdata = %x", ch0_rvfi_rd_wdata);
      $display("rvfi_pc_rdata = %x", ch0_rvfi_pc_rdata);
      $display("rvfi_pc_wdata = %x", ch0_rvfi_pc_wdata);
      $display("rvfi_mem_addr = %x", ch0_rvfi_mem_addr);
      $display("rvfi_mem_rmask = %x", ch0_rvfi_mem_rmask);
      $display("rvfi_mem_wmask = %x", ch0_rvfi_mem_wmask);
      $display("rvfi_mem_rdata = %x", ch0_rvfi_mem_rdata);
      $display("rvfi_mem_wdata = %x", ch0_rvfi_mem_wdata);
      $display("spec_valid = %x", ch0_spec_valid);
      $display("spec_trap = %x", ch0_spec_trap);
      if (ch0_spec_valid) begin
        if (ch0_rvfi_trap != ch0_spec_trap) begin
          ch0_handle_error(101, "mismatch in trap");
        end
        if (ch0_rvfi_rs1_addr != ch0_spec_rs1_addr && ch0_spec_rs1_addr != 0) begin
          ch0_handle_error(102, "mismatch in rs1_addr");
        end
        if (ch0_rvfi_rs2_addr != ch0_spec_rs2_addr && ch0_spec_rs2_addr != 0) begin
          ch0_handle_error(103, "mismatch in rs2_addr");
        end
        if (ch0_rvfi_rd_addr != ch0_spec_rd_addr) begin
          ch0_handle_error(104, "mismatch in rd_addr");
        end
        if (ch0_rvfi_rd_wdata != ch0_spec_rd_wdata) begin
          ch0_handle_error(105, "mismatch in rd_wdata");
        end
        if (ch0_rvfi_pc_wdata != ch0_spec_pc_wdata) begin
          ch0_handle_error(106, "mismatch in pc_wdata");
        end
        if (ch0_rvfi_mem_wmask != ch0_spec_mem_wmask) begin
          ch0_handle_error(108, "mismatch in mem_wmask");
        end
        if (!ch0_rvfi_mem_rmask[0] && ch0_spec_mem_rmask[0]) begin
          ch0_handle_error(110, "mismatch in mem_rmask[0]");
        end
        if (ch0_rvfi_mem_wmask[0] && ch0_rvfi_mem_wdata[7:0] != ch0_spec_mem_wdata[7:0]) begin
          ch0_handle_error(120, "mismatch in mem_wdata[7:0]");
        end
        if (!ch0_rvfi_mem_rmask[1] && ch0_spec_mem_rmask[1]) begin
          ch0_handle_error(111, "mismatch in mem_rmask[1]");
        end
        if (ch0_rvfi_mem_wmask[1] && ch0_rvfi_mem_wdata[15:8] != ch0_spec_mem_wdata[15:8]) begin
          ch0_handle_error(121, "mismatch in mem_wdata[15:8]");
        end
        if (!ch0_rvfi_mem_rmask[2] && ch0_spec_mem_rmask[2]) begin
          ch0_handle_error(112, "mismatch in mem_rmask[2]");
        end
        if (ch0_rvfi_mem_wmask[2] && ch0_rvfi_mem_wdata[23:16] != ch0_spec_mem_wdata[23:16]) begin
          ch0_handle_error(122, "mismatch in mem_wdata[23:16]");
        end
        if (!ch0_rvfi_mem_rmask[3] && ch0_spec_mem_rmask[3]) begin
          ch0_handle_error(113, "mismatch in mem_rmask[3]");
        end
        if (ch0_rvfi_mem_wmask[3] && ch0_rvfi_mem_wdata[31:24] != ch0_spec_mem_wdata[31:24]) begin
          ch0_handle_error(123, "mismatch in mem_wdata[31:24]");
        end
        if (ch0_rvfi_mem_addr != ch0_spec_mem_addr && (ch0_rvfi_mem_wmask || ch0_rvfi_mem_rmask)) begin
          ch0_handle_error(107, "mismatch in mem_addr");
        end
      end
    end
  end

  wire rob_i0_valid;
  wire [63:0] rob_i0_order;
  wire [176:0] rob_i0_data;

  wire rob_o0_valid;
  wire [63:0] rob_o0_order;
  wire [176:0] rob_o0_data;

  wire ro0_rvfi_valid = rob_o0_valid;
  assign rob_i0_valid = ch0_rvfi_valid;

  wire [63:0] ro0_rvfi_order = rob_o0_order;
  assign rob_i0_order = ch0_rvfi_order;

  wire [4:0] ro0_rvfi_rs1_addr = rob_o0_data[4:0];
  assign rob_i0_data[4:0] = ch0_rvfi_rs1_addr;

  wire [4:0] ro0_rvfi_rs2_addr = rob_o0_data[9:5];
  assign rob_i0_data[9:5] = ch0_rvfi_rs2_addr;

  wire [4:0] ro0_rvfi_rd_addr = rob_o0_data[14:10];
  assign rob_i0_data[14:10] = ch0_rvfi_rd_addr;

  wire [31:0] ro0_rvfi_rs1_rdata = rob_o0_data[46:15];
  assign rob_i0_data[46:15] = ch0_rvfi_rs1_rdata;

  wire [31:0] ro0_rvfi_rs2_rdata = rob_o0_data[78:47];
  assign rob_i0_data[78:47] = ch0_rvfi_rs2_rdata;

  wire [31:0] ro0_rvfi_rd_wdata = rob_o0_data[110:79];
  assign rob_i0_data[110:79] = ch0_rvfi_rd_wdata;

  wire [31:0] ro0_rvfi_pc_rdata = rob_o0_data[142:111];
  assign rob_i0_data[142:111] = ch0_rvfi_pc_rdata;

  wire [31:0] ro0_rvfi_pc_wdata = rob_o0_data[174:143];
  assign rob_i0_data[174:143] = ch0_rvfi_pc_wdata;

  wire [0:0] ro0_rvfi_intr = rob_o0_data[175:175];
  assign rob_i0_data[175:175] = ch0_rvfi_intr;

  wire [0:0] ro0_rvfi_trap = rob_o0_data[176:176];
  assign rob_i0_data[176:176] = ch0_rvfi_trap;

  wire [15:0] rob_errcode;

  psp_rvfimon_rob rob (
    .clock(clock),
    .reset(reset),
    .i0_valid(rob_i0_valid),
    .i0_order(rob_i0_order),
    .i0_data(rob_i0_data),
    .o0_valid(rob_o0_valid),
    .o0_order(rob_o0_order),
    .o0_data(rob_o0_data),
    .errcode(rob_errcode)
  );

  always @(posedge clock) begin
    if (!reset && rob_errcode) begin
      $display("-------- RVFI Monitor ROB error %0d: %m at time %0t --------", rob_errcode, $time);
      $display("No details on ROB errors available.");
    end
  end

  reg shadow_pc_valid;
  reg shadow_pc_trap;
  reg [31:0] shadow_pc;

  reg shadow0_pc_valid;
  reg shadow0_pc_trap;
  reg [31:0] shadow0_pc_rdata;

  reg [15:0] ro0_errcode_p;

  task ro0_handle_error_p;
    input [15:0] code;
    input [511:0] msg;
    begin
      $display("-------- RVFI Monitor error %0d in reordered channel 0: %m at time %0t --------", code, $time);
      $display("Error message: %0s", msg);
      $display("rvfi_valid = %x", ro0_rvfi_valid);
      $display("rvfi_order = %x", ro0_rvfi_order);
      $display("rvfi_rs1_addr = %x", ro0_rvfi_rs1_addr);
      $display("rvfi_rs2_addr = %x", ro0_rvfi_rs2_addr);
      $display("rvfi_rs1_rdata = %x", ro0_rvfi_rs1_rdata);
      $display("rvfi_rs2_rdata = %x", ro0_rvfi_rs2_rdata);
      $display("rvfi_rd_addr = %x", ro0_rvfi_rd_addr);
      $display("rvfi_rd_wdata = %x", ro0_rvfi_rd_wdata);
      $display("rvfi_pc_rdata = %x", ro0_rvfi_pc_rdata);
      $display("rvfi_pc_wdata = %x", ro0_rvfi_pc_wdata);
      $display("rvfi_intr = %x", ro0_rvfi_intr);
      $display("rvfi_trap = %x", ro0_rvfi_trap);
      $display("shadow_pc_valid = %x", shadow0_pc_valid);
      $display("shadow_pc_rdata = %x", shadow0_pc_rdata);
      ro0_errcode_p <= code;
    end
  endtask

  always @* begin
    shadow0_pc_valid = shadow_pc_valid;
    shadow0_pc_trap = shadow_pc_trap;
    shadow0_pc_rdata = shadow_pc;
  end

  always @(posedge clock) begin
    ro0_errcode_p <= 0;
    if (reset) begin
      shadow_pc_valid <= 0;
      shadow_pc_trap <= 0;
    end
    if (!reset && ro0_rvfi_valid) begin
      if (shadow0_pc_valid && shadow0_pc_rdata != ro0_rvfi_pc_rdata && !ro0_rvfi_intr) begin
        ro0_handle_error_p(130, "mismatch with shadow pc");
      end
      if (shadow0_pc_valid && shadow0_pc_trap && !ro0_rvfi_intr) begin
        ro0_handle_error_p(133, "expected intr after trap");
      end
      shadow_pc_valid <= !ro0_rvfi_trap;
      shadow_pc_trap <= ro0_rvfi_trap;
      shadow_pc <= ro0_rvfi_pc_wdata;
    end
  end

  reg [31:0] shadow_xregs_valid;
  reg [31:0] shadow_xregs [0:31];

  reg shadow0_rs1_valid;
  reg shadow0_rs2_valid;
  reg [31:0] shadow0_rs1_rdata;
  reg [31:0] shadow0_rs2_rdata;

  reg [15:0] ro0_errcode_r;

  task ro0_handle_error_r;
    input [15:0] code;
    input [511:0] msg;
    begin
      $display("-------- RVFI Monitor error %0d in reordered channel 0: %m at time %0t --------", code, $time);
      $display("Error message: %0s", msg);
      $display("rvfi_valid = %x", ro0_rvfi_valid);
      $display("rvfi_order = %x", ro0_rvfi_order);
      $display("rvfi_rs1_addr = %x", ro0_rvfi_rs1_addr);
      $display("rvfi_rs2_addr = %x", ro0_rvfi_rs2_addr);
      $display("rvfi_rs1_rdata = %x", ro0_rvfi_rs1_rdata);
      $display("rvfi_rs2_rdata = %x", ro0_rvfi_rs2_rdata);
      $display("rvfi_rd_addr = %x", ro0_rvfi_rd_addr);
      $display("rvfi_rd_wdata = %x", ro0_rvfi_rd_wdata);
      $display("rvfi_pc_rdata = %x", ro0_rvfi_pc_rdata);
      $display("rvfi_pc_wdata = %x", ro0_rvfi_pc_wdata);
      $display("rvfi_intr = %x", ro0_rvfi_intr);
      $display("rvfi_trap = %x", ro0_rvfi_trap);
      $display("shadow_rs1_valid = %x", shadow0_rs1_valid);
      $display("shadow_rs1_rdata = %x", shadow0_rs1_rdata);
      $display("shadow_rs2_valid = %x", shadow0_rs2_valid);
      $display("shadow_rs2_rdata = %x", shadow0_rs2_rdata);
      ro0_errcode_r <= code;
    end
  endtask

  always @* begin
    shadow0_rs1_valid = 0;
    shadow0_rs1_rdata = 0;
    if (!reset && ro0_rvfi_valid) begin
      shadow0_rs1_valid = shadow_xregs_valid[ro0_rvfi_rs1_addr];
      shadow0_rs1_rdata = shadow_xregs[ro0_rvfi_rs1_addr];
    end
  end

  always @* begin
    shadow0_rs2_valid = 0;
    shadow0_rs2_rdata = 0;
    if (!reset && ro0_rvfi_valid) begin
      shadow0_rs2_valid = shadow_xregs_valid[ro0_rvfi_rs2_addr];
      shadow0_rs2_rdata = shadow_xregs[ro0_rvfi_rs2_addr];
    end
  end

  always @(posedge clock) begin
    ro0_errcode_r <= 0;
    if (reset) begin
      shadow_xregs_valid <= 1;
      shadow_xregs[0] <= 0;
    end
    if (!reset && ro0_rvfi_valid) begin
      if (shadow0_rs1_valid && shadow0_rs1_rdata != ro0_rvfi_rs1_rdata) begin
        ro0_handle_error_r(131, "mismatch with shadow rs1");
      end
      if (shadow0_rs2_valid && shadow0_rs2_rdata != ro0_rvfi_rs2_rdata) begin
        ro0_handle_error_r(132, "mismatch with shadow rs2");
      end
      shadow_xregs_valid[ro0_rvfi_rd_addr] <= 1;
      shadow_xregs[ro0_rvfi_rd_addr] <= ro0_rvfi_rd_wdata;
    end
  end

  always @(posedge clock) begin
    errcode <= 0;
    if (!reset) begin
      if (ch0_errcode) errcode <= ch0_errcode;
      if (rob_errcode) errcode <= rob_errcode;
      if (ro0_errcode_p) errcode <= ro0_errcode_p;
      if (ro0_errcode_r) errcode <= ro0_errcode_r;
    end
  end
endmodule

module psp_rvfimon_rob (
  input clock,
  input reset,
    input i0_valid,
    input [63:0] i0_order,
    input [176:0] i0_data,
    output reg o0_valid,
    output reg [63:0] o0_order,
    output reg [176:0] o0_data,
  output reg [15:0] errcode
);
  reg [240:0] buffer [0:255];
  reg [255:0] valid;
  reg [63:0] cursor;
  reg continue_flag;

  always @(posedge clock) begin
    o0_valid <= 0;
    errcode <= 0;
    continue_flag = 1;
    if (reset) begin
      valid <= 0;
      cursor = 0;
    end else begin
      if (i0_valid) begin
        if (valid[i0_order[7:0]])
          errcode <= 60000 + i0_order[7:0];
        buffer[i0_order[7:0]] <= {i0_data, i0_order};
        valid[i0_order[7:0]] <= 1;
      end
      if (continue_flag && valid[cursor[7:0]]) begin
        if (buffer[cursor[7:0]][63:0] != cursor)
          errcode <= 61000 + cursor[7:0];
        o0_valid <= 1;
        o0_order <= buffer[cursor[7:0]][63:0];
        o0_data <= buffer[cursor[7:0]][240:64];
        valid[cursor[7:0]] <= 0;
        cursor = cursor + 1;
      end else begin
        continue_flag = 0;
      end
    end
  end
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_isa_spec (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);
  wire                                spec_insn_add_valid;
  wire                                spec_insn_add_trap;
  wire [                       4 : 0] spec_insn_add_rs1_addr;
  wire [                       4 : 0] spec_insn_add_rs2_addr;
  wire [                       4 : 0] spec_insn_add_rd_addr;
  wire [32   - 1 : 0] spec_insn_add_rd_wdata;
  wire [32   - 1 : 0] spec_insn_add_pc_wdata;
  wire [32   - 1 : 0] spec_insn_add_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_add_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_add_mem_wmask;
  wire [32   - 1 : 0] spec_insn_add_mem_wdata;

  psp_rvfimon_insn_add insn_add (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_add_valid),
    .spec_trap(spec_insn_add_trap),
    .spec_rs1_addr(spec_insn_add_rs1_addr),
    .spec_rs2_addr(spec_insn_add_rs2_addr),
    .spec_rd_addr(spec_insn_add_rd_addr),
    .spec_rd_wdata(spec_insn_add_rd_wdata),
    .spec_pc_wdata(spec_insn_add_pc_wdata),
    .spec_mem_addr(spec_insn_add_mem_addr),
    .spec_mem_rmask(spec_insn_add_mem_rmask),
    .spec_mem_wmask(spec_insn_add_mem_wmask),
    .spec_mem_wdata(spec_insn_add_mem_wdata)
  );

  wire                                spec_insn_addi_valid;
  wire                                spec_insn_addi_trap;
  wire [                       4 : 0] spec_insn_addi_rs1_addr;
  wire [                       4 : 0] spec_insn_addi_rs2_addr;
  wire [                       4 : 0] spec_insn_addi_rd_addr;
  wire [32   - 1 : 0] spec_insn_addi_rd_wdata;
  wire [32   - 1 : 0] spec_insn_addi_pc_wdata;
  wire [32   - 1 : 0] spec_insn_addi_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_addi_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_addi_mem_wmask;
  wire [32   - 1 : 0] spec_insn_addi_mem_wdata;

  psp_rvfimon_insn_addi insn_addi (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_addi_valid),
    .spec_trap(spec_insn_addi_trap),
    .spec_rs1_addr(spec_insn_addi_rs1_addr),
    .spec_rs2_addr(spec_insn_addi_rs2_addr),
    .spec_rd_addr(spec_insn_addi_rd_addr),
    .spec_rd_wdata(spec_insn_addi_rd_wdata),
    .spec_pc_wdata(spec_insn_addi_pc_wdata),
    .spec_mem_addr(spec_insn_addi_mem_addr),
    .spec_mem_rmask(spec_insn_addi_mem_rmask),
    .spec_mem_wmask(spec_insn_addi_mem_wmask),
    .spec_mem_wdata(spec_insn_addi_mem_wdata)
  );

  wire                                spec_insn_and_valid;
  wire                                spec_insn_and_trap;
  wire [                       4 : 0] spec_insn_and_rs1_addr;
  wire [                       4 : 0] spec_insn_and_rs2_addr;
  wire [                       4 : 0] spec_insn_and_rd_addr;
  wire [32   - 1 : 0] spec_insn_and_rd_wdata;
  wire [32   - 1 : 0] spec_insn_and_pc_wdata;
  wire [32   - 1 : 0] spec_insn_and_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_and_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_and_mem_wmask;
  wire [32   - 1 : 0] spec_insn_and_mem_wdata;

  psp_rvfimon_insn_and insn_and (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_and_valid),
    .spec_trap(spec_insn_and_trap),
    .spec_rs1_addr(spec_insn_and_rs1_addr),
    .spec_rs2_addr(spec_insn_and_rs2_addr),
    .spec_rd_addr(spec_insn_and_rd_addr),
    .spec_rd_wdata(spec_insn_and_rd_wdata),
    .spec_pc_wdata(spec_insn_and_pc_wdata),
    .spec_mem_addr(spec_insn_and_mem_addr),
    .spec_mem_rmask(spec_insn_and_mem_rmask),
    .spec_mem_wmask(spec_insn_and_mem_wmask),
    .spec_mem_wdata(spec_insn_and_mem_wdata)
  );

  wire                                spec_insn_andi_valid;
  wire                                spec_insn_andi_trap;
  wire [                       4 : 0] spec_insn_andi_rs1_addr;
  wire [                       4 : 0] spec_insn_andi_rs2_addr;
  wire [                       4 : 0] spec_insn_andi_rd_addr;
  wire [32   - 1 : 0] spec_insn_andi_rd_wdata;
  wire [32   - 1 : 0] spec_insn_andi_pc_wdata;
  wire [32   - 1 : 0] spec_insn_andi_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_andi_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_andi_mem_wmask;
  wire [32   - 1 : 0] spec_insn_andi_mem_wdata;

  psp_rvfimon_insn_andi insn_andi (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_andi_valid),
    .spec_trap(spec_insn_andi_trap),
    .spec_rs1_addr(spec_insn_andi_rs1_addr),
    .spec_rs2_addr(spec_insn_andi_rs2_addr),
    .spec_rd_addr(spec_insn_andi_rd_addr),
    .spec_rd_wdata(spec_insn_andi_rd_wdata),
    .spec_pc_wdata(spec_insn_andi_pc_wdata),
    .spec_mem_addr(spec_insn_andi_mem_addr),
    .spec_mem_rmask(spec_insn_andi_mem_rmask),
    .spec_mem_wmask(spec_insn_andi_mem_wmask),
    .spec_mem_wdata(spec_insn_andi_mem_wdata)
  );

  wire                                spec_insn_auipc_valid;
  wire                                spec_insn_auipc_trap;
  wire [                       4 : 0] spec_insn_auipc_rs1_addr;
  wire [                       4 : 0] spec_insn_auipc_rs2_addr;
  wire [                       4 : 0] spec_insn_auipc_rd_addr;
  wire [32   - 1 : 0] spec_insn_auipc_rd_wdata;
  wire [32   - 1 : 0] spec_insn_auipc_pc_wdata;
  wire [32   - 1 : 0] spec_insn_auipc_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_auipc_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_auipc_mem_wmask;
  wire [32   - 1 : 0] spec_insn_auipc_mem_wdata;

  psp_rvfimon_insn_auipc insn_auipc (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_auipc_valid),
    .spec_trap(spec_insn_auipc_trap),
    .spec_rs1_addr(spec_insn_auipc_rs1_addr),
    .spec_rs2_addr(spec_insn_auipc_rs2_addr),
    .spec_rd_addr(spec_insn_auipc_rd_addr),
    .spec_rd_wdata(spec_insn_auipc_rd_wdata),
    .spec_pc_wdata(spec_insn_auipc_pc_wdata),
    .spec_mem_addr(spec_insn_auipc_mem_addr),
    .spec_mem_rmask(spec_insn_auipc_mem_rmask),
    .spec_mem_wmask(spec_insn_auipc_mem_wmask),
    .spec_mem_wdata(spec_insn_auipc_mem_wdata)
  );

  wire                                spec_insn_beq_valid;
  wire                                spec_insn_beq_trap;
  wire [                       4 : 0] spec_insn_beq_rs1_addr;
  wire [                       4 : 0] spec_insn_beq_rs2_addr;
  wire [                       4 : 0] spec_insn_beq_rd_addr;
  wire [32   - 1 : 0] spec_insn_beq_rd_wdata;
  wire [32   - 1 : 0] spec_insn_beq_pc_wdata;
  wire [32   - 1 : 0] spec_insn_beq_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_beq_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_beq_mem_wmask;
  wire [32   - 1 : 0] spec_insn_beq_mem_wdata;

  psp_rvfimon_insn_beq insn_beq (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_beq_valid),
    .spec_trap(spec_insn_beq_trap),
    .spec_rs1_addr(spec_insn_beq_rs1_addr),
    .spec_rs2_addr(spec_insn_beq_rs2_addr),
    .spec_rd_addr(spec_insn_beq_rd_addr),
    .spec_rd_wdata(spec_insn_beq_rd_wdata),
    .spec_pc_wdata(spec_insn_beq_pc_wdata),
    .spec_mem_addr(spec_insn_beq_mem_addr),
    .spec_mem_rmask(spec_insn_beq_mem_rmask),
    .spec_mem_wmask(spec_insn_beq_mem_wmask),
    .spec_mem_wdata(spec_insn_beq_mem_wdata)
  );

  wire                                spec_insn_bge_valid;
  wire                                spec_insn_bge_trap;
  wire [                       4 : 0] spec_insn_bge_rs1_addr;
  wire [                       4 : 0] spec_insn_bge_rs2_addr;
  wire [                       4 : 0] spec_insn_bge_rd_addr;
  wire [32   - 1 : 0] spec_insn_bge_rd_wdata;
  wire [32   - 1 : 0] spec_insn_bge_pc_wdata;
  wire [32   - 1 : 0] spec_insn_bge_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_bge_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_bge_mem_wmask;
  wire [32   - 1 : 0] spec_insn_bge_mem_wdata;

  psp_rvfimon_insn_bge insn_bge (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_bge_valid),
    .spec_trap(spec_insn_bge_trap),
    .spec_rs1_addr(spec_insn_bge_rs1_addr),
    .spec_rs2_addr(spec_insn_bge_rs2_addr),
    .spec_rd_addr(spec_insn_bge_rd_addr),
    .spec_rd_wdata(spec_insn_bge_rd_wdata),
    .spec_pc_wdata(spec_insn_bge_pc_wdata),
    .spec_mem_addr(spec_insn_bge_mem_addr),
    .spec_mem_rmask(spec_insn_bge_mem_rmask),
    .spec_mem_wmask(spec_insn_bge_mem_wmask),
    .spec_mem_wdata(spec_insn_bge_mem_wdata)
  );

  wire                                spec_insn_bgeu_valid;
  wire                                spec_insn_bgeu_trap;
  wire [                       4 : 0] spec_insn_bgeu_rs1_addr;
  wire [                       4 : 0] spec_insn_bgeu_rs2_addr;
  wire [                       4 : 0] spec_insn_bgeu_rd_addr;
  wire [32   - 1 : 0] spec_insn_bgeu_rd_wdata;
  wire [32   - 1 : 0] spec_insn_bgeu_pc_wdata;
  wire [32   - 1 : 0] spec_insn_bgeu_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_bgeu_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_bgeu_mem_wmask;
  wire [32   - 1 : 0] spec_insn_bgeu_mem_wdata;

  psp_rvfimon_insn_bgeu insn_bgeu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_bgeu_valid),
    .spec_trap(spec_insn_bgeu_trap),
    .spec_rs1_addr(spec_insn_bgeu_rs1_addr),
    .spec_rs2_addr(spec_insn_bgeu_rs2_addr),
    .spec_rd_addr(spec_insn_bgeu_rd_addr),
    .spec_rd_wdata(spec_insn_bgeu_rd_wdata),
    .spec_pc_wdata(spec_insn_bgeu_pc_wdata),
    .spec_mem_addr(spec_insn_bgeu_mem_addr),
    .spec_mem_rmask(spec_insn_bgeu_mem_rmask),
    .spec_mem_wmask(spec_insn_bgeu_mem_wmask),
    .spec_mem_wdata(spec_insn_bgeu_mem_wdata)
  );

  wire                                spec_insn_blt_valid;
  wire                                spec_insn_blt_trap;
  wire [                       4 : 0] spec_insn_blt_rs1_addr;
  wire [                       4 : 0] spec_insn_blt_rs2_addr;
  wire [                       4 : 0] spec_insn_blt_rd_addr;
  wire [32   - 1 : 0] spec_insn_blt_rd_wdata;
  wire [32   - 1 : 0] spec_insn_blt_pc_wdata;
  wire [32   - 1 : 0] spec_insn_blt_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_blt_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_blt_mem_wmask;
  wire [32   - 1 : 0] spec_insn_blt_mem_wdata;

  psp_rvfimon_insn_blt insn_blt (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_blt_valid),
    .spec_trap(spec_insn_blt_trap),
    .spec_rs1_addr(spec_insn_blt_rs1_addr),
    .spec_rs2_addr(spec_insn_blt_rs2_addr),
    .spec_rd_addr(spec_insn_blt_rd_addr),
    .spec_rd_wdata(spec_insn_blt_rd_wdata),
    .spec_pc_wdata(spec_insn_blt_pc_wdata),
    .spec_mem_addr(spec_insn_blt_mem_addr),
    .spec_mem_rmask(spec_insn_blt_mem_rmask),
    .spec_mem_wmask(spec_insn_blt_mem_wmask),
    .spec_mem_wdata(spec_insn_blt_mem_wdata)
  );

  wire                                spec_insn_bltu_valid;
  wire                                spec_insn_bltu_trap;
  wire [                       4 : 0] spec_insn_bltu_rs1_addr;
  wire [                       4 : 0] spec_insn_bltu_rs2_addr;
  wire [                       4 : 0] spec_insn_bltu_rd_addr;
  wire [32   - 1 : 0] spec_insn_bltu_rd_wdata;
  wire [32   - 1 : 0] spec_insn_bltu_pc_wdata;
  wire [32   - 1 : 0] spec_insn_bltu_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_bltu_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_bltu_mem_wmask;
  wire [32   - 1 : 0] spec_insn_bltu_mem_wdata;

  psp_rvfimon_insn_bltu insn_bltu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_bltu_valid),
    .spec_trap(spec_insn_bltu_trap),
    .spec_rs1_addr(spec_insn_bltu_rs1_addr),
    .spec_rs2_addr(spec_insn_bltu_rs2_addr),
    .spec_rd_addr(spec_insn_bltu_rd_addr),
    .spec_rd_wdata(spec_insn_bltu_rd_wdata),
    .spec_pc_wdata(spec_insn_bltu_pc_wdata),
    .spec_mem_addr(spec_insn_bltu_mem_addr),
    .spec_mem_rmask(spec_insn_bltu_mem_rmask),
    .spec_mem_wmask(spec_insn_bltu_mem_wmask),
    .spec_mem_wdata(spec_insn_bltu_mem_wdata)
  );

  wire                                spec_insn_bne_valid;
  wire                                spec_insn_bne_trap;
  wire [                       4 : 0] spec_insn_bne_rs1_addr;
  wire [                       4 : 0] spec_insn_bne_rs2_addr;
  wire [                       4 : 0] spec_insn_bne_rd_addr;
  wire [32   - 1 : 0] spec_insn_bne_rd_wdata;
  wire [32   - 1 : 0] spec_insn_bne_pc_wdata;
  wire [32   - 1 : 0] spec_insn_bne_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_bne_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_bne_mem_wmask;
  wire [32   - 1 : 0] spec_insn_bne_mem_wdata;

  psp_rvfimon_insn_bne insn_bne (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_bne_valid),
    .spec_trap(spec_insn_bne_trap),
    .spec_rs1_addr(spec_insn_bne_rs1_addr),
    .spec_rs2_addr(spec_insn_bne_rs2_addr),
    .spec_rd_addr(spec_insn_bne_rd_addr),
    .spec_rd_wdata(spec_insn_bne_rd_wdata),
    .spec_pc_wdata(spec_insn_bne_pc_wdata),
    .spec_mem_addr(spec_insn_bne_mem_addr),
    .spec_mem_rmask(spec_insn_bne_mem_rmask),
    .spec_mem_wmask(spec_insn_bne_mem_wmask),
    .spec_mem_wdata(spec_insn_bne_mem_wdata)
  );

  wire                                spec_insn_jal_valid;
  wire                                spec_insn_jal_trap;
  wire [                       4 : 0] spec_insn_jal_rs1_addr;
  wire [                       4 : 0] spec_insn_jal_rs2_addr;
  wire [                       4 : 0] spec_insn_jal_rd_addr;
  wire [32   - 1 : 0] spec_insn_jal_rd_wdata;
  wire [32   - 1 : 0] spec_insn_jal_pc_wdata;
  wire [32   - 1 : 0] spec_insn_jal_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_jal_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_jal_mem_wmask;
  wire [32   - 1 : 0] spec_insn_jal_mem_wdata;

  psp_rvfimon_insn_jal insn_jal (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_jal_valid),
    .spec_trap(spec_insn_jal_trap),
    .spec_rs1_addr(spec_insn_jal_rs1_addr),
    .spec_rs2_addr(spec_insn_jal_rs2_addr),
    .spec_rd_addr(spec_insn_jal_rd_addr),
    .spec_rd_wdata(spec_insn_jal_rd_wdata),
    .spec_pc_wdata(spec_insn_jal_pc_wdata),
    .spec_mem_addr(spec_insn_jal_mem_addr),
    .spec_mem_rmask(spec_insn_jal_mem_rmask),
    .spec_mem_wmask(spec_insn_jal_mem_wmask),
    .spec_mem_wdata(spec_insn_jal_mem_wdata)
  );

  wire                                spec_insn_jalr_valid;
  wire                                spec_insn_jalr_trap;
  wire [                       4 : 0] spec_insn_jalr_rs1_addr;
  wire [                       4 : 0] spec_insn_jalr_rs2_addr;
  wire [                       4 : 0] spec_insn_jalr_rd_addr;
  wire [32   - 1 : 0] spec_insn_jalr_rd_wdata;
  wire [32   - 1 : 0] spec_insn_jalr_pc_wdata;
  wire [32   - 1 : 0] spec_insn_jalr_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_jalr_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_jalr_mem_wmask;
  wire [32   - 1 : 0] spec_insn_jalr_mem_wdata;

  psp_rvfimon_insn_jalr insn_jalr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_jalr_valid),
    .spec_trap(spec_insn_jalr_trap),
    .spec_rs1_addr(spec_insn_jalr_rs1_addr),
    .spec_rs2_addr(spec_insn_jalr_rs2_addr),
    .spec_rd_addr(spec_insn_jalr_rd_addr),
    .spec_rd_wdata(spec_insn_jalr_rd_wdata),
    .spec_pc_wdata(spec_insn_jalr_pc_wdata),
    .spec_mem_addr(spec_insn_jalr_mem_addr),
    .spec_mem_rmask(spec_insn_jalr_mem_rmask),
    .spec_mem_wmask(spec_insn_jalr_mem_wmask),
    .spec_mem_wdata(spec_insn_jalr_mem_wdata)
  );

  wire                                spec_insn_lb_valid;
  wire                                spec_insn_lb_trap;
  wire [                       4 : 0] spec_insn_lb_rs1_addr;
  wire [                       4 : 0] spec_insn_lb_rs2_addr;
  wire [                       4 : 0] spec_insn_lb_rd_addr;
  wire [32   - 1 : 0] spec_insn_lb_rd_wdata;
  wire [32   - 1 : 0] spec_insn_lb_pc_wdata;
  wire [32   - 1 : 0] spec_insn_lb_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_lb_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_lb_mem_wmask;
  wire [32   - 1 : 0] spec_insn_lb_mem_wdata;

  psp_rvfimon_insn_lb insn_lb (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_lb_valid),
    .spec_trap(spec_insn_lb_trap),
    .spec_rs1_addr(spec_insn_lb_rs1_addr),
    .spec_rs2_addr(spec_insn_lb_rs2_addr),
    .spec_rd_addr(spec_insn_lb_rd_addr),
    .spec_rd_wdata(spec_insn_lb_rd_wdata),
    .spec_pc_wdata(spec_insn_lb_pc_wdata),
    .spec_mem_addr(spec_insn_lb_mem_addr),
    .spec_mem_rmask(spec_insn_lb_mem_rmask),
    .spec_mem_wmask(spec_insn_lb_mem_wmask),
    .spec_mem_wdata(spec_insn_lb_mem_wdata)
  );

  wire                                spec_insn_lbu_valid;
  wire                                spec_insn_lbu_trap;
  wire [                       4 : 0] spec_insn_lbu_rs1_addr;
  wire [                       4 : 0] spec_insn_lbu_rs2_addr;
  wire [                       4 : 0] spec_insn_lbu_rd_addr;
  wire [32   - 1 : 0] spec_insn_lbu_rd_wdata;
  wire [32   - 1 : 0] spec_insn_lbu_pc_wdata;
  wire [32   - 1 : 0] spec_insn_lbu_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_lbu_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_lbu_mem_wmask;
  wire [32   - 1 : 0] spec_insn_lbu_mem_wdata;

  psp_rvfimon_insn_lbu insn_lbu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_lbu_valid),
    .spec_trap(spec_insn_lbu_trap),
    .spec_rs1_addr(spec_insn_lbu_rs1_addr),
    .spec_rs2_addr(spec_insn_lbu_rs2_addr),
    .spec_rd_addr(spec_insn_lbu_rd_addr),
    .spec_rd_wdata(spec_insn_lbu_rd_wdata),
    .spec_pc_wdata(spec_insn_lbu_pc_wdata),
    .spec_mem_addr(spec_insn_lbu_mem_addr),
    .spec_mem_rmask(spec_insn_lbu_mem_rmask),
    .spec_mem_wmask(spec_insn_lbu_mem_wmask),
    .spec_mem_wdata(spec_insn_lbu_mem_wdata)
  );

  wire                                spec_insn_lh_valid;
  wire                                spec_insn_lh_trap;
  wire [                       4 : 0] spec_insn_lh_rs1_addr;
  wire [                       4 : 0] spec_insn_lh_rs2_addr;
  wire [                       4 : 0] spec_insn_lh_rd_addr;
  wire [32   - 1 : 0] spec_insn_lh_rd_wdata;
  wire [32   - 1 : 0] spec_insn_lh_pc_wdata;
  wire [32   - 1 : 0] spec_insn_lh_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_lh_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_lh_mem_wmask;
  wire [32   - 1 : 0] spec_insn_lh_mem_wdata;

  psp_rvfimon_insn_lh insn_lh (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_lh_valid),
    .spec_trap(spec_insn_lh_trap),
    .spec_rs1_addr(spec_insn_lh_rs1_addr),
    .spec_rs2_addr(spec_insn_lh_rs2_addr),
    .spec_rd_addr(spec_insn_lh_rd_addr),
    .spec_rd_wdata(spec_insn_lh_rd_wdata),
    .spec_pc_wdata(spec_insn_lh_pc_wdata),
    .spec_mem_addr(spec_insn_lh_mem_addr),
    .spec_mem_rmask(spec_insn_lh_mem_rmask),
    .spec_mem_wmask(spec_insn_lh_mem_wmask),
    .spec_mem_wdata(spec_insn_lh_mem_wdata)
  );

  wire                                spec_insn_lhu_valid;
  wire                                spec_insn_lhu_trap;
  wire [                       4 : 0] spec_insn_lhu_rs1_addr;
  wire [                       4 : 0] spec_insn_lhu_rs2_addr;
  wire [                       4 : 0] spec_insn_lhu_rd_addr;
  wire [32   - 1 : 0] spec_insn_lhu_rd_wdata;
  wire [32   - 1 : 0] spec_insn_lhu_pc_wdata;
  wire [32   - 1 : 0] spec_insn_lhu_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_lhu_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_lhu_mem_wmask;
  wire [32   - 1 : 0] spec_insn_lhu_mem_wdata;

  psp_rvfimon_insn_lhu insn_lhu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_lhu_valid),
    .spec_trap(spec_insn_lhu_trap),
    .spec_rs1_addr(spec_insn_lhu_rs1_addr),
    .spec_rs2_addr(spec_insn_lhu_rs2_addr),
    .spec_rd_addr(spec_insn_lhu_rd_addr),
    .spec_rd_wdata(spec_insn_lhu_rd_wdata),
    .spec_pc_wdata(spec_insn_lhu_pc_wdata),
    .spec_mem_addr(spec_insn_lhu_mem_addr),
    .spec_mem_rmask(spec_insn_lhu_mem_rmask),
    .spec_mem_wmask(spec_insn_lhu_mem_wmask),
    .spec_mem_wdata(spec_insn_lhu_mem_wdata)
  );

  wire                                spec_insn_lui_valid;
  wire                                spec_insn_lui_trap;
  wire [                       4 : 0] spec_insn_lui_rs1_addr;
  wire [                       4 : 0] spec_insn_lui_rs2_addr;
  wire [                       4 : 0] spec_insn_lui_rd_addr;
  wire [32   - 1 : 0] spec_insn_lui_rd_wdata;
  wire [32   - 1 : 0] spec_insn_lui_pc_wdata;
  wire [32   - 1 : 0] spec_insn_lui_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_lui_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_lui_mem_wmask;
  wire [32   - 1 : 0] spec_insn_lui_mem_wdata;

  psp_rvfimon_insn_lui insn_lui (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_lui_valid),
    .spec_trap(spec_insn_lui_trap),
    .spec_rs1_addr(spec_insn_lui_rs1_addr),
    .spec_rs2_addr(spec_insn_lui_rs2_addr),
    .spec_rd_addr(spec_insn_lui_rd_addr),
    .spec_rd_wdata(spec_insn_lui_rd_wdata),
    .spec_pc_wdata(spec_insn_lui_pc_wdata),
    .spec_mem_addr(spec_insn_lui_mem_addr),
    .spec_mem_rmask(spec_insn_lui_mem_rmask),
    .spec_mem_wmask(spec_insn_lui_mem_wmask),
    .spec_mem_wdata(spec_insn_lui_mem_wdata)
  );

  wire                                spec_insn_lw_valid;
  wire                                spec_insn_lw_trap;
  wire [                       4 : 0] spec_insn_lw_rs1_addr;
  wire [                       4 : 0] spec_insn_lw_rs2_addr;
  wire [                       4 : 0] spec_insn_lw_rd_addr;
  wire [32   - 1 : 0] spec_insn_lw_rd_wdata;
  wire [32   - 1 : 0] spec_insn_lw_pc_wdata;
  wire [32   - 1 : 0] spec_insn_lw_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_lw_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_lw_mem_wmask;
  wire [32   - 1 : 0] spec_insn_lw_mem_wdata;

  psp_rvfimon_insn_lw insn_lw (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_lw_valid),
    .spec_trap(spec_insn_lw_trap),
    .spec_rs1_addr(spec_insn_lw_rs1_addr),
    .spec_rs2_addr(spec_insn_lw_rs2_addr),
    .spec_rd_addr(spec_insn_lw_rd_addr),
    .spec_rd_wdata(spec_insn_lw_rd_wdata),
    .spec_pc_wdata(spec_insn_lw_pc_wdata),
    .spec_mem_addr(spec_insn_lw_mem_addr),
    .spec_mem_rmask(spec_insn_lw_mem_rmask),
    .spec_mem_wmask(spec_insn_lw_mem_wmask),
    .spec_mem_wdata(spec_insn_lw_mem_wdata)
  );

  wire                                spec_insn_or_valid;
  wire                                spec_insn_or_trap;
  wire [                       4 : 0] spec_insn_or_rs1_addr;
  wire [                       4 : 0] spec_insn_or_rs2_addr;
  wire [                       4 : 0] spec_insn_or_rd_addr;
  wire [32   - 1 : 0] spec_insn_or_rd_wdata;
  wire [32   - 1 : 0] spec_insn_or_pc_wdata;
  wire [32   - 1 : 0] spec_insn_or_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_or_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_or_mem_wmask;
  wire [32   - 1 : 0] spec_insn_or_mem_wdata;

  psp_rvfimon_insn_or insn_or (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_or_valid),
    .spec_trap(spec_insn_or_trap),
    .spec_rs1_addr(spec_insn_or_rs1_addr),
    .spec_rs2_addr(spec_insn_or_rs2_addr),
    .spec_rd_addr(spec_insn_or_rd_addr),
    .spec_rd_wdata(spec_insn_or_rd_wdata),
    .spec_pc_wdata(spec_insn_or_pc_wdata),
    .spec_mem_addr(spec_insn_or_mem_addr),
    .spec_mem_rmask(spec_insn_or_mem_rmask),
    .spec_mem_wmask(spec_insn_or_mem_wmask),
    .spec_mem_wdata(spec_insn_or_mem_wdata)
  );

  wire                                spec_insn_ori_valid;
  wire                                spec_insn_ori_trap;
  wire [                       4 : 0] spec_insn_ori_rs1_addr;
  wire [                       4 : 0] spec_insn_ori_rs2_addr;
  wire [                       4 : 0] spec_insn_ori_rd_addr;
  wire [32   - 1 : 0] spec_insn_ori_rd_wdata;
  wire [32   - 1 : 0] spec_insn_ori_pc_wdata;
  wire [32   - 1 : 0] spec_insn_ori_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_ori_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_ori_mem_wmask;
  wire [32   - 1 : 0] spec_insn_ori_mem_wdata;

  psp_rvfimon_insn_ori insn_ori (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_ori_valid),
    .spec_trap(spec_insn_ori_trap),
    .spec_rs1_addr(spec_insn_ori_rs1_addr),
    .spec_rs2_addr(spec_insn_ori_rs2_addr),
    .spec_rd_addr(spec_insn_ori_rd_addr),
    .spec_rd_wdata(spec_insn_ori_rd_wdata),
    .spec_pc_wdata(spec_insn_ori_pc_wdata),
    .spec_mem_addr(spec_insn_ori_mem_addr),
    .spec_mem_rmask(spec_insn_ori_mem_rmask),
    .spec_mem_wmask(spec_insn_ori_mem_wmask),
    .spec_mem_wdata(spec_insn_ori_mem_wdata)
  );

  wire                                spec_insn_sb_valid;
  wire                                spec_insn_sb_trap;
  wire [                       4 : 0] spec_insn_sb_rs1_addr;
  wire [                       4 : 0] spec_insn_sb_rs2_addr;
  wire [                       4 : 0] spec_insn_sb_rd_addr;
  wire [32   - 1 : 0] spec_insn_sb_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sb_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sb_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sb_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sb_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sb_mem_wdata;

  psp_rvfimon_insn_sb insn_sb (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sb_valid),
    .spec_trap(spec_insn_sb_trap),
    .spec_rs1_addr(spec_insn_sb_rs1_addr),
    .spec_rs2_addr(spec_insn_sb_rs2_addr),
    .spec_rd_addr(spec_insn_sb_rd_addr),
    .spec_rd_wdata(spec_insn_sb_rd_wdata),
    .spec_pc_wdata(spec_insn_sb_pc_wdata),
    .spec_mem_addr(spec_insn_sb_mem_addr),
    .spec_mem_rmask(spec_insn_sb_mem_rmask),
    .spec_mem_wmask(spec_insn_sb_mem_wmask),
    .spec_mem_wdata(spec_insn_sb_mem_wdata)
  );

  wire                                spec_insn_sh_valid;
  wire                                spec_insn_sh_trap;
  wire [                       4 : 0] spec_insn_sh_rs1_addr;
  wire [                       4 : 0] spec_insn_sh_rs2_addr;
  wire [                       4 : 0] spec_insn_sh_rd_addr;
  wire [32   - 1 : 0] spec_insn_sh_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sh_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sh_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sh_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sh_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sh_mem_wdata;

  psp_rvfimon_insn_sh insn_sh (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sh_valid),
    .spec_trap(spec_insn_sh_trap),
    .spec_rs1_addr(spec_insn_sh_rs1_addr),
    .spec_rs2_addr(spec_insn_sh_rs2_addr),
    .spec_rd_addr(spec_insn_sh_rd_addr),
    .spec_rd_wdata(spec_insn_sh_rd_wdata),
    .spec_pc_wdata(spec_insn_sh_pc_wdata),
    .spec_mem_addr(spec_insn_sh_mem_addr),
    .spec_mem_rmask(spec_insn_sh_mem_rmask),
    .spec_mem_wmask(spec_insn_sh_mem_wmask),
    .spec_mem_wdata(spec_insn_sh_mem_wdata)
  );

  wire                                spec_insn_sll_valid;
  wire                                spec_insn_sll_trap;
  wire [                       4 : 0] spec_insn_sll_rs1_addr;
  wire [                       4 : 0] spec_insn_sll_rs2_addr;
  wire [                       4 : 0] spec_insn_sll_rd_addr;
  wire [32   - 1 : 0] spec_insn_sll_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sll_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sll_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sll_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sll_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sll_mem_wdata;

  psp_rvfimon_insn_sll insn_sll (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sll_valid),
    .spec_trap(spec_insn_sll_trap),
    .spec_rs1_addr(spec_insn_sll_rs1_addr),
    .spec_rs2_addr(spec_insn_sll_rs2_addr),
    .spec_rd_addr(spec_insn_sll_rd_addr),
    .spec_rd_wdata(spec_insn_sll_rd_wdata),
    .spec_pc_wdata(spec_insn_sll_pc_wdata),
    .spec_mem_addr(spec_insn_sll_mem_addr),
    .spec_mem_rmask(spec_insn_sll_mem_rmask),
    .spec_mem_wmask(spec_insn_sll_mem_wmask),
    .spec_mem_wdata(spec_insn_sll_mem_wdata)
  );

  wire                                spec_insn_slli_valid;
  wire                                spec_insn_slli_trap;
  wire [                       4 : 0] spec_insn_slli_rs1_addr;
  wire [                       4 : 0] spec_insn_slli_rs2_addr;
  wire [                       4 : 0] spec_insn_slli_rd_addr;
  wire [32   - 1 : 0] spec_insn_slli_rd_wdata;
  wire [32   - 1 : 0] spec_insn_slli_pc_wdata;
  wire [32   - 1 : 0] spec_insn_slli_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_slli_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_slli_mem_wmask;
  wire [32   - 1 : 0] spec_insn_slli_mem_wdata;

  psp_rvfimon_insn_slli insn_slli (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_slli_valid),
    .spec_trap(spec_insn_slli_trap),
    .spec_rs1_addr(spec_insn_slli_rs1_addr),
    .spec_rs2_addr(spec_insn_slli_rs2_addr),
    .spec_rd_addr(spec_insn_slli_rd_addr),
    .spec_rd_wdata(spec_insn_slli_rd_wdata),
    .spec_pc_wdata(spec_insn_slli_pc_wdata),
    .spec_mem_addr(spec_insn_slli_mem_addr),
    .spec_mem_rmask(spec_insn_slli_mem_rmask),
    .spec_mem_wmask(spec_insn_slli_mem_wmask),
    .spec_mem_wdata(spec_insn_slli_mem_wdata)
  );

  wire                                spec_insn_slt_valid;
  wire                                spec_insn_slt_trap;
  wire [                       4 : 0] spec_insn_slt_rs1_addr;
  wire [                       4 : 0] spec_insn_slt_rs2_addr;
  wire [                       4 : 0] spec_insn_slt_rd_addr;
  wire [32   - 1 : 0] spec_insn_slt_rd_wdata;
  wire [32   - 1 : 0] spec_insn_slt_pc_wdata;
  wire [32   - 1 : 0] spec_insn_slt_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_slt_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_slt_mem_wmask;
  wire [32   - 1 : 0] spec_insn_slt_mem_wdata;

  psp_rvfimon_insn_slt insn_slt (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_slt_valid),
    .spec_trap(spec_insn_slt_trap),
    .spec_rs1_addr(spec_insn_slt_rs1_addr),
    .spec_rs2_addr(spec_insn_slt_rs2_addr),
    .spec_rd_addr(spec_insn_slt_rd_addr),
    .spec_rd_wdata(spec_insn_slt_rd_wdata),
    .spec_pc_wdata(spec_insn_slt_pc_wdata),
    .spec_mem_addr(spec_insn_slt_mem_addr),
    .spec_mem_rmask(spec_insn_slt_mem_rmask),
    .spec_mem_wmask(spec_insn_slt_mem_wmask),
    .spec_mem_wdata(spec_insn_slt_mem_wdata)
  );

  wire                                spec_insn_slti_valid;
  wire                                spec_insn_slti_trap;
  wire [                       4 : 0] spec_insn_slti_rs1_addr;
  wire [                       4 : 0] spec_insn_slti_rs2_addr;
  wire [                       4 : 0] spec_insn_slti_rd_addr;
  wire [32   - 1 : 0] spec_insn_slti_rd_wdata;
  wire [32   - 1 : 0] spec_insn_slti_pc_wdata;
  wire [32   - 1 : 0] spec_insn_slti_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_slti_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_slti_mem_wmask;
  wire [32   - 1 : 0] spec_insn_slti_mem_wdata;

  psp_rvfimon_insn_slti insn_slti (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_slti_valid),
    .spec_trap(spec_insn_slti_trap),
    .spec_rs1_addr(spec_insn_slti_rs1_addr),
    .spec_rs2_addr(spec_insn_slti_rs2_addr),
    .spec_rd_addr(spec_insn_slti_rd_addr),
    .spec_rd_wdata(spec_insn_slti_rd_wdata),
    .spec_pc_wdata(spec_insn_slti_pc_wdata),
    .spec_mem_addr(spec_insn_slti_mem_addr),
    .spec_mem_rmask(spec_insn_slti_mem_rmask),
    .spec_mem_wmask(spec_insn_slti_mem_wmask),
    .spec_mem_wdata(spec_insn_slti_mem_wdata)
  );

  wire                                spec_insn_sltiu_valid;
  wire                                spec_insn_sltiu_trap;
  wire [                       4 : 0] spec_insn_sltiu_rs1_addr;
  wire [                       4 : 0] spec_insn_sltiu_rs2_addr;
  wire [                       4 : 0] spec_insn_sltiu_rd_addr;
  wire [32   - 1 : 0] spec_insn_sltiu_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sltiu_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sltiu_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sltiu_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sltiu_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sltiu_mem_wdata;

  psp_rvfimon_insn_sltiu insn_sltiu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sltiu_valid),
    .spec_trap(spec_insn_sltiu_trap),
    .spec_rs1_addr(spec_insn_sltiu_rs1_addr),
    .spec_rs2_addr(spec_insn_sltiu_rs2_addr),
    .spec_rd_addr(spec_insn_sltiu_rd_addr),
    .spec_rd_wdata(spec_insn_sltiu_rd_wdata),
    .spec_pc_wdata(spec_insn_sltiu_pc_wdata),
    .spec_mem_addr(spec_insn_sltiu_mem_addr),
    .spec_mem_rmask(spec_insn_sltiu_mem_rmask),
    .spec_mem_wmask(spec_insn_sltiu_mem_wmask),
    .spec_mem_wdata(spec_insn_sltiu_mem_wdata)
  );

  wire                                spec_insn_sltu_valid;
  wire                                spec_insn_sltu_trap;
  wire [                       4 : 0] spec_insn_sltu_rs1_addr;
  wire [                       4 : 0] spec_insn_sltu_rs2_addr;
  wire [                       4 : 0] spec_insn_sltu_rd_addr;
  wire [32   - 1 : 0] spec_insn_sltu_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sltu_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sltu_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sltu_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sltu_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sltu_mem_wdata;

  psp_rvfimon_insn_sltu insn_sltu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sltu_valid),
    .spec_trap(spec_insn_sltu_trap),
    .spec_rs1_addr(spec_insn_sltu_rs1_addr),
    .spec_rs2_addr(spec_insn_sltu_rs2_addr),
    .spec_rd_addr(spec_insn_sltu_rd_addr),
    .spec_rd_wdata(spec_insn_sltu_rd_wdata),
    .spec_pc_wdata(spec_insn_sltu_pc_wdata),
    .spec_mem_addr(spec_insn_sltu_mem_addr),
    .spec_mem_rmask(spec_insn_sltu_mem_rmask),
    .spec_mem_wmask(spec_insn_sltu_mem_wmask),
    .spec_mem_wdata(spec_insn_sltu_mem_wdata)
  );

  wire                                spec_insn_sra_valid;
  wire                                spec_insn_sra_trap;
  wire [                       4 : 0] spec_insn_sra_rs1_addr;
  wire [                       4 : 0] spec_insn_sra_rs2_addr;
  wire [                       4 : 0] spec_insn_sra_rd_addr;
  wire [32   - 1 : 0] spec_insn_sra_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sra_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sra_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sra_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sra_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sra_mem_wdata;

  psp_rvfimon_insn_sra insn_sra (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sra_valid),
    .spec_trap(spec_insn_sra_trap),
    .spec_rs1_addr(spec_insn_sra_rs1_addr),
    .spec_rs2_addr(spec_insn_sra_rs2_addr),
    .spec_rd_addr(spec_insn_sra_rd_addr),
    .spec_rd_wdata(spec_insn_sra_rd_wdata),
    .spec_pc_wdata(spec_insn_sra_pc_wdata),
    .spec_mem_addr(spec_insn_sra_mem_addr),
    .spec_mem_rmask(spec_insn_sra_mem_rmask),
    .spec_mem_wmask(spec_insn_sra_mem_wmask),
    .spec_mem_wdata(spec_insn_sra_mem_wdata)
  );

  wire                                spec_insn_srai_valid;
  wire                                spec_insn_srai_trap;
  wire [                       4 : 0] spec_insn_srai_rs1_addr;
  wire [                       4 : 0] spec_insn_srai_rs2_addr;
  wire [                       4 : 0] spec_insn_srai_rd_addr;
  wire [32   - 1 : 0] spec_insn_srai_rd_wdata;
  wire [32   - 1 : 0] spec_insn_srai_pc_wdata;
  wire [32   - 1 : 0] spec_insn_srai_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_srai_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_srai_mem_wmask;
  wire [32   - 1 : 0] spec_insn_srai_mem_wdata;

  psp_rvfimon_insn_srai insn_srai (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_srai_valid),
    .spec_trap(spec_insn_srai_trap),
    .spec_rs1_addr(spec_insn_srai_rs1_addr),
    .spec_rs2_addr(spec_insn_srai_rs2_addr),
    .spec_rd_addr(spec_insn_srai_rd_addr),
    .spec_rd_wdata(spec_insn_srai_rd_wdata),
    .spec_pc_wdata(spec_insn_srai_pc_wdata),
    .spec_mem_addr(spec_insn_srai_mem_addr),
    .spec_mem_rmask(spec_insn_srai_mem_rmask),
    .spec_mem_wmask(spec_insn_srai_mem_wmask),
    .spec_mem_wdata(spec_insn_srai_mem_wdata)
  );

  wire                                spec_insn_srl_valid;
  wire                                spec_insn_srl_trap;
  wire [                       4 : 0] spec_insn_srl_rs1_addr;
  wire [                       4 : 0] spec_insn_srl_rs2_addr;
  wire [                       4 : 0] spec_insn_srl_rd_addr;
  wire [32   - 1 : 0] spec_insn_srl_rd_wdata;
  wire [32   - 1 : 0] spec_insn_srl_pc_wdata;
  wire [32   - 1 : 0] spec_insn_srl_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_srl_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_srl_mem_wmask;
  wire [32   - 1 : 0] spec_insn_srl_mem_wdata;

  psp_rvfimon_insn_srl insn_srl (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_srl_valid),
    .spec_trap(spec_insn_srl_trap),
    .spec_rs1_addr(spec_insn_srl_rs1_addr),
    .spec_rs2_addr(spec_insn_srl_rs2_addr),
    .spec_rd_addr(spec_insn_srl_rd_addr),
    .spec_rd_wdata(spec_insn_srl_rd_wdata),
    .spec_pc_wdata(spec_insn_srl_pc_wdata),
    .spec_mem_addr(spec_insn_srl_mem_addr),
    .spec_mem_rmask(spec_insn_srl_mem_rmask),
    .spec_mem_wmask(spec_insn_srl_mem_wmask),
    .spec_mem_wdata(spec_insn_srl_mem_wdata)
  );

  wire                                spec_insn_srli_valid;
  wire                                spec_insn_srli_trap;
  wire [                       4 : 0] spec_insn_srli_rs1_addr;
  wire [                       4 : 0] spec_insn_srli_rs2_addr;
  wire [                       4 : 0] spec_insn_srli_rd_addr;
  wire [32   - 1 : 0] spec_insn_srli_rd_wdata;
  wire [32   - 1 : 0] spec_insn_srli_pc_wdata;
  wire [32   - 1 : 0] spec_insn_srli_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_srli_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_srli_mem_wmask;
  wire [32   - 1 : 0] spec_insn_srli_mem_wdata;

  psp_rvfimon_insn_srli insn_srli (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_srli_valid),
    .spec_trap(spec_insn_srli_trap),
    .spec_rs1_addr(spec_insn_srli_rs1_addr),
    .spec_rs2_addr(spec_insn_srli_rs2_addr),
    .spec_rd_addr(spec_insn_srli_rd_addr),
    .spec_rd_wdata(spec_insn_srli_rd_wdata),
    .spec_pc_wdata(spec_insn_srli_pc_wdata),
    .spec_mem_addr(spec_insn_srli_mem_addr),
    .spec_mem_rmask(spec_insn_srli_mem_rmask),
    .spec_mem_wmask(spec_insn_srli_mem_wmask),
    .spec_mem_wdata(spec_insn_srli_mem_wdata)
  );

  wire                                spec_insn_sub_valid;
  wire                                spec_insn_sub_trap;
  wire [                       4 : 0] spec_insn_sub_rs1_addr;
  wire [                       4 : 0] spec_insn_sub_rs2_addr;
  wire [                       4 : 0] spec_insn_sub_rd_addr;
  wire [32   - 1 : 0] spec_insn_sub_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sub_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sub_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sub_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sub_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sub_mem_wdata;

  psp_rvfimon_insn_sub insn_sub (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sub_valid),
    .spec_trap(spec_insn_sub_trap),
    .spec_rs1_addr(spec_insn_sub_rs1_addr),
    .spec_rs2_addr(spec_insn_sub_rs2_addr),
    .spec_rd_addr(spec_insn_sub_rd_addr),
    .spec_rd_wdata(spec_insn_sub_rd_wdata),
    .spec_pc_wdata(spec_insn_sub_pc_wdata),
    .spec_mem_addr(spec_insn_sub_mem_addr),
    .spec_mem_rmask(spec_insn_sub_mem_rmask),
    .spec_mem_wmask(spec_insn_sub_mem_wmask),
    .spec_mem_wdata(spec_insn_sub_mem_wdata)
  );

  wire                                spec_insn_sw_valid;
  wire                                spec_insn_sw_trap;
  wire [                       4 : 0] spec_insn_sw_rs1_addr;
  wire [                       4 : 0] spec_insn_sw_rs2_addr;
  wire [                       4 : 0] spec_insn_sw_rd_addr;
  wire [32   - 1 : 0] spec_insn_sw_rd_wdata;
  wire [32   - 1 : 0] spec_insn_sw_pc_wdata;
  wire [32   - 1 : 0] spec_insn_sw_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_sw_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_sw_mem_wmask;
  wire [32   - 1 : 0] spec_insn_sw_mem_wdata;

  psp_rvfimon_insn_sw insn_sw (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_sw_valid),
    .spec_trap(spec_insn_sw_trap),
    .spec_rs1_addr(spec_insn_sw_rs1_addr),
    .spec_rs2_addr(spec_insn_sw_rs2_addr),
    .spec_rd_addr(spec_insn_sw_rd_addr),
    .spec_rd_wdata(spec_insn_sw_rd_wdata),
    .spec_pc_wdata(spec_insn_sw_pc_wdata),
    .spec_mem_addr(spec_insn_sw_mem_addr),
    .spec_mem_rmask(spec_insn_sw_mem_rmask),
    .spec_mem_wmask(spec_insn_sw_mem_wmask),
    .spec_mem_wdata(spec_insn_sw_mem_wdata)
  );

  wire                                spec_insn_xor_valid;
  wire                                spec_insn_xor_trap;
  wire [                       4 : 0] spec_insn_xor_rs1_addr;
  wire [                       4 : 0] spec_insn_xor_rs2_addr;
  wire [                       4 : 0] spec_insn_xor_rd_addr;
  wire [32   - 1 : 0] spec_insn_xor_rd_wdata;
  wire [32   - 1 : 0] spec_insn_xor_pc_wdata;
  wire [32   - 1 : 0] spec_insn_xor_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_xor_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_xor_mem_wmask;
  wire [32   - 1 : 0] spec_insn_xor_mem_wdata;

  psp_rvfimon_insn_xor insn_xor (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_xor_valid),
    .spec_trap(spec_insn_xor_trap),
    .spec_rs1_addr(spec_insn_xor_rs1_addr),
    .spec_rs2_addr(spec_insn_xor_rs2_addr),
    .spec_rd_addr(spec_insn_xor_rd_addr),
    .spec_rd_wdata(spec_insn_xor_rd_wdata),
    .spec_pc_wdata(spec_insn_xor_pc_wdata),
    .spec_mem_addr(spec_insn_xor_mem_addr),
    .spec_mem_rmask(spec_insn_xor_mem_rmask),
    .spec_mem_wmask(spec_insn_xor_mem_wmask),
    .spec_mem_wdata(spec_insn_xor_mem_wdata)
  );

  wire                                spec_insn_xori_valid;
  wire                                spec_insn_xori_trap;
  wire [                       4 : 0] spec_insn_xori_rs1_addr;
  wire [                       4 : 0] spec_insn_xori_rs2_addr;
  wire [                       4 : 0] spec_insn_xori_rd_addr;
  wire [32   - 1 : 0] spec_insn_xori_rd_wdata;
  wire [32   - 1 : 0] spec_insn_xori_pc_wdata;
  wire [32   - 1 : 0] spec_insn_xori_mem_addr;
  wire [32/8 - 1 : 0] spec_insn_xori_mem_rmask;
  wire [32/8 - 1 : 0] spec_insn_xori_mem_wmask;
  wire [32   - 1 : 0] spec_insn_xori_mem_wdata;

  psp_rvfimon_insn_xori insn_xori (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
    .spec_valid(spec_insn_xori_valid),
    .spec_trap(spec_insn_xori_trap),
    .spec_rs1_addr(spec_insn_xori_rs1_addr),
    .spec_rs2_addr(spec_insn_xori_rs2_addr),
    .spec_rd_addr(spec_insn_xori_rd_addr),
    .spec_rd_wdata(spec_insn_xori_rd_wdata),
    .spec_pc_wdata(spec_insn_xori_pc_wdata),
    .spec_mem_addr(spec_insn_xori_mem_addr),
    .spec_mem_rmask(spec_insn_xori_mem_rmask),
    .spec_mem_wmask(spec_insn_xori_mem_wmask),
    .spec_mem_wdata(spec_insn_xori_mem_wdata)
  );

  assign spec_valid =
		spec_insn_add_valid ? spec_insn_add_valid :
		spec_insn_addi_valid ? spec_insn_addi_valid :
		spec_insn_and_valid ? spec_insn_and_valid :
		spec_insn_andi_valid ? spec_insn_andi_valid :
		spec_insn_auipc_valid ? spec_insn_auipc_valid :
		spec_insn_beq_valid ? spec_insn_beq_valid :
		spec_insn_bge_valid ? spec_insn_bge_valid :
		spec_insn_bgeu_valid ? spec_insn_bgeu_valid :
		spec_insn_blt_valid ? spec_insn_blt_valid :
		spec_insn_bltu_valid ? spec_insn_bltu_valid :
		spec_insn_bne_valid ? spec_insn_bne_valid :
		spec_insn_jal_valid ? spec_insn_jal_valid :
		spec_insn_jalr_valid ? spec_insn_jalr_valid :
		spec_insn_lb_valid ? spec_insn_lb_valid :
		spec_insn_lbu_valid ? spec_insn_lbu_valid :
		spec_insn_lh_valid ? spec_insn_lh_valid :
		spec_insn_lhu_valid ? spec_insn_lhu_valid :
		spec_insn_lui_valid ? spec_insn_lui_valid :
		spec_insn_lw_valid ? spec_insn_lw_valid :
		spec_insn_or_valid ? spec_insn_or_valid :
		spec_insn_ori_valid ? spec_insn_ori_valid :
		spec_insn_sb_valid ? spec_insn_sb_valid :
		spec_insn_sh_valid ? spec_insn_sh_valid :
		spec_insn_sll_valid ? spec_insn_sll_valid :
		spec_insn_slli_valid ? spec_insn_slli_valid :
		spec_insn_slt_valid ? spec_insn_slt_valid :
		spec_insn_slti_valid ? spec_insn_slti_valid :
		spec_insn_sltiu_valid ? spec_insn_sltiu_valid :
		spec_insn_sltu_valid ? spec_insn_sltu_valid :
		spec_insn_sra_valid ? spec_insn_sra_valid :
		spec_insn_srai_valid ? spec_insn_srai_valid :
		spec_insn_srl_valid ? spec_insn_srl_valid :
		spec_insn_srli_valid ? spec_insn_srli_valid :
		spec_insn_sub_valid ? spec_insn_sub_valid :
		spec_insn_sw_valid ? spec_insn_sw_valid :
		spec_insn_xor_valid ? spec_insn_xor_valid :
		spec_insn_xori_valid ? spec_insn_xori_valid : 0;
  assign spec_trap =
		spec_insn_add_valid ? spec_insn_add_trap :
		spec_insn_addi_valid ? spec_insn_addi_trap :
		spec_insn_and_valid ? spec_insn_and_trap :
		spec_insn_andi_valid ? spec_insn_andi_trap :
		spec_insn_auipc_valid ? spec_insn_auipc_trap :
		spec_insn_beq_valid ? spec_insn_beq_trap :
		spec_insn_bge_valid ? spec_insn_bge_trap :
		spec_insn_bgeu_valid ? spec_insn_bgeu_trap :
		spec_insn_blt_valid ? spec_insn_blt_trap :
		spec_insn_bltu_valid ? spec_insn_bltu_trap :
		spec_insn_bne_valid ? spec_insn_bne_trap :
		spec_insn_jal_valid ? spec_insn_jal_trap :
		spec_insn_jalr_valid ? spec_insn_jalr_trap :
		spec_insn_lb_valid ? spec_insn_lb_trap :
		spec_insn_lbu_valid ? spec_insn_lbu_trap :
		spec_insn_lh_valid ? spec_insn_lh_trap :
		spec_insn_lhu_valid ? spec_insn_lhu_trap :
		spec_insn_lui_valid ? spec_insn_lui_trap :
		spec_insn_lw_valid ? spec_insn_lw_trap :
		spec_insn_or_valid ? spec_insn_or_trap :
		spec_insn_ori_valid ? spec_insn_ori_trap :
		spec_insn_sb_valid ? spec_insn_sb_trap :
		spec_insn_sh_valid ? spec_insn_sh_trap :
		spec_insn_sll_valid ? spec_insn_sll_trap :
		spec_insn_slli_valid ? spec_insn_slli_trap :
		spec_insn_slt_valid ? spec_insn_slt_trap :
		spec_insn_slti_valid ? spec_insn_slti_trap :
		spec_insn_sltiu_valid ? spec_insn_sltiu_trap :
		spec_insn_sltu_valid ? spec_insn_sltu_trap :
		spec_insn_sra_valid ? spec_insn_sra_trap :
		spec_insn_srai_valid ? spec_insn_srai_trap :
		spec_insn_srl_valid ? spec_insn_srl_trap :
		spec_insn_srli_valid ? spec_insn_srli_trap :
		spec_insn_sub_valid ? spec_insn_sub_trap :
		spec_insn_sw_valid ? spec_insn_sw_trap :
		spec_insn_xor_valid ? spec_insn_xor_trap :
		spec_insn_xori_valid ? spec_insn_xori_trap : 0;
  assign spec_rs1_addr =
		spec_insn_add_valid ? spec_insn_add_rs1_addr :
		spec_insn_addi_valid ? spec_insn_addi_rs1_addr :
		spec_insn_and_valid ? spec_insn_and_rs1_addr :
		spec_insn_andi_valid ? spec_insn_andi_rs1_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_rs1_addr :
		spec_insn_beq_valid ? spec_insn_beq_rs1_addr :
		spec_insn_bge_valid ? spec_insn_bge_rs1_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rs1_addr :
		spec_insn_blt_valid ? spec_insn_blt_rs1_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_rs1_addr :
		spec_insn_bne_valid ? spec_insn_bne_rs1_addr :
		spec_insn_jal_valid ? spec_insn_jal_rs1_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_rs1_addr :
		spec_insn_lb_valid ? spec_insn_lb_rs1_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_rs1_addr :
		spec_insn_lh_valid ? spec_insn_lh_rs1_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_rs1_addr :
		spec_insn_lui_valid ? spec_insn_lui_rs1_addr :
		spec_insn_lw_valid ? spec_insn_lw_rs1_addr :
		spec_insn_or_valid ? spec_insn_or_rs1_addr :
		spec_insn_ori_valid ? spec_insn_ori_rs1_addr :
		spec_insn_sb_valid ? spec_insn_sb_rs1_addr :
		spec_insn_sh_valid ? spec_insn_sh_rs1_addr :
		spec_insn_sll_valid ? spec_insn_sll_rs1_addr :
		spec_insn_slli_valid ? spec_insn_slli_rs1_addr :
		spec_insn_slt_valid ? spec_insn_slt_rs1_addr :
		spec_insn_slti_valid ? spec_insn_slti_rs1_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rs1_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_rs1_addr :
		spec_insn_sra_valid ? spec_insn_sra_rs1_addr :
		spec_insn_srai_valid ? spec_insn_srai_rs1_addr :
		spec_insn_srl_valid ? spec_insn_srl_rs1_addr :
		spec_insn_srli_valid ? spec_insn_srli_rs1_addr :
		spec_insn_sub_valid ? spec_insn_sub_rs1_addr :
		spec_insn_sw_valid ? spec_insn_sw_rs1_addr :
		spec_insn_xor_valid ? spec_insn_xor_rs1_addr :
		spec_insn_xori_valid ? spec_insn_xori_rs1_addr : 0;
  assign spec_rs2_addr =
		spec_insn_add_valid ? spec_insn_add_rs2_addr :
		spec_insn_addi_valid ? spec_insn_addi_rs2_addr :
		spec_insn_and_valid ? spec_insn_and_rs2_addr :
		spec_insn_andi_valid ? spec_insn_andi_rs2_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_rs2_addr :
		spec_insn_beq_valid ? spec_insn_beq_rs2_addr :
		spec_insn_bge_valid ? spec_insn_bge_rs2_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rs2_addr :
		spec_insn_blt_valid ? spec_insn_blt_rs2_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_rs2_addr :
		spec_insn_bne_valid ? spec_insn_bne_rs2_addr :
		spec_insn_jal_valid ? spec_insn_jal_rs2_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_rs2_addr :
		spec_insn_lb_valid ? spec_insn_lb_rs2_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_rs2_addr :
		spec_insn_lh_valid ? spec_insn_lh_rs2_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_rs2_addr :
		spec_insn_lui_valid ? spec_insn_lui_rs2_addr :
		spec_insn_lw_valid ? spec_insn_lw_rs2_addr :
		spec_insn_or_valid ? spec_insn_or_rs2_addr :
		spec_insn_ori_valid ? spec_insn_ori_rs2_addr :
		spec_insn_sb_valid ? spec_insn_sb_rs2_addr :
		spec_insn_sh_valid ? spec_insn_sh_rs2_addr :
		spec_insn_sll_valid ? spec_insn_sll_rs2_addr :
		spec_insn_slli_valid ? spec_insn_slli_rs2_addr :
		spec_insn_slt_valid ? spec_insn_slt_rs2_addr :
		spec_insn_slti_valid ? spec_insn_slti_rs2_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rs2_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_rs2_addr :
		spec_insn_sra_valid ? spec_insn_sra_rs2_addr :
		spec_insn_srai_valid ? spec_insn_srai_rs2_addr :
		spec_insn_srl_valid ? spec_insn_srl_rs2_addr :
		spec_insn_srli_valid ? spec_insn_srli_rs2_addr :
		spec_insn_sub_valid ? spec_insn_sub_rs2_addr :
		spec_insn_sw_valid ? spec_insn_sw_rs2_addr :
		spec_insn_xor_valid ? spec_insn_xor_rs2_addr :
		spec_insn_xori_valid ? spec_insn_xori_rs2_addr : 0;
  assign spec_rd_addr =
		spec_insn_add_valid ? spec_insn_add_rd_addr :
		spec_insn_addi_valid ? spec_insn_addi_rd_addr :
		spec_insn_and_valid ? spec_insn_and_rd_addr :
		spec_insn_andi_valid ? spec_insn_andi_rd_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_rd_addr :
		spec_insn_beq_valid ? spec_insn_beq_rd_addr :
		spec_insn_bge_valid ? spec_insn_bge_rd_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rd_addr :
		spec_insn_blt_valid ? spec_insn_blt_rd_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_rd_addr :
		spec_insn_bne_valid ? spec_insn_bne_rd_addr :
		spec_insn_jal_valid ? spec_insn_jal_rd_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_rd_addr :
		spec_insn_lb_valid ? spec_insn_lb_rd_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_rd_addr :
		spec_insn_lh_valid ? spec_insn_lh_rd_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_rd_addr :
		spec_insn_lui_valid ? spec_insn_lui_rd_addr :
		spec_insn_lw_valid ? spec_insn_lw_rd_addr :
		spec_insn_or_valid ? spec_insn_or_rd_addr :
		spec_insn_ori_valid ? spec_insn_ori_rd_addr :
		spec_insn_sb_valid ? spec_insn_sb_rd_addr :
		spec_insn_sh_valid ? spec_insn_sh_rd_addr :
		spec_insn_sll_valid ? spec_insn_sll_rd_addr :
		spec_insn_slli_valid ? spec_insn_slli_rd_addr :
		spec_insn_slt_valid ? spec_insn_slt_rd_addr :
		spec_insn_slti_valid ? spec_insn_slti_rd_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rd_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_rd_addr :
		spec_insn_sra_valid ? spec_insn_sra_rd_addr :
		spec_insn_srai_valid ? spec_insn_srai_rd_addr :
		spec_insn_srl_valid ? spec_insn_srl_rd_addr :
		spec_insn_srli_valid ? spec_insn_srli_rd_addr :
		spec_insn_sub_valid ? spec_insn_sub_rd_addr :
		spec_insn_sw_valid ? spec_insn_sw_rd_addr :
		spec_insn_xor_valid ? spec_insn_xor_rd_addr :
		spec_insn_xori_valid ? spec_insn_xori_rd_addr : 0;
  assign spec_rd_wdata =
		spec_insn_add_valid ? spec_insn_add_rd_wdata :
		spec_insn_addi_valid ? spec_insn_addi_rd_wdata :
		spec_insn_and_valid ? spec_insn_and_rd_wdata :
		spec_insn_andi_valid ? spec_insn_andi_rd_wdata :
		spec_insn_auipc_valid ? spec_insn_auipc_rd_wdata :
		spec_insn_beq_valid ? spec_insn_beq_rd_wdata :
		spec_insn_bge_valid ? spec_insn_bge_rd_wdata :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rd_wdata :
		spec_insn_blt_valid ? spec_insn_blt_rd_wdata :
		spec_insn_bltu_valid ? spec_insn_bltu_rd_wdata :
		spec_insn_bne_valid ? spec_insn_bne_rd_wdata :
		spec_insn_jal_valid ? spec_insn_jal_rd_wdata :
		spec_insn_jalr_valid ? spec_insn_jalr_rd_wdata :
		spec_insn_lb_valid ? spec_insn_lb_rd_wdata :
		spec_insn_lbu_valid ? spec_insn_lbu_rd_wdata :
		spec_insn_lh_valid ? spec_insn_lh_rd_wdata :
		spec_insn_lhu_valid ? spec_insn_lhu_rd_wdata :
		spec_insn_lui_valid ? spec_insn_lui_rd_wdata :
		spec_insn_lw_valid ? spec_insn_lw_rd_wdata :
		spec_insn_or_valid ? spec_insn_or_rd_wdata :
		spec_insn_ori_valid ? spec_insn_ori_rd_wdata :
		spec_insn_sb_valid ? spec_insn_sb_rd_wdata :
		spec_insn_sh_valid ? spec_insn_sh_rd_wdata :
		spec_insn_sll_valid ? spec_insn_sll_rd_wdata :
		spec_insn_slli_valid ? spec_insn_slli_rd_wdata :
		spec_insn_slt_valid ? spec_insn_slt_rd_wdata :
		spec_insn_slti_valid ? spec_insn_slti_rd_wdata :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rd_wdata :
		spec_insn_sltu_valid ? spec_insn_sltu_rd_wdata :
		spec_insn_sra_valid ? spec_insn_sra_rd_wdata :
		spec_insn_srai_valid ? spec_insn_srai_rd_wdata :
		spec_insn_srl_valid ? spec_insn_srl_rd_wdata :
		spec_insn_srli_valid ? spec_insn_srli_rd_wdata :
		spec_insn_sub_valid ? spec_insn_sub_rd_wdata :
		spec_insn_sw_valid ? spec_insn_sw_rd_wdata :
		spec_insn_xor_valid ? spec_insn_xor_rd_wdata :
		spec_insn_xori_valid ? spec_insn_xori_rd_wdata : 0;
  assign spec_pc_wdata =
		spec_insn_add_valid ? spec_insn_add_pc_wdata :
		spec_insn_addi_valid ? spec_insn_addi_pc_wdata :
		spec_insn_and_valid ? spec_insn_and_pc_wdata :
		spec_insn_andi_valid ? spec_insn_andi_pc_wdata :
		spec_insn_auipc_valid ? spec_insn_auipc_pc_wdata :
		spec_insn_beq_valid ? spec_insn_beq_pc_wdata :
		spec_insn_bge_valid ? spec_insn_bge_pc_wdata :
		spec_insn_bgeu_valid ? spec_insn_bgeu_pc_wdata :
		spec_insn_blt_valid ? spec_insn_blt_pc_wdata :
		spec_insn_bltu_valid ? spec_insn_bltu_pc_wdata :
		spec_insn_bne_valid ? spec_insn_bne_pc_wdata :
		spec_insn_jal_valid ? spec_insn_jal_pc_wdata :
		spec_insn_jalr_valid ? spec_insn_jalr_pc_wdata :
		spec_insn_lb_valid ? spec_insn_lb_pc_wdata :
		spec_insn_lbu_valid ? spec_insn_lbu_pc_wdata :
		spec_insn_lh_valid ? spec_insn_lh_pc_wdata :
		spec_insn_lhu_valid ? spec_insn_lhu_pc_wdata :
		spec_insn_lui_valid ? spec_insn_lui_pc_wdata :
		spec_insn_lw_valid ? spec_insn_lw_pc_wdata :
		spec_insn_or_valid ? spec_insn_or_pc_wdata :
		spec_insn_ori_valid ? spec_insn_ori_pc_wdata :
		spec_insn_sb_valid ? spec_insn_sb_pc_wdata :
		spec_insn_sh_valid ? spec_insn_sh_pc_wdata :
		spec_insn_sll_valid ? spec_insn_sll_pc_wdata :
		spec_insn_slli_valid ? spec_insn_slli_pc_wdata :
		spec_insn_slt_valid ? spec_insn_slt_pc_wdata :
		spec_insn_slti_valid ? spec_insn_slti_pc_wdata :
		spec_insn_sltiu_valid ? spec_insn_sltiu_pc_wdata :
		spec_insn_sltu_valid ? spec_insn_sltu_pc_wdata :
		spec_insn_sra_valid ? spec_insn_sra_pc_wdata :
		spec_insn_srai_valid ? spec_insn_srai_pc_wdata :
		spec_insn_srl_valid ? spec_insn_srl_pc_wdata :
		spec_insn_srli_valid ? spec_insn_srli_pc_wdata :
		spec_insn_sub_valid ? spec_insn_sub_pc_wdata :
		spec_insn_sw_valid ? spec_insn_sw_pc_wdata :
		spec_insn_xor_valid ? spec_insn_xor_pc_wdata :
		spec_insn_xori_valid ? spec_insn_xori_pc_wdata : 0;
  assign spec_mem_addr =
		spec_insn_add_valid ? spec_insn_add_mem_addr :
		spec_insn_addi_valid ? spec_insn_addi_mem_addr :
		spec_insn_and_valid ? spec_insn_and_mem_addr :
		spec_insn_andi_valid ? spec_insn_andi_mem_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_addr :
		spec_insn_beq_valid ? spec_insn_beq_mem_addr :
		spec_insn_bge_valid ? spec_insn_bge_mem_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_addr :
		spec_insn_blt_valid ? spec_insn_blt_mem_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_addr :
		spec_insn_bne_valid ? spec_insn_bne_mem_addr :
		spec_insn_jal_valid ? spec_insn_jal_mem_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_addr :
		spec_insn_lb_valid ? spec_insn_lb_mem_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_addr :
		spec_insn_lh_valid ? spec_insn_lh_mem_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_addr :
		spec_insn_lui_valid ? spec_insn_lui_mem_addr :
		spec_insn_lw_valid ? spec_insn_lw_mem_addr :
		spec_insn_or_valid ? spec_insn_or_mem_addr :
		spec_insn_ori_valid ? spec_insn_ori_mem_addr :
		spec_insn_sb_valid ? spec_insn_sb_mem_addr :
		spec_insn_sh_valid ? spec_insn_sh_mem_addr :
		spec_insn_sll_valid ? spec_insn_sll_mem_addr :
		spec_insn_slli_valid ? spec_insn_slli_mem_addr :
		spec_insn_slt_valid ? spec_insn_slt_mem_addr :
		spec_insn_slti_valid ? spec_insn_slti_mem_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_addr :
		spec_insn_sra_valid ? spec_insn_sra_mem_addr :
		spec_insn_srai_valid ? spec_insn_srai_mem_addr :
		spec_insn_srl_valid ? spec_insn_srl_mem_addr :
		spec_insn_srli_valid ? spec_insn_srli_mem_addr :
		spec_insn_sub_valid ? spec_insn_sub_mem_addr :
		spec_insn_sw_valid ? spec_insn_sw_mem_addr :
		spec_insn_xor_valid ? spec_insn_xor_mem_addr :
		spec_insn_xori_valid ? spec_insn_xori_mem_addr : 0;
  assign spec_mem_rmask =
		spec_insn_add_valid ? spec_insn_add_mem_rmask :
		spec_insn_addi_valid ? spec_insn_addi_mem_rmask :
		spec_insn_and_valid ? spec_insn_and_mem_rmask :
		spec_insn_andi_valid ? spec_insn_andi_mem_rmask :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_rmask :
		spec_insn_beq_valid ? spec_insn_beq_mem_rmask :
		spec_insn_bge_valid ? spec_insn_bge_mem_rmask :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_rmask :
		spec_insn_blt_valid ? spec_insn_blt_mem_rmask :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_rmask :
		spec_insn_bne_valid ? spec_insn_bne_mem_rmask :
		spec_insn_jal_valid ? spec_insn_jal_mem_rmask :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_rmask :
		spec_insn_lb_valid ? spec_insn_lb_mem_rmask :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_rmask :
		spec_insn_lh_valid ? spec_insn_lh_mem_rmask :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_rmask :
		spec_insn_lui_valid ? spec_insn_lui_mem_rmask :
		spec_insn_lw_valid ? spec_insn_lw_mem_rmask :
		spec_insn_or_valid ? spec_insn_or_mem_rmask :
		spec_insn_ori_valid ? spec_insn_ori_mem_rmask :
		spec_insn_sb_valid ? spec_insn_sb_mem_rmask :
		spec_insn_sh_valid ? spec_insn_sh_mem_rmask :
		spec_insn_sll_valid ? spec_insn_sll_mem_rmask :
		spec_insn_slli_valid ? spec_insn_slli_mem_rmask :
		spec_insn_slt_valid ? spec_insn_slt_mem_rmask :
		spec_insn_slti_valid ? spec_insn_slti_mem_rmask :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_rmask :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_rmask :
		spec_insn_sra_valid ? spec_insn_sra_mem_rmask :
		spec_insn_srai_valid ? spec_insn_srai_mem_rmask :
		spec_insn_srl_valid ? spec_insn_srl_mem_rmask :
		spec_insn_srli_valid ? spec_insn_srli_mem_rmask :
		spec_insn_sub_valid ? spec_insn_sub_mem_rmask :
		spec_insn_sw_valid ? spec_insn_sw_mem_rmask :
		spec_insn_xor_valid ? spec_insn_xor_mem_rmask :
		spec_insn_xori_valid ? spec_insn_xori_mem_rmask : 0;
  assign spec_mem_wmask =
		spec_insn_add_valid ? spec_insn_add_mem_wmask :
		spec_insn_addi_valid ? spec_insn_addi_mem_wmask :
		spec_insn_and_valid ? spec_insn_and_mem_wmask :
		spec_insn_andi_valid ? spec_insn_andi_mem_wmask :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_wmask :
		spec_insn_beq_valid ? spec_insn_beq_mem_wmask :
		spec_insn_bge_valid ? spec_insn_bge_mem_wmask :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_wmask :
		spec_insn_blt_valid ? spec_insn_blt_mem_wmask :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_wmask :
		spec_insn_bne_valid ? spec_insn_bne_mem_wmask :
		spec_insn_jal_valid ? spec_insn_jal_mem_wmask :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_wmask :
		spec_insn_lb_valid ? spec_insn_lb_mem_wmask :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_wmask :
		spec_insn_lh_valid ? spec_insn_lh_mem_wmask :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_wmask :
		spec_insn_lui_valid ? spec_insn_lui_mem_wmask :
		spec_insn_lw_valid ? spec_insn_lw_mem_wmask :
		spec_insn_or_valid ? spec_insn_or_mem_wmask :
		spec_insn_ori_valid ? spec_insn_ori_mem_wmask :
		spec_insn_sb_valid ? spec_insn_sb_mem_wmask :
		spec_insn_sh_valid ? spec_insn_sh_mem_wmask :
		spec_insn_sll_valid ? spec_insn_sll_mem_wmask :
		spec_insn_slli_valid ? spec_insn_slli_mem_wmask :
		spec_insn_slt_valid ? spec_insn_slt_mem_wmask :
		spec_insn_slti_valid ? spec_insn_slti_mem_wmask :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_wmask :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_wmask :
		spec_insn_sra_valid ? spec_insn_sra_mem_wmask :
		spec_insn_srai_valid ? spec_insn_srai_mem_wmask :
		spec_insn_srl_valid ? spec_insn_srl_mem_wmask :
		spec_insn_srli_valid ? spec_insn_srli_mem_wmask :
		spec_insn_sub_valid ? spec_insn_sub_mem_wmask :
		spec_insn_sw_valid ? spec_insn_sw_mem_wmask :
		spec_insn_xor_valid ? spec_insn_xor_mem_wmask :
		spec_insn_xori_valid ? spec_insn_xori_mem_wmask : 0;
  assign spec_mem_wdata =
		spec_insn_add_valid ? spec_insn_add_mem_wdata :
		spec_insn_addi_valid ? spec_insn_addi_mem_wdata :
		spec_insn_and_valid ? spec_insn_and_mem_wdata :
		spec_insn_andi_valid ? spec_insn_andi_mem_wdata :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_wdata :
		spec_insn_beq_valid ? spec_insn_beq_mem_wdata :
		spec_insn_bge_valid ? spec_insn_bge_mem_wdata :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_wdata :
		spec_insn_blt_valid ? spec_insn_blt_mem_wdata :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_wdata :
		spec_insn_bne_valid ? spec_insn_bne_mem_wdata :
		spec_insn_jal_valid ? spec_insn_jal_mem_wdata :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_wdata :
		spec_insn_lb_valid ? spec_insn_lb_mem_wdata :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_wdata :
		spec_insn_lh_valid ? spec_insn_lh_mem_wdata :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_wdata :
		spec_insn_lui_valid ? spec_insn_lui_mem_wdata :
		spec_insn_lw_valid ? spec_insn_lw_mem_wdata :
		spec_insn_or_valid ? spec_insn_or_mem_wdata :
		spec_insn_ori_valid ? spec_insn_ori_mem_wdata :
		spec_insn_sb_valid ? spec_insn_sb_mem_wdata :
		spec_insn_sh_valid ? spec_insn_sh_mem_wdata :
		spec_insn_sll_valid ? spec_insn_sll_mem_wdata :
		spec_insn_slli_valid ? spec_insn_slli_mem_wdata :
		spec_insn_slt_valid ? spec_insn_slt_mem_wdata :
		spec_insn_slti_valid ? spec_insn_slti_mem_wdata :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_wdata :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_wdata :
		spec_insn_sra_valid ? spec_insn_sra_mem_wdata :
		spec_insn_srai_valid ? spec_insn_srai_mem_wdata :
		spec_insn_srl_valid ? spec_insn_srl_mem_wdata :
		spec_insn_srli_valid ? spec_insn_srli_mem_wdata :
		spec_insn_sub_valid ? spec_insn_sub_mem_wdata :
		spec_insn_sw_valid ? spec_insn_sw_mem_wdata :
		spec_insn_xor_valid ? spec_insn_xor_mem_wdata :
		spec_insn_xori_valid ? spec_insn_xori_mem_wdata : 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_add (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // ADD instruction
  wire [32-1:0] result = rvfi_rs1_rdata + rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 000 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_addi (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // ADDI instruction
  wire [32-1:0] result = rvfi_rs1_rdata + insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 7'b 0010011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_and (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // AND instruction
  wire [32-1:0] result = rvfi_rs1_rdata & rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 111 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_andi (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // ANDI instruction
  wire [32-1:0] result = rvfi_rs1_rdata & insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 111 && insn_opcode == 7'b 0010011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_auipc (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // U-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31:12], 12'b0});
  wire [4:0] insn_rd     = rvfi_insn[11:7];
  wire [6:0] insn_opcode = rvfi_insn[ 6:0];

  wire misa_ok = 1;

  // AUIPC instruction
  assign spec_valid = rvfi_valid && !insn_padding && insn_opcode == 7'b 0010111;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? rvfi_pc_rdata + insn_imm : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs1_addr = 0;
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_beq (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // SB-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // BEQ instruction
  wire cond = rvfi_rs1_rdata == rvfi_rs2_rdata;
  wire [32-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 7'b 1100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_bge (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // SB-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // BGE instruction
  wire cond = $signed(rvfi_rs1_rdata) >= $signed(rvfi_rs2_rdata);
  wire [32-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 101 && insn_opcode == 7'b 1100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_bgeu (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // SB-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // BGEU instruction
  wire cond = rvfi_rs1_rdata >= rvfi_rs2_rdata;
  wire [32-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 111 && insn_opcode == 7'b 1100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_blt (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // SB-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // BLT instruction
  wire cond = $signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata);
  wire [32-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 100 && insn_opcode == 7'b 1100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_bltu (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // SB-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // BLTU instruction
  wire cond = rvfi_rs1_rdata < rvfi_rs2_rdata;
  wire [32-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 110 && insn_opcode == 7'b 1100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_bne (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // SB-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // BNE instruction
  wire cond = rvfi_rs1_rdata != rvfi_rs2_rdata;
  wire [32-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 001 && insn_opcode == 7'b 1100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_jal (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // UJ-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[19:12], rvfi_insn[20], rvfi_insn[30:21], 1'b0});
  wire [4:0] insn_rd     = rvfi_insn[11:7];
  wire [6:0] insn_opcode = rvfi_insn[6:0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // JAL instruction
  wire [32-1:0] next_pc = rvfi_pc_rdata + insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_opcode == 7'b 1101111;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? rvfi_pc_rdata + 4 : 0;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rs1_addr = 0;
  assign spec_rs2_addr = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_jalr (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;
  wire ialign16 = 0;

  // JALR instruction
  wire [32-1:0] next_pc = (rvfi_rs1_rdata + insn_imm) & ~1;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 7'b 1100111;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? rvfi_pc_rdata + 4 : 0;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_lb (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // LB instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  wire [7:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 7'b 0000011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_rmask = ((1 << 1)-1) << (addr-spec_mem_addr);
  assign spec_rd_wdata = spec_rd_addr ? $signed(result) : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (1-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_lbu (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // LBU instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  wire [7:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 100 && insn_opcode == 7'b 0000011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_rmask = ((1 << 1)-1) << (addr-spec_mem_addr);
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (1-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_lh (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // LH instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  wire [15:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 001 && insn_opcode == 7'b 0000011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_rmask = ((1 << 2)-1) << (addr-spec_mem_addr);
  assign spec_rd_wdata = spec_rd_addr ? $signed(result) : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (2-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_lhu (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // LHU instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  wire [15:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 101 && insn_opcode == 7'b 0000011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_rmask = ((1 << 2)-1) << (addr-spec_mem_addr);
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (2-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_lui (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // U-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31:12], 12'b0});
  wire [4:0] insn_rd     = rvfi_insn[11:7];
  wire [6:0] insn_opcode = rvfi_insn[ 6:0];

  wire misa_ok = 1;

  // LUI instruction
  assign spec_valid = rvfi_valid && !insn_padding && insn_opcode == 7'b 0110111;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? insn_imm : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs1_addr = 0;
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_lw (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // LW instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  wire [31:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 010 && insn_opcode == 7'b 0000011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_rmask = ((1 << 4)-1) << (addr-spec_mem_addr);
  assign spec_rd_wdata = spec_rd_addr ? $signed(result) : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (4-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_or (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // OR instruction
  wire [32-1:0] result = rvfi_rs1_rdata | rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 110 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_ori (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // ORI instruction
  wire [32-1:0] result = rvfi_rs1_rdata | insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 110 && insn_opcode == 7'b 0010011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sb (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // S-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31:25], rvfi_insn[11:7]});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SB instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 7'b 0100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_wmask = ((1 << 1)-1) << (addr-spec_mem_addr);
  assign spec_mem_wdata = rvfi_rs2_rdata << (8*(addr-spec_mem_addr));
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (1-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_rmask = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sh (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // S-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31:25], rvfi_insn[11:7]});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SH instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 001 && insn_opcode == 7'b 0100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_wmask = ((1 << 2)-1) << (addr-spec_mem_addr);
  assign spec_mem_wdata = rvfi_rs2_rdata << (8*(addr-spec_mem_addr));
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (2-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_rmask = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sll (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SLL instruction
  wire [5:0] shamt = 32 == 64 ? rvfi_rs2_rdata[5:0] : rvfi_rs2_rdata[4:0];
  wire [32-1:0] result = rvfi_rs1_rdata << shamt;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 001 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_slli (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format (shift variation)
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct6 = rvfi_insn[31:26];
  wire [5:0] insn_shamt  = rvfi_insn[25:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SLLI instruction
  wire [32-1:0] result = rvfi_rs1_rdata << insn_shamt;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct6 == 6'b 000000 && insn_funct3 == 3'b 001 && insn_opcode == 7'b 0010011 && (!insn_shamt[5] || 32 == 64);
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_slt (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SLT instruction
  wire [32-1:0] result = $signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata);
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 010 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_slti (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SLTI instruction
  wire [32-1:0] result = $signed(rvfi_rs1_rdata) < $signed(insn_imm);
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 010 && insn_opcode == 7'b 0010011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sltiu (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SLTIU instruction
  wire [32-1:0] result = rvfi_rs1_rdata < insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 011 && insn_opcode == 7'b 0010011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sltu (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SLTU instruction
  wire [32-1:0] result = rvfi_rs1_rdata < rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 011 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sra (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SRA instruction
  wire [5:0] shamt = 32 == 64 ? rvfi_rs2_rdata[5:0] : rvfi_rs2_rdata[4:0];
  wire [32-1:0] result = $signed(rvfi_rs1_rdata) >>> shamt;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0100000 && insn_funct3 == 3'b 101 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_srai (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format (shift variation)
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct6 = rvfi_insn[31:26];
  wire [5:0] insn_shamt  = rvfi_insn[25:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SRAI instruction
  wire [32-1:0] result = $signed(rvfi_rs1_rdata) >>> insn_shamt;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct6 == 6'b 010000 && insn_funct3 == 3'b 101 && insn_opcode == 7'b 0010011 && (!insn_shamt[5] || 32 == 64);
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_srl (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SRL instruction
  wire [5:0] shamt = 32 == 64 ? rvfi_rs2_rdata[5:0] : rvfi_rs2_rdata[4:0];
  wire [32-1:0] result = rvfi_rs1_rdata >> shamt;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 101 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_srli (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format (shift variation)
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct6 = rvfi_insn[31:26];
  wire [5:0] insn_shamt  = rvfi_insn[25:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SRLI instruction
  wire [32-1:0] result = rvfi_rs1_rdata >> insn_shamt;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct6 == 6'b 000000 && insn_funct3 == 3'b 101 && insn_opcode == 7'b 0010011 && (!insn_shamt[5] || 32 == 64);
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sub (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SUB instruction
  wire [32-1:0] result = rvfi_rs1_rdata - rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0100000 && insn_funct3 == 3'b 000 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_sw (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // S-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed({rvfi_insn[31:25], rvfi_insn[11:7]});
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // SW instruction
  wire [32-1:0] addr = rvfi_rs1_rdata + insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 010 && insn_opcode == 7'b 0100011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_mem_addr = addr & ~(32/8-1);
  assign spec_mem_wmask = ((1 << 4)-1) << (addr-spec_mem_addr);
  assign spec_mem_wdata = rvfi_rs2_rdata << (8*(addr-spec_mem_addr));
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
  assign spec_trap = ((addr & (4-1)) != 0) || !misa_ok;

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_rmask = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_xor (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // R-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [6:0] insn_funct7 = rvfi_insn[31:25];
  wire [4:0] insn_rs2    = rvfi_insn[24:20];
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // XOR instruction
  wire [32-1:0] result = rvfi_rs1_rdata ^ rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct7 == 7'b 0000000 && insn_funct3 == 3'b 100 && insn_opcode == 7'b 0110011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule

// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module psp_rvfimon_insn_xori (
  input                                 rvfi_valid,
  input  [32   - 1 : 0] rvfi_insn,
  input  [32   - 1 : 0] rvfi_pc_rdata,
  input  [32   - 1 : 0] rvfi_rs1_rdata,
  input  [32   - 1 : 0] rvfi_rs2_rdata,
  input  [32   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [32   - 1 : 0] spec_rd_wdata,
  output [32   - 1 : 0] spec_pc_wdata,
  output [32   - 1 : 0] spec_mem_addr,
  output [32/8 - 1 : 0] spec_mem_rmask,
  output [32/8 - 1 : 0] spec_mem_wmask,
  output [32   - 1 : 0] spec_mem_wdata
);

  // I-type instruction format
  wire [32-1:0] insn_padding = rvfi_insn >> 32;
  wire [32-1:0] insn_imm = $signed(rvfi_insn[31:20]);
  wire [4:0] insn_rs1    = rvfi_insn[19:15];
  wire [2:0] insn_funct3 = rvfi_insn[14:12];
  wire [4:0] insn_rd     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];

  wire misa_ok = 1;

  // XORI instruction
  wire [32-1:0] result = rvfi_rs1_rdata ^ insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 100 && insn_opcode == 7'b 0010011;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rd_addr = insn_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule
