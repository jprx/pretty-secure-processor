/*
 * tb_tft
 *
 * Testbench to test the entire LCD TFT controller.
 */
`timescale 1ns/10ps


module tb_tft();
    logic clk; // Testbench clock
    logic sysclk; // Actual clock in

    logic[7:0] r, g, b;
    logic hsync, vsync, de, pxclk;
    logic reset;

    assign sysclk = clk;

    initial begin
        clk = 1'b0;
    end

    always begin
        #5 clk = ~clk;
    end

    tft dut(.*);

    initial begin
        $display("Booting up TFT!");
        reset = 1;
        #10
        reset = 0;
    end

endmodule
