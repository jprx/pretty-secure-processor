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

    // Connect this to the device using the bus
    modport driver (
        input data_o,
        output addr, data_i, data_en, write_en
    );

    // Connect this to the memory module
    modport bus (
        input addr, data_i, data_en, write_en,
        output data_o
    );

endinterface

`endif // MEMORY_IF
