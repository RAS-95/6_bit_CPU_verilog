module programCounter(
    input [3:0] I,
    input CLK,
    output O
);
    reg [3:0] PC;
    always @(posedge CLK) begin
        PC <= I;
    end
    assign O = PC;
endmodule