module siso_4bit_tb();

reg clk,reset,d_in;

wire d_out;

bit4_siso xiti (.clk(clk), .reset(reset),.d_in(d_in),.d_out(d_out));

initial
 begin
 clk = 0;
forever
#5 clk =~clk;
end

initial
begin
@ (negedge clk);
reset = 1; #10;
@ (negedge clk);
reset=0; #10

d_in= 1; #11;

d_in= 0; #11;

d_in= 0; #11;

d_in= 1; #11;
$finish;

end

endmodule
