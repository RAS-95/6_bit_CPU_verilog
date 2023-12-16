module cpu(
    input [3:0] RA2,
    input [3:0] WA,
    input [14:0] WD,
    input WE,
    input CLK,
    input PC_ENABLE,
    output [5:0] OUTPUT
);
    wire CPU_CLK = PC_ENABLE & CLK ? 1'b1 : 1'b0;
    wire [3:0] programCounterAdderIn, programCounterAdderOut, programCounterIn, programCounterOut;
    programCounter uutProgramCounter(
        .I(programCounterAdderOut),
        .CLK(CPU_CLK),
        .O(programCounterOut)
    );
    programCounterAdder uutProgramCounterAdder(
        .I(programCounterOut),
        .CLK(CPU_CLK),
        .O(programCounterAdderOut)
    );
    wire [14:0] RD1, RD2;   
    ram uutRam(
        .RA1(JMP_SEL ? JMP_ADDR : programCounterOut),
        .RA2(RA2),
        .WA(WA),
        .WD(WD),
        .WE(WE),
        .RD1(RD1),
        .RD2(RD1),
        .CLK(CLK)
    );
    wire [3:0] OPCODE, JMP_ADDR;
    assign OPCODE = RD1[14:11];
    wire [2:0] REG1, REG2;
    wire [5:0] IM_DATA;
    wire JMP_SEL;
    wire IM_SEL;
    wire REG_EN;
    assign REG1 = RD1[10:8];
    assign REG2 = RD1[7:5];
    assign IM_DATA = RD1[7:2];
    assign JMP_ADDR = RD1[10:7];
    controlUnit uutControlUnit(
        .OPCODE(OPCODE),
        .JMP_SEL(JMP_SEL),
        .IM_SEL(IM_SEL),
        .REG_EN(REG_EN),
        .CF(CF_O),
        .ZF(ZF_O),
        .SF(SF_O)
    );
    wire [5:0] A, B;
    registerSet uutRegisterSet(
        .WR(REG1),
        .WE(REG_EN),
        .CLK(CPU_CLK),
        .WRD(R), // ALU RESULT
        .RA(REG1),
        .RB(REG2),
        .A(A),
        .B(B)
    );
    wire CF, ZF, SF;
    wire [5:0] R;
    alu uutAlu(
        .A(A),
        .B(IM_SEL ? IM_DATA : B),
        .OP(OP),
        .R(R),
        .CF(CF),
        .ZF(ZF),
        .SF(SF)
    );
    wire CF_O, ZF_O, SF_O;
    flagRegister uutFlagRegister(
        .CLK(CPU_CLK),
        .CF_IN(CF),
        .ZF_IN(ZF),
        .SF_IN(SF),
        .CF_OUT(CF_O),
        .ZF_OUT(ZF_O),
        .SF_OUT(SF_O)
    );
    assign OUTPUT = R;


endmodule