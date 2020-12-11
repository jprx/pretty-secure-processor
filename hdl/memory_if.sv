`ifndef MEMORY_IF
`define MEMORY_IF

/*
 * mem_if
 *
 * An interface connecting a synchronous memory bus.
 */
interface mem_if;
    logic [31:0] addr;
    logic [31:0] data_i;
    logic [31:0] data_o;
    logic [3:0] data_en;
    logic write_en;

    // Will this address's value be ready NEXT cycle?
    // This what, whatever asserted address knows whether or not data WILL be valid next cycle
    logic hit;

    // Connect this to the device using the bus
    modport driver (
        input data_o, hit,
        output addr, data_i, data_en, write_en
    );

    // Connect this to the memory module
    modport bus (
        input addr, data_i, data_en, write_en,
        output data_o, hit
    );

endinterface

`endif // MEMORY_IF
