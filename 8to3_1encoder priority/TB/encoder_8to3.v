module pri8to3_encoder_tb();
reg [7:0] i;
wire [2:0] d;
pri8to3_encoder xiti (.i(i),.d(d));

initial
begin
i = 8'b0101_1110; #10;
i = 8'b0011_00110; #10;
i = 8'b0110_0000; #10;
i = 8'b1000_0000; #10;
i = 8'b1000_1010; #10;
i = 8'b10010_0000; #10;
i = 8'b10000_0000; #10;
i = 8'b10000_1000; #10;
$finish;
end
endmodule

