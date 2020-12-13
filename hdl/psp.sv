/*
 * Joseph Ravichandran
 * December 6, 2020
 */
`include "memory_if.sv"
`include "rvfi_if.sv"

/*
 * psp
 * A pretty secure processor.
 */
module psp
    (
        output logic [3:0] led,
        input logic sysclk
    );

    logic clk;

    // logic [2:0] clk_divider;
    assign clk = sysclk;
    // always_ff @ (posedge sysclk) begin
    //     clk_divider <= clk_divider + 1;
    // end

    // Main Memory
    mem_if main_mem_port_a();
    mem_if main_mem_port_b();

    // RVFI / verification ports
    rvfi_if rvfi_out;
    logic done, reset; // Done is asserted when main_mem_port_a requests a given address

    memory main_mem(
        .addr_a(main_mem_port_a.addr),
        .data_o_a(main_mem_port_a.data_o),

        .addr_b(main_mem_port_b.addr),
        .data_i_b(main_mem_port_b.data_i),
        .data_o_b(main_mem_port_b.data_o),
        .data_en_b(main_mem_port_b.data_en),
        .write_en_b(main_mem_port_b.write_en),

        .clk(clk)
    );

    // Something to ensure opt doesn't optimize out the entire design:
    assign led = main_mem_port_b.write_en;

    // Write to 0x600d600d to exit
    assign done = main_mem_port_b.addr == 32'h600d600c && main_mem_port_b.write_en;

    // Caches

    // Core
    core core(
        .imem(main_mem_port_a.driver),
        .dmem(main_mem_port_b.driver),
        .rvfi_out(rvfi_out),
        .reset(reset),
        .clk(clk)
    );

endmodule
