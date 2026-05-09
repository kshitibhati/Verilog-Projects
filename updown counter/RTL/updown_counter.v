module updowncounter (clk,reset,en,count);
output reg [3:0] count;
input clk,reset,en;


always @ (posedge clk)
begin
if (reset==1)
count=4'b0000;
else if
(en==1)
begin
count= count +1;
end
else if (en==0)
count=count-1;
end

endmodule
