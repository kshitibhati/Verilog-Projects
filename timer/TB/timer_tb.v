module timer_tb ();
reg [3:0] data;
reg load,clk,rst;
wire [3:0] temp;
wire [2:0] counter;
wire timeout;
timer xiti (.data(data),.counter(counter),.clk(clk),.load(load),.temp(temp),.rst(rst),.timeout(timeout));

initial begin
clk=0;
forever
#10 clk = ~clk;
end
initial
begin
@ (negedge clk);
rst = 1;
@ (negedge clk);
rst = 0;
load = 1;
data = 4'd10;
@ (negedge clk);
load=0;
repeat(60)@ (negedge clk);
$finish;
end
endmodule
 
