/*
 * TFT-LCD display controller
 * Designed for 800 by 480 display running at roughly 30 MHz
 * Joseph Ravichandran
 * December 11, 2020
 */

module tft
    (

        output logic[7:0] r, g, b,
        output logic hsync, vsync, de, pxclk,

        input logic reset,

        // 125 MHz system clock:
        input logic clk
    );

    // We want to transmit pixels at 125/3 = 41.2 MHz

    /*
     * Timings
     * Active Resolution: 800 by 480
     * Internal Resolution: 938 by 554
     *
     * Horizontal
     * HSync: 10 pixels
     * Back Porch: 88 pixels
     * Active Width: 800 pixels
     * Front Porch: 40 pixels
     *
     * Vertical
     * VSync: 20 lines
     * Back Porch: 32 lines
     * Active Height: 480 lines
     * Front Porch: 22 lines
     *
     * Polarity
     * HSync: Active Low
     * VSync: Active Low
     * Data Enable: Active High
     * Pixel Clock: Normal (low to high)
     */

    // Virtual resolution (not active resolution):
    localparam HSYNC_PULSE_LEN = 10;
    localparam HSYNC_BPORCH_LEN = 88;
    localparam HSYNC_ACTIVE_LEN = 800;
    localparam HSYNC_FPORCH_LEN = 50;

    localparam VSYNC_PULSE_LEN = 20;
    localparam VSYNC_BPORCH_LEN = 32;
    localparam VSYNC_ACTIVE_LEN = 480;
    localparam VSYNC_FPORCH_LEN = 22;

    // Time that each signal ends
    localparam HSYNC_PULSE_END = HSYNC_PULSE_LEN;
    localparam HSYNC_BPORCH_END = HSYNC_BPORCH_LEN + HSYNC_PULSE_END;
    localparam HSYNC_ACTIVE_END = HSYNC_ACTIVE_LEN + HSYNC_BPORCH_END;
    localparam HSYNC_FPORCH_END = HSYNC_FPORCH_LEN + HSYNC_ACTIVE_END;

    localparam VSYNC_PULSE_END = VSYNC_PULSE_LEN;
    localparam VSYNC_BPORCH_END = VSYNC_BPORCH_LEN + VSYNC_PULSE_END;
    localparam VSYNC_ACTIVE_END = VSYNC_ACTIVE_LEN + VSYNC_BPORCH_END;
    localparam VSYNC_FPORCH_END = VSYNC_FPORCH_LEN + VSYNC_ACTIVE_END;

    // Traces the entire screen, starting at sync, then back porch, active area, then front porch:
    logic [31:0] internal_x, internal_y;

    // Goes from (0,0) to (800,480)
    logic [31:0] screen_x, screen_y;

    // 41.2 MHz screen clock:
    logic screenclk;
    logic[3:0] screen_counter;

    // Clock generation
    always_ff @ (posedge clk) begin
        if (reset) begin
            screen_counter <= 0;
            screenclk <= 0;
        end
        else begin
            if (screen_counter >= 2) begin
                screenclk <= !screenclk;
                screen_counter <= 0;
            end
            else begin
                screen_counter <= screen_counter + 1;
            end
        end
    end

    assign pxclk = screenclk;

    // Generate screen-space coords
    always_comb begin
        screen_x = 0;
        screen_y = 0;
        if (internal_x >= HSYNC_BPORCH_END && internal_y >= VSYNC_BPORCH_END && internal_x < HSYNC_ACTIVE_END && internal_y < VSYNC_ACTIVE_END) begin
            screen_x = internal_x - HSYNC_BPORCH_END;
            screen_y = internal_y - VSYNC_BPORCH_END;
        end
    end

    always_ff @ (posedge screenclk or posedge reset) begin
        if (reset) begin
            internal_x <= 0;
            internal_y <= 0;
        end
        else begin
            // Count screen
            if (internal_x >= HSYNC_FPORCH_END) begin
                internal_x <= 0;

                if (internal_y >= VSYNC_FPORCH_END) begin
                    internal_y <= 0;
                end
                else begin
                    internal_y <= internal_y + 1;
                end
            end
            else begin
                internal_x <= internal_x + 1;
            end
        end
    end

    // Are we in the horizontal / vertical active areas? (Active high)
    logic h_de, v_de;

    // Q: Do we send hsyncs during vsync? A: Yes
    always_comb begin
        hsync = 1;
        vsync = 1;
        h_de = 0;
        v_de = 0;
        if (internal_x < HSYNC_PULSE_END) hsync = 0;
        else if (internal_x >= HSYNC_BPORCH_END && internal_x < HSYNC_ACTIVE_END) h_de = 1;

        if (internal_y < VSYNC_PULSE_END) vsync = 0;
        else if (internal_y >= VSYNC_BPORCH_END && internal_y < VSYNC_ACTIVE_END) v_de = 1;
    end

    assign de = (h_de & v_de);

    // Draw checkers pattern
    always_comb begin
        r = 0;
        g = 0;
        b = 0;
        if ((screen_x % 100) < 50) begin
            if ((screen_y % 100) < 50) begin
                r = 8'hff;
            end
            else begin
                b = 8'hff;
            end
        end
    end

    // assign r = internal_x < 600 ? 8'hff : 0;
    // assign g = 0;
    // assign b = 8'hff;

endmodule

/*
 * Top-level module for a TFT LCD driver test
 */
module tft_wrapper
    (
        // HSYNC, VSYNC, DE, CLK
        // output logic rpio_02_r, rpio_03_r, rpio_04_r, rpio_05_r,

        // R, G, B
        // output logic rpio_06_r, rpio_07_r, rpio_08_r,

        // Arduino pins
        output logic[12:0] ar,

        // Input clock
        input logic sysclk
    );

    logic r_out, g_out, b_out;

    logic [7:0] r, g, b;
    logic hsync, vsync, de, pxclk, clk;
    logic reset;


    /*
    assign rpio_02_r = hsync;
    assign rpio_03_r = vsync;
    assign rpio_04_r = de;
    assign rpio_05_r = pxclk;
    assign rpio_06_r = r_out;
    assign rpio_07_r = g_out;
    assign rpio_08_r = b_out;
    */

    assign ar[0] = de;
    assign ar[1] = vsync;
    assign ar[2] = hsync;
    assign ar[3] = pxclk;
    assign ar[4] = r_out;
    assign ar[5] = g_out;
    assign ar[6] = b_out;

    assign reset = 0;
    assign clk = sysclk;

    tft tft_inst(.*);

    assign r_out = r != 0;
    assign g_out = g != 0;
    assign b_out = b != 0;

endmodule

/*
 * tft_textmemory
 * Dual-port BRAM memory for TFT text mode data
 *
 * Addresses are log base 2 of MEM_SIZE bytes wide. The lower 2 bits
 * are ignored by this module. The data enable signals are respected
 * and are relative to the address modulo 4.
 *
 * So if you read from address 6 for example, with a width of 32 bits
 * you will receive [byte 4, byte 5, byte 6, byte 7] and data enable pins
 * will operate on those bytes. 
 *
 * (You will NOT get something like [byte 6, byte 7, byte 8, byte 9]).
 */
module tft_textmem
    #(
        // Max aligned address will be 1/4 this:
        parameter MEM_SIZE=8192
        // 8192 has max aligned address of 2048
    )
    (
        // Port A (READONLY)
        input logic [$clog2(MEM_SIZE)-1:0] addr_a,
        output logic [31:0] data_o_a,

        // Port B
        input logic [$clog2(MEM_SIZE)-1:0] addr_b,
        input logic [31:0] data_i_b,
        output logic [31:0] data_o_b,
        input logic [3:0] data_en_b,
        input logic write_en_b,

        input clk
    );

    logic [31:0] ram [(MEM_SIZE/4)-1:0];

    // Strip off 2 lower bits from input addresses:
    logic [$clog2(MEM_SIZE)-3:0] addr_a_aligned, addr_b_aligned;
    assign addr_a_aligned = addr_a >> 2;
    assign addr_b_aligned = addr_b >> 2;

    initial begin
        $readmemh("/project/memories/hello_tft.mem", ram);
    end

    always @ (posedge clk) begin
        // Make port A readonly because Vivado can't infer true dual-port and we don't really need it
        data_o_a <= ram[addr_a_aligned];
    end

    always @ (posedge clk) begin
        // Port B
        if (write_en_b) begin
            if(data_en_b[0]) ram[addr_b_aligned][7:0] <= data_i_b[7:0];
            if(data_en_b[1]) ram[addr_b_aligned][15:8] <= data_i_b[15:8];
            if(data_en_b[2]) ram[addr_b_aligned][23:16] <= data_i_b[23:16];
            if(data_en_b[3]) ram[addr_b_aligned][31:24] <= data_i_b[31:24];
            data_o_b <= ram[addr_b_aligned];
        end
        else begin
            data_o_b <= ram[addr_b_aligned];
        end
    end

endmodule // tft_textmem
