module registerSet(
    input [2:0] WR,
    input WE,
    input CLK,
    input [5:0] WRD,
    input [2:0] RA,
    input [2:0] RB,
    output [5:0] A,
    output [5:0] B
); 
    wire [7:0] r;
    threeToEightDecoder uut(WR, r);

    wire [5:0] tmp0, tmp1, tmp2, tmp3, tmp4;
    sixBitRegister reg1(.dataIn(WRD), .CLK(CLK), .dataOut(tmp0), .sel(r[0] & WE));
    sixBitRegister reg2(.dataIn(WRD), .CLK(CLK), .dataOut(tmp1), .sel(r[1] & WE));
    sixBitRegister reg3(.dataIn(WRD), .CLK(CLK), .dataOut(tmp2), .sel(r[2] & WE));
    sixBitRegister reg4(.dataIn(WRD), .CLK(CLK), .dataOut(tmp3), .sel(r[3] & WE));
    sixBitRegister reg5(.dataIn(WRD), .CLK(CLK), .dataOut(tmp4), .sel(r[4] & WE));

    assign A = (RA == 3'b000) ? tmp0 : (RA == 3'b001) ? tmp1 : (RA == 3'b010) ? tmp2 : (RA == 3'b011) ? tmp3 : tmp4;
    assign B = (RB == 3'b000) ? tmp0 : (RB == 3'b001) ? tmp1 : (RB == 3'b010) ? tmp2 : (RB == 3'b011) ? tmp3 : tmp4;
endmodule