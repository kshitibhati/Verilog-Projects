module count4bitup  (clk,reset,count);
output reg[3:0] count;
input clk,reset;

always @ (posedge clk)
if (reset|count==4'b1101)
begin
   count=4'b0000;
	end
else 
count=count+1;	
endmodule


