/*
 * tb_psp
 *
 * Testbench to test the entire PSP.
 */
`timescale 1ns/10ps

`include "../hdl/memory_if.sv"
`include "../hdl/rvfi_if.sv"

module tb_psp();
    logic clk;
    logic [3:0] led;
    logic done;
    logic reset;

    rvfi_if rvfi_out;

    initial begin
        clk = 1'b0;
    end

    always begin
        #5 clk = ~clk;
    end

    always_ff @ (posedge clk) begin
        if (reset) begin
            order <= 0;
        end
        else begin
            if (rvfi_out.valid) begin
                order <= order + 1;
            end
        end
    end

    always_ff @ (posedge clk) begin
        // Exit if DUT reports done
        if (done) begin
            $display("All checks passed!");
            $finish;
        end

        if (errcode != 0) begin
            $display("Quitting due to error code %0h", errcode);
            $display("At instruction %d", order);
            $finish;
        end
    end

    psp dut(.*);
    logic[15:0] errcode;
    logic[63:0] order;
    psp_rvfimon monitor(
        .clock(clk),
        .reset(reset),
        .rvfi_valid(rvfi_out.valid),
        .rvfi_order(order),
        .rvfi_insn(rvfi_out.insn),
        .rvfi_trap(0),
        .rvfi_halt(0),
        .rvfi_intr(0),
        .rvfi_mode(3),
        .rvfi_rs1_addr(rvfi_out.rs1_addr),
        .rvfi_rs2_addr(rvfi_out.rs2_addr),
        .rvfi_rs1_rdata(rvfi_out.rs1_rdata),
        .rvfi_rs2_rdata(rvfi_out.rs2_rdata),
        .rvfi_rd_addr(rvfi_out.rd_addr),
        .rvfi_rd_wdata(rvfi_out.rd_wdata),
        .rvfi_pc_rdata(rvfi_out.pc_rdata),
        .rvfi_pc_wdata(rvfi_out.pc_wdata),
        .rvfi_mem_addr(rvfi_out.mem_addr),
        .rvfi_mem_rmask(rvfi_out.mem_rmask),
        .rvfi_mem_wmask(rvfi_out.mem_wmask),
        .rvfi_mem_rdata(rvfi_out.mem_rdata),
        .rvfi_mem_wdata(rvfi_out.mem_wdata),
        .rvfi_mem_extamo(0),
        .errcode(errcode)
    );

    initial begin
        reset = 1;
        #10
        reset = 0;
    end

endmodule
