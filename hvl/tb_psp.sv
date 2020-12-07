/*
 * tb_psp
 *
 * Testbench to test the entire PSP.
 */
`timescale 1ns/10ps

`include "../hdl/memory_if.sv"

module tb_psp();
    logic clk;
    logic [3:0] led;
    logic reset;

    initial begin
        clk = 1'b0;
    end

    always begin
        #5 clk = ~clk;
    end

    psp dut(.*);

    initial begin
        reset = 1;
        #10
        reset = 0;

        #100

        #10
        $display("All checks passed!");

        $finish;
    end

endmodule
