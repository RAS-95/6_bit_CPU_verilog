module fifteenBitRegister(
    input [14:0] dataIn,
    input CLK,
    output [14:0] dataOut,
    input sel
);
reg [14:0] tmp = 0; // initialize to 0
always @(posedge CLK)
begin
    if (sel == 1)
       tmp <= dataIn;
end
endmodule