module flagRegister(
    input CLK,
    input CF_IN,
    input ZF_IN,
    input SF_IN,

    output CF_OUT,
    output ZF_OUT,
    output SF_OUT
);
    reg CF, ZF, SF;
    always @(posedge CLK) begin
        CF <= CF_IN;
        ZF <= ZF_IN;
        SF <= SF_IN;
    end
    assign CF_OUT = CF;
    assign ZF_OUT = ZF;
    assign SF_OUT = SF;
endmodule