module alu(
    input [5:0] A,
    input [5:0] B,
    input [1:0] OP,
    output [5:0] R,
    output CF,
    output ZF,
    output SF
);
    wire [5:0] tmp0, tmp1, tmp2;
    wire [2:0] flag0, flag1, flag2;
    xorOperation task1(.dataIn(A), .dataIn2(B), .dataOut(tmp0), .CF(flag0[0]), .ZF(flag0[1]), .SF(flag0[2]));
    addOperation task2(.dataIn(A), .dataIn2(B), .dataOut(tmp1), .CF(flag1[0]), .ZF(flag1[1]), .SF(flag1[2]));
    shiftRightOperation task3(.dataIn(A), .dataIn2(B), .dataOut(tmp2), .CF(flag2[0]), .ZF(flag2[1]), .SF(flag2[2]));
    assign R = (OP == 2'b00) ? tmp0 : (OP == 2'b01) ? tmp1 : tmp2;
    assign CF = (OP == 2'b00) ? flag0[0] : (OP == 2'b01) ? flag1[0] : flag2[0];
    assign ZF = (OP == 2'b00) ? flag0[1] : (OP == 2'b01) ? flag1[1] : flag2[1];
    assign SF = (OP == 2'b00) ? flag0[2] : (OP == 2'b01) ? flag1[2] : flag2[2];
endmodule