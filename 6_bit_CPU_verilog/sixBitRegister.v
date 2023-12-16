module sixBitRegister(
    input [5:0] dataIn,
    input CLK,
    output [5:0] dataOut,
    input sel
);
reg [5:0] tmp = 0; // initialize to 0
always @(posedge CLK) 
begin
    if (sel == 1) 
       tmp <= dataIn;
end
assign dataOut = tmp;
endmodule