module controlUnit(
    input [3:0] OPCODE,
    input CF,
    input ZF,
    input SF,
    output [1:0] OP,
    output JMP_SEL,
    output IM_SEL,
    output REG_EN
);

assign OP = OPCODE[1:0];
assign IM_SEL = ~OPCODE[3] & OPCODE[2];
assign REG_EN = IM_SEL | (~OPCODE[3] & ~OPCODE[2]);
assign JMP_SEL = (OPCODE[3] & ~OPCODE[2]) & ((~OPCODE[1] & ~OPCODE[0]) | (~OPCODE[1] & ~OPCODE[0] & CF));
endmodule