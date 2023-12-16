module shiftRightOperation(
    input [5:0] dataIn,
    input [5:0] dataIn2,
    input CF_OLD,
    output [5:0] dataOut,
    output CF,
    output ZF,
    output SF
);
assign dataOut = dataIn >> dataIn2;
assign CF = dataIn2 == 0 ? CF_OLD : dataIn2 === 1 ? dataIn[0] : dataIn2 === 2 ? dataIn[1] : dataIn2 === 3 ? dataIn[2] : dataIn2 === 4 ? dataIn[3] : dataIn2 === 5 ? dataIn[4] : dataIn2 == 6 ? dataIn[5] : 1'b0; 
endmodule