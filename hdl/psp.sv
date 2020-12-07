/*
 * Joseph Ravichandran
 * December 6, 2020
 */
 `include "memory_if.sv"

/*
 * psp
 * A pretty secure processor.
 */
module psp
    (
        input logic clk
    );

    // Main Memory
    mem_if main_mem_port_a();
    mem_if main_mem_port_b();

    memory main_mem(
        .addr_a(main_mem_port_a.addr),
        .data_i_a(main_mem_port_a.data_i),
        .data_o_a(main_mem_port_a.data_o),
        .data_en_a(main_mem_port_a.data_en),

        .addr_b(main_mem_port_b.addr),
        .data_i_b(main_mem_port_b.data_i),
        .data_o_b(main_mem_port_b.data_o),
        .data_en_b(main_mem_port_b.data_en),

        .clk(clk)
    );

    // Caches

    // Core

endmodule
