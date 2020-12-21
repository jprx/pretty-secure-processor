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

        // Write-only port to TFT text memory
        mem_if.bus tft_text_write_port,

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

    localparam FONT_WIDTH = 10;
    localparam FONT_HEIGHT = 15;
    localparam logic[7:0] fontmap[256] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,52,63,
        64,65,66,67,68,69,70,71,72,73,74,75,76,77,53,54,55,56,57,58,59,60,61,62,78,79,80,81,82,83,84,26,27,
        28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,85,86,87,88,89,90,0,1,2,3,4,
        5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,91,92,93,94,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0};


    logic[7:0] logo[14401:0];

    logic[2:0] font[14251:0];

    // Screen is 80 columns by 32 rows
    localparam SCREEN_WIDTH_TEXT = 80;
    localparam SCREEN_HEIGHT_TEXT = 32;
    logic[7:0] textmem[(80*32)-1:0];

    initial begin
        $readmemh("logo.mem", logo);
        $readmemh("font.mem", font);
        $readmemh("splashscreen.mem", textmem);
    end

    // Clock generation
    always_ff @ (posedge clk) begin
        if (reset) begin
            screen_counter <= 0;
            screenclk <= 0;
        end
        else begin
            if (screen_counter >= 3) begin
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
        // screen_x = 0;
        // screen_y = 0;
        // if (internal_x >= HSYNC_BPORCH_END && internal_y >= VSYNC_BPORCH_END && internal_x < HSYNC_ACTIVE_END && internal_y < VSYNC_ACTIVE_END) begin
            screen_x = internal_x - HSYNC_BPORCH_END;
            screen_y = internal_y - VSYNC_BPORCH_END;
        // end
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

    // Next char to display:
    logic[7:0] next_char;

    // Index of next char to display (from font LUT):
    logic[7:0] next_char_idx;

    // Work one character ahead
    logic[31:0] next_screen_x;

    logic logo_color;

    assign next_screen_x = screen_x + 2;
    always_ff @ (posedge screenclk) begin
        next_char_idx <= fontmap[textmem[((screen_y / FONT_HEIGHT) * SCREEN_WIDTH_TEXT) + (next_screen_x / FONT_WIDTH)]];

        logo_color <= 0;
        if (next_screen_x >= 800 - 240) begin
            if (screen_y <= 240) begin
                logo_color <= logo[(((screen_y >> 1) * 120) + ((next_screen_x >> 1) - (400-120)))];
            end
        end

        if (logo_color) begin
            r <= logo_color;
            g <= logo_color;
            b <= logo_color;
        end
        else begin
            r <= font[(FONT_WIDTH * FONT_HEIGHT * next_char_idx) + ((screen_y % FONT_HEIGHT) * FONT_WIDTH) + (next_screen_x % FONT_WIDTH)];
            g <= font[(FONT_WIDTH * FONT_HEIGHT * next_char_idx) + ((screen_y % FONT_HEIGHT) * FONT_WIDTH) + (next_screen_x % FONT_WIDTH)];
            b <= font[(FONT_WIDTH * FONT_HEIGHT * next_char_idx) + ((screen_y % FONT_HEIGHT) * FONT_WIDTH) + (next_screen_x % FONT_WIDTH)];
        end

        if (tft_text_write_port.write_en) begin
            textmem[(tft_text_write_port.addr)] <= tft_text_write_port.data_i;
        end
    end

endmodule

/*
 * Top-level module for a TFT LCD driver test
 */
module tft_wrapper
    (
        // Arduino pins
        output logic[12:0] ar,

        // Input clock
        input logic sysclk
    );

    logic r_out, g_out, b_out;

    logic [7:0] r, g, b;
    logic hsync, vsync, de, pxclk, clk;
    logic reset;

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
