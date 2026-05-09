/*module counter_tb();

reg reset,wr_enb,clk;
wire [1:0]x;

counter dut (.wr_enb(wr_enb),.reset(reset),.x(x));

initial begin 
clk = 0;
forever 
#10 clk = !clk;
end
initial
begin
reset=1;
#10;
reset=0; wr_enb=1;
#10;
$finish;
end
endmodule */
module counter_tb();
reg clk,reset,wr_enb;
wire [1:0] x;

counter xiti (.clk(clk),.reset(reset),.x(x),.wr_enb(wr_enb));

initial
begin
clk = 1;
forever
#5 clk = !clk;
end

initial
begin
reset = 1;
wr_enb = 0; 
@(negedge clk);
reset = 0;
wr_enb = 1;
@ (negedge clk);
$finish;
end
endmodule
