module addOperation(
    input [5:0] dataIn,
    input [5:0] dataIn2,
    output [5:0] dataOut,
    output CF,
    output ZF,
    output SF
);
wire [6:0] tmp;
assign tmp = dataIn + dataIn2;
assign dataOut = tmp[5:0];
assign CF = tmp[6];
assign ZF = (dataOut == 0);
assign SF = dataOut[5];
endmodule