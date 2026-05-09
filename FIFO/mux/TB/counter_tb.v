module counter_tb();
reg reset,rd_enb,clk;
wire [1:0] y;

counter xiti (.clk(clk),.reset(reset),.y(y),.rd_enb(rd_enb));

initial begin
clk = 1;
forever
#5 clk = !clk;
end



initial
begin
reset = 1;
rd_enb = 0; 
@(negedge clk);
reset = 0;
rd_enb = 1;
@ (negedge clk);
$finish;
end
endmodule
