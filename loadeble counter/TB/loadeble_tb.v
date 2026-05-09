module loadeble_tb();
reg clk,reset,load;
reg [3:0] data;
wire [3:0] counter;

loadcounter xiti (.clk(clk),.reset(reset),.load(load),.counter(counter),.data(data));

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
load = 0;
repeat (10)
@ (negedge clk);
load = 1;
data = 4'b0111;
@(negedge clk);
reset = 0;
@(negedge clk);
load = 0;
repeat (10)
@ (negedge clk);
$finish;
end
endmodule
