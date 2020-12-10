
module alu
    (
        input logic[31:0] in1, in2,
        input alu_cmd command,
        output logic[31:0] alu_out
    );

    // alu_out = in1 OPERATOR in2

    // Calculate alu_out = in1 OPERATOR in2
    always_comb begin
        case(command)
            alu_add     :   alu_out = in1 + in2;
            alu_sll     :   alu_out = in1 << (in2[4:0]);
            alu_sra     :   alu_out = $signed(in1) >>> (in2[4:0]); // Triple > operator is logical shift for signed types
            alu_sub     :   alu_out = in1 - in2;
            alu_xor     :   alu_out = in1 ^ in2;
            alu_srl     :   alu_out = in1 >> (in2[4:0]);
            alu_or      :   alu_out = in1 | in2;
            alu_and     :   alu_out = in1 & in2;
        endcase
    end

endmodule // alu

module cmp
    (
        input logic[31:0] in1, in2,
        input cmp_cmd command,
        output logic cmp_out
    );

    always_comb begin
        case(command)
            cmp_lt      :   cmp_out = $signed(in1) < $signed(in2);
            cmp_ltu     :   cmp_out = in1 < in2;
            cmp_gt      :   cmp_out = in1 >= in2;
            cmp_gtu     :   cmp_out = $signed(in1) >= $signed(in2);
            cmp_eq      :   cmp_out = in1 == in2;
            cmp_neq     :   cmp_out = in1 != in2;

            default     :   cmp_out = in1 == in2;
        endcase
    end

endmodule // cmp
