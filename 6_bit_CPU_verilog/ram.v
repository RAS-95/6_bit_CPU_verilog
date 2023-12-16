module ram(
    input [3:0] RA1,
    input [3:0] RA2,
    input [3:0] WA,
    input [14:0] WRD,
    input WE, 
    input CLK,
    output [14:0] RD1,
    output [14:0] RD2
);

wire [14:0] tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8;
fifteenBitRegister uut0(.dataIn(WRD), .CLK(CLK), .dataOut(tmp0), .sel(WA == 4'b0000 & WE));
fifteenBitRegister uut1(.dataIn(WRD), .CLK(CLK), .dataOut(tmp1), .sel(WA == 4'b0001 & WE));
fifteenBitRegister uut2(.dataIn(WRD), .CLK(CLK), .dataOut(tmp2), .sel(WA == 4'b0010 & WE));
fifteenBitRegister uut3(.dataIn(WRD), .CLK(CLK), .dataOut(tmp3), .sel(WA == 4'b0011 & WE));
fifteenBitRegister uut4(.dataIn(WRD), .CLK(CLK), .dataOut(tmp4), .sel(WA == 4'b0100 & WE));
fifteenBitRegister uut5(.dataIn(WRD), .CLK(CLK), .dataOut(tmp5), .sel(WA == 4'b0101 & WE));
fifteenBitRegister uut6(.dataIn(WRD), .CLK(CLK), .dataOut(tmp6), .sel(WA == 4'b0110 & WE));
fifteenBitRegister uut7(.dataIn(WRD), .CLK(CLK), .dataOut(tmp7), .sel(WA == 4'b0111 & WE));
fifteenBitRegister uut8(.dataIn(WRD), .CLK(CLK), .dataOut(tmp8), .sel(WA == 4'b1000 & WE));

assign RD1 = (RA1 == 4'b0000) ? tmp0 : (RA1 == 4'b0001) ? tmp1 : (RA1 == 4'b0010) ? tmp2 : (RA1 == 4'b0011) ? tmp3 : (RA1 == 4'b0100) ? tmp4 : (RA1 == 4'b0101) ? tmp5 : (RA1 == 4'b0110) ? tmp6 : (RA1 == 4'b0111) ? tmp7 : (RA1 == 4'b1000) ? tmp8 : 15'b0;
assign RD2 = (RA2 == 4'b0000) ? tmp0 : (RA2 == 4'b0001) ? tmp1 : (RA2 == 4'b0010) ? tmp2 : (RA2 == 4'b0011) ? tmp3 : (RA2 == 4'b0100) ? tmp4 : (RA2 == 4'b0101) ? tmp5 : (RA2 == 4'b0110) ? tmp6 : (RA2 == 4'b0111) ? tmp7 : (RA2 == 4'b1000) ? tmp8 : 15'b0;

endmodule