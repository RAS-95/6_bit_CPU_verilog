module xorOperation(
    input [5:0] dataIn,
    input [5:0] dataIn2,
    output [5:0] dataOut,
    output CF,
    output ZF,
    output SF
);
assign dataOut = dataIn ^ dataIn2;
assign CF = 1'b0;
assign ZF = (dataOut == 0);
assign SF = dataOut[5];
endmodule