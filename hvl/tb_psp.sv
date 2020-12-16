/*
 * tb_psp
 *
 * Testbench to test the entire PSP.
 */
`timescale 1ns/10ps

`include "../hdl/memory_if.sv"
`include "../hdl/rvfi_if.sv"

module tb_psp();
    logic clk; // Testbench clock
    logic sysclk; // Actual clock in
    logic [3:0] led;
    logic[15:0] errcode;
    logic[63:0] order;
    logic[12:0] ar;
    logic[3:0] btn;

    assign sysclk = clk;

    initial begin
        clk = 1'b0;
    end

    always begin
        #5 clk = ~clk;
    end

    always_ff @ (posedge clk) begin
        if (dut.reset) begin
            order <= 0;
        end
        else begin
            if (dut.rvfi_out.valid) begin
                order <= order + 1;
            end
        end
    end

    always_ff @ (posedge clk) begin
        // Exit if DUT reports dut.done
        if (dut.done) begin
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
    psp_rvfimon monitor(
        .clock(clk),
        .reset(dut.reset),
        .rvfi_valid(dut.rvfi_out.valid),
        .rvfi_order(order),
        .rvfi_insn(dut.rvfi_out.insn),
        .rvfi_trap(0),
        .rvfi_halt(0),
        .rvfi_intr(0),
        .rvfi_mode(3),
        .rvfi_rs1_addr(dut.rvfi_out.rs1_addr),
        .rvfi_rs2_addr(dut.rvfi_out.rs2_addr),
        .rvfi_rs1_rdata(dut.rvfi_out.rs1_rdata),
        .rvfi_rs2_rdata(dut.rvfi_out.rs2_rdata),
        .rvfi_rd_addr(dut.rvfi_out.rd_addr),
        .rvfi_rd_wdata(dut.rvfi_out.rd_wdata),
        .rvfi_pc_rdata(dut.rvfi_out.pc_rdata),
        .rvfi_pc_wdata(dut.rvfi_out.pc_wdata),
        .rvfi_mem_addr(dut.rvfi_out.mem_addr),
        .rvfi_mem_rmask(dut.rvfi_out.mem_rmask),
        .rvfi_mem_wmask(dut.rvfi_out.mem_wmask),
        .rvfi_mem_rdata(dut.rvfi_out.mem_rdata),
        .rvfi_mem_wdata(dut.rvfi_out.mem_wdata),
        .rvfi_mem_extamo(0),
        .errcode(errcode)
    );

    initial begin
        $display("Booting up!");
        dut.reset = 1;
        #10
        dut.reset = 0;
    end

endmodule
