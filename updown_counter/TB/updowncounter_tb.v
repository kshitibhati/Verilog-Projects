module updowncounter_tb();
reg clk,reset,en;
wire [3:0] count;

updowncounter xiti (.clk(clk),.reset(reset),.en(en),.count(count));

initial
begin
clk = 1;
forever
#10 clk = !clk;
end

initial
begin
@(negedge clk);
reset = 1;
@(negedge clk);
reset = 0;
en = 1;
repeat (16)
@ (negedge clk);
en=0;
repeat (16)
@ (negedge clk);
$finish;
end
endmodule
