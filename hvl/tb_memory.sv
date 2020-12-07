/*
 * tb_memory
 *
 * Testbench to ensure basic memory functions are working.
 */
`timescale 1ns/10ps

`include "../hdl/memory_if.sv"

module tb_memory();
    logic clk;

    // timeunit 10ns;
    // timeprecision 1ns;

    initial begin
        clk = 1'b0;
    end

    always begin
        #5 clk = ~clk;
    end

    mem_if port_a();
    mem_if port_b();

    memory dut(
        .addr_a(port_a.addr),
        .data_i_a(port_a.data_i),
        .data_o_a(port_a.data_o),
        .data_en_a(port_a.data_en),
        .write_en_a(port_a.write_en),

        .addr_b(port_b.addr),
        .data_i_b(port_b.data_i),
        .data_o_b(port_b.data_o),
        .data_en_b(port_b.data_en),
        .write_en_b(port_b.write_en),

        .clk(clk)
    );

    // Write complete word
    function automatic void write_a(input logic[31:0] addr, input logic[31:0] data);
        port_a.addr = addr;
        port_a.write_en = 1'b1;
        port_a.data_i = data;
        port_a.data_en = 4'b1111;
    endfunction

    function automatic void write_b(input logic[31:0] addr, input logic[31:0] data);
        port_b.addr = addr;
        port_b.write_en = 1'b1;
        port_b.data_i = data;
        port_b.data_en = 4'b1111;
    endfunction

    // Write partial word
    function automatic void write_a_part(input logic[31:0] addr, input logic[31:0] data, input logic[3:0] en);
        port_a.addr = addr;
        port_a.write_en = 1'b1;
        port_a.data_i = data;
        port_a.data_en = en;
    endfunction

    function automatic void write_b_part(input logic[31:0] addr, input logic[31:0] data, input logic[3:0] en);
        port_b.addr = addr;
        port_b.write_en = 1'b1;
        port_b.data_i = data;
        port_b.data_en = en;
    endfunction

    // Read entire bus
    function automatic void read_a(input logic[31:0] addr);
        port_a.addr = addr;
        port_a.write_en = 1'b0;
        port_a.data_en = 4'b1111;
    endfunction

    function automatic void read_b(input logic[31:0] addr);
        port_b.addr = addr;
        port_b.write_en = 1'b0;
        port_b.data_en = 4'b1111;
    endfunction

    // NOP = do nothing on this port
    function automatic void nop_a();
        port_a.data_en = 4'b0000;
    endfunction

    function automatic void nop_b();
        port_b.data_en = 4'b0000;
    endfunction

    // Wait for current write or read to terminate and print the result here
    task commit_transaction();
        #10
        $display("%0d", $time);
        if (port_a.write_en)  $display("0x%0h <- %0h", port_a.addr, port_a.data_i);
        if (port_b.write_en)  $display("0x%0h <- %0h", port_b.addr, port_b.data_i);
        if (!port_a.write_en) $display("0x%0h is %0h", port_a.addr, port_a.data_o);
        if (!port_b.write_en) $display("0x%0h is %0h", port_b.addr, port_b.data_o);
    endtask

    initial begin
        $display("Hello, world!");
        #10

        write_a(32'h0000_0000, 32'hdeadc0de);
        write_b(32'h0000_0004, 32'hfeedface);
        commit_transaction();

        read_a(32'h0000_0000);
        read_b(32'h0000_0004);
        commit_transaction();

        if (port_a.data_o != 32'hdeadc0de || port_b.data_o != 32'hfeedface) begin
            $display("Error: Basic writing test failed.");
            $finish;
        end

        write_a(32'h0000_0008, 32'hAAAAAAAA);
        write_b(32'h0000_0008, 32'hBBBBBBBB);
        commit_transaction();

        read_a(32'h0000_0008);
        read_b(32'h0000_0004);
        commit_transaction();

        if (port_a.data_o != 32'hBBBBBBBB) begin
            $display("Error: Port B writes should supercede Port A!");
            $finish;
        end

        if (port_b.data_o != 32'hfeedface) begin
            $display("Error: read after write to different address failed");
            $finish;
        end

        write_a(32'h0000_1000, 32'hfeedc0de);
        read_b(32'h0000_1000);
        commit_transaction();

        if (port_b.data_o != 32'hXXXXXXXX) begin
            $display("Error: This address should be uninitialized, got %0h", port_b.data_o);
            $finish;
        end

        read_a(32'h0000_1000);
        read_b(32'h0000_1000);
        commit_transaction();

        if (port_a.data_o != 32'hfeedc0de || port_b.data_o != 32'hfeedc0de) begin
            $display("Error: 0x1000 contains incorrect data");
        end

        // Test highest address
        write_a(32'h0000_1ffc, 32'haabbccdd);
        nop_b();
        commit_transaction();

        read_a(32'h0000_1ffc);
        nop_b();
        commit_transaction();

        if (port_a.data_o != 32'haabbccdd) begin
            $display("Highest port doesn't seem to work");
            $finish;
        end

        // Test byte enable
        write_a_part(32'h0000_02f0, 32'haaffaaff, 4'b1010);
        write_b_part(32'h0000_02a0, 32'hffaaaaff, 4'b0110);
        commit_transaction();

        read_a(32'h0000_02f0);
        read_b(32'h0000_02a0);
        commit_transaction();

        if (port_a.data_o != 32'haaxxaaxx || port_b.data_o != 32'hxxaaaaxx) begin
            $display("Byte enable signals don't seem to work");
            $finish;
        end

        $finish;
    end

endmodule
