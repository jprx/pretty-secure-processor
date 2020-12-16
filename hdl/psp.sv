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
        output logic[12:0] ar,
        input logic [3:0] btn,
        input logic sysclk
    );

    // Run core at 62.5MHz
    logic coreclk = 0;
    logic [1:0] core_counter = 0;

    always_ff @ (posedge sysclk) begin
        core_counter <= core_counter + 1;
        if (core_counter == 2) coreclk <= !coreclk;
    end

    assign led = btn;
    assign reset = btn[0];

    // assign coreclk = sysclk;

    // PLLE2_BASE: Base Phase Locked Loop (PLL)
    //             Virtex-7
    // Xilinx HDL Language Template, version 2019.1

    // CLKOUT0 is the 83.33 MHz clock
    /*
    logic CLKOUT0, CLKOUT1, CLKOUT2, CLKOUT3, CLKOUT4, CLKOUT5;
    logic CLKFBOUT, LOCKED;
    logic PWRDWN, CLKFBIN;

    assign PWRDWN = 0;
    assign CLKFBIN = CLKFBOUT;
    assign clk = CLKOUT0 & LOCKED;

    // Generate a 83.33 MHz clock from 125 MHz on CLKOUT0
    PLLE2_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // OPTIMIZED, HIGH, LOW
        .CLKFBOUT_MULT(8),        // Multiply value for all CLKOUT, (2-64)
        .CLKFBOUT_PHASE(0.0),     // Phase offset in degrees of CLKFB, (-360.000-360.000).
        .CLKIN1_PERIOD(8.0),      // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
        .CLKOUT0_DIVIDE(12),
        .CLKOUT1_DIVIDE(1),
        .CLKOUT2_DIVIDE(1),
        .CLKOUT3_DIVIDE(1),
        .CLKOUT4_DIVIDE(1),
        .CLKOUT5_DIVIDE(1),
        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(0.0),
        .CLKOUT2_PHASE(0.0),
        .CLKOUT3_PHASE(0.0),
        .CLKOUT4_PHASE(0.0),
        .CLKOUT5_PHASE(0.0),
        .DIVCLK_DIVIDE(1),        // Master division value, (1-56)
        .REF_JITTER1(0.0),        // Reference input jitter in UI, (0.000-0.999).
        .STARTUP_WAIT("FALSE")    // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
    )
    PLLE2_BASE_inst (
        // Clock Outputs: 1-bit (each) output: User configurable clock outputs
        .CLKOUT0(CLKOUT0),   // 1-bit output: CLKOUT0
        .CLKOUT1(CLKOUT1),   // 1-bit output: CLKOUT1
        .CLKOUT2(CLKOUT2),   // 1-bit output: CLKOUT2
        .CLKOUT3(CLKOUT3),   // 1-bit output: CLKOUT3
        .CLKOUT4(CLKOUT4),   // 1-bit output: CLKOUT4
        .CLKOUT5(CLKOUT5),   // 1-bit output: CLKOUT5
        // Feedback Clocks: 1-bit (each) output: Clock feedback ports
        .CLKFBOUT(CLKFBOUT), // 1-bit output: Feedback clock
        .LOCKED(LOCKED),     // 1-bit output: LOCK
        .CLKIN1(sysclk),     // 1-bit input: Input clock
        // Control Ports: 1-bit (each) input: PLL control ports
        .PWRDWN(PWRDWN),     // 1-bit input: Power-down
        .RST(reset),           // 1-bit input: Reset
        // Feedback Clocks: 1-bit (each) input: Clock feedback ports
        .CLKFBIN(CLKFBIN)    // 1-bit input: Feedback clock
    );
    */
    // End of PLLE2_BASE_inst instantiation

    // Main Memory
    mem_if main_mem_port_a();
    mem_if main_mem_port_b();

    // RVFI / verification ports
    rvfi_if rvfi_out;
    logic done, reset; // Done is asserted when main_mem_port_a requests a given address

    logic port_b_in_main_mem; // Is port B pointing to an address in main memory?

    assign port_b_in_main_mem = main_mem_port_b.addr < 32'h20_00_00_00;

    memory main_mem(
        .addr_a(main_mem_port_a.addr),
        .data_o_a(main_mem_port_a.data_o),

        .addr_b(main_mem_port_b.addr),
        .data_i_b(main_mem_port_b.data_i),
        .data_o_b(main_mem_port_b.data_o),
        .data_en_b(main_mem_port_b.data_en),
        .write_en_b(main_mem_port_b.write_en & port_b_in_main_mem),

        .clk(coreclk)
    );

    // LCD-TFT Controller Signals
    logic r_out, g_out, b_out;

    logic [7:0] r, g, b;
    logic hsync, vsync, de, pxclk;

    assign ar[0] = de;
    assign ar[1] = vsync;
    assign ar[2] = hsync;
    assign ar[3] = pxclk;
    assign ar[4] = r_out;
    assign ar[5] = g_out;
    assign ar[6] = b_out;

    mem_if tft_text_write_port();

    tft tft_inst(.*, .clk(sysclk));

    always_comb begin
        // tft_text_write_port.addr = main_mem_port_b.addr - TFT_MEM_BASE;
        tft_text_write_port.write_en = main_mem_port_b.write_en & ((main_mem_port_b.addr & TFT_MEM_BASE) != 0);
        // tft_text_write_port.data_i = main_mem_port_b.data_i;

        // Decode one-hot signal
        case (main_mem_port_b.data_en)
            4'b0001: tft_text_write_port.data_i = main_mem_port_b.data_i;
            4'b0010: tft_text_write_port.data_i = main_mem_port_b.data_i >> 8;
            4'b0100: tft_text_write_port.data_i = main_mem_port_b.data_i >> 16;
            4'b1000: tft_text_write_port.data_i = main_mem_port_b.data_i >> 24;
            default: tft_text_write_port.data_i = main_mem_port_b.data_i;
        endcase

        case (main_mem_port_b.data_en)
            4'b0001: tft_text_write_port.addr = main_mem_port_b.addr - TFT_MEM_BASE;
            4'b0010: tft_text_write_port.addr = main_mem_port_b.addr - TFT_MEM_BASE + 1;
            4'b0100: tft_text_write_port.addr = main_mem_port_b.addr - TFT_MEM_BASE + 2;
            4'b1000: tft_text_write_port.addr = main_mem_port_b.addr - TFT_MEM_BASE + 3;
            default: tft_text_write_port.addr = main_mem_port_b.addr - TFT_MEM_BASE;
        endcase
    end

    assign r_out = r != 0;
    assign g_out = g != 0;
    assign b_out = b != 0;

    // Something to ensure opt doesn't optimize out the entire design:
    // assign led = main_mem_port_b.write_en;

    // Write to 0x600d600d to exit
    assign done = main_mem_port_b.addr == 32'h600d600c && main_mem_port_b.write_en;

    // Caches

    // Core
    core core(
        .imem(main_mem_port_a.driver),
        .dmem(main_mem_port_b.driver),
        .rvfi_out(rvfi_out),
        .reset(reset),
        .clk(coreclk)
    );

endmodule
